<%-- 
    Document   : myorders
    Created on : Jan 7, 2019, 11:18:41 AM
    Author     : BABLESH RAJPOOT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.util.*"%>
<%@include file="logo.html"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Order successfully</title>
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
    StringBuffer db=new StringBuffer("<h1>My Order-Details Page...</h1>");
     db.append("<div style='float:left;'>");
     db.append("<p style='color:green;'><strong>Congratulation! Visting Us!</strong></p>");
     db.append("<p style='color:magenda;'><strong>Your Order Successfully Confirmed...</strong></p>");
      db.append("<p><a href='StoreControllerServlet'>Continue Shopping</a>&nbsp;&nbsp;&nbsp;&nbsp;");
      db.append("<a href='myorder.jsp>My Orders</a></p></div>");
     db.append("<h3 id='logout'><a href='myorder.jsp'><b>My Orders</b></a>&nbsp;&nbsp;&nbsp;<a href='LoginControllerServlet?logout=logout'><b>Logout</b></a></h3>");
     out.println(db);
    }
    %>
    </body>
</html>
