/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.servlets;

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
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.models.User;
import uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;

/**
 *
 * @author R.Raeper
 */
@WebServlet(name = "searchPage", urlPatterns = {
        "/Search",
        "/Search/Results/"
})
public class searchPage extends HttpServlet {

    Cluster cluster=null;


    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        RequestDispatcher rd = request.getRequestDispatcher("/searchpage.jsp");
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
                
        String usersearch=request.getParameter("username");        
        User us=new User();
        us.setCluster(cluster);
        boolean isValid=us.userExists(usersearch);
        if(isValid == true)
        {
            HttpSession session=request.getSession();
            session.setAttribute("NAME", usersearch);
            RequestDispatcher rd = request.getRequestDispatcher("searchpage.jsp");
            rd.forward(request, response);
        }
        else
        {
            HttpSession session=request.getSession();
            session.setAttribute("NAME", "");
            RequestDispatcher rd = request.getRequestDispatcher("searchpage.jsp");
            rd.forward(request, response);
            
            response.setContentType( "text/html" );
    // processing the request not shown...
    //
    // here we decide to send the value "bar" in parameter
    // "foo" to the JSP page example.jsp:
    response.sendRedirect( "example.jsp?foo=bar" );
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


