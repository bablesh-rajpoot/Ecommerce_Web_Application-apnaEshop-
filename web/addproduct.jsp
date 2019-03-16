<%-- 
    Document   : addproduct
    Created on : Jan 23, 2019, 10:30:00 PM
    Author     : BABLESH RAJPOOT
--%>
<%@page import="shopping.dto.ItemDTO"%>
<%@page session="true" contentType="text/html" pageEncoding="UTF-8"  import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add-Product</title>
        <link rel="stylesheet" type="text/css" href="styles/stylesheet.css"> 
        <script type="text/javascript" src="scripts/jquery.js"></script>
        <script type="text/javascript" src="scripts/additems.js"></script>
        <script type="text/javascript" src="scripts/addproduct.js"></script>
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
    StringBuffer db=new StringBuffer("<form><p>Add New Product</p>");
    db.append("<div style='float:left,padding-left:300px,padding-top:400px,id='addtable''>");
    db.append("<table border='2' id='tblproduct'>");
    db.append("<tr><th>Product Name:</th><td><input type='text' name='pname' id='pname'></td></tr>");
    db.append("<tr><th>Product Type:</th><td><input type='text' name='ptype' id='ptype'></td></tr>");
    db.append("<tr><th>Product Price:</th><td><input type='text' name='pprice' id='pprice'></td></tr>");
    db.append("<tr><th>Product Desc:</th><td><input type='text' name='pdesc' id='pdesc'></td></tr>");
    db.append("<tr><th>Product Image:</th><td><input type='file' name='pimage' value='Choose Image' id='pimage'></td></tr>");
    db.append("<tr><th><input type='button' value='Add Product' id='addbtn' onclick=connect()</th><th><input type='RESET' name='productname' value='Clear'></th</tr>");
    db.append("</table>");
    db.append("</div></form>");
    db.append("<span id='result'></span>");
    out.println(db);
   }
    %>
    </body>
</html>
