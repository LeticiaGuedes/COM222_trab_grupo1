/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.com222.model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wallace
 */
public class Associado {
    private int codigo;
    private String nome;
    private String endereco;
    private String email;
    private String senha;
    private String status;
    private List<Emprestimo> listaEmp;

    public Associado() {
        
    }
    
    public Associado(int codigo, String nome, String endereco, String email, String senha, String status, List<Emprestimo> lista) {
        this.codigo = codigo;
        this.nome = nome;
        this.endereco = endereco;
        this.email = email;
        this.senha = senha;
        this.status = status;
        this.listaEmp = lista;
    }
    
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public List<Emprestimo> getListaEmp() {
        return listaEmp;
    }

    public void setListaEmp(List<Emprestimo> listaEmp) {
        this.listaEmp = listaEmp;
    }
    
}
