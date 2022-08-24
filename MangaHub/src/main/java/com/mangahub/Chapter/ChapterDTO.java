package com.mangahub.Chapter;

import java.io.Serializable;
import java.sql.Date;

public class ChapterDTO implements Serializable, Comparable<ChapterDTO> {

    private int chapterID;
    private int chapterNumber;
    private String chapterName;
    private Date updateDate;
    private int mangaID;

    public ChapterDTO() {
    }

    public ChapterDTO(int chapterID, int chapterNumber, String chapterName, Date updateDate, int mangaID) {
        this.chapterID = chapterID;
        this.chapterNumber = chapterNumber;
        this.chapterName = chapterName;
        this.updateDate = updateDate;
        this.mangaID = mangaID;
    }

    public int getChapterID() {
        return chapterID;
    }

    public void setChapterID(int chapterID) {
        this.chapterID = chapterID;
    }

    public int getChapterNumber() {
        return chapterNumber;
    }

    public void setChapterNumber(int chapterNumber) {
        this.chapterNumber = chapterNumber;
    }

    public String getChapterName() {
        return chapterName;
    }

    public void setChapterName(String chapterName) {
        this.chapterName = chapterName;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public int getMangaID() {
        return mangaID;
    }

    public void setMangaID(int mangaID) {
        this.mangaID = mangaID;
    }

    // CompareTo method to sort the list of object
    // by chapterNumber
    @Override
    public int compareTo(ChapterDTO chapter) {
        if (chapterNumber == chapter.getChapterNumber()) {
            return 0;
        } else if (chapterNumber > chapter.getChapterNumber()) {
            return 1;
        } else {
            return -1;
        }
    }

}
