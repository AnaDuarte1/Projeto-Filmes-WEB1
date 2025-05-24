package br.edu.ifsp.arq.controller;

import br.edu.ifsp.arq.dao.FilmeDAO;
import br.edu.ifsp.arq.model.Filme;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/visualizar-filme")
public class VisualizarFilme extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            
            FilmeDAO filmeDAO = FilmeDAO.getInstance();
            Filme filme = filmeDAO.buscarPorId(id);
            
            if (filme == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Filme não encontrado");
                return;
            }
            
            request.setAttribute("filme", filme);
            request.getRequestDispatcher("/visualizar-filme.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID inválido");
        }
    }
}
