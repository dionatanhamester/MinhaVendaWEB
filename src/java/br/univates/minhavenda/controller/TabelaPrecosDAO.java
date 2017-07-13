/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.controller;

import br.univates.minhavenda.models.TabelaPrecos;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dionatan
 */
public class TabelaPrecosDAO extends CustomDAO<TabelaPrecos>{

    @Override
    public TabelaPrecos fillObject(ResultSet rs) {
        TabelaPrecos tabelapreco = new TabelaPrecos();        
        try {

            tabelapreco.setEmpresa(rs.getInt("tp_empresa"));
            tabelapreco.setCodigo(rs.getInt("tp_codigo"));
            tabelapreco.setNome(rs.getString("tp_nome"));
            tabelapreco.setDataTabela(rs.getDate("tp_data_tabela"));
            tabelapreco.setDataAtu(rs.getDate("tp_data_atu"));
            tabelapreco.setHoraAtu(rs.getTime("tp_hora_atu"));   
            
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }                                 
        return tabelapreco;
    }
    
    public TabelaPrecos getTabelaPreco(String empresa, String codigo){
        TabelaPrecos tabela = null;
        String query = "Select * from tabelaprecos where tp_empresa = "+empresa+
                       " and tp_codigo = "+codigo;
        Statement st = null;
        ResultSet rs = null;
        List<TabelaPrecos> listReturn = null;
        try {
            st = new Database().getInstance();
            rs = st.executeQuery(query);     
            rs.next();
            tabela = this.fillObject(rs);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GruposDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GruposDAO.class.getName()).log(Level.SEVERE, null, ex);
        }       
        return tabela;       
    }
    
    @Override
    public boolean insert(TabelaPrecos obj) {          
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
            
            SequencesDAO sequencesDAO = new SequencesDAO();
            
            //ResultSet rs;    

            st.executeUpdate("INSERT INTO public.tabelaprecos( " 
                                    + "            tp_empresa, "
                                    + "            tp_codigo, "
                                    + "            tp_nome, "
                                    + "            tp_data_tabela, "
                                    + "            tp_data_atu, "
                                    + "            tp_hora_atu) "
                                    + "VALUES ("
                                    + "            "+String.valueOf(obj.getEmpresa())+", "
                                    + "            '"+String.valueOf(sequencesDAO.getAutoIncrement(SequencesDAO.GEN_TABELAPRECOS))+"', "
                                    + "            '"+obj.getNome()+"', "                         
                                    + "             current_date," 
                                    + "             current_date," 
                                    + "             current_time)");
           
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
    public boolean update(TabelaPrecos obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                      
            //ResultSet rs;      
            st.executeUpdate("UPDATE public.tabelaprecos set " 
                                    + " tp_nome        = '"+ obj.getNome()+"', "
                                    + " tp_data_atu    = current_date, "
                                    + " tp_hora_atu    = current_time  "
                                    + "WHERE "
                                    + " tp_codigo = "+String.valueOf(obj.getCodigo()) 
                                    + " and tp_empresa = " + String.valueOf(obj.getEmpresa()));
            
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
    public boolean delete(TabelaPrecos obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                 
            st.executeUpdate("DELETE from tabelaprecos_detalhes where td_empresa = " + String.valueOf(obj.getEmpresa())
                           + " and td_tabelapreco = "+String.valueOf(obj.getCodigo()));
            
            st.executeUpdate("DELETE from tabelaprecos where tp_empresa = " + String.valueOf(obj.getEmpresa())
                           + " and tp_codigo = "+String.valueOf(obj.getCodigo()));
            
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
    public List<TabelaPrecos> listar(String where) {        
        String query = "Select * from tabelaprecos ";
        
        if (where != null){
            if (where.trim() != ""){
                query += where;
            }
        }
        
        Statement st = null;
        ResultSet rs = null;
        List<TabelaPrecos> listReturn = null;
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
