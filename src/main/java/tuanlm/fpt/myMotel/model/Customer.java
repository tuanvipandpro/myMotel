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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Tuan
 */
@Entity
@Table(name = "Customer")
public class Customer implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private int id;
    @Column(name = "Name", nullable = false, columnDefinition = "NVARCHAR(50)")
    private String name;
    @Temporal(TemporalType.DATE)
    @Column(name = "Birthdate", nullable = false)
    private Date birthdate;
    @Column(name = "Sex", nullable = false)
    private boolean sex;
    @Column(name = "Phone", nullable = true, columnDefinition = "NVARCHAR(20)")
    private String phone;
    @Column(name = "Email", nullable = true, columnDefinition = "NVARCHAR(50)")
    private String email;

    public Customer() {
    }

    public Customer(String name, Date date, boolean sex) {
        this.name = name;
        this.birthdate = date;
        this.sex = sex;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
