/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import tuanlm.fpt.myMotel.model.Account;
import tuanlm.fpt.myMotel.service.CalculateService;

/**
 *
 * @author Tuan
 */
@Controller
public class CalculateController {
    @Autowired
    CalculateService calculateService;
    
    @PostMapping(value = "/calculateRoom")
    public String calculateRoom (HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            Account account = (Account) session.getAttribute("USER");
            return calculateService.calculateRoom(request, account.getUsername()) ? "success" : "error";
        }
        else return "error";
    }
}
