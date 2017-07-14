/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.servlets;

import br.univates.minhavenda.controller.ItensPedidosDAO;
import br.univates.minhavenda.controller.TabelaPrecosDetalhesDAO;
import br.univates.minhavenda.models.ItensPedido;
import br.univates.minhavenda.models.TabelaPrecos_Detalhes;
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
public class PedidosProdutosSave extends HttpServlet {

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
        
        String  empresa        = request.getParameter("empresa"); 
        String  codigopedido   = request.getParameter("codigopedido"); 
        String  codigoProduto  = request.getParameter("codigoProduto"); 
        String  usuario        = request.getParameter("usuario"); 
        String  codigotabelapreco = request.getParameter("codigotabelapreco");
        String  valor          = request.getParameter("valor"); 
        String  quantidade     = request.getParameter("quantidade"); 

        try{
            ItensPedido item = new ItensPedido();
            
            item.setEmpresa(Integer.valueOf(empresa));
            item.setUsuario(Integer.valueOf(usuario));
            item.setPedido(Integer.valueOf(codigopedido));
            item.setProduto(Integer.valueOf(codigoProduto));
            item.setTabelaPreco(Integer.valueOf(codigotabelapreco));
            item.setQuantidade(Double.valueOf(quantidade));
            item.setValorUnitario(Double.valueOf(valor));
            item.setValorTotal(Double.valueOf(valor) * Double.valueOf(quantidade));
 
            ItensPedidosDAO itenspedidosDAO = new ItensPedidosDAO();
            
            if (itenspedidosDAO.getItemPedido(empresa, codigopedido, codigoProduto) != null){
               tudoOK = itenspedidosDAO.update(item);   
            } else {
               tudoOK = itenspedidosDAO.insert(item);  
            }
            
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
         return "Servlet para incluir Grupos";
    }// </editor-fold>

}
