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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Ryan Hothan
 */
@WebServlet(name = "PopulateReservedBooksServlet", urlPatterns =
{
    "/PopulateReservedBooksServlet"
})
public class PopulateReservedBooksServlet extends HttpServlet
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
        String email;
        email = (String)request.getSession().getAttribute("email");
        JSONArray reservedBooks = getReservedBooks(email);
        PrintWriter printout = response.getWriter();
        printout.print(reservedBooks);
        printout.flush();
    }

    private JSONArray getReservedBooks(String email)
    {
        String query;
        JSONArray jsons = new JSONArray();
        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;user=sa;password=nopw");
            Statement st = con.createStatement();
              query = "SELECT Book.*, reservedBooks.ReserveDate "
                    + "FROM [HardCover].[dbo].[Book] Book, [HardCover].[dbo].[RegisteredUser] RegisteredUser, [HardCover].[dbo].[ReservedBook] reservedBooks, [HardCover].[dbo].[Person] P "
                    + "WHERE Book.BookUuid = reservedBooks.BookId AND reservedBooks.RegisteredUserId = RegisteredUser.RegisteredUserId AND P.PersonUuid = RegisteredUser.RegisteredUserId "
                    + " AND P.Email = '" + email + "'";

            ResultSet rs = st.executeQuery(query);
            while (rs.next())
            {
                JSONObject bookToAdd = new JSONObject();
                Statement st2 = con.createStatement();
                Timestamp timeStamp = rs.getTimestamp("ReserveDate");
                String timeString = timeStamp.toString();
                String bookId = rs.getString("BookUuid");
                
                
                query = "SELECT AuthorName "
                        + "FROM [HardCover].[dbo].[Author] "
                        + "WHERE BookId = '" + bookId + "';";
                ResultSet rs2 = st2.executeQuery(query);
                rs2.next();
                bookToAdd.put("reserveDate", timeString);
                bookToAdd.put("author", rs2.getString("AuthorName"));
                bookToAdd.put("title", rs.getString("Title"));
                bookToAdd.put("cover", rs.getString("Cover"));
                bookToAdd.put("dateAdded", rs.getString("DateAdded"));
                bookToAdd.put("numCopies", rs.getString("NumCopies"));
                bookToAdd.put("bookId", rs.getString("BookUuid"));
                jsons.add(bookToAdd);
            }
             
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        return jsons;
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
