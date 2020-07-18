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
import javax.persistence.Table;

/**
 *
 * @author Tuan
 */
@Entity
@Table(name = "Room_Customer")
public class RoomCustomer implements Serializable{
    @Id
    @GeneratedValue
    @Column(name = "ID", nullable = false)
    private int id;
    @Column(name = "Room_ID", nullable = false)
    private int roomId;
    @Column(name = "Customer_ID", nullable = false)
    private int customerId;

    public RoomCustomer() {
    }

    public RoomCustomer(int id, int roomId, int customerId) {
        this.id = id;
        this.roomId = roomId;
        this.customerId = customerId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
}
