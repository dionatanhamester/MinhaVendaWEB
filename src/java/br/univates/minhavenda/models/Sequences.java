/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.models;

/**
 *
 * @author Dionatan
 */
public class Sequences {
private int Codigo;
    private int GenEmpresa;
    private int GenUsuario;
    private int GenClientes;
    private int GenPedidos;
    private int GenGrupos;
    private int GenProdutos;
    private int GenFormasPgto;
    private int GenTabelaPrecos;

    public int getCodigo() {
        return Codigo;
    }

    public void setCodigo(int codigo) {
        Codigo = codigo;
    }

    public int getGenEmpresa() {
        return GenEmpresa;
    }

    public void setGenEmpresa(int genEmpresa) {
        GenEmpresa = genEmpresa;
    }

    public int getGenUsuario() {
        return GenUsuario;
    }

    public void setGenUsuario(int genUsuario) {
        GenUsuario = genUsuario;
    }

    public int getGenClientes() {
        return GenClientes;
    }

    public void setGenClientes(int genClientes) {
        GenClientes = genClientes;
    }

    public int getGenPedidos() {
        return GenPedidos;
    }

    public void setGenPedidos(int genPedidos) {
        GenPedidos = genPedidos;
    }

    public int getGenGrupos() {
        return GenGrupos;
    }

    public void setGenGrupos(int genGrupos) {
        GenGrupos = genGrupos;
    }

    public int getGenProdutos() {
        return GenProdutos;
    }

    public void setGenProdutos(int genProdutos) {
        GenProdutos = genProdutos;
    }

    public int getGenFormasPgto() {
        return GenFormasPgto;
    }

    public void setGenFormasPgto(int genFormasPgto) {
        GenFormasPgto = genFormasPgto;
    }

    public int getGenTabelaPrecos() {
        return GenTabelaPrecos;
    }

    public void setGenTabelaPrecos(int genTabelaPrecos) {
        GenTabelaPrecos = genTabelaPrecos;
    }
}
