package br.edu.ifsp.arq.dao;

import java.util.ArrayList;
import java.util.List;
import br.edu.ifsp.arq.model.Filme;

public class FilmeDAO {

	private static FilmeDAO instance = null;
	private List<Filme> filmes;
	private int proximoId;
	
	private FilmeDAO() {
	    filmes = new ArrayList<>();
	    proximoId = 1;
	}
	
	public static FilmeDAO getInstance() {
	    if (instance == null) {
	        instance = new FilmeDAO();
	    }
	    return instance;
	}
	
	public boolean adicionarFilme(Filme filme) {
	    filme.setId(proximoId++);
	    return filmes.add(filme);
	}
	
	public List<Filme> getFilmes() {
	    return filmes;
	}
	
	public Filme buscarPorId(int id) {
	    for (Filme f : filmes) {
	        if (f.getId() == id) return f;
	    }
	    return null;
	}
	
	public boolean removerFilme(int id) {
	        for (Filme filme : filmes) {
	            if (filme.getId() == id) {
	                filmes.remove(filme);
	                return true;
	            }
	        }
	   return false; 
	}
	
	public boolean atualizarFilme(Filme filmeAtualizado) {
	    for (Filme f : filmes) {
	    	if(f.getId() == filmeAtualizado.getId()) {
	    		f.setTitulo(filmeAtualizado.getTitulo());
	    		f.setSinopse(filmeAtualizado.getSinopse());
	    		f.setAnoLancamento(filmeAtualizado.getAnoLancamento());
	    		f.setIdioma(filmeAtualizado.getIdioma());
	    		f.setFormato(filmeAtualizado.getFormato());
	    		f.setDuracao(filmeAtualizado.getDuracao());
	    		
	    		f.setImagem(filmeAtualizado.getImagem());
	    		
	    		return true;
	    	}
	    }
	    return false;
	}
}


