/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import tuanlm.fpt.myMotel.model.Account;
import tuanlm.fpt.myMotel.model.CalculateObject;
import tuanlm.fpt.myMotel.service.AccountService;
import tuanlm.fpt.myMotel.service.CalculateService;
import tuanlm.fpt.myMotel.service.RoomService;

/**
 *
 * @author Tuan
 */
@Controller
public class HomeController {
    @Autowired
    AccountService accountService;
    @Autowired
    RoomService roomService;
    @Autowired
    CalculateService calculateService;
    
    @PostMapping(value = "/changePassword")
    public String doChangePassword (@RequestParam String username, @RequestParam String password, Model model) {
        return accountService.updatePassword(username, password) ? "success" : "error";
    }
    
    @RequestMapping(value = "/introduce")
    public String goIntroducePage () {
        return "introduce";
    }
    
    @RequestMapping(value = "/roomMaganement")
    public String goRoomManagementPage (HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            Account account = (Account) session.getAttribute("USER");
            session.setAttribute("ROOM_LIST", roomService.getRoomListByOwner(account.getUsername()));
        }
        return "room-management";
    }
    
    @RequestMapping(value = "/makeBillRoom")
    public String goCalculateMonthFeePage (HttpServletRequest request, HttpSession session) {
        if (session != null) {
            Account acc = (Account) session.getAttribute("USER");
            List<CalculateObject> list = calculateService.getInformationToCalculate(acc.getUsername());
            request.setAttribute("LIST", list);
        }
        return "calculateRoom";
    }
    
    @RequestMapping(value = "/viewTotal")
    public String goViewBillPage () {
        return "xemdoanhthu";
    }    
}
