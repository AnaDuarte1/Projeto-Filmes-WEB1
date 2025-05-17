package br.edu.ifsp.arq.dao;

import br.edu.ifsp.arq.model.Usuario;

import java.io.*;
import java.util.*;

public class UsuarioDAO {

    private static final File dir = new File("C:\\ana\\Projeto-Filmes-WEB1-main\\Projeto-Filmes-WEB1_projeto\\data");
    private static final File arq = new File(dir, "usuarios.txt");

    private List<Usuario> carregarUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();

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

        // Lê os usuários do arquivo
        try (FileReader fileReader = new FileReader(arq);
             BufferedReader bufferedReader = new BufferedReader(fileReader)) {

            String linha;
            while ((linha = bufferedReader.readLine()) != null) {
                if (!linha.isEmpty()) {
                    String[] partes = linha.split("\\|"); // Usando o mesmo separador
                    if (partes.length == 3) {
                        usuarios.add(new Usuario(
                                partes[0],
                                partes[1].trim(),
                                partes[2].trim()
                        ));
                    }
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return usuarios;
    }

    public boolean salvarUsuario(Usuario usuario) {
        List<Usuario> usuarios = carregarUsuarios();

        for (Usuario u : usuarios) {
            if (u.getEmail().equalsIgnoreCase(usuario.getEmail())) {
                return false; 
            }
        }

        // Salva o novo usuário no arquivo
        try (FileWriter fileWriter = new FileWriter(arq, true);
             PrintWriter printWriter = new PrintWriter(fileWriter)) {

            printWriter.print(usuario.getNome() + "|");
            printWriter.print(usuario.getEmail() + "|");
            printWriter.println(usuario.getSenha());

            return true;

        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean autenticar(String email, String senha) {
        List<Usuario> usuarios = carregarUsuarios();

        for (Usuario u : usuarios) {
            if (u.getEmail().equals(email) && u.getSenha().equals(senha)) {
                return true;
            }
        }
        return false;
    }
}
