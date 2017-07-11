/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.controller;

import br.univates.minhavenda.models.Produtos;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;

/**
 *
 * @author Dionatan
 */
public class ProdutosDAO extends CustomDAO<Produtos>{

    @Override
    public Produtos fillObject(ResultSet rs) {
        Produtos produto = new Produtos();        
        try {
            produto.setEmpresa(rs.getInt("pr_empresa"));
            produto.setCodigo(rs.getInt("pr_codigo"));
            produto.setNome(rs.getString("pr_nome"));
            produto.setGrupo(rs.getInt("pr_grupo"));
            produto.setUnidade(rs.getString("pr_unidade"));
            produto.setInativo(rs.getString("pr_inativo"));
            produto.setDataAtu(rs.getDate("pr_data_atu"));
            produto.setHoraAtu(rs.getTime("pr_hora_atu"));                                       
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }                                 
        return produto;
    }
    
    public Produtos getProduto(String empresa, String codigo){
        Produtos produto = null;
        String query = "Select * from produtos where pr_empresa = "+empresa+
                       " and pr_codigo = "+codigo;
        Statement st = null;
        ResultSet rs = null;
        List<Produtos> listReturn = null;
        try {
            st = new Database().getInstance();
            rs = st.executeQuery(query);     
            rs.next();
            produto = this.fillObject(rs);
            
        } catch (ClassNotFoundException ex) {
            System.out.print(ex.getMessage());
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }       
        return produto;       
    }
    
    @Override
    public boolean insert(Produtos obj) {          
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
            
            SequencesDAO sequencesDAO = new SequencesDAO();
            
            //ResultSet rs;    
            st.executeUpdate("INSERT INTO public.produtos( " 
                                    + "            pr_empresa, "
                                    + "            pr_codigo, "
                                    + "            pr_nome, "
                                    + "            pr_grupo, "
                                    + "            pr_unidade, "
                                    + "            pr_inativo, "
                                    + "            pr_data_atu, "
                                    + "            pr_hora_atu) "
                                    + "VALUES ("
                                    + "            "+String.valueOf(obj.getEmpresa())+", "
                                    + "            '"+String.valueOf(sequencesDAO.getAutoIncrement(SequencesDAO.GEN_PRODUTOS))+"', "
                                    + "            '"+obj.getNome()+"', "                         
                                    + "            "+String.valueOf(obj.getGrupo())+", "                         
                                    + "            '"+obj.getUnidade()+"', "                         
                                    + "            '"+obj.getInativo()+"', "                         
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
    public boolean update(Produtos obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                      
            //ResultSet rs;      
            st.executeUpdate("UPDATE public.produtos set " 
                                    + " pr_nome        = '"+ obj.getNome()+"', "
                                    + " pr_grupo       = "+ String.valueOf(obj.getGrupo())+", "
                                    + " pr_unidade     = '"+ obj.getUnidade()+"', "
                                    + " pr_inativo     = '"+ obj.getInativo()+"', "
                                    + " pr_data_atu    = current_date, "
                                    + " pr_hora_atu    = current_time  "
                                    + "WHERE "
                                    + " pr_codigo = "+String.valueOf(obj.getCodigo()) 
                                    + " and pr_empresa = " + String.valueOf(obj.getEmpresa()));
            
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
    public boolean delete(Produtos obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                 
            st.executeUpdate("DELETE from produtos where pr_empresa = " + String.valueOf(obj.getEmpresa())
                           + " and pr_codigo = "+String.valueOf(obj.getCodigo()));
            
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
    public List<Produtos> listar(String where) {        
        String query = "Select * from produtos ";
        
        if (where != null){
            if (where.trim() != ""){
                query += where;
            }
        }
        
        Statement st = null;
        ResultSet rs = null;
        List<Produtos> listReturn = null;
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
