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

@WebServlet("/buscar-filme")
public class BuscarFilme extends HttpServlet {
    private final FilmeDAO filmeDAO;

    public BuscarFilme() {
        this.filmeDAO = FilmeDAO.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String palavraChave = request.getParameter("palavraChave");
        List<Filme> filmesEncontrados = filmeDAO.buscarFilmesPorPalavraChave(palavraChave);

        request.setAttribute("filmes", filmesEncontrados);
        request.setAttribute("tituloPagina", "Resultados da Busca");
        request.getRequestDispatcher("/resultado-busca.jsp").forward(request, response);
    }
}
