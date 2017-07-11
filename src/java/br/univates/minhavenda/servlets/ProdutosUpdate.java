/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.servlets;

import br.univates.minhavenda.controller.ProdutosDAO;
import br.univates.minhavenda.models.Produtos;
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
public class ProdutosUpdate extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        boolean tudoOK     = true;
        String  message    = "";
        String  codigo     = request.getParameter("codigo");   
        String  empresa    = request.getParameter("empresa"); 
        String  nome       = request.getParameter("nome"); 
        String  grupo      = request.getParameter("grupo"); 
        String  unidade    = request.getParameter("unidade"); 
        String  status     = request.getParameter("status"); 
        
        try{
            Produtos produto = new Produtos();
            
            produto.setCodigo(Integer.valueOf(codigo));
            produto.setEmpresa(Integer.valueOf(empresa));
            produto.setNome(nome);
            produto.setGrupo(Integer.valueOf(grupo));
            produto.setUnidade(unidade);
            produto.setInativo(status);
            
            ProdutosDAO produtosDAO = new ProdutosDAO();
            
            tudoOK = produtosDAO.update(produto);
            
            if (tudoOK){
                message = "Registro efetuado com sucesso!";    
            } else {
                message = "Não foi possível realizar o registro. Tente novamente mais tarde!";    
            }            
        } catch (Exception ex){
            tudoOK  = false;
            message = "Não foi possível realizar o registro. Verifique!" + ex.getMessage();
            System.out.print(ex.getMessage());
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
       return "Servlet para editar grupos";
    }// </editor-fold>

}
