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

@WebServlet("/criar-filme")
@MultipartConfig
public class AdicionarFilme extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private final FilmeDAO filmeDAO = FilmeDAO.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            Part imagemPart = request.getPart("imagem");
            String imagemPath = null;
            
            if (imagemPart != null && imagemPart.getSize() > 0) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + "imagens";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();
                
                String fileName = Paths.get(imagemPart.getSubmittedFileName()).getFileName().toString();
                imagemPath = "imagens/" + fileName; 
                imagemPart.write(uploadPath + File.separator + fileName);
            }

            Filme novoFilme = new Filme(
                request.getParameter("titulo"),
                request.getParameter("diretor"),
                Integer.parseInt(request.getParameter("anoLancamento")),
                request.getParameter("sinopse"),
                request.getParameter("idioma"),
                request.getParameter("formato"),
                request.getParameter("categoria"),
                Integer.parseInt(request.getParameter("duracao")),
                imagemPath,
                0 
            );

            filmeDAO.adicionarFilme(novoFilme);
            response.sendRedirect("listar-filmes");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Erro ao adicionar filme: " + e.getMessage());
            request.getRequestDispatcher("/cadastrar.jsp").forward(request, response);
        }
    }
}