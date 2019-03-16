<%-- 
    Document   : removemember
    Created on : Feb 8, 2019, 11:11:07 PM
    Author     : BABLESH RAJPOOT
--%>

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
     String member=(String)request.getParameter("member");
     StringBuffer db=new StringBuffer();
     boolean status=StoreDAO.removeMember(member);
     if(status==true)
     {
      db.append("<h3 style='color:green'>Member Successfully Removed!</h3>");
     }
     else
     {
      db.append("<h3 style='color:red'>Member Doesn't Removed!</h3>");   
     }
     out.println(db);
    }
 %>