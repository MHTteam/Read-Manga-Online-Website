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
import java.util.ArrayList;
import utils.DBUtil;

/**
 *
 * @author MSI GF63
 */
public class MangaDAO {

    public MangaDTO loadManga(int mangaID) {
        String sql = "SELECT mangaID, mangaName, coverImageURL, [description], publishDate, addedDate, updateDate, likeNumber, rating, [view], [status], author, uploader, [group] FROM Mangas WHERE mangaID = ?";
        try {
            Connection cn = DBUtil.getConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, mangaID);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                MangaDTO manga = new MangaDTO();
                manga.setMangaID(mangaID);
                manga.setMangaName(rs.getString("mangaName"));
                manga.setCoverImageURL(rs.getString("coverImageURL"));
                manga.setDescription(rs.getString("description"));
                manga.setPublishDate(rs.getDate("publishDate"));
                manga.setAddedDate(rs.getDate("addedDate"));
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

    public ArrayList<MangaDTO> loadTop6View() {
        String sql = "SELECT TOP 6 mangaID, mangaName, coverImageURL, [description], publishDate, addedDate, updateDate, likeNumber, rating, [view], [status], author, uploader, [group]"
                + " FROM Mangas ORDER BY [view] DESC";
        ArrayList<MangaDTO> list = new ArrayList<>();
        try {
            Connection cn = DBUtil.getConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                MangaDTO manga = new MangaDTO();
                manga.setMangaID(rs.getInt("mangaID"));
                manga.setMangaName(rs.getString("mangaName"));
                manga.setCoverImageURL(rs.getString("coverImageURL"));
                manga.setDescription(rs.getString("description"));
                manga.setPublishDate(rs.getDate("publishDate"));
                manga.setAddedDate(rs.getDate("addedDate"));
                manga.setUpdateDate(rs.getDate("updateDate"));
                manga.setLikeNumber(rs.getInt("likeNumber"));
                manga.setRating(rs.getDouble("rating"));
                manga.setView(rs.getInt("view"));
                manga.setStatus(rs.getString("status"));
                manga.setAuthor(rs.getInt("author"));
                manga.setUploader(rs.getString("uploader"));
                manga.setGroup(rs.getString("group"));

                list.add(manga);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public ArrayList<MangaDTO> loadTop6Rating() {
        String sql = "SELECT TOP 6 mangaID, mangaName, coverImageURL, [description], publishDate, addedDate, updateDate, likeNumber, rating, [view], [status], author, uploader, [group]"
                + " FROM Mangas ORDER BY [rating] DESC";
        ArrayList<MangaDTO> list = new ArrayList<>();
        try {
            Connection cn = DBUtil.getConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                MangaDTO manga = new MangaDTO();
                manga.setMangaID(rs.getInt("mangaID"));
                manga.setMangaName(rs.getString("mangaName"));
                manga.setCoverImageURL(rs.getString("coverImageURL"));
                manga.setDescription(rs.getString("description"));
                manga.setPublishDate(rs.getDate("publishDate"));
                manga.setAddedDate(rs.getDate("addedDate"));
                manga.setUpdateDate(rs.getDate("updateDate"));
                manga.setLikeNumber(rs.getInt("likeNumber"));
                manga.setRating(rs.getDouble("rating"));
                manga.setView(rs.getInt("view"));
                manga.setStatus(rs.getString("status"));
                manga.setAuthor(rs.getInt("author"));
                manga.setUploader(rs.getString("uploader"));
                manga.setGroup(rs.getString("group"));

                list.add(manga);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public ArrayList<MangaDTO> loadTop6RecentlyAdded() {
        String sql = "SELECT TOP 6 mangaID, mangaName, coverImageURL, [description], publishDate, addedDate, updateDate, likeNumber, rating, [view], [status], author, uploader, [group]"
                + " FROM Mangas ORDER BY [addedDate] DESC";
        ArrayList<MangaDTO> list = new ArrayList<>();
        try {
            Connection cn = DBUtil.getConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                MangaDTO manga = new MangaDTO();
                manga.setMangaID(rs.getInt("mangaID"));
                manga.setMangaName(rs.getString("mangaName"));
                manga.setCoverImageURL(rs.getString("coverImageURL"));
                manga.setDescription(rs.getString("description"));
                manga.setPublishDate(rs.getDate("publishDate"));
                manga.setAddedDate(rs.getDate("addedDate"));
                manga.setUpdateDate(rs.getDate("updateDate"));
                manga.setLikeNumber(rs.getInt("likeNumber"));
                manga.setRating(rs.getDouble("rating"));
                manga.setView(rs.getInt("view"));
                manga.setStatus(rs.getString("status"));
                manga.setAuthor(rs.getInt("author"));
                manga.setUploader(rs.getString("uploader"));
                manga.setGroup(rs.getString("group"));

                list.add(manga);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public static void main(String[] args) {
        MangaDAO dao = new MangaDAO();
        ArrayList<MangaDTO> rA = dao.loadTop6RecentlyAdded();
        if(rA == null){
            System.out.println("NULL");
        }
        else {
            System.out.println("NOT NULL");
        }
    }
}
