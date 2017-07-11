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

public class Produtos {
    private Integer Empresa;
    private Integer Codigo;
    private String Nome;
    private Integer Grupo;
    private String Unidade;
    private String Inativo;
    private Date DataAtu;
    private Time HoraAtu;
    
    public Produtos(){}


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

    public String getNome() {
        return Nome;
    }

    public void setNome(String nome) {
        Nome = nome;
    }

    public Integer getGrupo() {
        return Grupo;
    }

    public void setGrupo(Integer grupo) {
        Grupo = grupo;
    }

    public String getUnidade() {
        return Unidade;
    }

    public void setUnidade(String unidade) {
        Unidade = unidade;
    }

    public String getInativo() {
        return Inativo;
    }

    public void setInativo(String inativo) {
        Inativo = inativo;
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
 