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
@MultipartConfig
public class AdicionarFilme extends HttpServlet {
    private FilmeDAO filmeDAO = new FilmeDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
        int id = Integer.parseInt(request.getParameter("id"));
        String titulo = request.getParameter("titulo");
        String diretor = request.getParameter("diretor");
        int anoLancamento = Integer.parseInt(request.getParameter("anoLancamento"));
        String sinopse = request.getParameter("sinopse");
        String idioma = request.getParameter("idioma");
        String formato = request.getParameter("formato");
        int duracao = Integer.parseInt(request.getParameter("duracao"));

        // Processar o upload da imagem
        Part imagemPart = request.getPart("imagem");
        String imagemPath = "../imagem" + imagemPart.getSubmittedFileName();
        imagemPart.write(imagemPath);

        Filme novoFilme = new Filme(id, titulo, diretor, anoLancamento, sinopse, idioma, formato, duracao, imagemPath);
        filmeDAO.addFilme(novoFilme);

        response.sendRedirect("listar-filmes");
    }
}
