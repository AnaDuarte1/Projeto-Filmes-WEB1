package br.edu.ifsp.arq.controller;
import br.edu.ifsp.arq.model.Filme;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/excluir-filme")
public class RemoverFilme extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String titulo = request.getParameter("titulo");

        List<Filme> filmes = (List<Filme>) getServletContext().getAttribute("filmes");

        if (filmes != null) {
            for (int i = 0; i < filmes.size(); i++) {
                if (filmes.get(i).getTitulo().equalsIgnoreCase(titulo)) {
                    filmes.remove(i);
                    break;
                }
            }
        }

        response.sendRedirect("listar-filmes");
    }
}
