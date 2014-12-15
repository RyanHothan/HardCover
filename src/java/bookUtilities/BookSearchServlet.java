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
@WebServlet(name = "BookSearchServlet", urlPatterns =
{
    "/BookSearchServlet"
})
public class BookSearchServlet extends HttpServlet
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
        JSONArray books = getSearchResults(request.getParameter("searchPhrase"));
        PrintWriter printout = response.getWriter();
        printout.print(books);
        printout.flush();
    }

    private JSONArray getSearchResults(String searchPhrase)
    {
        JSONArray booksToReturn = new JSONArray();
        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;user=sa;password=nopw");

            Statement st = con.createStatement();
            if (searchPhrase.equals("newest"))
            {
                String query = "SELECT * "
                        + "FROM [HardCover].[dbo].[Book] "
                        + "WHERE Active = 1 "
                        + "ORDER BY DateAdded DESC;";

                ResultSet rs = st.executeQuery(query);
                while (rs.next())
                {
                    String bookId = rs.getString("BookUuid");
                    Statement st2 = con.createStatement();
                    query = "SELECT AuthorName "
                            + "FROM [HardCover].[dbo].[Author] "
                            + "WHERE BookId = '" + bookId + "';";
                    ResultSet rs2 = st2.executeQuery(query);
                    String authors = "";
                    while (rs2.next())
                    {
                        if (authors.isEmpty())
                        {
                            authors = rs2.getString("AuthorName");
                        } else
                        {
                            authors = authors + ", " + rs2.getString("AuthorName");
                        }
                    }
                    Statement st3 = con.createStatement();
                    query = "SELECT Genre "
                            + "FROM [HardCover].[dbo].[Genre] "
                            + "WHERE BookId = '" + bookId + "';";
                    ResultSet rs3 = st3.executeQuery(query);
                    String genres = "";
                    while (rs3.next())
                    {
                        if (genres.isEmpty())
                        {
                            genres = rs3.getString("Genre");
                        } else
                        {
                            genres = genres + ", " + rs3.getString("Genre");
                        }
                    }
                    JSONObject bookToAdd = new JSONObject();
                    bookToAdd.put("bookId", bookId);
                    bookToAdd.put("numCopies", rs.getString("NumCopies"));
                    bookToAdd.put("title", rs.getString("Title"));
                    bookToAdd.put("cover", rs.getString("Cover"));
                    bookToAdd.put("author", authors);
                    bookToAdd.put("genres", genres);
                    booksToReturn.add(bookToAdd);
                }
            } else if (searchPhrase.equals("popular"))
            {
                String query = "SELECT * "
                        + "FROM [HardCover].[dbo].[Book] "
                        + "WHERE Active = 1 "
                        + "ORDER BY TimesBorrowed DESC;";

                ResultSet rs = st.executeQuery(query);
                while (rs.next())
                {
                    String bookId = rs.getString("BookUuid");
                    Statement st2 = con.createStatement();
                    query = "SELECT AuthorName "
                            + "FROM [HardCover].[dbo].[Author] "
                            + "WHERE BookId = '" + bookId + "';";
                    ResultSet rs2 = st2.executeQuery(query);
                    String authors = "";
                    while (rs2.next())
                    {
                        if (authors.isEmpty())
                        {
                            authors = rs2.getString("AuthorName");
                        } else
                        {
                            authors = authors + ", " + rs2.getString("AuthorName");
                        }
                    }
                    Statement st3 = con.createStatement();
                    query = "SELECT Genre "
                            + "FROM [HardCover].[dbo].[Genre] "
                            + "WHERE BookId = '" + bookId + "';";
                    ResultSet rs3 = st3.executeQuery(query);
                    String genres = "";
                    while (rs3.next())
                    {
                        if (genres.isEmpty())
                        {
                            genres = rs3.getString("Genre");
                        } else
                        {
                            genres = genres + ", " + rs3.getString("Genre");
                        }
                    }
                    JSONObject bookToAdd = new JSONObject();
                    bookToAdd.put("bookId", bookId);
                    bookToAdd.put("numCopies", rs.getString("NumCopies"));
                    bookToAdd.put("title", rs.getString("Title"));
                    bookToAdd.put("cover", rs.getString("Cover"));
                    bookToAdd.put("author", authors);
                    bookToAdd.put("genres", genres);
                    booksToReturn.add(bookToAdd);
                }
            } else
            {
                String query = "SELECT * "
                        + "FROM HardCover.dbo.Book JOIN HardCover.dbo.Author "
                        + "ON HardCover.dbo.Book.BookUuid = HardCover.dbo.Author.BookId "
                        + "JOIN HardCover.dbo.Genre ON HardCover.dbo.Book.BookUuid = HardCover.dbo.Genre.BookId "
                        + "WHERE (FREETEXT((Title, Publisher, BookDescription, BookLanguage), '"
                        + searchPhrase + "') OR FREETEXT(AuthorName,'" + searchPhrase
                        + "') OR FREETEXT(Genre,'" + searchPhrase + "')) AND Active = 1 "
                        + " ORDER BY Title;";

                ResultSet rs = st.executeQuery(query);
                String oldTitle = "";
                String oldAuthor = "";
                String oldGenre = "";
                while (rs.next())
                {
                    JSONObject bookToAdd = new JSONObject();
                    String newTitle = rs.getString("Title");
                    String newAuthor = rs.getString("AuthorName");
                    String newGenre = rs.getString("Genre");
                    if (oldTitle.equals(newTitle))
                    {
                        if (!(oldAuthor.equals(newAuthor)))
                        {
                            bookToAdd = ((JSONObject) booksToReturn.remove(booksToReturn.size() - 1));
                            bookToAdd.put("author", bookToAdd.get("author") + ", " + newAuthor);
                            oldAuthor = newAuthor;
                            booksToReturn.add(bookToAdd);
                        }
                        else if (!(oldGenre.equals(newGenre)))
                        {
                            bookToAdd = ((JSONObject) booksToReturn.remove(booksToReturn.size() - 1));
                            bookToAdd.put("genres", bookToAdd.get("genres") + ", " + newGenre);
                            oldGenre = newGenre;
                            booksToReturn.add(bookToAdd);
                        }
                    } else
                    {
                        bookToAdd.put("bookId", rs.getString("BookUuid"));
                        bookToAdd.put("numCopies", rs.getString("NumCopies"));
                        bookToAdd.put("title", newTitle);
                        bookToAdd.put("cover", rs.getString("Cover"));
                        bookToAdd.put("author", newAuthor);
                        bookToAdd.put("genres", newGenre);
                        oldTitle = newTitle;
                        oldAuthor = newAuthor;
                        oldGenre = newGenre;
                        booksToReturn.add(bookToAdd);
                    }
                }
            }

        } catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
        return booksToReturn;
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
