<%-- 
    Document   : placeorder
    Created on : Jan 9, 2019, 9:34:05 AM
    Author     : BABLESH RAJPOOT
--%>

<%@page import="shopping.dto.ItemDTO"%>
<%@page session="true" contentType="text/html" pageEncoding="UTF-8"  import="java.util.*"%>
<%
    String username=(String)session.getAttribute("username");
    if(username==null)
    {
      session.invalidate();
      response.sendRedirect("accessdenied.html");
    }
    else
    {
     String name=request.getParameter("name");
     session.removeAttribute(name);
     out.println("done");
   }
 %>
   