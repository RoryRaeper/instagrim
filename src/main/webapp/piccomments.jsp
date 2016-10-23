<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : R.Raeper
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.rjr.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Styles.css" />
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
      
           <br><br><br><br><br><br>
             <%request.getAttribute("uuid");
             System.out.println("HELLO:::: " + request.getAttribute("uuid"));
             %>
        <div class="mainbody"> 
            <img src="/Instagrim/Image/${uuid}" style="width:500px;height:300px;">
            <br><br>
        <%java.util.LinkedList<PicComments> comments = (java.util.LinkedList<PicComments>) request.getAttribute("PicComments");
            if (comments == null) {%>
        <p>No Comments found</p>
                <table style ="text-align:left;width:100%;">
        <%} else {
            Iterator<PicComments> iterator;
            iterator = comments.iterator();
                while (iterator.hasNext()) {
                    PicComments c = (PicComments) iterator.next();%>
                <tr>
                    <td><%=c.getUser()%>        ||          Date Added: <%=c.getDateAdded()%></td><br>
                <td><div style='color:black'><%=c.getCommentText()%></div><td/><br><br>
                </tr>
                    <%}
            }%>
        
        
        
           <%lg = (LoggedIn) session.getAttribute("LoggedIn");
               if (lg != null){
                    String UserName = lg.getUsername();
                    if(lg.getloggedin()){%>
           <form method="POST"  action="Comments" id="commentBox">
                <br/>
                <input type="submit" value="Add Comment"> 
            </form>
           
           <textarea rows="4" cols="50" name="comment" form="commentBox"></textarea>
           <% }}else{%>
           Please <a href="/Instagrim/Login">Log in</a> to post a comment on this picture.
           <%}%>
        </div>
        
           
        <footer>
            <h2>&COPY; Andy C</h2>
            <h3>Edited by Rory R</h3>
        </footer>
    </body>
</html>
