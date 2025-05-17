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
        carregarFilmes(); // Carrega filmes do arquivo ao inicializar
    }

    public List<Filme> carregarFilmes() {
        List<Filme> filmes = new ArrayList<>();

        // Verifica se o diretório existe, se não, cria
        if (!dir.exists()) {
            dir.mkdirs();
        }

        // Verifica se o arquivo existe, se não, cria
        if (!arq.exists()) {
            try {
                arq.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // Lê os filmes do arquivo
        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(arq))) {
            String linha;
            while ((linha = bufferedReader.readLine()) != null) {
                if (!linha.isEmpty()) {
                    String[] partes = linha.split("\\|");
                    if (partes.length == 8) { // Verifica se a linha tem o número correto de partes
                        Filme filme = new Filme(
                            partes[0], // Título
                            partes[1], // Diretor
                            Integer.parseInt(partes[2]), // Ano de Lançamento
                            partes[3], // Sinopse
                            partes[4], // Idioma
                            partes[5], // Formato
                            Integer.parseInt(partes[6]), // Duração
                            partes[7], // Imagem
                            proximoId++ // ID gerado automaticamente
                        );
                        filmes.add(filme); // Adiciona o filme à lista
                        System.out.println("Carregando filmes do arquivo: " + arq.getAbsolutePath());

                    } else {
                        System.out.println("Linha inválida: " + linha); // Log para linhas inválidas
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return filmes; // Retorna a lista de filmes
    }


    public boolean adicionarFilme(Filme filme) {
        filme.setId(proximoId++);
        filmes.add(filme);
        return salvarFilmes(); // Salva a lista de filmes no arquivo
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
