/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import tuanlm.fpt.myMotel.model.Account;

/**
 *
 * @author Tuan
 */
@Controller
public class InitController {
    @RequestMapping(value = {"/","/welcome", "/login"})
    public String WelcomePage(Model model){
        model.addAttribute("account", new Account());
        return "login";
    }
    
    @GetMapping(value = "/success")
    public String goSuccessPage() {
        return "success";
    }
    
    @GetMapping(value = "/error")
    public String goErrorPage() {
        return "error";
    }    
}
