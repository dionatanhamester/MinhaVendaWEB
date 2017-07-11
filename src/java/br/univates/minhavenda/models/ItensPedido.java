/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.univates.minhavenda.models;

import java.sql.Time;
import java.util.Date;
/**
 *
 * @author Dionatan
 */
public class ItensPedido {
    private Integer Empresa;
    private Integer Usuario;
    private Integer Pedido;
    private Integer Produto;
    private Integer TabelaPreco;
    private Double Quantidade;
    private Double ValorUnitario;
    private Double ValorTotal;
    private Double PercDesconto;
    private Date   DataAtu;
    private Time   HoraAtu;
    private String OBS;

    public ItensPedido(){}


    public Integer getEmpresa() {
        return Empresa;
    }

    public void setEmpresa(Integer empresa) {
        Empresa = empresa;
    }

    public Integer getUsuario() {
        return Usuario;
    }

    public void setUsuario(Integer usuario) {
        Usuario = usuario;
    }

    public Integer getPedido() {
        return Pedido;
    }

    public void setPedido(Integer pedido) {
        Pedido = pedido;
    }

    public Integer getProduto() {
        return Produto;
    }

    public void setProduto(Integer produto) {
        Produto = produto;
    }

    public Integer getTabelaPreco() {
        return TabelaPreco;
    }

    public void setTabelaPreco(Integer tabelaPreco) {
        TabelaPreco = tabelaPreco;
    }

    public Double getQuantidade() {
        return Quantidade;
    }

    public void setQuantidade(Double quantidade) {
        Quantidade = quantidade;
    }

    public Double getValorUnitario() {
        return ValorUnitario;
    }

    public void setValorUnitario(Double valorUnitario) {
        ValorUnitario = valorUnitario;
    }

    public Double getValorTotal() {
        return ValorTotal;
    }

    public void setValorTotal(Double valorTotal) {
        ValorTotal = valorTotal;
    }

    public Double getPercDesconto() {
        return PercDesconto;
    }

    public void setPercDesconto(Double percDesconto) {
        PercDesconto = percDesconto;
    }

    public Date getDataAtu() {
        return DataAtu;
    }

    public void setDataAtu(Date dataAtu) {
        DataAtu = dataAtu;
    }

    public Time getHoraAtu() {
        return HoraAtu;
    }

    public void setHoraAtu(Time horaAtu) {
        HoraAtu = horaAtu;
    }

    public String getOBS() {
        return OBS;
    }

    public void setOBS(String OBS) {
        this.OBS = OBS;
    }
}
