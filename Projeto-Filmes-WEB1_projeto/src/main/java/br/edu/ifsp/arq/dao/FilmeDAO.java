package br.edu.ifsp.arq.dao;

import br.edu.ifsp.arq.model.Filme;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class FilmeDAO {
    private static FilmeDAO instance = null;
    private List<Filme> filmes;
    private AtomicInteger proximoId;

    private FilmeDAO() {
        filmes = new ArrayList<>();
        proximoId = new AtomicInteger(1);
        
        // Dados iniciais para teste
        filmes.add(new Filme("ThunderBolts", "Marvel", 2025, 
                "Em Thunderbolts, Yelena faz parte de uma equipe composta por ex-supervilões redimidos, prontos para agir em nome de causas controversas.", "Português", 
                "Digital", "Ação", 120, "imagem/thunderbolts.webp", proximoId.getAndIncrement()));
       
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

    public boolean adicionarFilme(Filme filme) {
        filme.setId(proximoId.getAndIncrement());
        filmes.add(filme);
        return true;
    }

    public boolean removerFilme(int id) {
        boolean removido = filmes.removeIf(f -> f.getId() == id);
        return removido;
    }

    public Filme buscarPorId(int id) {
        return filmes.stream()
            .filter(f -> f.getId() == id)
            .findFirst()
            .orElse(null);
    }

    public boolean atualizarFilme(Filme filmeAtualizado) {
        for (int i = 0; i < filmes.size(); i++) {
            if (filmes.get(i).getId() == filmeAtualizado.getId()) {
                filmes.set(i, filmeAtualizado);
                return true;
            }
        }
        return false;
    }

    public List<Filme> buscarFilmesPorPalavraChave(String palavraChave) {
        synchronized (this) {
            List<Filme> resultados = new ArrayList<>();
            for (Filme filme : filmes) {
                if (filme.getTitulo().toLowerCase().contains(palavraChave.toLowerCase()) ||
                    filme.getDiretor().toLowerCase().contains(palavraChave.toLowerCase()) ||
                    filme.getSinopse().toLowerCase().contains(palavraChave.toLowerCase())) {
                    resultados.add(filme);
                }
            }
            return resultados;
        }
    }
}
