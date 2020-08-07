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
@AllArgsConstructor
@NoArgsConstructor
public class Bill implements Serializable{
    @Id
    @GeneratedValue
    @Column(name = "ID", nullable = false)
    private int id;
    @Column(name = "Total", nullable = false)
    private int total;
    @Temporal(TemporalType.DATE)
    @Column(name = "Date", nullable = false)
    private Date date;
    @Column(name = "Status_ID", nullable = false)
    private int statusId;

    public Bill(int total, Date date, int statusId) {
        this.total = total;
        this.date = date;
        this.statusId = statusId;
    }
}
