/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.controller;

import br.univates.minhavenda.models.Clientes;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

/**
 *
 * @author Dionatan
 */
public class ClientesDAO extends CustomDAO<Clientes>{

    @Override
    public Clientes fillObject(ResultSet rs) {
        Clientes cliente = new Clientes();        
        try {
            cliente.setEmpresa(rs.getInt("cl_empresa"));
            cliente.setCodigo(rs.getInt("cl_codigo"));
            cliente.setMatricula(rs.getString("cl_matricula"));
            cliente.setNome(rs.getString("cl_nome"));
            
            cliente.setEndereco(rs.getString("cl_endereco"));
            cliente.setCidade(rs.getString("cl_cidade"));
            cliente.setBairro(rs.getString("cl_bairro"));
            cliente.setUF(rs.getString("cl_uf"));
            cliente.setCEP(rs.getString("cl_cep"));
            cliente.setFone(rs.getString("cl_fone"));
            cliente.setEmail(rs.getString("cl_email"));
            cliente.setCPF(rs.getString("cl_cpf"));
            cliente.setCNPJ(rs.getString("cl_cnpj"));
            cliente.setInativo(rs.getString("cl_inativo"));                    
            cliente.setDataAtu(rs.getDate("cl_data_atu"));
            cliente.setHoraAtu(rs.getTime("cl_hora_atu"));             
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }                                 
        return cliente;
    }
    
    public Clientes getCliente(String empresa, String codigo){
        Clientes cliente = null;
        String query = "Select * from clientes where cl_empresa = "+empresa+
                       " and cl_codigo = "+codigo;
        Statement st = null;
        ResultSet rs = null;
        List<Clientes> listReturn = null;
        try {
            st = new Database().getInstance();
            rs = st.executeQuery(query);     
            rs.next();
            cliente = this.fillObject(rs);
            
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }       
        return cliente;       
    }
    
    @Override
    public boolean insert(Clientes obj) {          
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
            
            SequencesDAO sequencesDAO = new SequencesDAO();
            
            //ResultSet rs;    
            st.executeUpdate("INSERT INTO public.clientes( " 
                                    + "            cl_empresa, "
                                    + "            cl_codigo, "
                                    + "            cl_matricula, "
                                    + "            cl_nome, "
                                    + "            cl_endereco, "
                                    + "            cl_cidade, "
                                    + "            cl_bairro, "
                                    + "            cl_uf, "
                                    + "            cl_cep, "
                                    + "            cl_fone, "
                                    + "            cl_email, "
                                    + "            cl_cpf, "
                                    + "            cl_cnpj, "
                                    + "            cl_inativo, "
                                    + "            cl_data_atu, "
                                    + "            cl_hora_atu) "
                                    + "VALUES ("
                                    + "            "+String.valueOf(obj.getEmpresa())+", "
                                    + "            '"+String.valueOf(sequencesDAO.getAutoIncrement(SequencesDAO.GEN_CLIENTES))+"', "
                                    + "            '"+obj.getMatricula()+"', "                         
                                    + "            '"+obj.getNome()+"', "                   
                                    + "            '"+obj.getEndereco()+"', "                   
                                    + "            '"+obj.getCidade()+"', "                   
                                    + "            '"+obj.getBairro()+"', "                   
                                    + "            '"+obj.getUF()+"', "                   
                                    + "            '"+obj.getCEP()+"', "                   
                                    + "            '"+obj.getFone()+"', "                   
                                    + "            '"+obj.getEmail()+"', "                   
                                    + "            '"+obj.getCPF()+"', "                   
                                    + "            '"+obj.getCNPJ()+"', "                                                               
                                    + "            '"+obj.getInativo()+"', "                                                               
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
    public boolean update(Clientes obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                      
            //ResultSet rs;      
            st.executeUpdate("UPDATE public.grupos set " 
                                    + " cl_matricula   = '"+ obj.getMatricula()+"', "
                                    + " cl_nome        = '"+ obj.getNome()+"', "
                                    + " cl_endereco    = '"+ obj.getEndereco()+"', "
                                    + " cl_cidade      = '"+ obj.getCidade()+"', "
                                    + " cl_bairro      = '"+ obj.getBairro()+"', "
                                    + " cl_uf          = '"+ obj.getUF()+"', "
                                    + " cl_cep         = '"+ obj.getCEP()+"', "
                                    + " cl_fone        = '"+ obj.getFone()+"', "
                                    + " cl_email       = '"+ obj.getEmail()+"', "
                                    + " cl_cpf         = '"+ obj.getCPF()+"', "                                            
                                    + " cl_cnpj        = '"+ obj.getCNPJ()+"', "                                            
                                    + " cl_inativo     = '"+ obj.getInativo()+"', "                                                                                        
                                    + " cl_data_atu    = current_date, "
                                    + " cl_hora_atu    = current_time  "
                                    + "WHERE "
                                    + " cl_codigo = "+String.valueOf(obj.getCodigo()) 
                                    + " and cl_empresa = " + String.valueOf(obj.getEmpresa()));
                           
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
    public boolean delete(Clientes obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                 
            st.executeUpdate("DELETE from clientes where cl_empresa = " + String.valueOf(obj.getEmpresa())
                           + " and cl_codigo = "+String.valueOf(obj.getCodigo()));
            
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
    public List<Clientes> listar(String where) {        
        String query = "Select * from clientes ";
        
        if (where != null){
            if (where.trim() != ""){
                query += where;
            }
        }
        
        Statement st = null;
        ResultSet rs = null;
        List<Clientes> listReturn = null;
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
