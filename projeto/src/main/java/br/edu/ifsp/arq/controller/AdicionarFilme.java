package br.edu.ifsp.arq.controller;
import br.edu.ifsp.arq.model.Filme;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/criar-filme")
public class AdicionarFilme extends HttpServlet{
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

        Filme novoFilme = new Filme(id,titulo, diretor, anoLancamento, sinopse, idioma, formato, duracao);

        List<Filme> filmes = (List<Filme>) getServletContext().getAttribute("filmes");

        if (filmes == null) {
            filmes = new ArrayList<>();
        }

        filmes.add(novoFilme);

        getServletContext().setAttribute("filmes", filmes);

        response.sendRedirect("listar-filmes");
    }
}
