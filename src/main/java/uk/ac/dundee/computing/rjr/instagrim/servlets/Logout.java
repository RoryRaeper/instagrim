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
@WebServlet(name = "Logout", urlPatterns = {"/Logout"})
public class Logout extends HttpServlet {

    Cluster cluster=null;


    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        RequestDispatcher rd = request.getRequestDispatcher("/Logout.jsp");    
        rd.forward(request, response);
        
        HttpSession session=request.getSession();
        LoggedIn lg= new LoggedIn();
        
            lg.setFirst_name(null);
            lg.setLast_name(null);
            lg.setEmail(null);
            lg.setDoB(null);
            
        //lg.setLoggedout();
        lg.setLoginState(false);
        session.setAttribute("LoggedIn", null);
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
                LoggedIn lg= new LoggedIn();
                lg.setLoggedout();
                lg.setLoginState(false);
                session.setAttribute("LoggedIn", lg);
            RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
	    rd.forward(request,response);
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
