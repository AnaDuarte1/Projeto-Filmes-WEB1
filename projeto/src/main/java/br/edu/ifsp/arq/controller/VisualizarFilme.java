package br.edu.ifsp.arq.controller;
import br.edu.ifsp.arq.model.Filme;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/visualizar-filme")
public class VisualizarFilme {
	public class VisualizarFilmeServlet extends HttpServlet {

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        
	        int id = Integer.parseInt(request.getParameter("id"));
	        
	        List<Filme> filmes = (List<Filme>) getServletContext().getAttribute("filmes");
	        
	        Filme filmeSelecionado = null;
	        
	        for (Filme filme : filmes) {
	            if (filme.getId() == id) {
	                filmeSelecionado = filme;
	                break;
	            }
	        }

	        request.setAttribute("filme", filmeSelecionado);
	        
	        request.getRequestDispatcher("/visualizar-filme.jsp").forward(request, response);
	    }
	}

}
