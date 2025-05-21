package br.edu.ifsp.arq.controller;

import br.edu.ifsp.arq.dao.FilmeDAO;
import br.edu.ifsp.arq.model.Filme;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/excluir-filme")
public class RemoverFilme extends HttpServlet {
    private final FilmeDAO filmeDAO = FilmeDAO.getInstance(); // Usar Singleton

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            
            // Opcional: ainda pode remover a imagem se quiser manter essa funcionalidade
            Filme filme = filmeDAO.buscarPorId(id);
            if (filme != null && filme.getImagem() != null) {
                String uploadPath = getServletContext().getRealPath("");
                File imagemFile = new File(uploadPath, filme.getImagem());
                if (imagemFile.exists()) {
                    imagemFile.delete();
                }
            }

            filmeDAO.removerFilme(id);
            response.sendRedirect("listar-filmes");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("listar-filmes?error=Erro ao excluir filme");
        }
    }
}