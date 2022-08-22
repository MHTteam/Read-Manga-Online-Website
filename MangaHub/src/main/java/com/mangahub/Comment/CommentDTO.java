
package com.mangahub.Comment;

import java.io.Serializable;
import java.sql.Date;

public class CommentDTO implements Serializable{
    private int commentID;
    private String content;
    private Date commentDate;
    private Boolean status;
    private String userName;
    private int mangaID;

    public CommentDTO() {
    }

    public CommentDTO(int commentID, String content, Date commentDate, Boolean status, String userName, int mangaID) {
        this.commentID = commentID;
        this.content = content;
        this.commentDate = commentDate;
        this.status = status;
        this.userName = userName;
        this.mangaID = mangaID;
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getMangaID() {
        return mangaID;
    }

    public void setMangaID(int mangaID) {
        this.mangaID = mangaID;
    }
    
    
}
