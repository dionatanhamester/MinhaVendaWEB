/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.controller;

import br.univates.minhavenda.models.TabelaPrecos_Detalhes;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

/**
 *
 * @author Dionatan
 */
public class TabelaPrecosDetalhesDAO extends CustomDAO<TabelaPrecos_Detalhes>{

    @Override
    public TabelaPrecos_Detalhes fillObject(ResultSet rs) {
        TabelaPrecos_Detalhes detalhes = new TabelaPrecos_Detalhes();        
        try {

            detalhes.setEmpresa(rs.getInt("td_empresa"));
            detalhes.setTabelaPreco(rs.getInt("td_tabelapreco"));
            detalhes.setProduto(rs.getInt("td_produto"));
            detalhes.setPreco(rs.getDouble("td_preco"));
            
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }                                 
        return detalhes;
    }
    
    public TabelaPrecos_Detalhes getTabelaPrecoDetalhes(String empresa, String tabela, String produto){
        TabelaPrecos_Detalhes detalhe = null;
        String query = "Select * from tabelaprecos_detalhes where td_empresa = "+empresa+
                       " and td_tabelapreco = "+tabela+" AND td_produto = "+produto;
        Statement st = null;
        ResultSet rs = null;
        List<TabelaPrecos_Detalhes> listReturn = null;
        try {
            st = new Database().getInstance();
            rs = st.executeQuery(query);     
                     
            if (rs.isBeforeFirst()) {
                rs.next();
                detalhe = this.fillObject(rs);
            }
            
            
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }       
        return detalhe;       
    }
    
        
    @Override
    public boolean insert(TabelaPrecos_Detalhes obj) {          
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
            
            SequencesDAO sequencesDAO = new SequencesDAO();
            
            //ResultSet rs;    

            st.executeUpdate("INSERT INTO public.tabelaprecos_detalhes( " 
                                    + "            td_empresa, "
                                    + "            td_tabelapreco, "
                                    + "            td_produto, "
                                    + "            td_preco) "
                                    + "VALUES ("
                                    + "            "+String.valueOf(obj.getEmpresa())+", "
                                    + "            "+String.valueOf(obj.getTabelaPreco())+", "                    
                                    + "            "+String.valueOf(obj.getProduto())+", "
                                    + "            "+String.valueOf(obj.getPreco())+")");
           
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
            vReturn = false;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            vReturn = false;
        }
        return vReturn;        
    }

    @Override
    public boolean update(TabelaPrecos_Detalhes obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                      
            //ResultSet rs;      
            st.executeUpdate("UPDATE public.tabelaprecos_detalhes set " 
                                    + " td_preco        = "+ String.valueOf(obj.getPreco())+" "
                                    + "WHERE "
                                    + " td_tabelapreco = "+String.valueOf(obj.getTabelaPreco()) 
                                    + " and td_produto = "+String.valueOf(obj.getProduto())
                                    + " and td_empresa = " + String.valueOf(obj.getEmpresa()));
            
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
    public boolean delete(TabelaPrecos_Detalhes obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                 
            st.executeUpdate("DELETE from tabelaprecos_detalhes where td_empresa = " + String.valueOf(obj.getEmpresa())
                           + " and td_produto     = "+ String.valueOf(obj.getProduto())  
                           + " and td_tabelapreco = "+String.valueOf(obj.getTabelaPreco()));
            
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
    public List<TabelaPrecos_Detalhes> listar(String where) {        
        String query = "Select * from tabelaprecos_detalhes ";
        
        if (where != null){
            if (where.trim() != ""){
                query += where;
            }
        }
        
        Statement st = null;
        ResultSet rs = null;
        List<TabelaPrecos_Detalhes> listReturn = null;
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
