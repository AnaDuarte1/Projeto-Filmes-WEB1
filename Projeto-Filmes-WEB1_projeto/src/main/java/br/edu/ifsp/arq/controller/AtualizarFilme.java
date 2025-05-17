package br.edu.ifsp.arq.controller;

import br.edu.ifsp.arq.dao.FilmeDAO;
import br.edu.ifsp.arq.model.Filme;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet({"/editar-filme", "/atualizar-filme"})
@MultipartConfig
public class AtualizarFilme extends HttpServlet {
    private FilmeDAO filmeDAO = new FilmeDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Filme filme = filmeDAO.buscarPorId(id);
        request.setAttribute("filme", filme);
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

        String imagemPath = null;
        Part imagemPart = request.getPart("imagem");
        if (imagemPart.getSize() > 0) { // Verifica se uma nova imagem foi enviada
            String uploadPath = getServletContext().getRealPath("") + File.separator + "imagens";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            
            String fileName = Paths.get(imagemPart.getSubmittedFileName()).getFileName().toString();
            imagemPath = uploadPath + File.separator + fileName;
            imagemPart.write(imagemPath);
            
            // Armazenar apenas o caminho relativo
            imagemPath = "imagens/" + fileName;
        } else {
            // Manter a imagem atual se nenhuma nova imagem for enviada
            Filme filmeAtual = filmeDAO.buscarPorId(id);
            imagemPath = filmeAtual.getImagem();
        }

        Filme filmeAtualizado = new Filme(titulo, diretor, anoLancamento, sinopse, idioma, formato, duracao, imagemPath, duracao);
        filmeDAO.atualizarFilme(filmeAtualizado);

        response.sendRedirect("listar-filmes");
    }
}
