/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping.dbutil;
import java.sql.*;
import java.sql.DriverManager;
public class DBConnection
{
     private static Connection conn;
    static
    {
        try
        {
          Class.forName("oracle.jdbc.OracleDriver");
          conn=DriverManager.getConnection("jdbc:oracle:thin:@//DESKTOP-D1U1HFD:1521/XE","onlineshopping","shopping");
          System.out.println("connection success to the database ");
        }
        catch(ClassNotFoundException ex)
        {
           System.out.println("Error in loading class");
           ex.printStackTrace();
        }
        catch(SQLException sql)
        {
            System.out.println("Error in opening the connection"); 
           sql.printStackTrace();
        }
    }
    public static Connection getConnection()
    {
        return conn;
    }
    
   
}
