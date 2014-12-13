/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 *
 * @author Javier
 */
public class DatabaseUpdater implements Runnable
{

    @Override
    public void run()
    {
        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost;user=sa;password=nopw");
            Statement st = con.createStatement();
            
            String query = "UPDATE [HardCover].[dbo].[Book]"
                    + "SET NumCopies = NumCopies+1"
                    + "FROM [HardCover].[dbo].[CheckedOutBook] CheckedOutBook, [HardCover].[dbo].[Book] Book "
                    + "WHERE ExpirationDate <= GETDATE() AND CheckedOutBook.BookId = Book.BookUuid AND CheckedOutBook.Expired = 0";
            st.executeUpdate(query);
            query = "UPDATE [HardCover].[dbo].[CheckedOutBook] "
                    + "SET Expired = 1 "
                    + "WHERE ExpirationDate <= GETDATE()";
            st.executeUpdate(query);
            System.out.println("got here");
        } catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
    }

}
