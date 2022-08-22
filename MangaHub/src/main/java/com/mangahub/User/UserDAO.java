/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mangahub.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtil;

/**
 *
 * @author MSI GF63
 */
public class UserDAO {
    public UserDTO login(String userName, String password){
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
            
            if(rs.next()){
                UserDTO user = new UserDTO();
                user.setUserName(rs.getString("userName"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setAvatarURL(rs.getString("avatarURL"));
                user.setNickName(rs.getString("nickName"));
                user.setGender(rs.getBoolean("gender"));
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
    
    
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        UserDTO user = dao.login("testUser1", "111111");
        System.out.println(user.getUserName());
        System.out.println(user.getPassword());
        System.out.println(user.getAvatarURL());
        System.out.println(user.getGender());
    }
}
