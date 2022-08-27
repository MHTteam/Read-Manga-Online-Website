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
import java.util.ArrayList;
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

        if (checkEmail(email)) {
            return null;
        }
        if (checkUserName(userName)) {
            return null;
        }

        if (checkNickName(nickName)) {
            return null;
        }

        long millis = System.currentTimeMillis();
        java.sql.Date signupDate = new java.sql.Date(millis);

        try {
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, nickName);
            ps.setString(5, gender);
            ps.setDate(6, signupDate);

            int rs = ps.executeUpdate();

            if (rs != 0) {
                return login(userName, password);
            }

        } catch (Exception e) {
            System.out.println("An Erorr occured when add a new user.");
            e.printStackTrace();
            e.getMessage();
        }

        return null;
    }

    private boolean checkUserName(String userName) {
        String sql = "SELECT * FROM Users "
                + " WHERE userName = ? ";

        try {
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            System.out.println("An error occour when executing query.");
            e.printStackTrace();
        }

        return false;
    }

    private boolean checkEmail(String email) {
        String sql = "SELECT * FROM Users "
                + " WHERE email = ? ";

        try {
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            System.out.println("An error occour when executing query.");
            e.printStackTrace();
        }

        return false;
    }

    private boolean checkNickName(String nickName) {
        String sql = "SELECT * FROM Users "
                + " WHERE nickName = ? ";

        try {
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nickName);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            System.out.println("An error occour when executing query.");
            e.printStackTrace();
        }

        return false;
    }

    public boolean changePass(String userName, String pass) {

        String sql = "UPDATE Users "
                + " SET password = ? "
                + " WHERE userName = ?; ";

        try {
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, userName);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error when execute query.");
            e.printStackTrace();
            e.getMessage();
        }

        return false;
    }

    public boolean changeProfile(String userName, String nickName, String gender) {

        if (checkNickName(nickName)) {
            return false;
        }

        String sql = "UPDATE Users "
                + " SET nickName = ?, gender = ? "
                + " WHERE userName = ? ";

        try {
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nickName);
            ps.setString(2, gender);
            ps.setString(3, userName);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error when execute query.");
            e.printStackTrace();
            e.getMessage();
        }

        return false;
    }

    public boolean changeProfile(String userName, String gender) {

        String sql = "UPDATE Users "
                + " SET gender = ? "
                + " WHERE userName = ? ";

        try {
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, gender);
            ps.setString(2, userName);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error when execute query.");
            e.printStackTrace();
            e.getMessage();
        }

        return false;
    }

    //load data from database and save in a list
    public ArrayList<UserDTO> list() {
        String sql = "select userName, [password], email, phoneNumber, avatarURL, nickname, gender, [status], signupDate, roleName"
                + "from Users"
                + "inner join UserRoles"
                + "on Users.[role] = UserRoles.roleID;";
        ArrayList<UserDTO> userList = new ArrayList<>();
        try {
            Connection cn = DBUtil.getConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                UserDTO userDTO = new UserDTO();

                userDTO.setUserName(rs.getString("userName"));
                userDTO.setPassword(rs.getString("password"));
                userDTO.setEmail(rs.getString("email"));
                userDTO.setAvatarURL(rs.getString("avartarURL"));
                userDTO.setNickName(rs.getString("nickname"));
                userDTO.setGender(rs.getString("gender"));
                userDTO.setStatus(rs.getBoolean("status"));
                userDTO.setSignupDate(rs.getDate("signupDate"));
                userDTO.setRoleName(rs.getString("roleName"));

                userList.add(userDTO);
            }
            return userList;
        } catch (SQLException ex) {
            System.out.println("Query user error: " + ex.getMessage());
        }
        return null;

    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
//        UserDTO test = dao.signUp("daominhtri1000@gmail.com", "triPro", "123456", "triPro", "nam");
//        System.out.println(test.toString());

//        String email = "daominhtri@gmail.com";
//        boolean matchEmail = email.matches("^[a-z][a-z0-9_\\.]{5,32}@gmail.com$");
//        System.out.println(matchEmail);
//
//        String txt[] = email.split("@");
//        String nickName = txt[0];
//        System.out.println(nickName);

        String userName = "girluser";
        String nickName = "admin pro";
        String gender = "Nữ";
        
        System.out.println(dao.changeProfile(userName, gender));

    }
}
