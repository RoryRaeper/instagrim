<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : R.Raeper
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.rjr.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Styles.css" />
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

                <li><a class = "active" href="/Instagrim/Images/<%=lg.getUsername()%>">Images</a></li>
                <li><a href="/Instagrim/Logout" method="POST"  action="Logout">Logout</a></li>
                <div class = "Profile"><li><a href="/Instagrim/Profile"><%=UserName%></a></li></div> 
                    <%}}else{%>
                <li><a href="/Instagrim/Register">Register</a></li>
                <li><a href="/Instagrim/Login">Login</a></li>
                <li style="float:right;color:white;">instaGrim</li>
                <%}%> 
           </ul>
        </div>
        
        <nav>
            <ul>
                <li class="nav"><a href="/Instagrim/upload.jsp">Upload</a></li>
                <li class="nav"><a href="/Instagrim/Images/majed">Sample Images</a></li>
            </ul>
        </nav>
        <h1>Your Pics</h1>
        <%java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
            if (lsPics == null) {%>
        <p>No Pictures found</p>
        <div class="mainbody">
            <table style="width:100%;margin:0;">
        <%} else {
            Iterator<Pic> iterator;
            iterator = lsPics.iterator();
            while (iterator.hasNext()) {
                Pic p = (Pic) iterator.next();%>
                    <tr>
                        <td><a href="/Instagrim/Image/<%=p.getSUUID()%>" style="border: 0;"><img  style="border: 0" src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a><a href="/Instagrim/Comments/<%=p.getSUUID()%>/">Click to view comments.</a></td>
                        <!--<td><a href="/Instagrim/Comments/<%=p.getSUUID()%>/">Click to view comments.</a></td>-->
                    </tr>
                    <%}
            }%>
            </table>
        </div>
            <br><br>
                <footer>
            <h2>&COPY; Andy C</h2>
            <h3>Edited by Rory R</h3>
        </footer>
    </body>
</html>
