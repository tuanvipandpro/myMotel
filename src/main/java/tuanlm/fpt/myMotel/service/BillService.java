/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import tuanlm.fpt.myMotel.model.Bill;
import tuanlm.fpt.myMotel.repository.BillRepository;
import tuanlm.fpt.myMotel.utils.Constant;

/**
 *
 * @author Tuan
 */
@Service
public class BillService {
    @Autowired
    BillRepository billRepository;
    
    public List<Bill> getBillListByPageNo (String owner, int pageNo) {
        return billRepository.findAllByOwnerOrderByDateDesc(owner, PageRequest.of(pageNo, Constant.PAGE_LINE_NUMBER));
    }
    
    public long getCountPage () {
        long numberRecord = billRepository.count();
        if (numberRecord % Constant.PAGE_LINE_NUMBER != 0) {
            return  numberRecord / Constant.PAGE_LINE_NUMBER + 1;
        } else {
            return numberRecord / Constant.PAGE_LINE_NUMBER;
        }
    }
}
