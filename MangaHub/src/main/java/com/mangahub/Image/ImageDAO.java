/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mangahub.Image;

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
public class ImageDAO {
    public ArrayList<ImageDTO> loadChapterImages(int chapterID) {
        String sql = "SELECT imageID, imageNumber, imageURL, chapterID FROM Images WHERE chapterID = ?";
        ArrayList<ImageDTO> imageList = new ArrayList<>();
        try {
            Connection cn = DBUtil.getConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, chapterID);
            ResultSet rs = pst.executeQuery();
            
            while(rs.next()){
                ImageDTO image = new ImageDTO();
                image.setImageID(rs.getInt("imageID"));
                image.setImageNumber(rs.getInt("imageNumber"));
                image.setImageURL(rs.getString("imageURL"));
                image.setChapterID(chapterID);
                
                imageList.add(image);
            }
            Collections.sort(imageList);
            return imageList;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}
