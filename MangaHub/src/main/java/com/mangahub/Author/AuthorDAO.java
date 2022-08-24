/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mangahub.Author;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtil;

/**
 *
 * @author MSI GF63
 */
public class AuthorDAO {
    public AuthorDTO loadAuthor(int authorID){
        String sql = "SELECT authorID, authorName FROM Authors WHERE authorID = ?";
        try {
            Connection cn = DBUtil.getConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, authorID);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                AuthorDTO author = new AuthorDTO();
                author.setAuthorID(authorID);
                author.setAuthorName(rs.getString("authorName"));
                
                return author;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    // main function to test functions
    public static void main(String[] args) {
        AuthorDAO dao = new AuthorDAO();
        AuthorDTO author = dao.loadAuthor(1);
        System.out.println(author.getAuthorName());
    }
}

