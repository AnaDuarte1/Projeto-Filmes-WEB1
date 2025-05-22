package br.edu.ifsp.arq.dao;

import br.edu.ifsp.arq.model.Filme;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class FilmeDAO {
    private static FilmeDAO instance = null;
    private static final Object lock = new Object();

    private List<Filme> filmes;
    private AtomicInteger proximoId;

    public FilmeDAO() {
        filmes = new ArrayList<>();
        proximoId = new AtomicInteger(1);
    }

    public List<Filme> carregarFilmes() {
        synchronized (lock) {
            // Retorna uma cópia da lista para evitar modificações externas
            return new ArrayList<>(filmes);
        }
    }

    public boolean adicionarFilme(Filme filme) {
        synchronized (lock) {
            filme.setId(proximoId.getAndIncrement());
            filmes.add(filme);
            return true;
        }
    }

    public boolean removerFilme(int id) {
        synchronized (lock) {
            boolean removido = filmes.removeIf(f -> f.getId() == id);
            if (removido) {
                return true;
            }
            return false;
        }
    }

    public static synchronized FilmeDAO getInstance() {
        if (instance == null) {
            instance = new FilmeDAO();
        }
        return instance;
    }
    
    public List<Filme> getFilmes() {
        return new ArrayList<>(filmes); 
    }

    public Filme buscarPorId(int id) {
        return filmes.stream()
            .filter(f -> f.getId() == id)
            .findFirst()
            .orElse(null);
    }

    public boolean atualizarFilme(Filme filmeAtualizado) {
        synchronized (lock) {
            for (int i = 0; i < filmes.size(); i++) {
                if (filmes.get(i).getId() == filmeAtualizado.getId()) {
                    filmes.set(i, filmeAtualizado);
                    return true;
                }
            }
            return false;
        }
    }
}