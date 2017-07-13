/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.controller;

import br.univates.minhavenda.models.Usuario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

/**
 *
 * @author Dionatan
 */
public class UsuarioDAO extends CustomDAO<Usuario>{

    @Override
    public Usuario fillObject(ResultSet rs) {
        Usuario usuario = new Usuario();        
        try {
            usuario.setEmpresa(rs.getInt("us_empresa"));
            usuario.setCodigo(rs.getInt("us_codigo"));
            usuario.setNome(rs.getString("us_nome"));
            usuario.setCPF(rs.getString("us_cpf"));
            usuario.setCNPJ(rs.getString("us_cnpj"));
            usuario.setCEP(rs.getString("us_cep"));
            usuario.setUF(rs.getString("us_uf"));
            usuario.setBairro(rs.getString("us_bairro"));
            usuario.setCidade(rs.getString("us_cidade"));
            usuario.setEndereco(rs.getString("us_endereco"));
            usuario.setEmail(rs.getString("us_email"));
            usuario.setTelefone(rs.getString("us_telefone"));
            usuario.setTipoAcesso(rs.getString("us_tipoacesso"));
            usuario.setUsuario(rs.getString("us_usuario"));
            usuario.setSenha(rs.getString("us_senha"));
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }                                 
        return usuario;
    }
    
    public Usuario getUsuarioLogin(String user, String pass){
        Usuario usuario = null;
        String query = "Select * from usuario where us_usuario = '"+user+"'"+
                       " and us_senha = '"+pass+"'";
        
        Statement st = null;
        ResultSet rs = null;
        List<Usuario> listReturn = null;
        try {
            st = new Database().getInstance();
            rs = st.executeQuery(query);     
            if(rs.isBeforeFirst()){
                rs.next();
                usuario = this.fillObject(rs);
            }                        
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }       
        return usuario; 
    }
    
    public Usuario getUsuario(String empresa, String codigo){
        Usuario usuario = null;
        String query = "Select * from usuario where us_empresa = "+empresa+
                       " and us_codigo = "+codigo;
        Statement st = null;
        ResultSet rs = null;
        List<Usuario> listReturn = null;
        try {
            st = new Database().getInstance();
            rs = st.executeQuery(query);     
            rs.next();
            usuario = this.fillObject(rs);
            
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }       
        return usuario;       
    }
    
    @Override
    public boolean insert(Usuario obj) {          
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
            
            SequencesDAO sequencesDAO = new SequencesDAO();
            
            //ResultSet rs;    
            st.executeUpdate("INSERT INTO public.usuario( " 
                                    + "            us_empresa, "
                                    + "            us_codigo, "
                                    + "            us_nome, "
                                    + "            us_cpf, "
                                    + "            us_cnpj, "
                                    + "            us_cep, "
                                    + "            us_uf, "
                                    + "            us_bairro, "
                                    + "            us_cidade, "
                                    + "            us_endereco, "
                                    + "            us_email, "
                                    + "            us_telefone, "
                                    + "            us_tipoacesso, "
                                    + "            us_usuario, "
                                    + "            us_senha) "
                                    + "VALUES ("
                                    + "            "+String.valueOf(obj.getEmpresa())+", "
                                    + "            '"+String.valueOf(sequencesDAO.getAutoIncrement(SequencesDAO.GEN_USUARIO))+"', "                                            
                                    + "            '"+obj.getNome()+"', "                         
                                    + "            '"+obj.getCPF()+"', "                         
                                    + "            '"+obj.getCNPJ()+"', "                         
                                    + "            '"+obj.getCEP()+"', "                         
                                    + "            '"+obj.getUF()+"', "                         
                                    + "            '"+obj.getBairro()+"', "                         
                                    + "            '"+obj.getCidade()+"', "                         
                                    + "            '"+obj.getEndereco()+"', "                         
                                    + "            '"+obj.getEmail()+"', "                         
                                    + "            '"+obj.getTelefone()+"', "                         
                                    + "            '"+obj.getTipoAcesso()+"', "                         
                                    + "            '"+obj.getUsuario()+"', "                                                                     
                                    + "            '"+obj.getSenha()+"')");
           
           
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
    public boolean update(Usuario obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                      
            //ResultSet rs;      
            st.executeUpdate("UPDATE public.usuario set " 
                                    + " us_nome      = '"+ obj.getNome()+"', "
                                    + " us_cpf       = '"+ obj.getCPF()+"', "
                                    + " us_cnpj      = '"+ obj.getCNPJ()+"', "
                                    + " us_cep       = '"+ obj.getCEP()+"', "
                                    + " us_uf        = '"+ obj.getUF()+"', "
                                    + " us_bairro    = '"+ obj.getBairro()+"', "
                                    + " us_cidade    = '"+ obj.getCidade()+"', "
                                    + " us_endereco  = '"+ obj.getEndereco()+"', "
                                    + " us_email     = '"+ obj.getEmail()+"', "
                                    + " us_telefone  = '"+ obj.getTelefone()+"', "
                                    + " us_tipoacesso = '"+ obj.getTipoAcesso()+"', "
                                    + " us_usuario    = '"+ obj.getUsuario()+"', "
                                    + " us_senha      = '"+ obj.getSenha()+"' "                                                                        
                                    + "WHERE "
                                    + " us_codigo = "+String.valueOf(obj.getCodigo()) 
                                    + " and us_empresa = " + String.valueOf(obj.getEmpresa()));
            
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
    public boolean delete(Usuario obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
                 
            st.executeUpdate("DELETE from usuario where us_empresa = " + String.valueOf(obj.getEmpresa())
                           + " and us_codigo = "+String.valueOf(obj.getCodigo()));
            
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
    public List<Usuario> listar(String where) {        
        String query = "Select * from usuario ";
        
        if (where != null){
            if (where.trim() != ""){
                query += where;
            }
        }
        
        Statement st = null;
        ResultSet rs = null;
        List<Usuario> listReturn = null;
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
