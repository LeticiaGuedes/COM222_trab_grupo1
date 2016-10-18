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

public class Exemplar extends Publicacao{
    private int numero;
    private float preco;
    private int status; 

    public Exemplar () {
        super();
    }
    
    public Exemplar(int ISBN, int numero, float preco, int status, String titulo, String autor, String editora, int ano) {
        super(ISBN, titulo, autor, editora, ano);
        this.numero = numero;
        this.preco = preco;
        this.status = status;
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
}
