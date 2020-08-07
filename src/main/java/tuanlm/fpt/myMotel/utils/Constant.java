/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.utils;

import org.apache.log4j.Logger;

/**
 *
 * @author Tuan
 */
public class Constant {
    public static final Logger logger = Logger.getLogger(Constant.class.getName());
    
    // Status 
    public static final int ACTIVE = 1;
    public static final int INACTIVE = 2;
    public static final int COME = 3;
    public static final int OUT = 4;
    public static final int RENTED = 5;
    public static final int FREE = 6;
    public static final int DELETED = 7;
}
