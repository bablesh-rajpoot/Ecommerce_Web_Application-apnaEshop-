/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shoppingcatalog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import shopping.dao.AdminDAO;
import shopping.dto.ItemDTO;

/**
 *
 * @author BABLESH RAJPOOT
 */
public class AddProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         String pname=request.getParameter("pname");
        String ptype=request.getParameter("ptype");
        String pprice=request.getParameter("pprice");
        String pdesc=request.getParameter("pdesc");
        String pimage=request.getParameter("pimage");
        ArrayList<ItemDTO>list=new ArrayList<ItemDTO>();
        RequestDispatcher rd=null;
         try
         {
          ItemDTO id=new ItemDTO();
          id.setItemType(ptype);
          id.setItemName(pname);
          id.setItemPrice(Double.parseDouble(pprice));
          id.setItemDesc(pdesc);
          id.setItemImage(pimage);
          list.add(id);
          boolean status=AdminDAO.addProduct(list);
          if(status)
          {
           request.setAttribute("addproduct",status);
           rd=request.getRequestDispatcher("addproductresponse.jsp");   
          }
          
        }catch(Exception th)
        {
          request.setAttribute("exception", th);
          rd=request.getRequestDispatcher("showexception.jsp");
          System.out.println("Exception from Model:"+th);
        }
        finally
        {
            rd.forward(request, response);
        }
        
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
