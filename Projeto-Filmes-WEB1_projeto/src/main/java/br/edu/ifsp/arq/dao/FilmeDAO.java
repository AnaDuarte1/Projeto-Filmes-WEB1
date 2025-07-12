package br.edu.ifsp.arq.dao;

import br.edu.ifsp.arq.model.Comentario;
import br.edu.ifsp.arq.model.Filme;
import br.edu.ifsp.arq.model.Usuario;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

public class FilmeDAO {
    private static FilmeDAO instance = null;
    private List<Filme> filmes;
    private AtomicInteger proximoFilmeId;
    private AtomicInteger proximoComentarioId;

    private static final File dir = new File("C:\\Projeto-Filmes-WEB1\\Projeto-Filmes-WEB1_projeto\\src\\main\\webapp\\dados");
    private static final File arqFilmes = new File(dir, "filmes.txt");
    private static final File arqComentarios = new File(dir, "comentarios.txt");

    private FilmeDAO() {
        filmes = new ArrayList<>();
        proximoFilmeId = new AtomicInteger(1);
        proximoComentarioId = new AtomicInteger(1);

        if (!dir.exists()) {
            dir.mkdirs();
        }
        carregarFilmes(); 
    }

  
    public static synchronized FilmeDAO getInstance() {
        if (instance == null) {
            instance = new FilmeDAO();
        }
        return instance;
    }

    public void carregarComentarios(UsuarioDAO usuarioDAO) {
        if (!arqComentarios.exists() || usuarioDAO == null) {
            return;
        }
        
        for(Filme filme : this.filmes) {
            filme.getComentarios().clear();
        }

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(arqComentarios), StandardCharsets.UTF_8))) {
            String line;
            int maxId = 0;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length == 5) {
                    int id = Integer.parseInt(parts[0]);
                    int filmeId = Integer.parseInt(parts[1]);
                    int autorId = Integer.parseInt(parts[2]);
                    String texto = parts[3];
                    int nota = Integer.parseInt(parts[4]);

                    Filme filme = buscarPorId(filmeId);
                    // Usa o UsuarioDAO que o servlet forneceu para encontrar o autor
                    Usuario autor = usuarioDAO.buscarPorId(autorId); 
                    
                    if (filme != null && autor != null) {
                        Comentario c = new Comentario(texto, nota, autor);
                        c.setId(id);
                        filme.getComentarios().add(c);
                        filme.recalcularNotaMedia();
                    }
                    if (id > maxId) maxId = id;
                }
            }
            proximoComentarioId.set(maxId + 1);
        } catch (IOException | NumberFormatException e) {
            e.printStackTrace();
        }
    }

    
    private void carregarFilmes() {
        if (!arqFilmes.exists()) return;
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(arqFilmes), StandardCharsets.UTF_8))) {
            String line;
            int maxId = 0;
            filmes.clear();
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length == 10) {
                    int id = Integer.parseInt(parts[0]);
                    Filme f = new Filme(parts[1], parts[2], Integer.parseInt(parts[3]), parts[4], parts[5], parts[6], parts[7], Integer.parseInt(parts[8]), parts[9], 0);
                    f.setId(id);
                    filmes.add(f);
                    if (id > maxId) maxId = id;
                }
            }
            proximoFilmeId.set(maxId + 1);
        } catch (IOException | NumberFormatException e) {
            e.printStackTrace();
        }
    }
    
    private void salvarFilmes() {
        try (PrintWriter writer = new PrintWriter(new OutputStreamWriter(new FileOutputStream(arqFilmes, false), StandardCharsets.UTF_8))) {
            for (Filme f : filmes) {
                writer.println(f.getId() + "|" + f.getTitulo() + "|" + f.getDiretor() + "|" + f.getAnoLancamento() + "|" + f.getSinopse() + "|" + f.getIdioma() + "|" + f.getFormato() + "|" + f.getCategoria() + "|" + f.getDuracao() + "|" + f.getImagem());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void salvarComentario(Comentario comentario, int filmeId) {
        try (PrintWriter writer = new PrintWriter(new BufferedWriter(new OutputStreamWriter(new FileOutputStream(arqComentarios, true), StandardCharsets.UTF_8)))) {
            writer.println(comentario.getId() + "|" + filmeId + "|" + comentario.getAutor().getId() + "|" + comentario.getTexto() + "|" + comentario.getNota());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Filme> getFilmes() {    
        return new ArrayList<>(filmes); 
    }

    public boolean adicionarFilme(Filme filme) {
        filme.setId(proximoFilmeId.getAndIncrement());
        filmes.add(filme);
        salvarFilmes();
        return true;
    }

    public Filme buscarPorId(int id) {
        return filmes.stream().filter(f -> f.getId() == id).findFirst().orElse(null);
    }
    
    public void adicionarComentario(int filmeId, Comentario comentario) {
        Filme filme = buscarPorId(filmeId);
        if (filme != null && comentario.getAutor() != null && comentario.getAutor().getId() > 0) {
            comentario.setId(proximoComentarioId.getAndIncrement());
            filme.getComentarios().add(comentario);
            filme.recalcularNotaMedia();
            salvarComentario(comentario, filmeId);
        }
    }
    
    public List<Filme> buscarFilmesPorPalavraChave(String palavraChave) {
        String p = palavraChave.toLowerCase();
        return filmes.stream()
            .filter(filme -> filme.getTitulo().toLowerCase().contains(p) ||
                             filme.getDiretor().toLowerCase().contains(p) ||
                             filme.getCategoria().toLowerCase().contains(p))
            .collect(Collectors.toList());
    }

    public boolean removerFilme(int id) {
        boolean removed = filmes.removeIf(f -> f.getId() == id);
        if (removed) {
            salvarFilmes();
        }
        return removed;
    }

    public boolean atualizarFilme(Filme filmeAtualizado) {
        for (int i = 0; i < filmes.size(); i++) {
            if (filmes.get(i).getId() == filmeAtualizado.getId()) {
                filmes.set(i, filmeAtualizado);
                salvarFilmes();
                return true;
            }
        }
        return false;
    }
}
