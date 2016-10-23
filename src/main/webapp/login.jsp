<%-- 
    Document   : login.jsp
    Created on : Sep 28, 2014, 12:04:14 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.rjr.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />

    </head>
    
    
    <div class="nav">
            <ul>
                <li style="float:left; color:#999999">instaGrim</li>
                <li><a href="/Instagrim">Home</a></li>
                <li><a href="/Instagrim/Search">Search</a></li>
		<li><a href="/Instagrim/Upload">Upload</a></li>
                    <%  
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        System.out.println("LOGGED IN? " + lg);
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getloggedin()) {
                                System.out.println("LOGGED IN? " + lg.getloggedin());
                    %>

                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Images</a></li>
                <li><a href="/Instagrim/Logout" method="POST"  action="Logout">Logout</a></li>
                <div class = "Profile"><li><a href="/Instagrim/Profile"><%=UserName%></a></li></div> 
                    <%}}else{%>
                <li><a href="/Instagrim/Register">Register</a></li>
                <li><a class = "active" href="/Instagrim/Login">Login</a></li>
                <li style="float:right;color:white;">instaGrim</li>
                <%}%> 
           </ul>
        </div>
           <br><br><br>
    <body>
        <div class='mainbody'>
            <div class="regpage">
        <h1>Enter your Username and password</h1>
        <h2>If you don't have an account, please register <a href="/Instagrim/Register">here</a>.
       
        <!--<div class='mainbody'>-->
        <article>
            <h3>Login</h3>
            <form method="POST"  action="Login">
                <ul style='list-style:none;'>
                    <li>User Name &nbsp;&nbsp;<input type="text" name="username"></li><br>
                    <li>Password  &nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password"></li>
                </ul>
                <br/>
                <input type="submit" value="Login"> 
            </form>
            
            <%Boolean temp1 = (Boolean)session.getAttribute("validuser");
                if(temp1==null){}
                else if(temp1==false){%>
                <br><br><div style="color:red;">Invalid Login, Please Try Again.</div>
                <%}else{%>
                <%}%>
            
            </div>
        </article>
        </div>
        <footer>
            <h2>&COPY; Andy C</h2>
            <h3>Edited by Rory R</h3>
        </footer>
    </body>
</html>
