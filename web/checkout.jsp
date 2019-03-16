<%-- 
    Document   : checkout
    Created on : Jan 9, 2019, 10:04:20 AM
    Author     : BABLESH RAJPOOT
--%>
<%@page import="shopping.dao.StoreDAO"%>
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
   if(username==null)
    {
      session.invalidate();
      response.sendRedirect("accessdenied.html");
    }
    else
    {
     String totalAmount=request.getParameter("totalAmount");
     StringBuffer db=new StringBuffer("<h1>My CheckOut-Details Page..</h1>");
      db.append("<div style='float:left;'>");
     db.append("<p><strong>Thank You for Shopping with Us!</strong></p>");
     db.append("<p style='color:green;'><strong>Total Amount To Pay: </strong>Rs"+totalAmount+"<strong> is under Processing!<br>Order saved in the database</strong></p>");
     Enumeration en=session.getAttributeNames();
     ArrayList<ItemDTO>itemlist= new ArrayList<ItemDTO>();
    while(en.hasMoreElements())
     {
        Object ob=en.nextElement();
        if(ob.equals("username")==false)
        {
         ItemDTO item=(ItemDTO)session.getAttribute(ob.toString());
         ItemDTO td=new ItemDTO();
         td.setItemId(item.getItemId());
         td.setItemName(item.getItemName());
         td.setItemPrice(item.getItemPrice());
         itemlist.add(td);
        }
      }
      boolean status= StoreDAO.addOrders(username, itemlist,Double.parseDouble(totalAmount));
      if(status)
      {
      db.append("<p><a href='StoreControllerServlet'>Again-Shopping-Again</a>&nbsp;&nbsp;&nbsp;&nbsp;");
      db.append("<a href='myorder.jsp'>confirm Payment</a></p></div>");
      db.append("<h3 id='logout'><a href='myorder.jsp'><b>My Orders</b></a>&nbsp;&nbsp;&nbsp;<a href='LoginControllerServlet?logout=logout'><b>Logout</b></a></h3>");
      out.println(db);
      return;
      }  
    }
    %>
    </body>
</html>
