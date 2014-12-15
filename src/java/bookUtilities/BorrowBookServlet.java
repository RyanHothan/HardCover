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
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Javier
 */
@WebServlet(name = "BorrowBookServlet", urlPatterns =
{
    "/BorrowBookServlet"
})
public class BorrowBookServlet extends HttpServlet
{

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
        String bookUuid = request.getParameter("bookUuid");
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        if(!fixBookStatistics(bookUuid, request))
        {
            response.sendError(501);
            return;
        }
        
        if(!updateCheckedOutBooks(email, bookUuid))
        {
            response.sendError(500);
            return;
        }
    }

    protected boolean fixBookStatistics(String bookUuid, HttpServletRequest request)
    {
        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;user=sa;password=nopw");
            Statement st = con.createStatement();
            String query = "SELECT NumCopies "
                        +" FROM [HardCover].[dbo].[Book] "
                        +"WHERE BookUuid = '" + bookUuid + "'";
            ResultSet NumberOfCopies = st.executeQuery(query);
            NumberOfCopies.next();
            if(NumberOfCopies.getInt("NumCopies") <= 0)
            {
                return false;
            }
             query = "UPDATE [HardCover].[dbo].[Book] "
                    + "SET NumCopies = NumCopies-1, TimesBorrowed = TimesBorrowed+1 "
                    + "WHERE BookUuid = '" + bookUuid + "'";
            st.executeUpdate(query);

        } catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
        return true;
    }

    protected boolean updateCheckedOutBooks(String email, String book)
    {
        try
        {
            String query = "SELECT * "
                    + "FROM [HardCover].[dbo].[CheckedOutBook] checkedBooks, [HardCover].[dbo].[Person] Person "
                    + "WHERE checkedBooks.BookId = '" + book + "' AND checkedBooks.RegisteredUserId = Person.PersonUuid AND Person.Email = '" + email + "'";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;user=sa;password=nopw");
            Statement st = con.createStatement();
            ResultSet canNotBorrowBookTwice = st.executeQuery(query);
            if(canNotBorrowBookTwice.next())
            {
                return false;
            }
            
            query = "SELECT PersonUuid FROM [HardCover].[dbo].[Person] "
                    + "WHERE email = '" + email + "'";
            ResultSet rs = st.executeQuery(query);
            rs.next();
            String PersonUuid = rs.getString("PersonUuid");
            Calendar someDate = Calendar.getInstance();
            someDate.setTime(new Date());
            someDate.add(Calendar.DATE, 10);
            Timestamp stamp = new Timestamp(someDate.getTimeInMillis());
            
            query = "INSERT INTO [HardCover].[dbo].[CheckedOutBook](RegisteredUserId, BookId, ExpirationDate, Expired) "
                    +"VALUES('" + PersonUuid + "' , '" + book + "', '" + stamp + "', 0)";
            st.executeUpdate(query);
        } catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
        return true;
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
