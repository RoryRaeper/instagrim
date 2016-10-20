<%-- 
    Document   : register.jsp
    Created on : Sep 28, 2014, 6:29:51 PM
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
    <body>
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

                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Images</a></li>
                <li><a method="POST"  action="Logout">Logout</a></li>
                <div class = "Profile"><li><a href="Profile.jsp">Profile</a></li></div>
                    <%}
                            }else{
                                %>
                <li><a class="active" href="register.jsp">Register</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li style="float:right;color:white;">instaGrim</li>
                <%
                                        
                            
                    }%> 
           </ul>
        </div>
           <br><br><br>
           
           
        <div class="mainbody">
                   
        <div class="regpage">
        <!--<nav>
            <ul>
                
                <li><a href="/Instagrim/Images/majed">Sample Images</a></li>
            </ul>
        </nav>-->
       
        <article>
            
            <h3 style='text-align: center'>Register as user</h3>
            <br>
                            <form method="POST"  action="Register">
                                <table style="width:100%">
                                    <tr>
                                        <td>First Name:</td>
                                        <td><input type="text" name="fname" required></td>
                                        <td>Surname:</td>
                                        <td><input type="text" name="sname" required></td>
                                    </tr>
                                    <tr>
                                        <td>User Name:</td> 
                                        <td><input type="text" name="username" minlength="2" maxlength="15" required></td>
                                        <td>Password:</td>
                                        <td><input type="password" name="password" minlength="5" required></td>
                                    </tr>
                                    <tr>
                                        <td>Email:</td>
                                        <td><input type="email" name="email" required></td>
                                        <td>Confirm Email:</td>
                                        <td><input type="email" name="emailConf" required></td>
                                    </tr>
                                    <tr>
                                        <td>Telephone:</td>
                                        <td><input type="tel" name="tel" id="tel"> <!--pattern='[\+]\d{2}[\(]\d{2}[\)]\d{4}[\-]\d{4}'title='Phone Number (Format: +99(99)9999-9999)'--></td>
                                        <td>Date of Birth:</td>
                                        <td><input type="date" name="DoB" min="1900-01-01" required></td>
                                    </tr>
                                </table>
                                <br/><br>
                                <div style="margin:0;text-align:center;">
                                <input type="submit" value="Register">
                                </div>
                            </form>
            </div>
        </article>
        </div>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html>
