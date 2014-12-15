/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bookUtilities;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
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
@WebServlet(name = "AddBookServlet", urlPatterns =
{
    "/AddBookServlet"
})
public class AddBookServlet extends HttpServlet
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
        JSONObject message = addBook(request.getParameter("title"),
                request.getParameter("cover"), request.getParameter("author"),
                request.getParameter("genre"), request.getParameter("description"), request.getParameter("language"),
                request.getParameter("publisher"));
        PrintWriter printout = response.getWriter();
        printout.print(message);
        printout.flush();
    }

    private JSONObject addBook(String title, String cover, String author, String genre, String description, String language, String publisher)
    {

        JSONObject messageToReturn = new JSONObject();
        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;user=sa;password=nopw");

            Statement st = con.createStatement();
            Calendar someDate = Calendar.getInstance();
            someDate.setTime(new Date());
            someDate.add(Calendar.DATE, 10);
            Timestamp stamp = new Timestamp(someDate.getTimeInMillis());
            String query = "DECLARE @newId UNIQUEIDENTIFIER; "
                    + "SET @newid = NEWID(); "
                    + "INSERT INTO [HardCover].[dbo].[Book] "
                    + "VALUES (@newid, '" + title + "', '" + cover + "', '" + stamp
                    + "', 5, 0, '" + language + "', '" + description + "', '"
                    + publisher + "', 1); ";
            String[] authors = author.split(", ");
            String[] genres = genre.split(", ");
            for (String s : authors)
            {
                query += "INSERT INTO [HardCover].[dbo].[Author] (AuthorName, BookId)"
                        + "VALUES('" + s + "', @newid); ";
            }
            for (String s : genres)
            {
                query += "INSERT INTO [HardCover].[dbo].[Genre] (Genre, BookId)"
                        + "VALUES('" + s + "', @newid); ";
            }
            st.executeUpdate(query);
            messageToReturn.put("message", "success");
        } catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
        return messageToReturn;
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
