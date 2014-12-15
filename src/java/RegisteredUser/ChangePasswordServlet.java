/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RegisteredUser;

import BCrypt.BCrypt;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
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
@WebServlet(name = "ChangePasswordServlet", urlPatterns =
{
    "/ChangePasswordServlet"
})
public class ChangePasswordServlet extends HttpServlet
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
        String password = request.getParameter("password");
        String repeatPassword = request.getParameter("passwordRepeat");
        String newPassword = request.getParameter("newPassword");
        if(!repeatPassword.equals(newPassword))
        {
              PrintWriter printout = response.getWriter();
            printout.print("false");
            printout.flush();
            return;
        }
        String email = (String) request.getSession().getAttribute("email");
        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;user=sa;password=nopw");

            Statement st = con.createStatement();

            String query = "SELECT * "
                    + "FROM [HardCover].[dbo].[Person] "
                    + "WHERE Email = '" + email + "'";
            //see if email exists in database.
            ResultSet rs = st.executeQuery(query);
            if (rs.next())
            {
                //then hash the password given and see if it matches the one we have stored.
                String hashed = rs.getString("Password");
                if (BCrypt.checkpw(password, hashed))
                {
                    //if everything checks out. hash new password and add to database.
                    hashed = BCrypt.hashpw(newPassword, BCrypt.gensalt(12));
                    query = "UPDATE [Hardcover].[dbo].[Person] "
                            + "SET Password = '" + hashed + "' "
                            +"WHERE Email = '" + email + "'";
                    st.executeUpdate(query);
                }
            }
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
