<%-- 
    Document   : searchpage
    Created on : 19-Oct-2016, 21:24:07
    Author     : R.Raeper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="uk.ac.dundee.computing.rjr.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    
     <div class="nav">
            <ul>
                <li style="float:left; color:#999999">instaGrim</li>
                <li><a href="/Instagrim">Home</a></li>
                <li><a class = "active" href="/Instagrim/Search">Search</a></li>
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
                <li><a href="/Instagrim/Login">Login</a></li>
                <li style="float:right;color:white;">instaGrim</li>
                <%}%> 
           </ul>
        </div>
           <br><br><br>
    <body>
        <div class="mainbody">
        Search for Somebody! 
        <form method="POST"  action="Search">
                <ul style="list-style:none; padding-right:40px;">
                    <li><input type="text" name="username" required></li>
                </ul>
                <br/>
                <input type="submit" value="Search"> 
        </form>
        <br> <br>
        <%
            if(session.getAttribute("NAME")!=(null))
            {%>
        <h2>You searched "${NAME}",</h2>
        <h2>Results:</h2>
            <% if(session.getAttribute("EntryNotValid")!=null){ %>
            <h2>User doesn't exist</h2>
            <% } %>   
        <a style="text-decoration: none;" href="/Instagrim/Images/${NAME}">Click Here to view ${NAME}'s Profile</a>
        <%}else{}%> 
        <br>
                <footer>
            <h2>&COPY; Andy C</h2>
            <h3>Edited by Rory R</h3>
        </footer>
        </div>
    </body>
</html>
