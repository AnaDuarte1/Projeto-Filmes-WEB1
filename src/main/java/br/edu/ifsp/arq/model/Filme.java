package br.edu.ifsp.arq.model;

import java.util.List; 
import java.util.ArrayList;

public class Filme {
    private int id;
    private String titulo;
    private String diretor;
    private int anoLancamento;
    private String sinopse;
    private String idioma;
    private String formato;
    private String categoria;
    private int duracao;
    private String imagem; 
    private double notaMedia;
    private List<Comentario> comentarios;
    
    public Filme(String titulo, String diretor, int anoLancamento, String sinopse, String idioma, String formato, String categoria, int duracao, String imagem, int id) {
        this.id = id;
        this.titulo = titulo;
        this.diretor = diretor;
        this.anoLancamento = anoLancamento;
        this.sinopse = sinopse;
        this.idioma = idioma;
        this.formato = formato;
        this.categoria = categoria;
        this.duracao = duracao;
        this.imagem = imagem;
        this.comentarios = new ArrayList<>();
        this.notaMedia = 0.0;
    }
    
    public void recalcularNotaMedia() {
        if (comentarios == null || comentarios.isEmpty()) {
            this.notaMedia = 0.0;
            return;
        }
        double soma = 0;
        for (Comentario c : comentarios) {
            soma += c.getNota();
        }
        this.notaMedia = soma / comentarios.size();
    }

    // Getters e Setters
    public double getNotaMedia() { 
        return notaMedia; 
    }
    public void setNotaMedia(double notaMedia) { 
        this.notaMedia = notaMedia; 
    }
    public List<Comentario> getComentarios() {
        return comentarios; 
    }
    public void setComentarios(List<Comentario> comentarios) { 
        this.comentarios = comentarios; 
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDiretor() {
        return diretor;
    }

    public void setDiretor(String diretor) {
        this.diretor = diretor;
    }

    public int getAnoLancamento() {
        return anoLancamento;
    }

    public void setAnoLancamento(int anoLancamento) {
        this.anoLancamento = anoLancamento;
    }

    public String getSinopse() {
        return sinopse;
    }

    public void setSinopse(String sinopse) {
        this.sinopse = sinopse;
    }

    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    public String getFormato() {
        return formato;
    }

    public void setFormato(String formato) {
        this.formato = formato;
    }
    
    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getDuracao() {
        return duracao;
    }

    public void setDuracao(int duracao) {
        this.duracao = duracao;
    }

    public String getImagem() {
        return imagem;
    }
    
    public void setImagem(String imagem) {
        this.imagem = imagem;
    }
}