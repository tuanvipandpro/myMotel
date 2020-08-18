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
@AllArgsConstructor
@NoArgsConstructor
public class Fee implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)    
    private int id;
    @Column(name = "Electric", nullable = false)
    private int electric;
    @Column(name = "Water", nullable = false)
    private int water;
    @Column(name = "Other", nullable = false)
    private int other;
    @Temporal(TemporalType.DATE)
    @Column(name = "Date", nullable = false)
    private Date date;
}
