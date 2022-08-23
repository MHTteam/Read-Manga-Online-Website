/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mangahub.User;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jdk.nashorn.internal.runtime.UserAccessorProperty;
import utils.DBUtil;

/**
 *
 * @author MSI GF63
 */
public class UserDAO {

    public UserDTO login(String userName, String password) {
        String sql = "SELECT userName, [password], email, avatarURL, nickName, gender, [status], signupDate, roleName FROM Users"
                + " INNER JOIN UserRoles"
                + " ON Users.[role] = UserRoles.roleID"
                + " WHERE userName = ? AND [password] = ?";
        try {
            Connection cn = DBUtil.getConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, userName);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                UserDTO user = new UserDTO();
                user.setUserName(rs.getString("userName"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setAvatarURL(rs.getString("avatarURL"));
                user.setNickName(rs.getString("nickName"));
                user.setGender(rs.getString("gender"));
                user.setStatus(rs.getBoolean("status"));
                user.setSignupDate(rs.getDate("signupDate"));
                user.setRoleName(rs.getString("roleName"));

                return user;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public UserDTO signUp(String email, String userName, String password, String nickName, String gender) {
        String sql = "INSERT INTO Users(userName, [password], email, avatarURL, nickName, gender, [status], signupDate, [role]) "
                + "	VALUES (?, ?, ?, NULL, ?, ?, 0, ?, 2)";

        long millis = System.currentTimeMillis();
        java.sql.Date signupDate = new java.sql.Date(millis);
        
        try {
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,userName);
            
            
        } catch (Exception e) {
            System.out.println("An Erorr occured.");
            e.printStackTrace();
        }

        return null;

    }
    
//    private boolean checkUserName(String userName) {
//        String sql = "SELECT * FROM Users"
//        
//        return false;
//    }

    public static void main(String[] args) {
//        UserDAO dao = new UserDAO();
//        UserDTO user = dao.login("testUser", "111111");
//        System.out.println(user.getUserName());
//        System.out.println(user.getPassword());
//        System.out.println(user.getAvatarURL());
//        System.out.println(user.getGender());

        long millis = System.currentTimeMillis();
        java.sql.Date signupDate = new java.sql.Date(millis);
        System.out.println(signupDate);
    }
}
