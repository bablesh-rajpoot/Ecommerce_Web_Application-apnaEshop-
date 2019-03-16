<%-- 
    Document   : allmember
    Created on : Feb 2, 2019, 10:34:38 AM
    Author     : BABLESH RAJPOOT
--%>
<%-- 
    Document   : getproductid
    Created on : Jan 31, 2019, 11:32:50 AM
    Author     : BABLESH RAJPOOT
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="shopping.dao.StoreDAO"%>
<%@page session="true" contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username=(String)session.getAttribute("username");
    if(username==null)
    {
      session.invalidate();
      response.sendRedirect("accessdenied.html");
    }
    else
    {
     ArrayList<String>list=(ArrayList<String>)request.getAttribute("uList");
      StringBuffer db=new StringBuffer("<select style='width:120px' id='member'>");
      for(String member:list)
      {
          db.append("<b><option value="+member+">" +member+ "</option></b>");
          System.out.println("username  "+member);
      }
      db.append("</select>");
     
      out.println(db);
    }
       
        
     
  %>
  