/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.servlets;

import br.univates.minhavenda.controller.Database;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Dionatan
 */
public class ListClientes extends HttpServlet {
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {             
        response.setContentType("text/html;charset=UTF-8");
       String  empresa     = request.getParameter("empr");   
               
        String query = "select cl.cl_codigo, cl.cl_nome " +
                       "from clientes cl "+
                       "where " +
                       "   cl_empresa = "+empresa+
                       "order by cl_nome";
      
        Statement st = null;
        ResultSet rs = null;
        
        JSONArray arr = new JSONArray();
        
        try {
            st = new Database().getInstance();
            rs = st.executeQuery(query);     
            
            while (rs.next()){
                JSONObject obj = new JSONObject();
                obj.put("codigo", rs.getInt("cl_codigo"));
                obj.put("label",   rs.getString("cl_nome"));                
                arr.put(obj);
            }
                       
        } catch (ClassNotFoundException ex) {
            System.out.print(ex.getMessage());
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        } catch (JSONException ex) {       
            Logger.getLogger(ListProdutosTabelaPrecos.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        try (PrintWriter out = response.getWriter()) {
            out.println(arr.toString());            
        } 
    }

    
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
