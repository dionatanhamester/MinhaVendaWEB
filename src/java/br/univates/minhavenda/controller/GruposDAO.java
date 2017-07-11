/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.controller;

import br.univates.minhavenda.models.Grupos;
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
public class GruposDAO extends CustomDAO<Grupos>{

    @Override
    public Grupos fillObject(ResultSet rs) {
        Grupos grupo = new Grupos();        
        try {
            grupo.setEmpresa(rs.getInt("gr_empresa"));
            grupo.setCodigo(rs.getInt("gr_codigo"));
            grupo.setNome(rs.getString("gr_nome"));
            grupo.setDataAtu(rs.getDate("gr_data_atu"));
            grupo.setHoraAtu(rs.getTime("gr_hora_atu"));   
            
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }                                 
        return grupo;
    }
    
    public Grupos getGrupo(String empresa, String codigo){
        Grupos grupo = null;
        String query = "Select * from grupos where gr_empresa = "+empresa+
                       " and gr_codigo = "+codigo;
        Statement st = null;
        ResultSet rs = null;
        List<Grupos> listReturn = null;
        try {
            st = new Database().getInstance();
            rs = st.executeQuery(query);     
            rs.next();
            grupo = this.fillObject(rs);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GruposDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GruposDAO.class.getName()).log(Level.SEVERE, null, ex);
        }       
        return grupo;       
    }
    
    @Override
    public boolean insert(Grupos obj) {          
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
            
            SequencesDAO sequencesDAO = new SequencesDAO();
            
            //ResultSet rs;    
            st.executeUpdate("INSERT INTO public.grupos( " 
                                    + "            gr_empresa, "
                                    + "            gr_codigo, "
                                    + "            gr_nome, "
                                    + "            gr_data_atu, "
                                    + "            gr_hora_atu) "
                                    + "VALUES ("
                                    + "            "+String.valueOf(obj.getEmpresa())+", "
                                    + "            '"+String.valueOf(sequencesDAO.getAutoIncrement(SequencesDAO.GEN_GRUPOS))+"', "
                                    + "            '"+obj.getNome()+"', "                         
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
    public boolean update(Grupos obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                      
            //ResultSet rs;      
            st.executeUpdate("UPDATE public.grupos set " 
                                    + " gr_nome        = '"+ obj.getNome()+"', "
                                    + " gr_data_atu    = current_date, "
                                    + " gr_hora_atu    = current_time  "
                                    + "WHERE "
                                    + " gr_codigo = "+String.valueOf(obj.getCodigo()) 
                                    + " and gr_empresa = " + String.valueOf(obj.getEmpresa()));
            
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
    public boolean delete(Grupos obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                 
            st.executeUpdate("DELETE from grupos where gr_empresa = " + String.valueOf(obj.getEmpresa())
                           + " and gr_codigo = "+String.valueOf(obj.getCodigo()));
            
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
    public List<Grupos> listar(String where) {        
        String query = "Select * from grupos ";
        
        if (where != null){
            if (where.trim() != ""){
                query += where;
            }
        }
        
        Statement st = null;
        ResultSet rs = null;
        List<Grupos> listReturn = null;
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
