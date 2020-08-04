/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.model;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author Tuan
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CalculateObject implements Serializable{
    private int roomId;
    private int oldElectric;
    private int newElectric;
    private int oldWater;
    private int newWater;
    private int roomPrice; 
    private int statusID;
}
