
package com.mangahub.Category;

import java.io.Serializable;

public class CategoryDTO implements Serializable, Comparable<CategoryDTO>{
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
    
    // CompareTo method to sort the list of object
    // by cateName
    @Override
    public int compareTo(CategoryDTO cate) {
        return this.cateName.compareTo(cate.getCateName());
    }
    
    
}
