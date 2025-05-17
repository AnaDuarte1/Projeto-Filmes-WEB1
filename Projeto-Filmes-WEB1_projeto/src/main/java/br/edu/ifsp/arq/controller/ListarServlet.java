package br.edu.ifsp.arq.controller;

import br.edu.ifsp.arq.dao.FilmeDAO;
import br.edu.ifsp.arq.model.Filme;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/listar-filmes")
public class ListarServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtém a lista de filmes do DAO
        FilmeDAO filmeDAO = FilmeDAO.getInstance();
        List<Filme> filmes = filmeDAO.carregarFilmes(); // Corrigido para chamar o método correto

        // Define a lista de filmes como atributo da requisição
        request.setAttribute("filmes", filmes);

        // Redireciona para a página listar-filmes.jsp
        request.getRequestDispatcher("listar-filmes.jsp").forward(request, response);
    }
}
