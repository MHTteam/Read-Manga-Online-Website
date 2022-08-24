/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mangahub.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import utils.DBUtil;

/**
 *
 * @author MSI GF63
 */
public class CategoryDAO {
    public ArrayList<CategoryDTO> list(){
        String sql = "SELECT cateID, cateName FROM Categories";
        ArrayList<CategoryDTO> cateList = new ArrayList<>();
        try {
            Connection cn = DBUtil.getConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
                CategoryDTO cate = new CategoryDTO();
                cate.setCateID(rs.getInt("cateID"));
                cate.setCateName(rs.getString("cateName"));
                
                cateList.add(cate);
            }
            
            Collections.sort(cateList);
            return cateList;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public ArrayList<CategoryDTO> loadMangaCategories(int mangaID){
        String sql = "SELECT Categories.cateID, cateName FROM Categories"
                + " INNER JOIN Mangas_Categories"
                + " ON Categories.cateID = Mangas_Categories.cateID"
                + " WHERE mangaID = ?";
        ArrayList<CategoryDTO> cateList = new ArrayList<>();
        try {
            Connection cn = DBUtil.getConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, mangaID);
            ResultSet rs = pst.executeQuery();

            while(rs.next()){
                CategoryDTO cate = new CategoryDTO();
                cate.setCateID(rs.getInt("cateID"));
                cate.setCateName(rs.getString("cateName"));
                
                cateList.add(cate);
            }
            Collections.sort(cateList);
            return cateList;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
}
