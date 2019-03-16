<%-- 
    Document   : showexception
    Created on : Jan 4, 2019, 1:35:29 PM
    Author     : BABLESH RAJPOOT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="logo.html"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ERROR</title>
        <link rel="stylesheet" type="text/css" href="styles/stylesheet.css"> 
        <script type="text/javascript" src="scripts/jquery.js"></script>
        <script type="text/javascript" src="scripts/showitems.js"></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <meta http-equiv="Cache-control" content="no-cache"/>
        <meta http-equiv="expires" content="-1"/>
        <meta http-equiv="pragma" content="no-cache"/>
    </head>
    <body><center> 
 <%
   Exception e=(Exception)request.getAttribute("exception");
    String msg=e.getMessage();
    System.out.println("Exception is"+e);
    out.println("<h1 style='color:red'>Some Problem Occurred at Server<br>Try Again Later...</h1>"+msg);
%>
    </center>
    </body>
</html>

