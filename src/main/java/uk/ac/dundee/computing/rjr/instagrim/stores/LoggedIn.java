/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.rjr.instagrim.stores;

/**
 *
 * @author R.Raeper
 */
public class LoggedIn {
    boolean loggedin=false;
    String Username=null;
    String fname=null;
    String sname=null;
    String email=null;
    String dob=null;
    String phone=null;
    public void LoggedIn(){
        
    }
    
    public void setUsername(String name){
        this.Username=name;
    }
    public String getUsername(){
        return Username;
    }

    public void setFirst_name(String firstname){
        this.fname=firstname;
    }
    
    public String getFirst_name(){
        return fname;
    }
    
    public void setLast_name(String surname){
        this.sname=surname;
    }
    
    public String getLast_name(){
        return sname;
    }
    
    public void setEmail(String Email){
        this.email=Email;
    }
    
    public String getEmail(){
        return email;
    }
    
    public void setPhone(String telephone){
        this.phone=telephone;
    }
    
    public String getPhone(){
        return phone;
    }
    
    public void setDoB(String DoB){
        this.dob=DoB;
    }
    
    public String getDoB(){
        return dob;
    }
    
    public void setLoggedin(){
        loggedin=true;
    }
    public void setLoggedout(){
        loggedin=false;
    }
    
    public void setLoginState(boolean loggedin){
        this.loggedin=loggedin;
    }
    public boolean getloggedin(){
        return loggedin;
    }
}
