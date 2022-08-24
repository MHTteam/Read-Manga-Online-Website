package com.mangahub.Manga;

import java.io.Serializable;
import java.sql.Date;

public class MangaDTO implements Serializable {

    private int mangaID;
    private String mangaName;
    private String coverImageURL;
    private String description;
    private Date publishDate;
    private Date updateDate;
    private int likeNumber;
    private double rating;
    private int view;
    private String status;
    private int author;
    private String uploader;
    private String group;

    public MangaDTO() {
    }

    public MangaDTO(int mangaID, String mangaName, String coverImageURL, String description, Date publishDate, Date updateDate, int likeNumber, double rating, int view, String status, int author, String uploader, String group) {
        this.mangaID = mangaID;
        this.mangaName = mangaName;
        this.coverImageURL = coverImageURL;
        this.description = description;
        this.publishDate = publishDate;
        this.updateDate = updateDate;
        this.likeNumber = likeNumber;
        this.rating = rating;
        this.view = view;
        this.status = status;
        this.author = author;
        this.uploader = uploader;
        this.group = group;
    }

    public int getMangaID() {
        return mangaID;
    }

    public void setMangaID(int mangaID) {
        this.mangaID = mangaID;
    }

    public String getMangaName() {
        return mangaName;
    }

    public void setMangaName(String mangaName) {
        this.mangaName = mangaName;
    }

    public String getCoverImageURL() {
        return coverImageURL;
    }

    public void setCoverImageURL(String coverImageURL) {
        this.coverImageURL = coverImageURL;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public int getLikeNumber() {
        return likeNumber;
    }

    public void setLikeNumber(int likeNumber) {
        this.likeNumber = likeNumber;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getAuthor() {
        return author;
    }

    public void setAuthor(int author) {
        this.author = author;
    }

    public String getUploader() {
        return uploader;
    }

    public void setUploader(String uploader) {
        this.uploader = uploader;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }
    
    

}
