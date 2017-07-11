/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.servlets;

import br.univates.minhavenda.controller.EmpresaDAO;
import br.univates.minhavenda.models.Empresa;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
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
public class EmpresaInsert extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        
        boolean tudoOK     = true;
        String  message    = "";
        String razaosocial = request.getParameter("razaosocial");  
        String fantasia    = request.getParameter("fantasia");  
        String cnpj        = request.getParameter("cnpj");   
        cnpj = cnpj.replace(".", "");
        cnpj = cnpj.replace("/", "");
        cnpj = cnpj.replace("-", "");
        String CEP         = request.getParameter("CEP");  
        CEP = CEP.replace("-", "");
        String UF          = request.getParameter("UF");
        String cidade      = request.getParameter("cidade"); 
        String bairro      = request.getParameter("bairro");
        String endereco    = request.getParameter("endereco");
        String email       = request.getParameter("email"); 
        String telefone    = request.getParameter("telefone"); 
        telefone = telefone.replace(" ", "");
        telefone = telefone.replace("(", "");
        telefone = telefone.replace(")", "");
        telefone = telefone.replace("-", "");
        
        try{
            Empresa empresa = new Empresa();
            
            empresa.setRazaoSocial(razaosocial);
            empresa.setFantasia(fantasia);
            empresa.setCNPJ(cnpj);
            empresa.setCEP(CEP);
            empresa.setUF(UF);
            empresa.setCidade(cidade);
            empresa.setBairro(bairro);
            empresa.setEndereco(endereco);
            empresa.setEmail(email);
            empresa.setTelefone(telefone);
            
            EmpresaDAO empresaDAO = new EmpresaDAO();
            
            tudoOK = empresaDAO.insert(empresa);
            
            if (tudoOK){
                message = "Registro efetuado com sucesso!";    
            } else {
                message = "Não foi possível realizar o registro. Tente novamente mais tarde!";    
            }            
        } catch (Exception ex){
            tudoOK  = false;
            message = "Não foi possível realizar o registro. Verifique!" + ex.getMessage();
        }        
        
         try (PrintWriter out = response.getWriter()) {
            
            JSONObject obj = new JSONObject();
            obj.put("status", tudoOK);
            obj.put("mesage", message);            
            out.println(obj);
            
        } catch (JSONException ex) {
            Logger.getLogger(EmpresaExcluir.class.getName()).log(Level.SEVERE, null, ex);
        }             
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
         return "Servlet para incluir empresa";
    }// </editor-fold>

}
