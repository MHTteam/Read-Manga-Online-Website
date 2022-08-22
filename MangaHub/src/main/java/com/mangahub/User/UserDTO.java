/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mangahub.User;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author MSI GF63
 */
public class UserDTO implements Serializable{
    private String userName;
    private String password;
    private String email;
    private String avatarURL;
    private String nickName;
    private String gender;
    private Boolean status;
    private Date signupDate;
    private String roleName;

    public UserDTO() {
    }

    public UserDTO(String userName, String password, String email, String avatarURL, String nickName, String gender, Boolean status, Date signupDate, String roleName) {
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.avatarURL = avatarURL;
        this.nickName = nickName;
        this.gender = gender;
        this.status = status;
        this.signupDate = signupDate;
        this.roleName = roleName;
    }
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatarURL() {
        return avatarURL;
    }

    public void setAvatarURL(String avatarURL) {
        this.avatarURL = avatarURL;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Date getSignupDate() {
        return signupDate;
    }

    public void setSignupDate(Date signupDate) {
        this.signupDate = signupDate;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
    
    
}
