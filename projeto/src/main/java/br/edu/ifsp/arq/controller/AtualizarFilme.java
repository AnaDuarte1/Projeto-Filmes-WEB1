package br.edu.ifsp.arq.controller;
import br.edu.ifsp.arq.model.Filme;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet({"/editar-filme", "/atualizar-filme"})
public class AtualizarFilme extends HttpServlet  {
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
	        
	        request.getRequestDispatcher("/editar-filme.jsp").forward(request, response);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        
	        int id = Integer.parseInt(request.getParameter("id"));
	        String titulo = request.getParameter("titulo");
	        String diretor = request.getParameter("diretor");
	        int anoLancamento = Integer.parseInt(request.getParameter("anoLancamento"));
	        String sinopse = request.getParameter("sinopse");
	        String idioma = request.getParameter("idioma");
	        String formato = request.getParameter("formato");
	        int duracao = Integer.parseInt(request.getParameter("duracao"));

	        List<Filme> filmes = (List<Filme>) getServletContext().getAttribute("filmes");
	        
	        for (Filme filme : filmes) {
	            if (filme.getId() == id) {
	                filme.setTitulo(titulo);
	                filme.setDiretor(diretor);
	                filme.setAnoLancamento(anoLancamento);
	                filme.setSinopse(sinopse);
	                filme.setIdioma(idioma);
	                filme.setFormato(formato);
	                filme.setDuracao(duracao);
	                break;
	            }
	        }

	        response.sendRedirect("listar-filmes");
	    }
}
