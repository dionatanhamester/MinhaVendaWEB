/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.controller;

import br.univates.minhavenda.models.ItensPedido;
import br.univates.minhavenda.models.Pedidos;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

/**
 *
 * @author Dionatan
 */
public class ItensPedidosDAO extends CustomDAO<ItensPedido>{

    @Override
    public ItensPedido fillObject(ResultSet rs) {
        ItensPedido item = new ItensPedido();        
        try {
            item.setEmpresa(rs.getInt("ip_emresa"));
            item.setUsuario(rs.getInt("ip_usuario"));
            item.setPedido(rs.getInt("ip_pedido"));
            item.setProduto(rs.getInt("ip_produto"));
            item.setTabelaPreco(rs.getInt("ip_tabelapreco"));
            item.setQuantidade(rs.getDouble("ip_quantidade"));
            item.setValorUnitario(rs.getDouble("ip_valorunit"));
            item.setValorTotal(rs.getDouble("ip_valortotal"));
            item.setPercDesconto(rs.getDouble("ip_perc_desconto"));
            item.setOBS(rs.getString("ip_obs"));

            item.setDataAtu(rs.getDate("ip_data_atu"));
            item.setHoraAtu(rs.getTime("ip_hora_atu"));
                       
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }                                 
        return item;
    }
    
    public ItensPedido getItemPedido(String empresa, String codigoPedido, String produto){
        ItensPedido item = null;
        String query = "Select * from itens_pedido where ip_emresa = "+empresa+
                       " and ip_produto = "+produto+ 
                       " and ip_pedido  = "+codigoPedido;
        Statement st = null;
        ResultSet rs = null;
        List<ItensPedido> listReturn = null;
        try {
            st = new Database().getInstance();
            rs = st.executeQuery(query);     
            
            if (rs.isBeforeFirst()) {
                rs.next();
                item = this.fillObject(rs);
            }
            
        } catch (ClassNotFoundException ex) {
            System.out.print(ex.getMessage());
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }       
        return item;       
    }
    
    @Override
    public boolean insert(ItensPedido obj) {          
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
            
            SequencesDAO sequencesDAO = new SequencesDAO();
            
            //ResultSet rs;                
            st.executeUpdate("INSERT INTO public.itens_pedido( " 
                                    + "            ip_emresa, "
                                    + "            ip_usuario, "
                                    + "            ip_pedido, "
                                    + "            ip_produto, "
                                    + "            ip_tabelapreco, "
                                    + "            ip_quantidade, "
                                    + "            ip_valorunit, "
                                    + "            ip_valortotal, "
                                    + "            ip_perc_desconto, "
                                    + "            ip_obs, "
                                    + "            ip_data_atu, "
                                    + "            ip_hora_atu) "
                                    + "VALUES ("
                                    + "            "+String.valueOf(obj.getEmpresa())+", "
                                    + "            "+String.valueOf(obj.getUsuario())+", "        
                                    + "            "+String.valueOf(obj.getPedido())+", "        
                                    + "            "+String.valueOf(obj.getProduto())+", "        
                                    + "            "+String.valueOf(obj.getTabelaPreco())+", "        
                                    + "            "+String.valueOf(obj.getQuantidade())+", "                
                                    + "            "+String.valueOf(obj.getValorUnitario())+", "                
                                    + "            "+String.valueOf(obj.getValorTotal())+", "                
                                    + "            "+String.valueOf(obj.getPercDesconto())+", "                
                                    + "            '"+obj.getOBS()+"', "                                                                                 
                                    + "             current_date," 
                                    + "             current_time)");   
            
            PedidosDAO dao = new PedidosDAO();
            dao.recalculaTotalPedido(String.valueOf(obj.getEmpresa()), String.valueOf(obj.getPedido()));
        } catch (ClassNotFoundException ex) {
            System.out.print(ex.getMessage());
            vReturn = false;
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
            vReturn = false;
        }
        return vReturn;        
    }

    @Override
    public boolean update(ItensPedido obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                      
            //ResultSet rs;      
            st.executeUpdate("UPDATE public.itens_pedido set " 
                                    + " ip_tabelapreco   = "+ String.valueOf(obj.getTabelaPreco())+", "
                                    + " ip_quantidade    = "+ String.valueOf(obj.getQuantidade())+", "
                                    + " ip_valorunit     = "+ String.valueOf(obj.getValorUnitario())+", "
                                    + " ip_valortotal    = "+ String.valueOf(obj.getValorTotal())+", "
                                    + " ip_perc_desconto = "+ String.valueOf(obj.getPercDesconto())+", "
                                    + " ip_obs           = '"+ obj.getOBS()+"', "                              
                                    + " ip_data_atu      = current_date, "
                                    + " ip_hora_atu      = current_time  "
                                    + "WHERE "
                                    + " ip_pedido      = "+String.valueOf(obj.getPedido())
                                    + " and ip_usuario = "+String.valueOf(obj.getUsuario())
                                    + " and ip_produto = "+String.valueOf(obj.getProduto()) 
                                    + " and ip_emresa  = " + String.valueOf(obj.getEmpresa()));
            PedidosDAO dao = new PedidosDAO();
            dao.recalculaTotalPedido(String.valueOf(obj.getEmpresa()), String.valueOf(obj.getPedido()));
        } catch (ClassNotFoundException ex) {
            System.out.print(ex.getMessage());
            vReturn = false;
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
            vReturn = false;
        }
        return vReturn;
    }

    @Override
    public boolean delete(ItensPedido obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                 
            st.executeUpdate("DELETE from itens_pedido where ip_emresa = " + String.valueOf(obj.getEmpresa())
                           + " and ip_produto = "+String.valueOf(obj.getProduto())  
                           + " and ip_usuario = "+String.valueOf(obj.getUsuario())
                           + " and ip_pedido  = "+String.valueOf(obj.getPedido()));
            
            PedidosDAO dao = new PedidosDAO();
            dao.recalculaTotalPedido(String.valueOf(obj.getEmpresa()), String.valueOf(obj.getPedido()));
        } catch (ClassNotFoundException ex) {
            System.out.print(ex.getMessage());
            vReturn = false;
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
            vReturn = false;
        }
        return vReturn;  
    }

    @Override
    public List<ItensPedido> listar(String where) {        
        String query = "Select * from itens_pedido ";
        
        if (where != null){
            if (where.trim() != ""){
                query += where;
            }
        }
        
        Statement st = null;
        ResultSet rs = null;
        List<ItensPedido> listReturn = null;
        try {
            st = new Database().getInstance();
            rs = st.executeQuery(query);     
            
            listReturn = this.toList(rs);
            
        } catch (ClassNotFoundException ex) {
            System.out.print(ex.getMessage());
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }       
        return listReturn;
    }        
}