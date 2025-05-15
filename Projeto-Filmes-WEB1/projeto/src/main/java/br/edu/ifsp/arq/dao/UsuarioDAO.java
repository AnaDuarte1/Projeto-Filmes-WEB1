package br.edu.ifsp.arq.dao;

import br.edu.ifsp.arq.model.Usuario;

import java.io.*;
import java.util.*;

public class UsuarioDAO {

  private static final File dir = new File("/data");
  private static final File arq = new File(dir, "usuarios.txt");

  private List<Usuario> carregarUsuarios() {
    List<Usuario> usuarios = new ArrayList<>();

    if (!arq.exists()) {
      return usuarios;
    }

    FileReader fileReader = null;
    BufferedReader bufferedReader = null;

    try {
      fileReader = new FileReader(arq);
      bufferedReader = new BufferedReader(fileReader);

      String linha;
      while ((linha = bufferedReader.readLine()) != null) {
        if (!linha.isEmpty()) {
          String[] partes = linha.split(";");
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
    } finally {
      try {
        if (bufferedReader != null) bufferedReader.close();
        if (fileReader != null) fileReader.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
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

    if (!dir.exists()) {
      dir.mkdirs();
    }

    FileWriter fileWriter = null;
    PrintWriter printWriter = null;

    try {
      fileWriter = new FileWriter(arq, true);
      printWriter = new PrintWriter(fileWriter);

      printWriter.print(usuario.getNome() + "|");
      printWriter.print(usuario.getEmail() + "|");
      printWriter.println(usuario.getSenha());

      printWriter.flush();
      return true;

    } catch (IOException e) {
      e.printStackTrace();
      return false;

    } finally {
      if (printWriter != null) printWriter.close();
      try {
        if (fileWriter != null) fileWriter.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
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
