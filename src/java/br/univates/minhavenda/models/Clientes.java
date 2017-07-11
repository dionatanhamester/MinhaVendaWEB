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
public class Clientes {
    private Integer Empresa;
    private Integer Codigo;
    private String Matricula;
    private String Nome;
    private String Endereco;
    private String Cidade;
    private String Bairro;
    private String UF;
    private String CEP;
    private String Fone;
    private String Email;
    private String CPF;
    private String CNPJ;
    private String Inativo;
    private Date DataAtu;
    private Time HoraAtu;

    public Clientes(){}


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

    public String getMatricula() {
        return Matricula;
    }

    public void setMatricula(String matricula) {
        Matricula = matricula;
    }

    public String getNome() {
        return Nome;
    }

    public void setNome(String nome) {
        Nome = nome;
    }

    public String getEndereco() {
        return Endereco;
    }

    public void setEndereco(String endereco) {
        Endereco = endereco;
    }

    public String getCidade() {
        return Cidade;
    }

    public void setCidade(String cidade) {
        Cidade = cidade;
    }

    public String getBairro() {
        return Bairro;
    }

    public void setBairro(String bairro) {
        Bairro = bairro;
    }

    public String getUF() {
        return UF;
    }

    public void setUF(String UF) {
        this.UF = UF;
    }

    public String getCEP() {
        return CEP;
    }

    public void setCEP(String CEP) {
        this.CEP = CEP;
    }

    public String getFone() {
        return Fone;
    }

    public void setFone(String fone) {
        Fone = fone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getCPF() {
        return CPF;
    }

    public void setCPF(String CPF) {
        this.CPF = CPF;
    }

    public String getCNPJ() {
        return CNPJ;
    }

    public void setCNPJ(String CNPJ) {
        this.CNPJ = CNPJ;
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
