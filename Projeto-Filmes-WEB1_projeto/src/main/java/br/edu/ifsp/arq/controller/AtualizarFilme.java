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
    private final FilmeDAO filmeDAO = FilmeDAO.getInstance(); // Usar Singleton

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Filme filme = filmeDAO.buscarPorId(id);
            if (filme == null) {
                response.sendRedirect("listar-filmes?error=Filme não encontrado");
                return;
            }
            request.setAttribute("filme", filme);
            request.getRequestDispatcher("/editar-filme.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("listar-filmes?error=Erro ao carregar filme");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Filme filmeAtual = filmeDAO.buscarPorId(id);
            if (filmeAtual == null) {
                response.sendRedirect("listar-filmes?error=Filme não encontrado");
                return;
            }

            // Processar upload de nova imagem se fornecida
            Part imagemPart = request.getPart("imagem");
            String imagemPath = filmeAtual.getImagem(); // Mantém a imagem atual por padrão
            
            if (imagemPart != null && imagemPart.getSize() > 0) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + "imagens";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();
                
                String fileName = Paths.get(imagemPart.getSubmittedFileName()).getFileName().toString();
                imagemPath = "imagens/" + fileName; // Caminho relativo
                imagemPart.write(uploadPath + File.separator + fileName);
            }

            // Criar filme atualizado
            Filme filmeAtualizado = new Filme(
                request.getParameter("titulo"),
                request.getParameter("diretor"),
                Integer.parseInt(request.getParameter("anoLancamento")),
                request.getParameter("sinopse"),
                request.getParameter("idioma"),
                request.getParameter("formato"),
                Integer.parseInt(request.getParameter("duracao")),
                imagemPath,
                id // Manter o mesmo ID
            );

            filmeDAO.atualizarFilme(filmeAtualizado);
            response.sendRedirect("listar-filmes");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("listar-filmes?error=Erro ao atualizar filme");
        }
    }
}