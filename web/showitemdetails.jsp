<%-- 
    Document   : showitemdetails
    Created on : Jan 6, 2019, 10:13:49 AM
    Author     : BABLESH RAJPOOT
--%>
<%@page import="shopping.dto.ItemDTO"%>
<%@page session="true" contentType="text/html" pageEncoding="UTF-8"  import="java.util.*"%>
<%@include file="logo.html"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Store-Categories</title>
        <link rel="stylesheet" type="text/css" href="styles/stylesheet.css"> 
        <script type="text/javascript" src="scripts/jquery.js"></script>
        <script type="text/javascript" src="scripts/showitems.js"></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <meta http-equiv="Cache-control" content="no-cache"/>
        <meta http-equiv="expires" content="-1"/>
        <meta http-equiv="pragma" content="no-cache"/>
    </head>
    <body>
<%
     String username=(String)session.getAttribute("username");
     RequestDispatcher rd=null;
    if(username==null)
    {
      session.invalidate();
      rd=request.getRequestDispatcher("accessdenied.html");
      rd.forward(request, response);
    }
    else
    {
      ItemDTO allitem=(ItemDTO)request.getAttribute("itemlist");
      StringBuffer db=new StringBuffer("<h3>My Store-Item Details</h3><p><em>You are Viewing</em></p>");
      db.append("<strong><a href='StoreControllerServlet'>"+allitem.getItemType()+"&nbsp;&gt;&nbsp;&nbsp;</a>"+allitem.getItemName()+"</strong></p>");
      db.append("<div style='float:left'>");
      db.append("<img src=\'images/"+allitem.getItemImage()+"'></div>");
      db.append("<div style='float:left;padding-left:12px'>");
      db.append("<strong>Description:</strong><p style='color:green'><br>"+allitem.getItemDesc()+"</p>");
      db.append("<p><strong style='color:red'>Price: </strong>Rs"+allitem.getItemPrice()+"</p>");
      db.append("<p><a href='addtocard.jsp?itemId="+allitem.getItemId()+"'>Add To Cart</a></p></div>");
      out.println(db);
   }
  %>
    </body>
    </html>