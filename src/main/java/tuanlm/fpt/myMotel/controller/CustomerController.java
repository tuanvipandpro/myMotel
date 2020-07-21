/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.controller;

import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import tuanlm.fpt.myMotel.model.Customer;
import tuanlm.fpt.myMotel.service.CustomerService;
import tuanlm.fpt.myMotel.service.RoomService;
import tuanlm.fpt.myMotel.utils.Constant;

/**
 *
 * @author Tuan
 */
@Controller
public class CustomerController {
    @Autowired
    CustomerService customerService;
    @Autowired
    RoomService roomService;
    Logger logger = Constant.logger;

    @RequestMapping(value = "/view-customer")
    public String viewCustomer(@RequestParam int id, HttpServletRequest request, Model model) {
        request.setAttribute("CUSTOMER", customerService.getCustomerById(id));
        return "detailCustomer";
    }

    @RequestMapping(value = "/update-customer")
    public String updateCustomer(
            @RequestParam int id,
            @RequestParam String name,
            @RequestParam String birthdate,
            @RequestParam boolean sex,
            @RequestParam String phone,
            @RequestParam String email,
            HttpServletRequest request, Model model) {
        try {
            Customer customer = customerService.updateCustomer(id, name, birthdate, sex, phone, email);
            if (customer != null) {
                request.setAttribute("CUSTOMER", customer);
            } 
            else {
                return "error";
            }
        } 
        catch (ParseException ex) {
            logger.error("CustomerController (updateCustomer): " + ex.getMessage());
        }
        
        return "detailCustomer";
    }
    
    @RequestMapping(value = "/add-customer-to-room")
    public String addCustomerToRoom(
            @RequestParam int roomId,
            @RequestParam String name,
            @RequestParam String birthdate,
            @RequestParam boolean sex,
            @RequestParam String phone,
            @RequestParam String email,
            HttpServletRequest request, Model model) {
        try {
            Customer customer = customerService.addCustomer(name, birthdate, sex, phone, email);
            if (customer != null) {
                roomService.addCustomerToRoom(roomId, customer.getId());
                request.setAttribute("ROOM", roomService.getRoomById(roomId));
                request.setAttribute("CUSTOMER_LIST", roomService.getCustomerListByRoomId(roomId));   
                return "detailRoom";
            } 
            else {
                return "error";
            }
        } 
        catch (ParseException ex) {
            logger.error("CustomerController (updateCustomer): " + ex.getMessage());
            return "error";
        }
    }    
}
