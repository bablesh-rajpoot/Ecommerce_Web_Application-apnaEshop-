<%-- 
    Document   : senditemdetails
    Created on : Jan 25, 2019, 11:55:25 AM
    Author     : BABLESH RAJPOOT
--%>

<%@page import="shopping.dto.ItemDTO"%>
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
      //String itemId=(String)request.getParameter("member");
      //ItemDTO allitem=(ItemDTO)StoreDAO.getItemDetails(Integer.parseInt("itemId"));
      ItemDTO allitem=(ItemDTO)request.getAttribute("itemDetails");
      StringBuffer db=new StringBuffer("<h3>My Store-Item Details</h3><p><em>You are Viewing</em></p>");
      db.append("<strong><a href='AdminControllerServlet'>"+allitem.getItemType()+"&nbsp;&gt;&nbsp;&nbsp;</a>"+allitem.getItemName()+"</strong></p>");
      db.append("<div style='float:left'>");
      db.append("<img src=\'images/"+allitem.getItemImage()+"'></div>");
      db.append("<div style='float:left;padding-left:20px'>");
      db.append("<strong>Description:</strong><p style='color:green'><br>"+allitem.getItemDesc()+"</p>");
      db.append("<p><strong style='color:red'>Price: </strong>Rs"+allitem.getItemPrice()+"</p>");
      out.println(db);
   }
    %>
