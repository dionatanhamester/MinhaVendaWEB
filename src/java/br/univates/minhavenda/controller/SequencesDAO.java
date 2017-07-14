/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.controller;

import br.univates.minhavenda.models.Sequences;
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
public class SequencesDAO extends CustomDAO<Sequences>{
    public static final String GEN_EMPRESA   = "gen_empresa";
    public static final String GEN_GRUPOS    = "gen_grupos";
    public static final String GEN_PRODUTOS  = "gen_produtos";
    public static final String GEN_CLIENTES  = "gen_clientes";
    public static final String GEN_USUARIO   = "gen_usuario";
    public static final String GEN_FORMASPGTO = "gen_formaspgto";
    public static final String GEN_TABELAPRECOS = "gen_tabela_precos";
    public static final String GEN_PEDIDOS      = "gen_pedidos";
    
    public int getAutoIncrement(String TYPE){
        int vReturn = -1;
        String field = "";
       
        field = TYPE;         
                
        String query = "Select * from sequences";
        Statement st = null;
        ResultSet rs = null;
        
        try {
            st = new Database().getInstance();
            rs = st.executeQuery(query);     
            rs.next();
            Sequences seq = this.fillObject(rs);
            
            if (TYPE.equals(GEN_EMPRESA)){
                vReturn = seq.getGenEmpresa();    
                seq.setGenEmpresa(seq.getGenEmpresa() + 1 );
            } else if (TYPE.equals(GEN_GRUPOS)){
                vReturn = seq.getGenGrupos();    
                seq.setGenGrupos(seq.getGenGrupos()+ 1 );
            } else if (TYPE.equals(GEN_PRODUTOS)){
                vReturn = seq.getGenProdutos();    
                seq.setGenProdutos(seq.getGenProdutos()+ 1 );
            } else if (TYPE.equals(GEN_CLIENTES)){
                vReturn = seq.getGenClientes();    
                seq.setGenClientes(seq.getGenClientes()+ 1 );
            } else if (TYPE.equals(GEN_USUARIO)){
                vReturn = seq.getGenUsuario();    
                seq.setGenUsuario(seq.getGenUsuario()+ 1 );
            } else if (TYPE.equals(GEN_FORMASPGTO)){
                vReturn = seq.getGenFormasPgto();    
                seq.setGenFormasPgto(seq.getGenFormasPgto() + 1 );
            }  else if (TYPE.equals(GEN_TABELAPRECOS)){
                vReturn = seq.getGenTabelaPrecos();    
                seq.setGenTabelaPrecos(seq.getGenTabelaPrecos() + 1 );
            }   else if (TYPE.equals(GEN_PEDIDOS)){
                vReturn = seq.getGenPedidos();    
                seq.setGenPedidos(seq.getGenPedidos()+ 1 );
            }  
            update(seq);                                  
            
        } catch (ClassNotFoundException ex) {
            System.out.print(ex.getMessage());
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }       
        
        return vReturn;       
    }
    
    @Override
    public Sequences fillObject(ResultSet rs) {
        Sequences seq = new Sequences();
        
        try {
            seq.setCodigo(rs.getInt("se_codigo"));
            seq.setGenEmpresa(rs.getInt(GEN_EMPRESA));
            seq.setGenGrupos(rs.getInt(GEN_GRUPOS));
            seq.setGenProdutos(rs.getInt(GEN_PRODUTOS));
            seq.setGenClientes(rs.getInt(GEN_CLIENTES));
            seq.setGenUsuario(rs.getInt(GEN_USUARIO));
            seq.setGenFormasPgto(rs.getInt(GEN_FORMASPGTO));
            seq.setGenTabelaPrecos(rs.getInt(GEN_TABELAPRECOS));
            seq.setGenPedidos(rs.getInt(GEN_PEDIDOS));

        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }                                 
        return seq;
    }

    @Override
    public boolean insert(Sequences obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Sequences obj) {
        boolean vReturn = true;
        try {            
            Statement st = new Database().getInstance();
  
            st.executeUpdate("UPDATE public.sequences set "
                            +"   gen_empresa = " + String.valueOf(obj.getGenEmpresa()) 
                            +"  ,gen_usuario = " + String.valueOf(obj.getGenUsuario()) 
                            +"  ,gen_clientes = " + String.valueOf(obj.getGenClientes()) 
                            +"  ,gen_pedidos = " + String.valueOf(obj.getGenPedidos()) 
                            +"  ,gen_grupos = " + String.valueOf(obj.getGenGrupos()) 
                            +"  ,gen_produtos = " + String.valueOf(obj.getGenProdutos()) 
                            +"  ,gen_formaspgto = " + String.valueOf(obj.getGenFormasPgto()) 
                            +"  ,gen_tabela_precos = " + String.valueOf(obj.getGenTabelaPrecos())
                            +" WHERE "
                            +" se_codigo = "+ String.valueOf(obj.getCodigo()));                    
                    
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
    public boolean delete(Sequences obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Sequences> listar(String where) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
