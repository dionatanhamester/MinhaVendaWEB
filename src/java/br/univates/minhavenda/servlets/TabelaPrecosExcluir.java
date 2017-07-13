/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.servlets;

import br.univates.minhavenda.controller.TabelaPrecosDAO;
import br.univates.minhavenda.models.TabelaPrecos;
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
public class TabelaPrecosExcluir extends HttpServlet {

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
        String empresa  = request.getParameter("tp_empresa");
        String codigo   = request.getParameter("tp_codigo");
        boolean tudoOK  = true;
        String  message = "";                
        try{
            TabelaPrecosDAO tabelaprecosDAO = new TabelaPrecosDAO();
            
            TabelaPrecos tabela = tabelaprecosDAO.getTabelaPreco(empresa, codigo);
            
            tudoOK = tabelaprecosDAO.delete(tabela);                       
            
        } catch ( Exception ex ){
            
        }         
         
        try (PrintWriter out = response.getWriter()) {
            
            JSONObject obj = new JSONObject();
            obj.put("status", tudoOK);
            obj.put("mesage", message);            
            out.println(obj);
            
        } catch (JSONException ex) {
            System.out.println(ex.getMessage());
        }                  
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet para excluir Tabela Preços";
    }

}