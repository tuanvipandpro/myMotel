/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.utils;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import tuanlm.fpt.myMotel.model.CalculateObject;

/**
 *
 * @author Tuan
 */
public class RequestHandler {
    public List<CalculateObject> handleRequestToCalculate (HttpServletRequest request, List<CalculateObject> list) {
        for (CalculateObject calculateObject : list) {
            if (calculateObject.getStatusId() != Constant.FREE) {
                // không truyền water
                // get param
                int newElectric = Integer.parseInt(request.getParameter("newElectric" + calculateObject.getRoomId()));
                int newWater = Integer.parseInt(request.getParameter("newWater" + calculateObject.getRoomId()));
                // set param
                calculateObject.setNewElectric(newElectric);
                calculateObject.setNewWater(newWater);                
            }
        }
        
        return list;
    }
}
