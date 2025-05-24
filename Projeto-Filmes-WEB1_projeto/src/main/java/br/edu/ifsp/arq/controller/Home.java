package br.edu.ifsp.arq.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifsp.arq.dao.FilmeDAO;
import br.edu.ifsp.arq.model.Filme;

@WebServlet("/home")
public class Home extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        FilmeDAO filmeDAO = FilmeDAO.getInstance();
        List<Filme> filmes = filmeDAO.getFilmes();
        
        // Log para depuração
        System.out.println("HomeServlet: Encontrados " + filmes.size() + " filmes");
        
        request.setAttribute("filmes", filmes);
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }
}