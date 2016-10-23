/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.rjr.instagrim.servlets;

import com.datastax.driver.core.Cluster;
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

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author R.Raeper
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {
    Cluster cluster=null;
    String RegistrationError = "";
    
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }
    
      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
        HttpSession session=request.getSession();
        session.setAttribute("RegistrationError", RegistrationError);
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
        HttpSession session=request.getSession();
        
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String fname=request.getParameter("fname");
        String sname=request.getParameter("sname");
        
        String email=request.getParameter("email");
        String emailConf=request.getParameter("emailConf");
        if(email.equals(emailConf)){
            System.out.println("Emails match");
        }else{
            System.out.println("Emails do not match");
            RegistrationError = "EmailsDontMatch";
            session.setAttribute("RegistrationError", RegistrationError);
            response.sendRedirect("/Instagrim/Registration");
            return;
        }
        String phone = request.getParameter("tel"); 
        System.out.println("TELEPHONE: " + phone);
        String DoB=request.getParameter("DoB");
        
        
        User us=new User();
        us.setCluster(cluster);
        Boolean NameInUse = us.userExists(username);
        if(NameInUse == true){
            System.out.println("Sorry, this username is already in use.");
            RegistrationError = "UsernameConflict";
            session.setAttribute("RegistrationError", RegistrationError);
            response.sendRedirect("/Instagrim/Register");           
        }
        else{
            us.RegisterUser(username, password, fname, sname, email, phone, DoB); //, telephone, DoB,email
            response.sendRedirect("/Instagrim");
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
