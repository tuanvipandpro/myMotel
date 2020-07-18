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
@Table(name = "Room")
public class Room implements Serializable {
    @Id
    @GeneratedValue
    @Column(name = "ID", nullable = false)
    private int id;
    @Column(name = "Room_Number", nullable = false, columnDefinition = "NVARCHAR(5)")
    private String room_number;
    @Column(name = "Owner", nullable = false, columnDefinition = "NVARCHAR(50)")
    private String owner;
    @Column(name = "Status_ID", nullable = false)
    private int status_id;

    public Room() {
    }

    public Room(int id, String room_number, String owner, int status_id) {
        this.id = id;
        this.room_number = room_number;
        this.owner = owner;
        this.status_id = status_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoom_number() {
        return room_number;
    }

    public void setRoom_number(String room_number) {
        this.room_number = room_number;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public int getStatus_id() {
        return status_id;
    }

    public void setStatus_id(int status_id) {
        this.status_id = status_id;
    }
}
