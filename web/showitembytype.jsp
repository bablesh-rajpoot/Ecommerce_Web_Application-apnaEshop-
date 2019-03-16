<%-- 
    Document   : showitembytype
    Created on : Jan 6, 2019, 10:13:17 AM
    Author     : BABLESH RAJPOOT
--%>
<%@page import="shopping.dto.ItemInfoDTO"%>
<%@page session="true" contentType="text/html" pageEncoding="UTF-8"  import="java.util.*"%>

 <%
            String username=(String)session.getAttribute("username");
            RequestDispatcher rd=null;
            if(username==null)
            {
                session.invalidate();
                rd=request.getRequestDispatcher("accessdenied.html");
            }
            else
            {
              StringBuffer db=new StringBuffer("<ul>");
              List<ItemInfoDTO>itemname=(ArrayList<ItemInfoDTO>)request.getAttribute("iteminfo");
              for(ItemInfoDTO n:itemname)
              {
               String name=n.getItemName();
               int id=n.getItemId();
               db.append("<li id='"+n+"'><strong><a href='StoreControllerServlet?itemId="+id+"'>"+name+"<strong></a></li>");
              }
              db.append("</ul>");
              out.println(db);
            
            }
         %>