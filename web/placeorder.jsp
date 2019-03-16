<%-- 
    Document   : placeorder
    Created on : Jan 9, 2019, 9:34:05 AM
    Author     : BABLESH RAJPOOT
--%>

<%@page import="shopping.dto.ItemDTO"%>
<%@page session="true" contentType="text/html" pageEncoding="UTF-8"  import="java.util.*"%>
 <%@include file="logo.html"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Place Ordered</title>
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
    String itemname=request.getParameter("itemName");
    RequestDispatcher rd=null;
    if(username==null)
    {
      session.invalidate();
      response.sendRedirect("accessdenied.html");
    }
    else
    {
     ItemDTO allitem=(ItemDTO)request.getAttribute("item");
     
     System.out.println(itemname);
     StringBuffer db=new StringBuffer("<h1>My Store-Orders Details</h1>");
      db.append("<div style='float:left;'>");
      Enumeration en=session.getAttributeNames();
     db.append("<table border='2' id='tblitems'>");
     db.append("<tr ><th>Item Name</th><th>Item Price</th><th>Remove Item to cart</th></tr>");
     double totalAmount=0.0;
      while(en.hasMoreElements())
      {
        Object ob=en.nextElement();
        if(ob.equals("username")==false)
        {
         ItemDTO item=(ItemDTO)session.getAttribute(ob.toString());
         db.append("<tr id='item'><td>"+item.getItemName()+"</td><td>"+item.getItemPrice()+"</td><td><p style='color:red;'><a id='removeitems' onclick=remove() href='remove.jsp?name="+item.getItemName()+"' >Remove</a></p></td></tr>");
         totalAmount+=item.getItemPrice();
       }
        
     }
      db.append("</table>");
      db.append("<p><strong>Total Amount To Pay:</strong>"+totalAmount+"</p>");
      db.append("<p><a href='StoreControllerServlet'>Continue Shopping</a>&nbsp;&nbsp;&nbsp;&nbsp;");
      db.append("<a href='checkout.jsp?totalAmount="+totalAmount+"'>Check-Out</a></p></div>");
     db.append("<h3 id='logout'><a href='myorder.jsp'><b>My Orders</b></a>&nbsp;&nbsp;&nbsp;<a href='LoginControllerServlet?logout=logout'><b>Logout</b></a></h3>");
     out.println(db);
   }
    %>
    </body>
</html>
