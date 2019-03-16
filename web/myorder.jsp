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
        <title>My-Order</title>
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
     StringBuffer db=new StringBuffer("<h1>My Store Orders</h1>");
     db.append("<div style='float:left;'>");
    
      ArrayList<OrderDTO>ordlist=StoreDAO.getOrdersByCust(username);
      if(ordlist.size()==0)
      {
          db.append("<p><strong>You not Palced nay Order yet</strong></p>");
      }
      else
      {
       SimpleDateFormat sdf=new SimpleDateFormat("dd-MMM-yyyy");
       db.append("<table border='2'>");
      db.append("<tr ><th>Order_Id</th><th>Order_Amount</th><th>Order_Date</th></tr>");
      for(OrderDTO od:ordlist)
      {
          String date=sdf.format(od.getOrderDate());
         db.append("<tr><td><a href='showcategories.jsp?orderId="+od.getOrderId()+"'>"+od.getOrderId()+"</a></td></a><td>"+od.getOrderAmount()+"</td><td>"+date+"</td></tr>");
      }
      db.append("</table>");
     db.append("<p><a href='StoreControllerServlet'>Show Categories</a></p></div>");
     
     db.append("<h3 id='logout'><a href='LoginControllerServlet?logout=logout'><b>Logout</b></a></h3>");
     out.println(db);
      }
    }
    //session.invalidate();
    %>
    </body>
</html>

