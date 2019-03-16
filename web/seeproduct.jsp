<%-- 
    Document   : addproduct
    Created on : Jan 14, 2019, 12:22:42 AM
    Author     : BABLESH RAJPOOT
--%>
<%-- 
    Document   : seestore
    Created on : Jan 6, 2019, 10:12:46 AM
    Author     : BABLESH RAJPOOT
--%>
<%@page session="true" contentType="text/html" pageEncoding="UTF-8"  import="java.util.*"%>
 <%@include file="logo.html"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Product</title>
        <link rel="stylesheet" type="text/css" href="styles/stylesheet.css"> 
        <script type="text/javascript" src="scripts/jquery.js"></script>
        <script type="text/javascript" src="scripts/additems.js"></script>
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
     String prod="ManageProduct";
     session.setAttribute("Manageprod",prod);
     String user="ManageUser";
     session.setAttribute("Manageuser",user);
     String order="ManageOrder";
     session.setAttribute("Manageorder",order);
     StringBuffer db=new StringBuffer("<h1>Admin Options</h1><p>select acategories to take an option.</p>");
     db.append("<p id='"+prod+"'><strong><a href=# onclick=ManageProduct('"+prod+"')><span>+ Manage Products</span></a></strong></p>");
     db.append("<p id='"+user+"'><strong><a href=# onclick=ManageProduct('"+user+"')><span>+ Manage Users</span></a></strong></p>");
     db.append("<p id='"+order+"'><strong><a href=# onclick=ManageProduct('"+order+"')><span>+ Manage Orders</span></a></strong></p>");
    db.append("<h3 id='logout'><a href='myorder.jsp'><b>My Orders</b></a>&nbsp;&nbsp;&nbsp;<a href='LoginControllerServlet?logout=logout'><b>Logout</b></a></h3>");
    out.println(db);
   }
  %>
 </body>
</html>

   