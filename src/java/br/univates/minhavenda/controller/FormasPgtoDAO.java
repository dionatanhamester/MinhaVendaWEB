/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.controller;

import br.univates.minhavenda.models.FormasPgto;
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
public class FormasPgtoDAO extends CustomDAO<FormasPgto>{

    @Override
    public FormasPgto fillObject(ResultSet rs) {
        FormasPgto formapgto = new FormasPgto();        
        try {
            formapgto.setEmpresa(rs.getInt("fp_empresa"));
            formapgto.setCodigo(rs.getInt("fp_codigo"));
            formapgto.setDescricao(rs.getString("fp_descricao"));
            formapgto.setNroVezes(rs.getInt("fp_nro_vezes"));
            formapgto.setDataAtu(rs.getDate("fp_data_atu"));
            formapgto.setHoraAtu(rs.getTime("fp_hora_atu"));   
            
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }                                 
        return formapgto;
    }
    
    public FormasPgto getFormaPgto(String empresa, String codigo){
        FormasPgto formapgto = null;
        String query = "Select * from formaspgto where fp_empresa = "+empresa+
                       " and fp_codigo = "+codigo;
        Statement st = null;
        ResultSet rs = null;
        List<FormasPgto> listReturn = null;
        try {
            st = new Database().getInstance();
            rs = st.executeQuery(query);     
            rs.next();
            formapgto = this.fillObject(rs);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GruposDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GruposDAO.class.getName()).log(Level.SEVERE, null, ex);
        }       
        return formapgto;       
    }
    
    @Override
    public boolean insert(FormasPgto obj) {          
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
            
            SequencesDAO sequencesDAO = new SequencesDAO();
            
            //ResultSet rs;    
 
            st.executeUpdate("INSERT INTO public.formaspgto( " 
                                    + "            fp_empresa, "
                                    + "            fp_codigo, "
                                    + "            fp_descricao, "
                                    + "            fp_nro_vezes, "
                                    + "            fp_data_atu, "
                                    + "            fp_hora_atu) "
                                    + "VALUES ("
                                    + "            "+String.valueOf(obj.getEmpresa())+", "
                                    + "            '"+String.valueOf(sequencesDAO.getAutoIncrement(SequencesDAO.GEN_FORMASPGTO))+"', "
                                    + "            '"+obj.getDescricao()+"', "                         
                                    + "            "+String.valueOf(obj.getNroVezes())+", "
                                    + "             current_date," 
                                    + "             current_time)");
           
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GruposDAO.class.getName()).log(Level.SEVERE, null, ex);
            vReturn = false;
        } catch (SQLException ex) {
            Logger.getLogger(GruposDAO.class.getName()).log(Level.SEVERE, null, ex);
            vReturn = false;
        }
        return vReturn;        
    }

    @Override
    public boolean update(FormasPgto obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                      
            //ResultSet rs;      
            st.executeUpdate("UPDATE public.formaspgto set " 
                                    + " fp_descricao   = '"+ obj.getDescricao()+"', "
                                    + " fp_nro_vezes   = '"+ obj.getNroVezes()+"', "
                                    + " fp_data_atu    = current_date, "
                                    + " fp_hora_atu    = current_time  "
                                    + "WHERE "
                                    + " fp_codigo = "+String.valueOf(obj.getCodigo()) 
                                    + " and fp_empresa = " + String.valueOf(obj.getEmpresa()));
            
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
    public boolean delete(FormasPgto obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                 
            st.executeUpdate("DELETE from formaspgto where fp_empresa = " + String.valueOf(obj.getEmpresa())
                           + " and fp_codigo = "+String.valueOf(obj.getCodigo()));
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GruposDAO.class.getName()).log(Level.SEVERE, null, ex);
            vReturn = false;
        } catch (SQLException ex) {
            Logger.getLogger(GruposDAO.class.getName()).log(Level.SEVERE, null, ex);
            vReturn = false;
        }
        return vReturn;  
    }

    @Override
    public List<FormasPgto> listar(String where) {        
        String query = "Select * from formaspgto ";
        
        if (where != null){
            if (where.trim() != ""){
                query += where;
            }
        }
        
        Statement st = null;
        ResultSet rs = null;
        List<FormasPgto> listReturn = null;
        try {
            st = new Database().getInstance();
            rs = st.executeQuery(query);     
            
            listReturn = this.toList(rs);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmpresaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EmpresaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }       
        return listReturn;
    }        
}
