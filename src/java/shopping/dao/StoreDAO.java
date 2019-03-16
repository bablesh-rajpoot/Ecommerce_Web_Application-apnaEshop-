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
import java.util.List;
import shopping.dbutil.DBConnection;
import shopping.dto.ItemDTO;
import shopping.dto.ItemInfoDTO;
import shopping.dto.OrderDTO;
import shopping.dto.ordDetailsDTO;

/**
 *
 * @author BABLESH RAJPOOT
 */
public class StoreDAO 
{
    private static PreparedStatement ps1,ps2,ps3,ps4,ps5,ps6,ps8,ps9,ps10,ps11;
    private static Statement st,st2,st3,st4;
     static
      {
       try
          {
           st=DBConnection.getConnection().createStatement();
           ps1=DBConnection.getConnection().prepareStatement("select id,item_name from store_items where item_type=?");
           ps2=DBConnection.getConnection().prepareStatement("select * from store_items where id=?");
           ps3=DBConnection.getConnection().prepareStatement("insert into order_master values(?,?,?,?)");
           ps4=DBConnection.getConnection().prepareStatement("insert into order_details values(?,?,?)");
           ps5=DBConnection.getConnection().prepareStatement("select order_Id,order_amount,order_date from order_master where cust_name=?");
           ps6=DBConnection.getConnection().prepareStatement("select order_Id,item_name,item_price from order_details where order_Id=?");
           ps8=DBConnection.getConnection().prepareStatement("Select max(id) as count from store_items");
           ps9=DBConnection.getConnection().prepareStatement("Insert into store_items values(?,?,?,?,?,?)");
           ps10=DBConnection.getConnection().prepareStatement("select id from store_items");
           st2=DBConnection.getConnection().createStatement();
           st3=DBConnection.getConnection().createStatement();
           st4=DBConnection.getConnection().createStatement();
           ps11=DBConnection.getConnection().prepareStatement("delete from member where membertype='CUSTOMER' and username=?");
           
          }
          catch(Throwable th)
          {
           System.out.println("Error In DB"+th);
           th.printStackTrace();
          }
     }
    public static ArrayList<String> getItemType()throws SQLException
    {
       ArrayList<String>itemlist=new ArrayList<String>();
       ResultSet rs=st.executeQuery("select distinct item_type from store_items");
       while(rs.next())
       {
           itemlist.add(rs.getString(1));
       }
       return itemlist;
       
    }
    public static List<ItemInfoDTO>getItemsByType(String itemType)throws SQLException
    {
      List<ItemInfoDTO>list=new ArrayList<ItemInfoDTO>();
     ps1.setString(1, itemType);
     ResultSet rs=ps1.executeQuery();
     while(rs.next())
     {
       ItemInfoDTO iit= new ItemInfoDTO();
       iit.setItemId(rs.getInt(1));
       iit.setItemName(rs.getString(2));
       list.add(iit);
       
     }
     return list;
    }
    public static ItemDTO getItemsDetails(int itemId)throws SQLException
    {
      ps2.setInt(1, itemId);
      ResultSet rs=ps2.executeQuery();
      ItemDTO id=new ItemDTO(); 
      if(rs.next())
      {
          
          id.setItemId(rs.getInt(1));
          id.setItemType(rs.getString(2));
          id.setItemName(rs.getString(3));
          id.setItemPrice(rs.getDouble(4));
          id.setItemDesc(rs.getString(5));
          id.setItemImage(rs.getString(6));
      }
    return id;
    }
    public static boolean addOrders( String custName,ArrayList<ItemDTO>itemlist,double totalamount)throws SQLException
    {
    ResultSet rs=st2.executeQuery("select count(*) as count from order_master");
    rs.next();
    int lastId=rs.getInt(1);
    String nextId="ORD-00"+(lastId+1);
    ps3.setString(1,nextId);
    ps3.setString(2,custName);
    ps3.setDouble(3,totalamount);
    java.util.Date today=new java.util.Date();
    long ms=today.getTime();
    java.sql.Date currdate=new java.sql.Date(ms);
    ps3.setDate(4,currdate);
    int ans1=ps3.executeUpdate();
    System.out.println("Recored inserted 1"+ans1);
    int count=0;
    for(ItemDTO item:itemlist)
    {
     ps4.setString(1,nextId);
     ps4.setString(2,item.getItemName());
     ps4.setDouble(3,item.getItemPrice());
     int ans2=ps4.executeUpdate();
     if(ans2==1)
         ++count;
    System.out.println("Recorde inserted "+ans2);
}
    
    return (ans1==1 && count==itemlist.size());
    }
    public static ArrayList<OrderDTO> getOrdersByCust(String custname)throws SQLException
    {
        ArrayList<OrderDTO>ordlist=new ArrayList<OrderDTO>();
        ps5.setString(1,custname);
        ResultSet rs=ps5.executeQuery();
        while(rs.next())
        {
            OrderDTO od=new OrderDTO();
            od.setOrderId(rs.getString(1));
            od.setOrderAmount(rs.getDouble(2));
            od.setOrderDate(rs.getDate(3));
            ordlist.add(od);
       }
        return ordlist;
        
    }
     public static ArrayList<ordDetailsDTO> getOrdersDetails(String orderId)throws SQLException
    {
        ArrayList<ordDetailsDTO>ordlist=new ArrayList<ordDetailsDTO>();
        ps6.setString(1,orderId);
        ResultSet rs=ps6.executeQuery();
        while(rs.next())
        {
            ordDetailsDTO od=new ordDetailsDTO();
            od.setOrder_Id(rs.getString(1));
            od.setItem_name(rs.getString(2));
            od.setItem_price(rs.getDouble(3));
            ordlist.add(od);
       }
        return ordlist;
        
    }
     public static boolean addNewProduct(ItemDTO obj)throws SQLException
{
    ResultSet rs=ps8.executeQuery();
    rs.next();
    int lastId=rs.getInt(1);
    int nextId=lastId+1;
    ps9.setInt(1, nextId);
    ps9.setString(2, obj.getItemType());
    ps9.setString(3, obj.getItemName());
    ps9.setDouble(4, obj.getItemPrice());
    ps9.setString(5, obj.getItemDesc());
    ps9.setString(6, obj.getItemImage());
    int ans=ps9.executeUpdate();
    return (ans==1);
}
public static ArrayList<Integer> getAllProductId()throws SQLException
{
   ArrayList<Integer> itemIdList=new ArrayList<Integer>();
   ResultSet rs=st2.executeQuery("Select id from store_items");
    while(rs.next())
    {
        itemIdList.add(rs.getInt(1));
    }
     
        System.out.println("List is of "+itemIdList.size()+" items");
        return itemIdList; 
}
public static int getAllProdId()throws SQLException
{   int id=0;
    ResultSet rs=st2.executeQuery("Select id from store_items");
    if(rs.next())
    {
      id=rs.getInt(1);
    }
   System.out.println("List is of "+id+" items");
     return id; 
}
public static ItemDTO getItemDetails(int itemId)throws SQLException
{
    ItemDTO obj=null;
    ps2.setInt(1, itemId);
    ResultSet rs=ps2.executeQuery();
    if(rs.next())
    {
        obj=new ItemDTO();
        obj.setItemId(itemId);
        obj.setItemType(rs.getString("item_type"));
        obj.setItemName(rs.getString("item_name"));
        obj.setItemPrice(rs.getDouble("item_price"));
        obj.setItemDesc(rs.getString("item_desc"));
        obj.setItemImage(rs.getString("item_image"));
        
    }
    
        return obj;
     
}
public static ArrayList<String> Username()throws SQLException
{
    ArrayList<String>ulist=new ArrayList<String>();
   ResultSet rs=st3.executeQuery("Select username from member where membertype='CUSTOMER'");
    while(rs.next())
    {
        ulist.add(rs.getString(1));
    }
   return ulist; 
  }
public static ArrayList<String>allOrderId()throws SQLException
{
    ArrayList<String>ulist=new ArrayList<String>();
   ResultSet rs=st4.executeQuery("Select order_id from order_master");
    while(rs.next())
    {
        ulist.add(rs.getString(1));
    }
   return ulist; 
}
public static boolean removeMember(String member)throws SQLException
{
    ps11.setString(1,member);
    int ans=ps11.executeUpdate();
    return (ans==1);
   
}
}
 
