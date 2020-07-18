/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Tuan
 */
@Entity
@Table(name = "Account")
public class Account implements Serializable {
    @Id
    @Column(name = "Username", nullable = false, length = 50)
    private String username;
    @Column(name = "Password", nullable = false, length = 500)
    private String password;
    @Column(name = "Fullname", nullable = false, columnDefinition = "NVARCHAR(500)")
    private String fullname;
    @Column(name = "Role_ID", nullable = false)
    private int roleID;
    @Column(name = "Status_ID", nullable = false)
    private int statusID;

    public Account() {
    }

    public Account(String username, String password, String fullname, int roleID, int statusID) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.roleID = roleID;
        this.statusID = statusID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }
}
