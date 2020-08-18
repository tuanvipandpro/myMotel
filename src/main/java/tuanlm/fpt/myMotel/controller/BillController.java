/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import tuanlm.fpt.myMotel.model.Account;
import tuanlm.fpt.myMotel.model.Bill;
import tuanlm.fpt.myMotel.model.Details;
import tuanlm.fpt.myMotel.service.BillService;

/**
 *
 * @author Tuan
 */
@Controller
public class BillController {
    @Autowired
    BillService billService;    
    
    @RequestMapping(value = "/viewTotalByPageNo")
    public String goViewBillPage (HttpServletRequest request, @RequestParam int pageNo) {
        if (request.getSession(false) != null) {
            Account acc = (Account) request.getSession(false).getAttribute("USER");
            request.setAttribute("LIST", billService.getBillListByPageNo(acc.getUsername(), pageNo - 1));
            request.setAttribute("NUMBER_PAGE", billService.getCountPage());
            request.setAttribute("PAGE_NO", pageNo);
        }        
        return "viewBill";
    }
    
    @RequestMapping(value = "/viewDetailBill")
    public String goDetailForBill (HttpServletRequest request, @RequestParam int billId) {
        if (request.getSession(false) != null) {
//            Account acc = (Account) request.getSession(false).getAttribute("USER");
            request.setAttribute("BILL", billService.getBillById(billId));
            request.setAttribute("DETAILS_LIST", billService.getDetailsForBill(billId));
        }        
        return "detailBill";
    }   
}
