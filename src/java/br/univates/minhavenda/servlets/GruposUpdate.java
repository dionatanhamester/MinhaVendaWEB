/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.servlets;

import br.univates.minhavenda.controller.GruposDAO;
import br.univates.minhavenda.models.Grupos;
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
public class GruposUpdate  extends HttpServlet {

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
        
        try{
            Grupos grupo = new Grupos();
            
            grupo.setCodigo(Integer.valueOf(codigo));
            grupo.setEmpresa(Integer.valueOf(empresa));
            grupo.setNome(nome);
            
            GruposDAO gruposDAO = new GruposDAO();
            
            tudoOK = gruposDAO.update(grupo);
            
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
