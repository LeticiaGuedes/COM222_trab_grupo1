/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.com222.model;

/**
 * O status pode ser 0 ou 1, sendo "Disponível" e "Emprestado" respectivamente
 * 
 */

public class Exemplar {
    private int publicacao_ISBN;
    private int numero;
    private float preco;
    private int status;
    private Publicacao pub;

    public int getPublicacao_ISBN() {
        return publicacao_ISBN;
    }

    public void setPublicacao_ISBN(int publicacao_ISBN) {
        this.publicacao_ISBN = publicacao_ISBN;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Publicacao getPub() {
        return pub;
    }

    public void setPub(Publicacao pub) {
        this.pub = pub;
    }
}
