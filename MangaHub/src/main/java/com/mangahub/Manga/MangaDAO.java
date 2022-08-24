/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mangahub.Manga;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtil;

/**
 *
 * @author MSI GF63
 */
public class MangaDAO {
    public MangaDTO loadManga(int mangaID){
        String sql = "SELECT mangaID, mangaName, coverImageURL, [description], publishDate, updateDate, likeNumber, rating, [view], [status], author, uploader, [group] FROM Mangas WHERE mangaID = ?";
        try {
            Connection cn = DBUtil.getConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, mangaID);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                MangaDTO manga = new MangaDTO();
                manga.setMangaID(mangaID);
                manga.setMangaName(rs.getString("mangaName"));
                manga.setCoverImageURL(rs.getString("coverImageURL"));
                manga.setDescription(rs.getString("description"));
                manga.setPublishDate(rs.getDate("publishDate"));
                manga.setUpdateDate(rs.getDate("updateDate"));
                manga.setLikeNumber(rs.getInt("likeNumber"));
                manga.setRating(rs.getDouble("rating"));
                manga.setView(rs.getInt("view"));
                manga.setStatus(rs.getString("status"));
                manga.setAuthor(rs.getInt("author"));
                manga.setUploader(rs.getString("uploader"));
                manga.setGroup(rs.getString("group"));
                
                return manga;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}
