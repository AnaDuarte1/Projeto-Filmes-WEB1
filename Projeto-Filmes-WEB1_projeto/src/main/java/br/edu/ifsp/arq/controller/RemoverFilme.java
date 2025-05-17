package br.edu.ifsp.arq.controller;

import br.edu.ifsp.arq.dao.FilmeDAO;
import br.edu.ifsp.arq.model.Filme;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/excluir-filme")
public class RemoverFilme extends HttpServlet {
    private FilmeDAO filmeDAO = new FilmeDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Filme filme = filmeDAO.buscarPorId(id);
        
        // Remover a imagem do servidor, se necessário
        File imagemFile = new File(filme.getImagem());
        if (imagemFile.exists()) {
            imagemFile.delete(); // Deletar a imagem do servidor
        }

        filmeDAO.removerFilme(id);
        response.sendRedirect("listar-filmes");
    }
}
