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
public class FormasPgto {
    private Integer Empresa;
    private Integer Codigo;
    private String  Descricao;
    private Integer NroVezes;
    private Date    DataAtu;
    private Time    HoraAtu;
    
    public FormasPgto(){}

    public Integer getEmpresa() {
        return Empresa;
    }

    public void setEmpresa(Integer empresa) {
        Empresa = empresa;
    }

    public Integer getCodigo() {
        return Codigo;
    }

    public void setCodigo(Integer codigo) {
        Codigo = codigo;
    }

    public String getDescricao() {
        return Descricao;
    }

    public void setDescricao(String descricao) {
        Descricao = descricao;
    }

    public Integer getNroVezes() {
        return NroVezes;
    }

    public void setNroVezes(Integer nroVezes) {
        NroVezes = nroVezes;
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
