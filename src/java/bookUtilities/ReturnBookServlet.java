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

/**
 *
 * @author Javier
 */
@WebServlet(name = "ReturnBookServlet", urlPatterns =
{
    "/ReturnBookServlet"
})
public class ReturnBookServlet extends HttpServlet
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
        String email = (String) request.getSession().getAttribute("email");
        String bookId = request.getParameter("bookId");
        if(email == null)
        {
            response.sendError(500);
            return;
        }

        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;user=sa;password=nopw");
            Statement st = con.createStatement();
            String query = "SELECT PersonUuid "
                    + "FROM [HardCover].[dbo].[Person] "
                    + "WHERE Email = '" + email + "'";
            ResultSet rs = st.executeQuery(query);
            rs.next();
            String personUuid = rs.getString("PersonUuid");
            query = "UPDATE [HardCover].[dbo].[CheckedOutBook] "
                    + "SET Expired = 1"
                    + "WHERE RegisteredUserId = '" + personUuid + "' AND BookId = '" + bookId + "'; "
                    + "UPDATE [HardCover].[dbo].[Book] "
                    + "SET NumCopies = NumCopies+1 "
                    + "WHERE BookUuid = '" + bookId + "';" ;
            st.executeUpdate(query);
        } catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
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
