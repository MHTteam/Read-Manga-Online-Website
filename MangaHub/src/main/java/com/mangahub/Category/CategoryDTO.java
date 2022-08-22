
package com.mangahub.Category;

import java.io.Serializable;

public class CategoryDTO implements Serializable{
    private int cateID;
    private String cateName;

    public CategoryDTO() {
    }

    public CategoryDTO(int cateID, String cateName) {
        this.cateID = cateID;
        this.cateName = cateName;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }
    
    
}
