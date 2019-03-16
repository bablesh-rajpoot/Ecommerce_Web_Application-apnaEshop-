<%-- 
    Document   : addproductresponse
    Created on : Jan 25, 2019, 1:04:15 AM
    Author     : BABLESH RAJPOOT
--%>
<% boolean result=(Boolean)request.getAttribute("addproduct");
   if(result==true)
    {
   out.println("success");
   }
    else
    out.println("failure");
    %>
