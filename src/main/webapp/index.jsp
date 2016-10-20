<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <header>
            <!--<h1>InstaGrim ! </h1>
            <h2>Your world in Black and White</h2>-->
        </header>
        
        <div class="nav">
            <ul>
                <li style="float:left; color:#999999">instaGrim</li>
                <li><a class = "active" href="/Instagrim">Home</a></li>
                <li><a href="index.jsp">About</a></li>
		<li><a href="/Instagrim/Upload">Upload</a></li>
                    <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getloggedin()) {
                    %>

                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Images</a></li>
                <li><a method="POST"  action="Logout">Logout</a></li>
                <div class = "Profile"><li><a href="/Instagrim/Profile"><%=UserName%></a></li></div> <!-- maybe add Profile/"USERNAME" -->
                    <%}
                            }else{
                                %>
                <li><a href="/Instagrim/Register">Register</a></li>
                <li><a href="/Instagrim/Login">Login</a></li>
                <li style="float:right;color:white;">instaGrim</li>
                <%
                                        
                            
                    }%> 
           </ul>
        </div>
      
           <br><br>
        <img src="instagrim/home_img_1.jpg" alt="Temp Image" style="width:1920px;height:300px;">
        <img src="instagrim/home_img_2.jpg" alt="Temp Image" style="width:1920px;height:300px;">
        <img src="instagrim/home_img_3.jpg" alt="Temp Image" style="width:1920px;height:300px;">
        <img src="instagrim/home_img_4.jpg" alt="Temp Image" style="width:1920px;height:300px;">
        
        <footer>
            <h2>&COPY; Andy C</h2>
            <h3>Rory R</h3>
        </footer>
    </body>
</html>
