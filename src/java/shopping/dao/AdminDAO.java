/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import shopping.dbutil.DBConnection;
import shopping.dto.ItemDTO;

/**
 *
 * @author BABLESH RAJPOOT
 */
public class AdminDAO
{
    private static PreparedStatement ps1;
    private static Statement st1;
     static
      {
       try
          {
           ps1=DBConnection.getConnection().prepareStatement("insert into store_items values(?,?,?,?,?,?)");
           st1=DBConnection.getConnection().createStatement();
         }
          catch(Throwable th)
          {
           System.out.println("Error In DB"+th);
           th.printStackTrace();
          }
     }
  public static boolean addProduct(ArrayList<ItemDTO>itemlist)throws SQLException
    {
    ResultSet rs=st1.executeQuery("select count(*) as count from store_items");
    rs.next();
    int lastId=rs.getInt(1);
    ps1.setInt(1, lastId);
    for(ItemDTO item:itemlist)
    {
       ps1.setString(2,item.getItemType());
        ps1.setString(3,item.getItemName());
        ps1.setDouble(4,item.getItemPrice());
        ps1.setString(5,item.getItemDesc());
        ps1.setString(6,item.getItemImage());
        itemlist.add(item);
    }
    int ans=ps1.executeUpdate();
     return (ans==1);
  }
}
