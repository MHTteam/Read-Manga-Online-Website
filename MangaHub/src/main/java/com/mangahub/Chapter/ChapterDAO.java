/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mangahub.Chapter;

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
public class ChapterDAO {
    public ArrayList<ChapterDTO> loadChapters(int mangaID){
        String sql = "SELECT chapterID, chapterNumber, chapterName, updateDate, mangaID FROM Chapters WHERE mangaID = ?";
        ArrayList<ChapterDTO> chapterList = new ArrayList<>();
        try {
            Connection cn = DBUtil.getConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, mangaID);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                ChapterDTO chapter = new ChapterDTO();
                chapter.setChapterID(rs.getInt("chapterID"));
                chapter.setChapterNumber(rs.getInt("chapterNumber"));
                chapter.setChapterName(rs.getString("chapterName"));
                chapter.setUpdateDate(rs.getDate("updateDate"));
                chapter.setMangaID(mangaID);
                
                chapterList.add(chapter);
            }
            Collections.sort(chapterList, Collections.reverseOrder());
            return chapterList;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
}
