/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import shopping.dbutil.DBConnection;
import shopping.dto.UserDTO;

/**
 *
 * @author BABLESH RAJPOOT
 */
public class RegistrationDAO 
{
    private static PreparedStatement ps1,ps2,ps3,ps4;
     static
      {
       try
          {
           ps1=DBConnection.getConnection().prepareStatement("select username from member where username=? and membertype='CUSTOMER'");
           ps2=DBConnection.getConnection().prepareStatement("insert into member values(?,?,?)");
           ps3=DBConnection.getConnection().prepareStatement("Update member set password=? where userid=? and password=?");
           ps4=DBConnection.getConnection().prepareStatement("select username from member where userid=? and password=?");
          }
          catch(Throwable th)
          {
           System.out.println("Error In DB"+th);
           th.printStackTrace();
          }
     }
    public static boolean searchUser(String username)throws SQLException
    {
     ps1.setString(1, username);
     ResultSet rs=ps1.executeQuery();
     return rs.next();
    }
      public static boolean userregister(UserDTO user)throws SQLException
      {
        boolean done=false;
        ps2.setString(1,user.getUsername());
        ps2.setString(2,user.getPassword());
        ps2.setString(3,user.getUsertype());
        int ans=ps2.executeUpdate();
        if(ans!=0)
            done=true;
        return done;
      }
      public static boolean updatePassword(String uid,String oldpwd,String npwd)throws SQLException
      {
        boolean passwordChanged=false;
         ps3.setString(1, npwd);
            ps3.setString(2,uid);
            ps3.setString(3,oldpwd);
           int count=ps3.executeUpdate();
            if(count!=0)
            {
                passwordChanged=true;
            }
           return passwordChanged;
    }
    public static String validateUser(String uid,String pwd)throws SQLException
    {
       String username=null;
            ps4.setString(1, uid);
            ps4.setString(2,pwd);
            ResultSet rs=ps4.executeQuery();
            if(rs.next())
            {
                username=rs.getString(1);
            }
             return username;
    }
 }
