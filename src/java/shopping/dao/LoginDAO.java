/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import shopping.dbutil.DBConnection;
import shopping.dto.UserDTO;

/**
 *
 * @author BABLESH RAJPOOT
 */
public class LoginDAO 
{
    private static PreparedStatement ps;
    static
    {
        try
        {
       ps=DBConnection.getConnection().prepareStatement("select username,password,membertype from member where username=? and password=? and membertype=?");
         
        }catch(Throwable th)
        {
            System.out.println("Error in Db"+th);  
        }
    }
    
    public static boolean validateUser(UserDTO user)throws SQLException
    {
     ps.setString(1,user.getUsername());
     ps.setString(2,user.getPassword());
     ps.setString(3,user.getUsertype());
     ResultSet rs=ps.executeQuery();
     return rs.next();
     
    }
}
