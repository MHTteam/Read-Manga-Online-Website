
package com.mangahub.Image;

import java.io.Serializable;

public class ImageDTO implements Serializable, Comparable<ImageDTO>{
    private int imageID;
    private int imageNumber;
    private String imageURL;
    private int chapterID;

    public ImageDTO() {
    }

    public ImageDTO(int imageID, int imageNumber, String imageURL, int chapterID) {
        this.imageID = imageID;
        this.imageNumber = imageNumber;
        this.imageURL = imageURL;
        this.chapterID = chapterID;
    }

    public int getImageID() {
        return imageID;
    }

    public void setImageID(int imageID) {
        this.imageID = imageID;
    }

    public int getImageNumber() {
        return imageNumber;
    }

    public void setImageNumber(int imageNumber) {
        this.imageNumber = imageNumber;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public int getChapterID() {
        return chapterID;
    }

    public void setChapterID(int chapterID) {
        this.chapterID = chapterID;
    }

    @Override
    public int compareTo(ImageDTO image) {
        if (imageNumber == image.getImageNumber()) {
            return 0;
        } else if (imageNumber > image.getImageNumber()) {
            return 1;
        } else {
            return -1;
        }
    }
    
    
}
