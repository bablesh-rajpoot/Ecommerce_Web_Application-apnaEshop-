<%-- 
    Document   : addproduct
    Created on : Jan 14, 2019, 12:22:42 AM
    Author     : BABLESH RAJPOOT
--%>
<%@page session="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Product</title>
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
     String prod="addProduct";
     session.setAttribute("addProduct",prod);
     String user="updateProduct";
     session.setAttribute("updateProduct",user);
     String order="deleteProduct";
     session.setAttribute("deleteProduct",order);
     StringBuffer db=new StringBuffer("<ul>");
     db.append("<span><li id='"+prod+"'><strong><a href='addproduct.html' onclick=ManageProduct('"+prod+"')>Add Product<strong></a></li>");
     db.append("<li id='"+user+"'><strong><a href='StoreControllerServlet?itemId="+user+"'>Update Product<strong></a></li>");
     db.append("<li id='"+order+"'><strong><a href='StoreControllerServlet?itemId="+order+"'>Delete Product<strong></a></li></span>");
     db.append("</ul>");
     out.println(db);
   }
  %>
 </body>
</html>

   