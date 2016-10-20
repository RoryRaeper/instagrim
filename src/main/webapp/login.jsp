<%-- 
    Document   : login.jsp
    Created on : Sep 28, 2014, 12:04:14 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
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
                <li><a href="index.jsp">About</a></li>
		<li><a href="upload.jsp">Upload</a></li>
                    <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getloggedin()) {
                    %>

                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                    <%}
                            }else{
                                %>
                <li><a href="register.jsp">Register</a></li>
                <li><a class="active" href="login.jsp">Login</a></li>
                <%
                                        
                            
                    }%> 
           </ul>
        </div>
           <br><br><br>
    <body>
        <header>
        <h1>InstaGrim ! </h1>
        <h2>Your world in Black and White</h2>
        </header>
        <nav>
            <ul>
                
                <li><a href="/Instagrim/Images/majed">Sample Images</a></li>
            </ul>
        </nav>
       
        <article>
            <h3>Login</h3>
            <form method="POST"  action="Login">
                <ul>
                    <li>User Name <input type="text" name="username"></li>
                    <li>Password <input type="password" name="password"></li>
                </ul>
                <br/>
                <input type="submit" value="Login"> 
            </form>

        </article>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html>
