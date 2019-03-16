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
     StringBuffer db=new StringBuffer("<h1>My Categories</h1><p>select acategories to see items.</p>");
     ArrayList<String>itype=(ArrayList<String>)request.getAttribute("itemtype");
     for(String itemtype:itype)
     {
     db.append("<p id='"+itemtype+"'><strong><a href=# onclick=getItemNames('"+itemtype+"')><span>+ "+itemtype+"</span></a></strong></p>");
     }
     db.append("<h3 id='logout'><a href='myorder.jsp'><b>My Orders</b></a>&nbsp;&nbsp;&nbsp;<a href='LoginControllerServlet?logout=logout'><b>Logout</b></a></h3>");
     out.println(db);
   }
  %>
 </body>
</html>

   