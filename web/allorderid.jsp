<%-- 
    Document   : allorderid
    Created on : Feb 7, 2019, 11:48:10 PM
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
      ArrayList<String>list=(ArrayList<String>)request.getAttribute("ordList");
      StringBuffer db=new StringBuffer("<select style='width:120px' onchange='getItemDetails()' id='select_id'>");
      for(String id:list)
      {
          db.append("<option value="+id+">" +id+ "</option>");
          System.out.println("all order id"+id);
      }
      db.append("</select>");
      
      out.println(db);
   }
    %>