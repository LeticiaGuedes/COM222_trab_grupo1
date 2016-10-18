/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.com222.model;

import java.util.Date;

/**
 *
 * @author wallace
 */
public class Emprestimo {
    private int id;
    private Exemplar exemplar;
    private Date emprestimo;
    private Date devolucao;
    private int codigoAssoc;
    private int status;

    public Emprestimo () {
        
    }
    
    public Emprestimo (int id, Date emp, Date dev, int cod, int status, Exemplar exemp) {
        this.id = id;
        this.emprestimo = emp;
        this.devolucao = dev;
        this.codigoAssoc = cod;
        this.status = status;
        this.exemplar = exemp;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Exemplar getExemplar() {
        return exemplar;
    }

    public void setExemplar(Exemplar exemplar) {
        this.exemplar = exemplar;
    }

    public Date getEmprestimo() {
        return emprestimo;
    }

    public void setEmprestimo(Date emprestimo) {
        this.emprestimo = emprestimo;
    }

    public Date getDevolucao() {
        return devolucao;
    }

    public void setDevolucao(Date devolucao) {
        this.devolucao = devolucao;
    }

    public int getCodigoAssoc() {
        return codigoAssoc;
    }

    public void setCodigoAssoc(int codigoAssoc) {
        this.codigoAssoc = codigoAssoc;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
