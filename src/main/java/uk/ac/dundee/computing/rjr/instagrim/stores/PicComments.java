/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.rjr.instagrim.stores;

import java.util.Date;

/**
 *
 * @author R.Raeper
 */
public class PicComments {

    String commentText=null;
    String User=null;
    java.util.UUID UUID=null;
    String suuid=null;
    Date date_added=null;
    java.util.UUID commentID=null;   
    
    public void Pic() {

    }
    
    public void setUUID(java.util.UUID uuid){
        this.UUID =uuid;
    }
    
    public void setUUIDfromString(String uuid){
        this.UUID =UUID.fromString(uuid);
    }
    
    public java.util.UUID getCommentID(){
        return commentID;
    }
    
    public void setCommentID(java.util.UUID CommentID){
        this.commentID = CommentID;
    }
    
    public java.util.UUID getUUID(){
        return UUID;
    }
    
    public String getSUUID(){
        return UUID.toString();
    }
    
    public void setPicComments(String comment, String user, Date added) {
        this.commentText = comment;
        this.User = user;
        this.date_added=added;
    }
    
    public void setCommentText(String Comment){
        this.commentText = Comment;
    }
    public String getCommentText(){
        return commentText;
    }
    
    public String getUser(){
        return User;
    }
    
    public Date getDateAdded(){
        return date_added;
    }
    
    

}
