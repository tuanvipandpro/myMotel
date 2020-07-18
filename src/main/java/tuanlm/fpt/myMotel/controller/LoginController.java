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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import tuanlm.fpt.myMotel.model.Account;
import tuanlm.fpt.myMotel.service.AccountService;

/**
 *
 * @author Tuan
 */
@Controller
public class LoginController {
    @Autowired
    private AccountService accountService;
//    private Logger logger = Constant.logger;
    
    @RequestMapping(value = "/doLogin")
    public String doLogin(@ModelAttribute("account") Account account, Model model, HttpServletRequest request){
        Account acc = accountService.checkLogin(account.getUsername(), account.getPassword());
        if (acc == null) {
            model.addAttribute("error", true);
            return "redirect:login";
        }
        else {
            if (acc.getRoleID() == 1) {
                request.getSession().setAttribute("USER", acc);
                return "home";
            }
            else {
                System.out.println("Denied Access !!!");
                return "error/403";
            }
        }
    }
    
    @RequestMapping(value = "/home")
    public String goHomePage(){
        return "home";
    }    
}
