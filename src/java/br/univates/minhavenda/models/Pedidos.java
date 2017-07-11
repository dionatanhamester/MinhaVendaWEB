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
public class Pedidos {
    private Integer Empresa;
    private Integer Pedido;
    private Integer Usuario;
    private Integer Cliente;
    private Integer Duracao;
    private Double ProducaoLeite;
    private Double PesoVivo;
    private Integer Lactantes;
    private Integer Preparto;
    private Integer Novilhas;
    private Integer Terneiras_2Meses;
    private Integer Terneiras_6Meses;
    private Double ValorTotal;
    private String OBS;
    private String Cancelado;
    private Date   Data;
    private Integer FormaPgto;
    private String  MotivoCancelamento;
    private Date   DataAtu;
    private Time   HoraAtu;
    
    public Pedidos(){}

    public Integer getEmpresa() {
        return Empresa;
    }

    public void setEmpresa(Integer empresa) {
        Empresa = empresa;
    }

    public Integer getPedido() {
        return Pedido;
    }

    public void setPedido(Integer pedido) {
        Pedido = pedido;
    }

    public Integer getUsuario() {
        return Usuario;
    }

    public void setUsuario(Integer usuario) {
        Usuario = usuario;
    }

    public Integer getCliente() {
        return Cliente;
    }

    public void setCliente(Integer cliente) {
        Cliente = cliente;
    }

    public Integer getDuracao() {
        return Duracao;
    }

    public void setDuracao(Integer duracao) {
        Duracao = duracao;
    }

    public Double getProducaoLeite() {
        return ProducaoLeite;
    }

    public void setProducaoLeite(Double producaoLeite) {
        ProducaoLeite = producaoLeite;
    }

    public Double getPesoVivo() {
        return PesoVivo;
    }

    public void setPesoVivo(Double pesoVivo) {
        PesoVivo = pesoVivo;
    }

    public Integer getLactantes() {
        return Lactantes;
    }

    public void setLactantes(Integer lactantes) {
        Lactantes = lactantes;
    }

    public Integer getPreparto() {
        return Preparto;
    }

    public void setPreparto(Integer preparto) {
        Preparto = preparto;
    }

    public Integer getNovilhas() {
        return Novilhas;
    }

    public void setNovilhas(Integer novilhas) {
        Novilhas = novilhas;
    }

    public Integer getTerneiras_2Meses() {
        return Terneiras_2Meses;
    }

    public void setTerneiras_2Meses(Integer terneiras_2Meses) {
        Terneiras_2Meses = terneiras_2Meses;
    }

    public Integer getTerneiras_6Meses() {
        return Terneiras_6Meses;
    }

    public void setTerneiras_6Meses(Integer terneiras_6Meses) {
        Terneiras_6Meses = terneiras_6Meses;
    }

    public Double getValorTotal() {
        return ValorTotal;
    }

    public void setValorTotal(Double valorTotal) {
        ValorTotal = valorTotal;
    }

    public String getOBS() {
        return OBS;
    }

    public void setOBS(String OBS) {
        this.OBS = OBS;
    }

    public String getCancelado() {
        return Cancelado;
    }

    public void setCancelado(String cancelado) {
        Cancelado = cancelado;
    }

    public Date getData() {
        return Data;
    }

    public void setData(Date data) {
        Data = data;
    }

    public Integer getFormaPgto() {
        return FormaPgto;
    }

    public void setFormaPgto(Integer formaPgto) {
        FormaPgto = formaPgto;
    }

    public String getMotivoCancelamento() {
        return MotivoCancelamento;
    }

    public void setMotivoCancelamento(String motivoCancelamento) {
        MotivoCancelamento = motivoCancelamento;
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
}
