/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dionatan
 */
public abstract class CustomDAO<T> {
    
    public abstract T fillObject(ResultSet rs);
    /**
    * Item que verifica se deve incluir ou alterar um registro na tabela.
    */
    public abstract boolean insert(T obj);
    
    /**
    * Item que verifica se deve alterar um registro na tabela.
    */
    public abstract boolean update(T obj);
    
    /**
     * Item que verifica se deve incluir ou alterar um registro na tabela.
     */
    public abstract boolean delete(T obj);
    
    /*
    * Listar registros da tabela
    */
    public abstract List<T> listar(String where);
    
    
    /**
     * Responsável por tonar um Cursor em uma lista
     * @param c
     * @return List<T>
     */
    public List<T> toList(ResultSet rs) throws SQLException{
        List<T> lista = new ArrayList<T>();
        // Processar cada item do banco e adicionar uma linha na tabela
        while (rs.next()) {
            lista.add(fillObject(rs));
        }
        rs.close();                
        return lista;
    }
    
    
    
}
