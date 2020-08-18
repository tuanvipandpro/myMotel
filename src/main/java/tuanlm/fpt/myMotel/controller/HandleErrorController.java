/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Tuan
 */
@Controller
public class HandleErrorController implements ErrorController{
    @RequestMapping("/error")
    public String handleError(HttpServletRequest request) {
        System.out.println("Error - Error");
        Object statusObj = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        if (statusObj != null) {
            int status = Integer.valueOf(statusObj.toString());
            if (status == HttpStatus.NOT_FOUND.value()) {
                return "error/404";
            } else if (status == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                return "error/500";
            }
        }
        return "error/500";
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }
    
}
