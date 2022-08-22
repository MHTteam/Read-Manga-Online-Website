
package com.mangahub.Author;

import java.io.Serializable;

public class AuthorDTO implements Serializable{
    private int authorID;
    private String authorName;

    public AuthorDTO() {
    }

    public AuthorDTO(int authorID, String authorName) {
        this.authorID = authorID;
        this.authorName = authorName;
    }

    public int getAuthorID() {
        return authorID;
    }

    public void setAuthorID(int authorID) {
        this.authorID = authorID;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }
    
    
}
