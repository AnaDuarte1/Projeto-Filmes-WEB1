package br.edu.ifsp.arq.dao;

import br.edu.ifsp.arq.model.Filme;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FilmeDAO {

    private static final File dir = new File("C:\\ana\\Projeto-Filmes-WEB1-main\\Projeto-Filmes-WEB1_projeto\\data");
    private static final File arq = new File(dir, "filmes.txt");
    private static FilmeDAO instance = null;

    private List<Filme> filmes;
    private int proximoId;

    public FilmeDAO() {
        filmes = new ArrayList<>();
        proximoId = 1;
        carregarFilmes();
    }

    public List<Filme> carregarFilmes() {
    	filmes = new ArrayList<>(); 
//        List<Filme> filmes = new ArrayList<>(); cria uma lista nova local, não a da instância

        if (!dir.exists()) {
            dir.mkdirs();
        }

        if (!arq.exists()) {
            try {
                arq.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(arq))) {
            String linha;
            while ((linha = bufferedReader.readLine()) != null) {
                if (!linha.isEmpty()) {
                    String[] partes = linha.split("\\|");
                    if (partes.length == 8) { 
                        Filme filme = new Filme(
                            partes[0],
                            partes[1], 
                            Integer.parseInt(partes[2]), 
                            partes[3], 
                            partes[4], 
                            partes[5], 
                            Integer.parseInt(partes[6]), 
                            partes[7], 
                            proximoId++ 
                        );
                        filmes.add(filme); 
                        System.out.println("Carregando filmes do arquivo: " + arq.getAbsolutePath());

                    } else {
                        System.out.println("Linha inválida: " + linha); 
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return filmes; 
    }


    public boolean adicionarFilme(Filme filme) {
        filme.setId(proximoId++);
        filmes.add(filme);
        return salvarFilmes();
    }

    public boolean salvarFilmes() {
        try (PrintWriter printWriter = new PrintWriter(new FileWriter(arq, false))) {
            for (Filme filme : filmes) {
                printWriter.println(filme.getTitulo() + "|" +
                                   filme.getDiretor() + "|" +
                                   filme.getAnoLancamento() + "|" +
                                   filme.getSinopse() + "|" +
                                   filme.getIdioma() + "|" +
                                   filme.getFormato() + "|" +
                                   filme.getDuracao() + "|" +
                                   filme.getImagem());
            }
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static FilmeDAO getInstance() {
        if (instance == null) {
            instance = new FilmeDAO();
        }
        return instance;
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
            if (f.getId() == filmeAtualizado.getId()) {
                f.setTitulo(filmeAtualizado.getTitulo());
                f.setDiretor(filmeAtualizado.getDiretor());
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
