/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.servlets;

import br.univates.minhavenda.controller.ClientesDAO;
import br.univates.minhavenda.models.Clientes;
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
public class ClientesInsert extends HttpServlet {

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
        
        String empresa    = request.getParameter("empresa"); 
        String matricula  = request.getParameter("matricula");
        String nome       = request.getParameter("nome"); 
        String cnpj       = request.getParameter("cnpj");
        cnpj = cnpj.replace(".", "");
        cnpj = cnpj.replace("/", "");
        cnpj = cnpj.replace("-", "");
        
        String cpf        = request.getParameter("cpf");
        cpf = cpf.replace(".", "");
        cpf = cpf.replace("-", "");
        
        String CEP        = request.getParameter("CEP");
        CEP = CEP.replace("-", "");
        
        String UF         = request.getParameter("UF");
        String cidade     = request.getParameter("cidade");
        String bairro     = request.getParameter("bairro");
        String endereco   = request.getParameter("endereco");
        String email      = request.getParameter("email");
        String telefone   = request.getParameter("telefone");
        telefone = telefone.replace(" ", "");
        telefone = telefone.replace("(", "");
        telefone = telefone.replace(")", "");
        telefone = telefone.replace("-", "");
        
        String status     = request.getParameter("status");
                       
        try{
            Clientes cliente = new Clientes();
            
            cliente.setEmpresa(Integer.valueOf(empresa));
            cliente.setMatricula(matricula);
            cliente.setNome(nome);
            cliente.setCNPJ(cnpj);
            cliente.setCPF(cpf);
            cliente.setCEP(CEP);
            cliente.setUF(UF);
            cliente.setCidade(cidade);
            cliente.setBairro(bairro);
            cliente.setEndereco(endereco);
            cliente.setEmail(email);
            cliente.setFone(telefone);
            cliente.setInativo(status);
                                   
            ClientesDAO clientesDAO = new ClientesDAO();
            
            tudoOK = clientesDAO.insert(cliente);
            
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
         return "Servlet para incluir Clientes";
    }// </editor-fold>

}
