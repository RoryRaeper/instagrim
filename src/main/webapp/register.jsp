<%-- 
    Document   : register.jsp
    Created on : Sep 28, 2014, 6:29:51 PM
    Author     : R.Raeper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="uk.ac.dundee.computing.rjr.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Styles.css" />
    </head>
    <body>
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
                <li><a class = "active" href="/Instagrim/Register">Register</a></li>
                <li><a href="/Instagrim/Login">Login</a></li>
                <li style="float:right;color:white;">instaGrim</li>
                <%}%> 
           </ul>
        </div>
           <br><br><br>
           
           
        <div class="mainbody">
                   
        <div class="regpage">       
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
                                        <td><input type="tel" name="tel" id="tel" pattern='^\s*\(?(020[7,8]{1}\)?[ ]?[1-9]{1}[0-9{2}[ ]?[0-9]{4})|(0[1-8]{1}[0-9]{3}\)?[ ]?[1-9]{1}[0-9]{2}[ ]?[0-9]{3})\s*$'></td>
                                        <td>Date of Birth:</td>
                                        <td><input type="date" name="DoB" min="1900-01-01" required></td>
                                    </tr>
                                </table>
                                <br/><br>
                                <div style="margin:0;text-align:center;">
                                <input type="submit" value="Register">
                                </div>
                            </form>
            
            
                <%String temp = (String)session.getAttribute("RegistrationError");
                if(temp.equals("EmailsDontMatch")){%>
                    <br><br><div style="color:red;">Emails don't match, Please Try Again.</div>
                <%}else if(temp.equals("UsernameConflict")){%>
                    <br><br><div style="color:red;">Username is already in use, Please Try Again.</div>
                <%}else{}%>
                
                
            </div>
        </article>
        </div>
                <footer>
            <h2>&COPY; Andy C</h2>
            <h3>Edited by Rory R</h3>
        </footer>
    </body>
</html>
