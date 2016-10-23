/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.rjr.instagrim.servlets;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uk.ac.dundee.computing.rjr.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.rjr.instagrim.models.User;
import uk.ac.dundee.computing.rjr.instagrim.stores.LoggedIn;
import uk.ac.dundee.computing.rjr.instagrim.stores.Pic;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    Cluster cluster=null;
    Boolean validUser = true;

    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");  
        HttpSession session=request.getSession();
        session.setAttribute("validuser", validUser);
        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
        String username=request.getParameter("username"); //reads in the values that the user entered
        String password=request.getParameter("password");
        
        User us=new User(); //Creates a new user object
        us.setCluster(cluster);
        boolean isValid=us.IsValidUser(username, password);
        String data = null;        
        
        HttpSession session=request.getSession();
        System.out.println("Session in servlet "+session);
        if (isValid){
            LoggedIn lg= new LoggedIn();
            lg.setLoggedin();
            lg.setUsername(username);
            
            //Sets the values for the currently logged in user
            data=us.recieveuserinfo(username, "first_name");
            lg.setFirst_name(data);
            data=us.recieveuserinfo(username, "last_name");
            lg.setLast_name(data);
            data=us.recieveuserinfo(username, "email");
            lg.setEmail(data);
            data=us.recieveuserinfo(username, "dob");
            lg.setDoB(data);
            data=us.recieveuserinfo(username, "telephone");
            lg.setPhone(data);
        
            //request.setAttribute("LoggedIn", lg);
            validUser = true;
            session.setAttribute("validuser", validUser); //Informs the jsp page that the login is valid
            
            session.setAttribute("LoggedIn", lg); //Sets logged in
            System.out.println("Session in servlet "+session);
            RequestDispatcher rd=request.getRequestDispatcher("");
	    rd.forward(request,response);
            
        }else{
            validUser = false;
            session.setAttribute("validuser", validUser); //Informs the jsp page that the login is invalid
            response.sendRedirect("/Instagrim/Login"); //Sends user back to the login page      
        }
        
    }
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
