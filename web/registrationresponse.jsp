<%-- 
    Document   : registrationresponse
    Created on : Jan 5, 2019, 5:02:50 PM
    Author     : BABLESH RAJPOOT
--%>
<% boolean result=(Boolean)request.getAttribute("result");
    boolean userFound=(Boolean)request.getAttribute("userFound");
    if(userFound==true)
    {
     out.println("uap");
    }
    else if(result==true)
    {
   out.println("success");
   }
    else
    out.println("failure");
    %>
