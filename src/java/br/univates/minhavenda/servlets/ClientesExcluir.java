/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.servlets;

import br.univates.minhavenda.controller.ClientesDAO;
import br.univates.minhavenda.controller.EmpresaDAO;
import br.univates.minhavenda.models.Clientes;
import br.univates.minhavenda.models.Empresa;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class ClientesExcluir extends HttpServlet {

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
        String codigo   = request.getParameter("cl_codigo");
        String empresa  = request.getParameter("cl_empresa");
        
        boolean tudoOK  = true;
        String  message = "";                
        try{
            ClientesDAO clientesDAO = new ClientesDAO();
            
            Clientes cliente = clientesDAO.getCliente(empresa, codigo);
            
            tudoOK = clientesDAO.delete(cliente);                       
            
        } catch ( Exception ex ){
            
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
        return "Servlet para excluir Clientes";
    }

}
