/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.servlets;

import br.univates.minhavenda.controller.PedidosDAO;
import br.univates.minhavenda.models.Pedidos;
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
public class PedidosUpdate extends HttpServlet {

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
        
        String codigopedido            = request.getParameter("pedido"); 
        String usuario           = request.getParameter("usuario"); 
        String empresa           = request.getParameter("empresa"); 
        String codigoCliente     = request.getParameter("codigoCliente"); 
        String duracao           = request.getParameter("duracao"); 
        String pesovivo          = request.getParameter("pesovivo"); 
        String producao          = request.getParameter("producao"); 
        String lactantes         = request.getParameter("lactantes"); 
        String preparto          = request.getParameter("preparto"); 
        String novilhas          = request.getParameter("novilhas"); 
        String terneiras_2meses  = request.getParameter("terneiras_2meses"); 
        String terneiras_6meses  = request.getParameter("terneiras_6meses"); 
        String codigoformapgto   = request.getParameter("codigoformapgto"); 
        String obs               = request.getParameter("obs"); 
        String total = "0.00"; 
                       
        try{
            Pedidos pedido = new Pedidos();
            pedido.setPedido(Integer.valueOf(codigopedido));
            pedido.setUsuario(Integer.valueOf(usuario));
            pedido.setEmpresa(Integer.valueOf(empresa));
            pedido.setCliente(Integer.valueOf(codigoCliente));
            pedido.setDuracao(Integer.valueOf(duracao));
            pedido.setPesoVivo(Double.valueOf(pesovivo));
            pedido.setProducaoLeite(Double.valueOf(producao));
            
            pedido.setLactantes(Integer.valueOf(lactantes));
            pedido.setPreparto(Integer.valueOf(preparto));
            pedido.setNovilhas(Integer.valueOf(novilhas));
            pedido.setTerneiras_2Meses(Integer.valueOf(terneiras_2meses));
            pedido.setTerneiras_6Meses(Integer.valueOf(terneiras_6meses));
            pedido.setValorTotal(0.00);
            pedido.setOBS(obs);
            pedido.setFormaPgto(Integer.valueOf(codigoformapgto));
            pedido.setCancelado("N");
                                   
            PedidosDAO pedidosDAO = new PedidosDAO();
            
            tudoOK = pedidosDAO.update(pedido);
            
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
