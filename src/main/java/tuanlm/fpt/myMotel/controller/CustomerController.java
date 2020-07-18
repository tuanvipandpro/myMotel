/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import tuanlm.fpt.myMotel.model.Customer;
import tuanlm.fpt.myMotel.service.CustomerService;

/**
 *
 * @author Tuan
 */
@Controller
public class CustomerController {
    @Autowired
    CustomerService customerService;
    
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
            Customer customer = customerService.updateCustomer(id, name, new SimpleDateFormat("yyyy-MM-dd").parse(birthdate), sex, phone, email);
            if (customer != null) {
                request.setAttribute("CUSTOMER", customer);
                System.out.println("Customer : " + customer.getBirthdate().toString());
            }
            else {
                return "error";
            }
        }
        catch (ParseException e) {
            return "error";
        }
        return "detailCustomer";
    }    
}
