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
    private final FilmeDAO filmeDAO;
    
    public ListarServlet() {
        this.filmeDAO = FilmeDAO.getInstance(); 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            List<Filme> filmes = filmeDAO.getFilmes();
            
            request.setAttribute("filmes", filmes);
            request.setAttribute("tituloPagina", "Lista de Filmes");
            
            request.getRequestDispatcher("/listar-filmes.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.err.println("[ERRO] ListarServlet: " + e.getMessage());
            e.printStackTrace();
            
            request.setAttribute("errorMessage", 
                "Erro ao carregar filmes. Detalhes: " + e.getMessage());
            request.getRequestDispatcher("/listar-filmes.jsp").forward(request, response);
        }
    }
}