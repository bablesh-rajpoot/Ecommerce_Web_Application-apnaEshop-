<%-- 
    Document   : adminstore
    Created on : Jan 25, 2019, 11:54:30 AM
    Author     : BABLESH RAJPOOT
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="shopping.dao.StoreDAO"%>
<%@page session="true" contentType="text/html" pageEncoding="UTF-8"%>
<%String username=(String)session.getAttribute("username");
   if(username==null)
   {
       session.invalidate();
       response.sendRedirect("accessdenied.html");
   }
   else
   {
      ArrayList<Integer>list=(ArrayList<Integer>)request.getAttribute("itemIdList");
      StringBuffer db=new StringBuffer("<select style='width:170px' onchange='getItemDetails()' id='itemid'>");
      for(int itemid:list)
      {
          db.append("<option value="+itemid+">" +itemid+ "</option>");
          System.out.println("Id"+itemid);
      }
      db.append("</select>");
      
      out.println(db);
   }
    %>