/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author Tuan
 */
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Details implements Serializable{
    @Id
    @GeneratedValue
    @Column(name = "ID", nullable = false)      
    private int id;
    @Column(name = "Bill_ID", nullable = false)
    private int billId;
    @Column(name = "Room_ID", nullable = false)
    private int roomId;
    @Column(name = "ElectricNumber", nullable = false)
    private int electricNumber;
    @Column(name = "WaterNumber", nullable = false)
    private int waterNumber;

    public Details(int billId, int roomId, int electricNumber, int waterNumber) {
        this.billId = billId;
        this.roomId = roomId;
        this.electricNumber = electricNumber;
        this.waterNumber = waterNumber;
    }
}
