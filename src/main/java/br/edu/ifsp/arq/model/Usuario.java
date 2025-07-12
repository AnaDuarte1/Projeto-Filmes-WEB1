package br.edu.ifsp.arq.model;

import java.io.Serializable;

public class Usuario implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private int id; 
   
    private String nome;
    private String email;
    private String senha;
    private String tipo;


    /**
     * CONSTRUTOR 1: Para criar um novo usuário.
     * Usado pelo CadastroServlet. O ID será definido posteriormente pelo DAO.
     */
    public Usuario(String nome, String email, String senha, String tipo) {
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.tipo = tipo;
    }

    /**
     * CONSTRUTOR 2: Para carregar um usuário existente do arquivo.
     * Usado pelo UsuarioDAO ao ler o arquivo usuarios.txt.
     */
    public Usuario(int id, String nome, String email, String senha, String tipo) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.tipo = tipo;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}