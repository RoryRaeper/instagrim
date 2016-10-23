package uk.ac.dundee.computing.rjr.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.datastax.driver.core.Session;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import uk.ac.dundee.computing.rjr.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.rjr.instagrim.lib.Convertors;
import uk.ac.dundee.computing.rjr.instagrim.models.PicModel;
import uk.ac.dundee.computing.rjr.instagrim.stores.LoggedIn;
import uk.ac.dundee.computing.rjr.instagrim.stores.Pic;
import uk.ac.dundee.computing.rjr.instagrim.stores.PicComments;

/**
 * Servlet implementation class Image
 */
@WebServlet(urlPatterns = {
    "/Comments/*",
    "/Comments/"
})
@MultipartConfig

public class Comments extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Cluster cluster;   

    /**
     * @see HttpServlet#HttpServlet()
     */
    PicComments pc = new PicComments();
    public Comments() {
        super();
    }

    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {;
        RequestDispatcher rd = request.getRequestDispatcher("/piccomments.jsp");
        
        String URI = request.getRequestURI();
        String[] output = URI.split("/");
        String SUUID = output[3];
        if(SUUID.equals("")){
            System.out.println("The URL does not contain the picture UUID");
        }
        else{
            pc.setUUIDfromString(SUUID);
        }
        java.util.UUID uuid = pc.getUUID();
        Session session = cluster.connect("instagrim"); 
        DisplayComments(uuid, SUUID, session, request, response);
        rd = request.getRequestDispatcher("/piccomments.jsp");
    }
    
    private void DisplayComments(java.util.UUID uuid, String SUUID, Session session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PicModel tm = new PicModel();       
        java.util.LinkedList<PicComments> PicComments = tm.getCommentsforImage(uuid, session);
        RequestDispatcher rd = request.getRequestDispatcher("/piccomments.jsp");
        request.setAttribute("uuid", SUUID);
        request.setAttribute("PicComments", PicComments);
        rd.forward(request, response);
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesh=request.getSession();
        LoggedIn lg= (LoggedIn)sesh.getAttribute("LoggedIn");
            String username="majed";
            if (lg.getloggedin()){
                username=lg.getUsername();
            }
            else{
                System.out.println("The username can not be found");
            }
            System.out.println("USERNAME: " + username);
        Convertors convertor = new Convertors();    
        java.util.UUID commentID = convertor.getTimeUUID();
        Session session = cluster.connect("Instagrim");
        String commentText=request.getParameter("comment");
        PicModel pm = new PicModel();
        java.util.UUID uuid = pc.getUUID();
        pm.setComments(username, uuid, commentText, session, commentID);
        session.close();
        
        response.sendRedirect("/Instagrim/");
    }
    
    protected void DisplayComments(HttpServletRequest request, HttpServletResponse response){
        
    }

}
