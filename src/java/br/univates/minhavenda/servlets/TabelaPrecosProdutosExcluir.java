/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.servlets;

import br.univates.minhavenda.controller.TabelaPrecosDetalhesDAO;
import br.univates.minhavenda.models.TabelaPrecos_Detalhes;
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
public class TabelaPrecosProdutosExcluir extends HttpServlet {

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
        String empresa   = request.getParameter("td_empresa");
        String tabela    = request.getParameter("td_tabelapreco");
        String produto   = request.getParameter("td_produto");
        
        boolean tudoOK  = true;
        String  message = "";                
        try{
            TabelaPrecosDetalhesDAO tabeladetalhesDAO = new TabelaPrecosDetalhesDAO();
            
            TabelaPrecos_Detalhes detalhe = tabeladetalhesDAO.getTabelaPrecoDetalhes(empresa, tabela, produto);
            
            tudoOK = tabeladetalhesDAO.delete(detalhe);                       
            
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