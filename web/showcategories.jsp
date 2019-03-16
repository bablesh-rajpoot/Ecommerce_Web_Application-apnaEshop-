<%-- 
    Document   : showcategories
    Created on : Jan 13, 2019, 9:50:45 AM
    Author     : BABLESH RAJPOOT
--%>
<%@page import="shopping.dto.ordDetailsDTO"%>
<%-- 
    Document   : myorder
    Created on : Jan 11, 2019, 10:18:20 AM
    Author     : BABLESH RAJPOOT
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="shopping.dto.OrderDTO"%>
<%@page import="shopping.dao.StoreDAO"%>
<%@page session="true" contentType="text/html" pageEncoding="UTF-8"  import="java.util.*"%>
<%@include file="logo.html"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Categories</title>
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
    if(username==null)
    {
      session.invalidate();
      response.sendRedirect("accessdenied.html");
    }
    else
    {
        
      String ordId=request.getParameter("orderId");
     StringBuffer db=new StringBuffer("<h1>My Order Details</h1>");
     db.append("<div style='float:left;'>");
      ArrayList<ordDetailsDTO>ordlist=StoreDAO.getOrdersDetails(ordId);
      if(ordlist.size()==0)
      {
          db.append("<p><strong>You not Palced nay Order yet</strong></p>");
      }
      else
      {
       db.append("<table border='2'>");
      db.append("<tr><th>Order_Id</th><th>Item_Name</th><th>Item_price</th></tr>");
      for(ordDetailsDTO od:ordlist)
      {
         db.append("<tr><td>"+od.getOrder_Id()+"</td></a><td>"+od.getItem_name()+"</td><td>"+od.getItem_price()+"</td></tr>");
      }
      db.append("</table>");
     db.append("<p><a href='StoreControllerServlet'>Continue Shopping!</a></p></div>");
     db.append("<h3 id='logout'><a href='LoginControllerServlet?logout=logout'><b>Logout</b></a></h3>");
     out.println(db);
      }
    }
    %>
    </body>
</html>

