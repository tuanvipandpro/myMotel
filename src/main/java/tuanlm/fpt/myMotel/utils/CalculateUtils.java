/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.utils;

import tuanlm.fpt.myMotel.model.CalculateObject;

/**
 *
 * @author Tuan
 */
public class CalculateUtils {
    public static int getTotal (CalculateObject c, int electricFee, int waterFee, int otherFee) {   
        return c.getRoomPrice() + getElectricNumber(c) * electricFee + getWaterNumber(c) * waterFee + otherFee;
    }
    
    public static int getElectricNumber (CalculateObject c) {
        return c.getNewElectric() - c.getOldElectric();
    }
    
    public static int getWaterNumber (CalculateObject c) {
        return c.getNewWater() - c.getOldWater();
    }
}
