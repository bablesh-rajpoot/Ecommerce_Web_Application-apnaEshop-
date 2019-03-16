<%-- 
    Document   : getproductid
    Created on : Jan 31, 2019, 11:32:50 AM
    Author     : BABLESH RAJPOOT
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="shopping.dao.StoreDAO"%>
<%@page session="true" contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username=(String)session.getAttribute("username");
    if(username==null)
    {
      session.invalidate();
      response.sendRedirect("accessdenied.html");
    }
    else
    {
        //int prodId=StoreDAO.getAllProdId();
        ArrayList<Integer>list=StoreDAO.getAllProductId();
        StringBuffer db=new StringBuffer();
        //db.append(list);
        //db.append(prodId);
        //db.append(list);
        //db.append("<select id='pid' name='pid' onchange='getdata()'>");
       for(int pid:list)
        {
           System.out.println("pid "+pid);
          //db.append("<option value="+pid+">"+ pid +"</option>");
          db.append(pid);
          
        }
        
        out.println(db);
    }
    
%>