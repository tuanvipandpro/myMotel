/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tuanlm.fpt.myMotel.model.CalculateObject;
import tuanlm.fpt.myMotel.model.Power;
import tuanlm.fpt.myMotel.model.Room;
import tuanlm.fpt.myMotel.repository.FeeRepository;
import tuanlm.fpt.myMotel.repository.PowerRepository;
import tuanlm.fpt.myMotel.repository.RoomRepository;


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
}
