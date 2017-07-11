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
public class Usuario {
    private Integer Codigo;
    private Integer Empresa;
    private String Nome;
    private String CPF;
    private String CNPJ;
    private String CEP;
    private String UF;
    private String Bairro;
    private String Cidade;
    private String Endereco;
    private String Email;
    private String Telefone;
    private String SenhaMD5;
    private String TipoAcesso;

    public Usuario(){}

    public Integer getCodigo() {
        return Codigo;
    }

    public void setCodigo(Integer codigo) {
        Codigo = codigo;
    }

    public Integer getEmpresa() {
        return Empresa;
    }

    public void setEmpresa(Integer empresa) {
        Empresa = empresa;
    }

    public String getNome() {
        return Nome;
    }

    public void setNome(String nome) {
        Nome = nome;
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

    public String getCEP() {
        return CEP;
    }

    public void setCEP(String CEP) {
        this.CEP = CEP;
    }

    public String getUF() {
        return UF;
    }

    public void setUF(String UF) {
        this.UF = UF;
    }

    public String getBairro() {
        return Bairro;
    }

    public void setBairro(String bairro) {
        Bairro = bairro;
    }

    public String getCidade() {
        return Cidade;
    }

    public void setCidade(String cidade) {
        Cidade = cidade;
    }

    public String getEndereco() {
        return Endereco;
    }

    public void setEndereco(String endereco) {
        Endereco = endereco;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getTelefone() {
        return Telefone;
    }

    public void setTelefone(String telefone) {
        Telefone = telefone;
    }

    public String getSenhaMD5() {
        return SenhaMD5;
    }

    public void setSenhaMD5(String senhaMD5) {
        SenhaMD5 = senhaMD5;
    }

    public String getTipoAcesso() {
        return TipoAcesso;
    }

    public void setTipoAcesso(String tipoAcesso) {
        TipoAcesso = tipoAcesso;
    }
}
