/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.com222.model;

/**
 *
 * @author wallace
 */
public class Publicacao {
    private int ISBN;
    private String titulo;
    private String autor;
    private String editora;
    private int ano;
    
    public Publicacao() {
        
    }
    
    public Publicacao(int isbn, String titulo, String autor, String editora, int ano) {
        this.ISBN = isbn;
        this.ano = ano;
        this.autor = autor;
        this.editora = editora;
        this.titulo = titulo;
    }

    public int getISBN() {
        return ISBN;
    }

    public void setISBN(int ISBN) {
        this.ISBN = ISBN;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getEditora() {
        return editora;
    }

    public void setEditora(String editora) {
        this.editora = editora;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }
}
