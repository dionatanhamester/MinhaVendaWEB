/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.controller;

import br.univates.minhavenda.models.Empresa;
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
public class EmpresaDAO extends CustomDAO<Empresa>{

    @Override
    public Empresa fillObject(ResultSet rs) {
        Empresa empresa = new Empresa();
        
        try {
            
            empresa.setCodigo(rs.getInt("em_codigo"));
            empresa.setRazaoSocial(rs.getString("em_razaosocial"));
            empresa.setFantasia(rs.getString("em_fantasia"));
            empresa.setCNPJ(rs.getString("em_cnpj"));
            empresa.setCEP(rs.getString("em_cep"));
            empresa.setUF(rs.getString("em_uf"));
            empresa.setBairro(rs.getString("em_bairro"));
            empresa.setCidade(rs.getString("em_cidade"));
            empresa.setEndereco(rs.getString("em_endereco"));
            empresa.setEmail(rs.getString("em_email"));
            empresa.setTelefone(rs.getString("em_telefone"));
            empresa.setDataAtu(rs.getDate("em_data_atu"));
            empresa.setHoraAtu(rs.getTime("em_hora_atu"));   
            
        } catch (SQLException ex) {
            Logger.getLogger(EmpresaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }                                 
        return empresa;
    }
    
    public Empresa getEmpresa(String codigo){
        Empresa empresa = null;
        String query = "Select * from empresa where em_codigo = "+codigo;
        Statement st = null;
        ResultSet rs = null;
        List<Empresa> listReturn = null;
        try {
            st = new Database().getInstance();
            rs = st.executeQuery(query);     
            rs.next();
            empresa = this.fillObject(rs);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmpresaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EmpresaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }       
        
        return empresa;       
    }
    
    @Override
    public boolean insert(Empresa obj) {          
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
            
            SequencesDAO sequencesDAO = new SequencesDAO();
            
            //ResultSet rs;    
            st.executeUpdate("INSERT INTO public.empresa( " 
                                    + "            em_codigo, "
                                    + "            em_razaosocial, "
                                    + "            em_fantasia, "
                                    + "            em_cnpj, "
                                    + "            em_cep, "
                                    + "            em_uf, " 
                                    + "            em_bairro, "
                                    + "            em_cidade, "
                                    + "            em_endereco, "
                                    + "            em_email, "
                                    + "            em_telefone, "
                                    + "            em_data_atu, "
                                    + "            em_hora_atu) "
                                    + "VALUES ("
                                    + "            "+String.valueOf(sequencesDAO.getAutoIncrement(SequencesDAO.GEN_EMPRESA))+", "
                                    + "            '"+obj.getRazaoSocial()+"', "
                                    + "            '"+obj.getFantasia()+"', "
                                    + "            '"+obj.getCNPJ()+"', "
                                    + "            '"+obj.getCEP()+"', "
                                    + "            '"+obj.getUF()+"', " 
                                    + "            '"+obj.getBairro()+"', "
                                    + "            '"+obj.getCidade()+"', "
                                    + "            '"+obj.getEndereco()+"', "
                                    + "            '"+obj.getEmail()+"', "
                                    + "            '"+obj.getTelefone()+"', "
                                    + "             current_date," 
                                    + "             current_time)");
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmpresaDAO.class.getName()).log(Level.SEVERE, null, ex);
            vReturn = false;
        } catch (SQLException ex) {
            Logger.getLogger(EmpresaDAO.class.getName()).log(Level.SEVERE, null, ex);
            vReturn = false;
        }
        return vReturn;        
    }

    @Override
    public boolean update(Empresa obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
            
            SequencesDAO sequencesDAO = new SequencesDAO();
            
            //ResultSet rs;    
            st.executeUpdate("UPDATE public.empresa set " 
                                    + " em_razaosocial = '"+ obj.getRazaoSocial()+"', "
                                    + " em_fantasia    = '"+ obj.getFantasia()+"', " 
                                    + " em_cnpj        = '"+ obj.getCNPJ()+"', " 
                                    + " em_cep         = '"+ obj.getCEP()+"', " 
                                    + " em_uf          = '"+ obj.getUF()+"', "   
                                    + " em_bairro      = '"+ obj.getBairro()+"', " 
                                    + " em_cidade      = '"+ obj.getCidade()+"', " 
                                    + " em_endereco    = '"+ obj.getEndereco()+"', " 
                                    + " em_email       = '"+ obj.getEmail()+"', " 
                                    + " em_telefone    = '"+ obj.getTelefone()+"', "
                                    + " em_data_atu    = current_date, "
                                    + " em_hora_atu    = current_time  "
                                    + "WHERE "
                                    + " em_codigo = " + String.valueOf(obj.getCodigo()));
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmpresaDAO.class.getName()).log(Level.SEVERE, null, ex);
            vReturn = false;
        } catch (SQLException ex) {
            Logger.getLogger(EmpresaDAO.class.getName()).log(Level.SEVERE, null, ex);
            vReturn = false;
        }
        return vReturn;
    }

    @Override
    public boolean delete(Empresa obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                 
            st.executeUpdate("DELETE from empresa where em_codigo = "+String.valueOf(obj.getCodigo()));
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmpresaDAO.class.getName()).log(Level.SEVERE, null, ex);
            vReturn = false;
        } catch (SQLException ex) {
            Logger.getLogger(EmpresaDAO.class.getName()).log(Level.SEVERE, null, ex);
            vReturn = false;
        }
        return vReturn;  
    }

    @Override
    public List<Empresa> listar(String where) {        
        String query = "Select * from empresa ";
        
        if (where != null){
            if (where.trim() != ""){
                query += where;
            }
        }
        
        Statement st = null;
        ResultSet rs = null;
        List<Empresa> listReturn = null;
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
