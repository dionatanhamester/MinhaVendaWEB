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
public class TabelaPrecos_Detalhes {
    private Integer Empresa;
    private Integer TabelaPreco;
    private Integer Produto;
    private Double  Preco;

    public TabelaPrecos_Detalhes(){}

    public Integer getEmpresa() {
        return Empresa;
    }

    public void setEmpresa(Integer empresa) {
        Empresa = empresa;
    }

    public Integer getTabelaPreco() {
        return TabelaPreco;
    }

    public void setTabelaPreco(Integer tabelaPreco) {
        TabelaPreco = tabelaPreco;
    }

    public Integer getProduto() {
        return Produto;
    }

    public void setProduto(Integer produto) {
        Produto = produto;
    }

    public Double getPreco() {
        return Preco;
    }

    public void setPreco(Double preco) {
        Preco = preco;
    }
}