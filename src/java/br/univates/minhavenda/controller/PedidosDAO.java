/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.controller;

import br.univates.minhavenda.models.Pedidos;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

/**
 *
 * @author Dionatan
 */
public class PedidosDAO extends CustomDAO<Pedidos>{

    @Override
    public Pedidos fillObject(ResultSet rs) {
        Pedidos pedido = new Pedidos();        
        try {
            pedido.setEmpresa(rs.getInt("pe_empresa"));
            pedido.setPedido(rs.getInt("pe_pedido"));
            pedido.setUsuario(rs.getInt("pe_usuario"));
            pedido.setCliente(rs.getInt("pe_cliente"));
            pedido.setDuracao(rs.getInt("pe_duracao"));
            pedido.setProducaoLeite(rs.getDouble("pe_producaoleite"));
            pedido.setPesoVivo(rs.getDouble("pe_pesovivo"));
            pedido.setLactantes(rs.getInt("pe_nro_lactantes"));
            pedido.setPreparto(rs.getInt("pe_nro_preparto"));
            pedido.setNovilhas(rs.getInt("pe_nro_novilhas"));
            pedido.setTerneiras_2Meses(rs.getInt("pe_nro_terneiras_2mes"));
            pedido.setTerneiras_6Meses(rs.getInt("pe_nro_terneiras_6mes"));
            pedido.setValorTotal(rs.getDouble("pe_valortotal"));
            pedido.setOBS(rs.getString("pe_obs"));
            pedido.setData(rs.getDate("pe_data"));
            pedido.setFormaPgto(rs.getInt("pe_formapgto"));
            pedido.setMotivoCancelamento(rs.getString("pe_motivo_cancelamento"));
            pedido.setDataAtu(rs.getDate("pe_data_atu"));
            pedido.setHoraAtu(rs.getTime("pe_hora_atu"));               
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }                                 
        return pedido;
    }
    
    public void recalculaTotalPedido(String empresa, String codigoPedido){
        String query = "select coalesce(sum(ip_valortotal),0.00) as total " +
                       "from itens_pedido " +
                       "where " +
                       "ip_emresa = "+empresa+" and " +
                       "ip_pedido = "+codigoPedido;

        Statement st = null;
        ResultSet rs = null;
        List<Pedidos> listReturn = null;
        try {
            st = new Database().getInstance();
            rs = st.executeQuery(query);     
            rs.next();
            Double total = rs.getDouble("total");
            
            Pedidos pedido = this.getPedido(empresa, codigoPedido);
            
            pedido.setValorTotal(total);
            
            this.update(pedido);     
            
        } catch (ClassNotFoundException ex) {
            System.out.print(ex.getMessage());
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }       
    }
    
    public Pedidos getPedido(String empresa, String codigoPedido){
        Pedidos pedido = null;
        String query = "Select * from pedidos where pe_empresa = "+empresa+
                       " and pe_pedido = "+codigoPedido;
        Statement st = null;
        ResultSet rs = null;
        List<Pedidos> listReturn = null;
        try {
            st = new Database().getInstance();
            rs = st.executeQuery(query);     
            rs.next();
            pedido = this.fillObject(rs);
            
        } catch (ClassNotFoundException ex) {
            System.out.print(ex.getMessage());
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }       
        return pedido;       
    }
    
    @Override
    public boolean insert(Pedidos obj) {          
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
            
            SequencesDAO sequencesDAO = new SequencesDAO();
            
            //ResultSet rs;    
            
            st.executeUpdate("INSERT INTO public.pedidos( " 
                                    + "            pe_empresa, "
                                    + "            pe_pedido, "
                                    + "            pe_usuario, "
                                    + "            pe_cliente, "
                                    + "            pe_duracao, "
                                    + "            pe_producaoleite, "
                                    + "            pe_pesovivo, "
                                    + "            pe_nro_lactantes, "
                                    + "            pe_nro_preparto, "
                                    + "            pe_nro_novilhas, "
                                    + "            pe_nro_terneiras_2mes, "
                                    + "            pe_nro_terneiras_6mes, "
                                    + "            pe_valortotal, "
                                    + "            pe_obs, "
                                    + "            pe_cancelado, "
                                    + "            pe_data, "
                                    + "            pe_formapgto, "
                                    + "            pe_motivo_cancelamento, "                                        
                                    + "            pe_data_atu, "
                                    + "            pe_hora_atu) "
                                    + "VALUES ("
                                    + "            "+String.valueOf(obj.getEmpresa())+", "
                                    + "            '"+String.valueOf(sequencesDAO.getAutoIncrement(SequencesDAO.GEN_PEDIDOS))+"', "
                                    + "            "+String.valueOf(obj.getUsuario())+", "        
                                    + "            "+String.valueOf(obj.getCliente())+", "        
                                    + "            "+String.valueOf(obj.getDuracao())+", "        
                                    + "            "+String.valueOf(obj.getProducaoLeite())+", "        
                                    + "            "+String.valueOf(obj.getPesoVivo())+", "                
                                    + "            "+String.valueOf(obj.getLactantes())+", "                
                                    + "            "+String.valueOf(obj.getPreparto())+", "                
                                    + "            "+String.valueOf(obj.getNovilhas())+", "                
                                    + "            "+String.valueOf(obj.getTerneiras_2Meses())+", " 
                                    + "            "+String.valueOf(obj.getTerneiras_6Meses())+", " 
                                    + "            "+String.valueOf(obj.getValorTotal())+", " 
                                    + "            '"+obj.getOBS()+"', "                             
                                    + "            '"+obj.getCancelado()+"', "                                     
                                    + "             current_date,"         
                                    + "            "+String.valueOf(obj.getFormaPgto())+", "         
                                    + "            '"+obj.getMotivoCancelamento()+"', "                                                                                 
                                    + "             current_date," 
                                    + "             current_time)");                           
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
    public boolean update(Pedidos obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                      
            //ResultSet rs;      
            st.executeUpdate("UPDATE public.pedidos set " 
                                    + " pe_cliente             = "+  String.valueOf(obj.getCliente())+", "
                                    + " pe_duracao             = "+  String.valueOf(obj.getDuracao())+", "
                                    + " pe_producaoleite       = "+ String.valueOf(obj.getProducaoLeite())+", "
                                    + " pe_pesovivo            = "+ String.valueOf(obj.getPesoVivo())+", "
                                    + " pe_nro_lactantes       = "+ String.valueOf(obj.getLactantes())+", "
                                    + " pe_nro_preparto        = "+ String.valueOf(obj.getPreparto())+", "
                                    + " pe_nro_novilhas        = "+ String.valueOf(obj.getNovilhas())+", "
                                    + " pe_nro_terneiras_2mes  = "+ String.valueOf(obj.getTerneiras_2Meses())+", "
                                    + " pe_nro_terneiras_6mes  = "+ String.valueOf(obj.getTerneiras_6Meses())+", "
                                    + " pe_valortotal          = "+ String.valueOf(obj.getValorTotal())+", "
                                    + " pe_obs                 = '"+ obj.getOBS()+"', "
                                    + " pe_cancelado           = 'N', "                                    
                                    + " pe_motivo_cancelamento = '"+ obj.getMotivoCancelamento()+"', "
                                    + " pe_formapgto           =  "+ String.valueOf(obj.getFormaPgto())+", "                                    
                                    + " pe_data_atu    = current_date, "
                                    + " pe_hora_atu    = current_time  "
                                    + "WHERE "
                                    + " pe_pedido = "+String.valueOf(obj.getPedido()) 
                                    + " and pe_usuario = "+String.valueOf(obj.getUsuario()) 
                                    + " and pe_empresa = " + String.valueOf(obj.getEmpresa()));
            System.out.print("");
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
    public boolean delete(Pedidos obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                 
             st.executeUpdate("DELETE from itens_pedido where ip_emresa = " + String.valueOf(obj.getEmpresa())
                           + " and ip_pedido = "+String.valueOf(obj.getPedido()));
            
            
            st.executeUpdate("DELETE from pedidos where pe_empresa = " + String.valueOf(obj.getEmpresa())
                           + " and pe_pedido = "+String.valueOf(obj.getPedido()));
            
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
    public List<Pedidos> listar(String where) {        
        String query = "Select * from pedidos ";
        
        if (where != null){
            if (where.trim() != ""){
                query += where;
            }
        }
        
        Statement st = null;
        ResultSet rs = null;
        List<Pedidos> listReturn = null;
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
