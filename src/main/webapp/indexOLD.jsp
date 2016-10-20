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
                <li><a class="active" href="index.jsp">Home</a></li>
                <li><a href="index.jsp">About</a></li>
		<li><a href="index.jsp">Upload</a></li>
                <li><a href="index.jsp">Profile</a></li>
                <li><a href="index.jsp">Sign In</a></li>
            </ul>
        </div>
        <navtemp>
            <ul>

               
                <li><a href="upload.jsp">Upload</a></li>
                    <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>

                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                    <%}
                            }else{
                                %>
                 <li><a href="register.jsp">Register</a></li>
                <li><a href="login.jsp">Login</a></li>
                <%
                                        
                            
                    }%>
            </ul>
        </navtemp>
    
        <img src="instagrim/home_img_1.jpg" alt="Temp Image" style="width:1920px;height:300px;">
        <img src="instagrim/home_img_2.jpg" alt="Temp Image" style="width:1920px;height:300px;">
        <img src="instagrim/home_img_3.jpg" alt="Temp Image" style="width:1920px;height:300px;">
        <img src="instagrim/home_img_4.jpg" alt="Temp Image" style="width:1920px;height:300px;">
        
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
                <li>&COPY; Andy C</li>
            </ul>
        </footer>
    </body>
</html>
