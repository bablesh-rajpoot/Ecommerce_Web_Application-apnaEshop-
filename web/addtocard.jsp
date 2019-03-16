<%-- 
    Document   : addtocard
    Created on : Jan 7, 2019, 3:46:33 PM
    Author     : BABLESH RAJPOOT
--%>
<%@page import="shopping.dao.StoreDAO"%>
<%@page import="shopping.dto.ItemDTO"%>
<%@page session="true" contentType="text/html" pageEncoding="UTF-8"  import="java.util.*"%>
 <%@include file="logo.html"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add-to-card</title>
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
     String itemId=request.getParameter("itemId");
     ItemDTO allitem=StoreDAO.getItemsDetails(Integer.parseInt(itemId));
     session.setAttribute(String.valueOf(allitem.getItemId()),allitem);
    StringBuffer db=new StringBuffer("<h1>My Store-Shopping Cart</h1><p style='color:#0000ff;'>&nbsp;&nbsp;&nbsp;<em>You are Viewing</em></p>");
    db.append("<p style='color:#00ff00;'><strong>-: Item Added Successfully!:-<strong></p>");
    db.append("<p><strong>Item-ID : </strong>"+itemId+"</p>");
     db.append("<p style='color:#990099;'><strong>Item-Name : </strong>"+allitem.getItemName()+"</p>");
     Enumeration en=session.getAttributeNames();
     int count=0;
     while(en.hasMoreElements()){
         ++count;
     en.nextElement();}
     db.append("<p><strong>Total Item In-cart : </strong>"+(count-1)+"</p>");
      db.append("<p><a href='StoreControllerServlet'>Continue Shopping</a>&nbsp;&nbsp;&nbsp;&nbsp;");
      db.append("<a href='placeorder.jsp?itemName="+allitem.getItemName()+"'>Place Order</a></p>");
      db.append("<h3 id='logout'><a href='myorder.jsp'><b>My Orders</b></a>&nbsp;&nbsp;&nbsp;<a href='LoginControllerServlet?logout=logout'><b>Logout</b></a></h3>");
     out.println(db);
   }
  %>  
    </body>
</html>
