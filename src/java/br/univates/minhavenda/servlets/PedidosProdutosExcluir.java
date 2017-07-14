/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.servlets;

import br.univates.minhavenda.controller.ItensPedidosDAO;
import br.univates.minhavenda.models.ItensPedido;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Dionatan
 */
public class PedidosProdutosExcluir extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String empresa   = request.getParameter("ip_empresa");
        String usuario   = request.getParameter("ip_usuario");
        String pedido    = request.getParameter("ip_pedido");
        String produto   = request.getParameter("ip_produto");
        
        boolean tudoOK  = true;
        String  message = "";                
        try{
            ItensPedidosDAO itenspedidoDAO = new ItensPedidosDAO();
            
            ItensPedido item = itenspedidoDAO.getItemPedido(empresa, pedido, produto);
            
            tudoOK = itenspedidoDAO.delete(item);                       
            
        } catch ( Exception ex ){
            System.out.println(ex.getMessage());
        }         
         
        try (PrintWriter out = response.getWriter()) {
            
            JSONObject obj = new JSONObject();
            obj.put("status", tudoOK);
            obj.put("mesage", message);            
            out.println(obj);
            
        } catch (JSONException ex) {
            System.out.print(ex.getMessage());
        }                  
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet para excluir grupos";
    }

}
