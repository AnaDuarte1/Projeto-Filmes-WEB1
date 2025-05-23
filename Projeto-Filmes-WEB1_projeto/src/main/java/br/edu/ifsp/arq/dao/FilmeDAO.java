package br.edu.ifsp.arq.dao;

import br.edu.ifsp.arq.model.Filme;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class FilmeDAO {
    private static FilmeDAO instance = null;
    private List<Filme> filmes;
    private AtomicInteger proximoId;

    // Construtor privado
    private FilmeDAO() {
        filmes = new ArrayList<>();
        proximoId = new AtomicInteger(1);
        
        // Dados iniciais para teste
        filmes.add(new Filme("ThunderBolts", "Marvel", 2025, 
                "Em Thunderbolts, Yelena faz parte de uma equipe composta por ex-supervilões redimidos, prontos para agir em nome de causas controversas.", "Português", 
                "Digital", "Ação", 120, "imagem/thunderbolts.webp", proximoId.getAndIncrement()));
        
        System.out.println("[FilmeDAO] Inicializado com " + filmes.size() + " filmes");
    }

    // Método sincronizado para obter instância
    public static synchronized FilmeDAO getInstance() {
        if (instance == null) {
            instance = new FilmeDAO();
        }
        return instance;
    }

    public List<Filme> getFilmes() {
        System.out.println("[FilmeDAO] Retornando " + filmes.size() + " filmes");
        return new ArrayList<>(filmes); // Retorna cópia
    }

    public boolean adicionarFilme(Filme filme) {
        filme.setId(proximoId.getAndIncrement());
        filmes.add(filme);
        System.out.println("[FilmeDAO] Filme adicionado: " + filme.getTitulo() + 
                         " (Total: " + filmes.size() + ")");
        return true;
    }

    public boolean removerFilme(int id) {
        boolean removido = filmes.removeIf(f -> f.getId() == id);
        System.out.println("[FilmeDAO] Tentativa de remover ID " + id + 
                         (removido ? " - Sucesso" : " - Falha"));
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
                System.out.println("[FilmeDAO] Filme atualizado: ID " + filmeAtualizado.getId());
                return true;
            }
        }
        System.out.println("[FilmeDAO] Filme não encontrado para atualização: ID " + 
                         filmeAtualizado.getId());
        return false;
    }
}