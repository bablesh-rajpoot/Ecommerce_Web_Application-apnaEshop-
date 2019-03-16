/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingcatalog.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import shopping.dao.StoreDAO;
import shopping.dto.ItemDTO;


public class AddNewProductControllerServlet extends HttpServlet
{

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd=null;
        try 
        {
        ServletFileUpload sfu=new ServletFileUpload(new DiskFileItemFactory());
        List<FileItem> multiparts = sfu.parseRequest(new ServletRequestContext(request));
	System.out.println("Size is :"+multiparts.size());	
        ArrayList<String> objValues=new ArrayList<>();
         for(FileItem item : multiparts)
         {
	  if (item.isFormField()) 
          {
               
                String fieldName = item.getFieldName();
                String fieldValue = item.getString();
                    System.out.println(fieldName+":"+fieldValue);
                    objValues.add(fieldValue);
                
            }
          else
          {
                
                String fieldName = item.getFieldName();
                System.out.println("shoe fied "+fieldName);
                //String fileName = new File(item.getName()).getName();
                String fileName=item.getName();
                objValues.add(fileName);
                System.out.println(fieldName+":"+fileName);
                InputStream fileContent = item.getInputStream();
                System.out.println("content:"+fileContent);
                
                String imagePath="D:/Web Application/Myshoppingcatalog/web/images"; 
                System.out.println("path is:"+imagePath);
                File myFile=new File(imagePath+"/"+fileName);
                 System.out.println("File will be saved at:"+myFile.getAbsolutePath());
                    System.out.println("File created:"+myFile.createNewFile());
                item.write(myFile);
                System.out.println("File saved at:"+myFile.getAbsolutePath());
                
            }
                    
                    
		} 
         ItemDTO obj=new ItemDTO();
         obj.setItemImage(objValues.get(0));
         obj.setItemName(objValues.get(1));
         obj.setItemType(objValues.get(2));
         obj.setItemDesc(objValues.get(3));
         obj.setItemPrice(Double.parseDouble(objValues.get(4)));
         boolean result=StoreDAO.addNewProduct(obj);
        if(result==true)
         {
             rd=request.getRequestDispatcher("success.jsp");
             request.setAttribute("success",result);
        }
         else
         {
             rd=request.getRequestDispatcher("failure.html");
         }
        }
        
	catch (Exception ex)
        {
                rd=request.getRequestDispatcher("showexception");
                request.setAttribute("ex", ex);
                System.out.println("Exception:"+ex);
                ex.printStackTrace();
            }
        finally
        {
            rd.forward(request, response);
        }
        
        }
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
