/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tuanlm.fpt.myMotel.model.Bill;
import tuanlm.fpt.myMotel.model.CalculateObject;
import tuanlm.fpt.myMotel.model.Details;
import tuanlm.fpt.myMotel.model.Fee;
import tuanlm.fpt.myMotel.model.Power;
import tuanlm.fpt.myMotel.model.Room;
import tuanlm.fpt.myMotel.repository.BillRepository;
import tuanlm.fpt.myMotel.repository.DetailsRepository;
import tuanlm.fpt.myMotel.repository.FeeRepository;
import tuanlm.fpt.myMotel.repository.PowerRepository;
import tuanlm.fpt.myMotel.repository.RoomRepository;
import tuanlm.fpt.myMotel.utils.CalculateUtils;
import tuanlm.fpt.myMotel.utils.Constant;
import tuanlm.fpt.myMotel.utils.RequestHandler;


/**
 *
 * @author Tuan
 */
@Service
public class CalculateService {
    @Autowired
    RoomRepository roomRepository;
    @Autowired
    FeeRepository feeRepository;
    @Autowired
    PowerRepository powerRepository;
    @Autowired
    BillRepository billRepository;
    @Autowired
    DetailsRepository detailsRepository;
    
    public List<CalculateObject> getInformationToCalculate (String owner) {
        List<CalculateObject> result = null;
        for (Room room : roomRepository.findByOwner(owner)) {
            List<Power> powerList = powerRepository.findTop2ByRoomIdOrderByDateDesc(room.getId());
            
            int oldElectric = 0;
            int oldWater = 0;
            
            for (Power power : powerList) {
                if (power.getCategory_id() == 1) oldElectric = power.getNumber();
                if (power.getCategory_id() == 2) oldWater = power.getNumber();
            }
            
            if (result == null) result = new ArrayList<>();
            result.add(new CalculateObject(room.getId(), room.getRoom_number() , oldElectric, 0, oldWater, 0, room.getPrice(), room.getStatus_id()));
        }
        return result;
    }
    
    public boolean calculateRoom (HttpServletRequest request, String owner) {
        Date date = new Date();
        Fee fee = feeRepository.findFirstByOrderByIdDesc();
        List<CalculateObject> list = new RequestHandler().handleRequestToCalculate(request, getInformationToCalculate (owner));
        
        for (CalculateObject c : list) {
            if (c.getStatusId() == Constant.RENTED) {
                detailsRepository.save(new Details(billRepository.save(
                    new Bill(CalculateUtils.getTotal(c, fee.getElectric(), fee.getWater(), fee.getOther()), date , Constant.ACTIVE, owner )).getId(), 
                    c.getRoomId(),
                    CalculateUtils.getElectricNumber(c), 
                    CalculateUtils.getWaterNumber(c) 
                ));
                
                powerRepository.save(new Power(c.getRoomId(), c.getNewElectric(), date, Constant.ELECTRIC));
                powerRepository.save(new Power(c.getRoomId(), c.getNewWater(), date, Constant.WATER));
            }
        }
        
        return (list != null);
    }
}
