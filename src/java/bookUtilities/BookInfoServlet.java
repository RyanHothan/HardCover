/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookUtilities;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

/**
 *
 * @author Ryan Hothan
 */
@WebServlet(name = "BookModalServlet", urlPatterns =
{
    "/BookModalServlet"
})
public class BookInfoServlet extends HttpServlet
{

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        JSONObject book = getBookInfo(request.getParameter("bookId"));
        
    }

    private JSONObject getBookInfo(String bookId)
    {
        JSONObject ourBook = new JSONObject();
        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;user=sa;password=nopw");

            Statement st = con.createStatement();
            Statement st2 = con.createStatement();
            Statement st3 = con.createStatement();
            String query = "SELECT * "
                    + "FROM [HardCover].[dbo].[Book] "
                    + "WHERE BookUuid = '" + bookId + "';";

            String query2 = "SELECT AuthorName "
                        + "FROM [HardCover].[dbo].[Author] "
                        + "WHERE BookId = '" + bookId + "';";
            
            String query3 = "SELECT Genre "
                        + "FROM [HardCover].[dbo].[Genre] "
                        + "WHERE BookId = '" + bookId + "';";
            
            ResultSet rs = st.executeQuery(query);
            ResultSet rs2 = st2.executeQuery(query2);
            ResultSet rs3 = st2.executeQuery(query3);
            
            rs.next();
            rs2.next();
            rs3.next();
            
            ourBook.put("title", rs.getString("Title"));
            ourBook.put("author", rs.getString("Author"));
            ourBook.put("description", rs.getString("Description"));
            ourBook.put("title", rs.getString("Title"));
            ourBook.put("title", rs.getString("Title"));
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        
        
        return ourBook;
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
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
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo()
    {
        return "Short description";
    }// </editor-fold>

}
