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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import tuanlm.fpt.myMotel.model.Account;
import tuanlm.fpt.myMotel.service.RoomService;

/**
 *
 * @author Tuan
 */
@Controller
public class RoomController {
    @Autowired
    RoomService roomService;
    
    @PostMapping(value = "/update-room")
    public String updateRoom (
            @RequestParam int id, 
            @RequestParam int status, 
            @RequestParam String roomNumber,
            @RequestParam int price,
            HttpServletRequest request, Model model) {
        System.out.println("updateRoom");
        if (request.getSession(false) != null) {
            roomService.updateRoom(id, roomNumber, price, status);
            Account user = (Account) request.getSession(false).getAttribute("USER");
            request.getSession(false).setAttribute("ROOM_LIST", roomService.getRoomListByOwner(user.getUsername()));
        }
        return "room-management";
    }
    
    @PostMapping(value = "/add-room")
    public String addRoom (
            @RequestParam int status, 
            @RequestParam String roomNumber,
            @RequestParam int price,
            HttpServletRequest request, Model model) {
        System.out.println("updateRoom");
        if (request.getSession(false) != null) {
            Account user = (Account) request.getSession(false).getAttribute("USER");
            if (user != null) {
                roomService.createRoom(roomNumber, user.getUsername(), price, status);
                request.getSession(false).setAttribute("ROOM_LIST", roomService.getRoomListByOwner(user.getUsername()));
            }
            else return "error";
        }
        return "room-management";
    }    
    
    @RequestMapping(value = "/view-room")
    public String viewRoom (@RequestParam int id, HttpServletRequest request) {
        request.setAttribute("ROOM", roomService.getRoomById(id));
        request.setAttribute("CUSTOMER_LIST", roomService.getCustomerListByRoomId(id));
        return "detailRoom";
    }
}
