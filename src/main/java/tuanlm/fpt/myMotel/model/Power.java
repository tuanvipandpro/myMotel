/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author Tuan
 */
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Power implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)    
    private int id;
    @Column(name = "Room_ID", nullable = false)
    private int roomId;
    @Column(name = "Number", nullable = false)
    private int number;
    @Temporal(TemporalType.DATE)
    @Column(name = "Date", nullable = false)    
    private Date date;
    @Column(name = "Category_ID", nullable = false)
    private int category_id;

    public Power(int roomId, int number, Date date, int category_id) {
        this.roomId = roomId;
        this.number = number;
        this.date = date;
        this.category_id = category_id;
    }
}
