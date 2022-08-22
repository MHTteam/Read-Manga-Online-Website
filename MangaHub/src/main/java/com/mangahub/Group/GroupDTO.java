
package com.mangahub.Group;

import java.io.Serializable;
import java.sql.Date;

public class GroupDTO implements Serializable{
    private String groupID;
    private String groupName;
    private String groupAvatarURL;
    private String description;
    private String creator;
    private Date createDate;

    public GroupDTO() {
    }

    public GroupDTO(String groupID, String groupName, String groupAvatarURL, String description, String creator, Date createDate) {
        this.groupID = groupID;
        this.groupName = groupName;
        this.groupAvatarURL = groupAvatarURL;
        this.description = description;
        this.creator = creator;
        this.createDate = createDate;
    }

    public String getGroupID() {
        return groupID;
    }

    public void setGroupID(String groupID) {
        this.groupID = groupID;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getGroupAvatarURL() {
        return groupAvatarURL;
    }

    public void setGroupAvatarURL(String groupAvatarURL) {
        this.groupAvatarURL = groupAvatarURL;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    
    
}
