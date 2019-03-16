<%-- 
    Document   : addproduct
    Created on : Jan 14, 2019, 12:22:42 AM
    Author     : BABLESH RAJPOOT
--%>
<%@page session="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin-User</title>
        <link rel="stylesheet" type="text/css" href="styles/stylesheet.css"> 
        <script type="text/javascript" src="scripts/jquery.js"></script>
        <script type="text/javascript" src="scripts/additems.js"></script>
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
     String user="ManageUser";
     session.setAttribute("Manageuser",user);
     StringBuffer db=new StringBuffer("<ul>");
     db.append("<li id='"+user+"'><strong><a href='AdminControllerServlet?itemId="+user+"'>Remove Users<strong></a></li>");
     db.append("</ul>");
    out.println(db);
   }
  %>
 </body>
</html>

   