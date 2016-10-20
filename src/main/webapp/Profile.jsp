<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <link rel="stylesheet" type="text/css" href="profileinfo.css" />
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
                <div class = "Profile"><li><a class="active" href="Profile.jsp"><%=UserName%></a></li></div>
                    <%}
                            }else{
                                %>
                <li><a href="register.jsp">Register</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li style="float:right;color:white;">instaGrim</li>
                <%
                                        
                            
                    }%> 
           </ul>
        </div>
           <br><br><br>
           
    <body>
        <div class="mainbody">
            <form method="POST" enctype="multipart/form-data" action="Image">
                Choose a new Profile Picture! <input type="file" name="upprofpic">
                <br/>
                <br/>
                <input type="submit" value="Press"> to upload!
            </form>
            <br>
            <img src="" alt="Profile Picture" style="width:200px;height:200px;"
                 <br>
            <%
                String UserName = lg.getUsername();
                String fname = lg.getFirst_name();
                String sname = lg.getLast_name();
            %>
            <h3 style='text-align: center'>USERNAME: <%=UserName%></h3>
            <table style="width:100%;padding:10px;">
                <tr>
                    <td>NAME: <%=fname%></td>
                    <td>SURNAME: <%=sname%></td>
                </tr><tr></tr><tr></tr>
                <tr>
                    <td>EMAILADDRESS</td>
                    <td>TELEPHONENUM</td>
                </tr><tr></tr><tr></tr>
                <tr>
                    <td>DATEOFBIRTH</td>
                    <td>PICTUREPROF</td>
                </tr>
            </table>
        </div>
    </body>
</html>
