package br.edu.ifsp.arq.controller;
import br.edu.ifsp.arq.dao.FilmeDAO;
import br.edu.ifsp.arq.model.Filme;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
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
    private FilmeDAO filmeDAO = FilmeDAO.getInstance(); // Usando o singleton

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            // Obter parâmetros do formulário
            String titulo = request.getParameter("titulo");
            String diretor = request.getParameter("diretor");
            String sinopse = request.getParameter("sinopse");
            String idioma = request.getParameter("idioma");
            String formato = request.getParameter("formato");
            
            // Converter parâmetros numéricos com validação
            int anoLancamento = 0;
            try {
                anoLancamento = Integer.parseInt(request.getParameter("anoLancamento"));
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Ano de lançamento inválido");
                request.getRequestDispatcher("/adicionar.jsp").forward(request, response);
                return;
            }
            
            int duracao = 0;
            try {
                duracao = Integer.parseInt(request.getParameter("duracao"));
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Duração inválida");
                request.getRequestDispatcher("/adicionar.jsp").forward(request, response);
                return;
            }

            // Processar a imagem
            Part imagemPart = request.getPart("imagem");
            String imagemPath = null;
            
            if (imagemPart != null && imagemPart.getSize() > 0) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();
                
                String fileName = Paths.get(imagemPart.getSubmittedFileName()).getFileName().toString();
                imagemPath = uploadPath + File.separator + fileName;
                imagemPart.write(imagemPath);
                
                // Armazenar apenas o caminho relativo
                imagemPath = "uploads/" + fileName;
            }

            Filme novoFilme = new Filme(titulo, diretor, anoLancamento, sinopse, idioma, formato, duracao, imagemPath);
            novoFilme.setTitulo(titulo);
            novoFilme.setDiretor(diretor);
            novoFilme.setSinopse(sinopse);
            novoFilme.setAnoLancamento(anoLancamento);
            novoFilme.setIdioma(idioma);
            novoFilme.setFormato(formato);
            novoFilme.setDuracao(duracao);
            novoFilme.setImagem(imagemPath);

            // Adicionar ao DAO
            filmeDAO.adicionarFilme(novoFilme);

            response.sendRedirect(request.getContextPath() + "/visualizar-filme.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Erro ao processar o formulário: " + e.getMessage());
            request.getRequestDispatcher("/adicionar.jsp").forward(request, response);
        }
    }
}