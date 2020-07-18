/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import tuanlm.fpt.myMotel.repository.CustomerRepository;

/**
 *
 * @author Tuan
 */
@Controller
public class CustomerController {
    @Autowired
    CustomerRepository customerRepository;
    
    @RequestMapping(value = "/view-customer")
    public String viewCustomer(@RequestParam int id, HttpServletRequest request, Model model) {
        request.setAttribute("CUSTOMER", customerRepository.findById(id));
        return "detailCustomer";
    }
}
