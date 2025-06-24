package br.edu.ifsp.arq.controller;

import br.edu.ifsp.arq.dao.FilmeDAO;
import br.edu.ifsp.arq.model.Filme;
import com.google.gson.Gson;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

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
    private static final long serialVersionUID = 1L;
    private final FilmeDAO filmeDAO = FilmeDAO.getInstance();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Filme filme = filmeDAO.buscarPorId(id);

            if (filme == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                Map<String, String> erro = new HashMap<>();
                erro.put("status", "erro");
                erro.put("mensagem", "Filme não encontrado");
                response.getWriter().write(gson.toJson(erro));
                return;
            }
            response.getWriter().write(gson.toJson(filme));

        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            Map<String, String> erro = new HashMap<>();
            erro.put("status", "erro");
            erro.put("mensagem", "ID inválido fornecido.");
            response.getWriter().write(gson.toJson(erro));
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            Map<String, String> erro = new HashMap<>();
            erro.put("status", "erro");
            erro.put("mensagem", "Erro ao buscar filme: " + e.getMessage());
            response.getWriter().write(gson.toJson(erro));
            e.printStackTrace();
        }
    }

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Map<String, String> resposta = new HashMap<>();
        Gson gson = new Gson();

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Filme filmeAtual = filmeDAO.buscarPorId(id);

            if (filmeAtual == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                resposta.put("status", "erro");
                resposta.put("mensagem", "Filme não encontrado para atualização.");
                response.getWriter().write(gson.toJson(resposta));
                return;
            }

            String imagemPath = filmeAtual.getImagem(); 
            Part imagemPart = request.getPart("imagem");
            
            if (imagemPart != null && imagemPart.getSize() > 0) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + "imagens";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();

                String fileName = Paths.get(imagemPart.getSubmittedFileName()).getFileName().toString();
                imagemPath = "imagens/" + fileName; 
                imagemPart.write(uploadPath + File.separator + fileName);
            }

            Filme filmeAtualizado = new Filme(
                request.getParameter("titulo"),
                request.getParameter("diretor"),
                Integer.parseInt(request.getParameter("anoLancamento")),
                request.getParameter("sinopse"),
                request.getParameter("idioma"),
                request.getParameter("formato"),
                request.getParameter("categoria"),
                Integer.parseInt(request.getParameter("duracao")),
                imagemPath,
                id 
            );

            filmeDAO.atualizarFilme(filmeAtualizado);
            
            resposta.put("status", "sucesso");
            resposta.put("mensagem", "Filme '" + filmeAtualizado.getTitulo() + "' atualizado com sucesso!");

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resposta.put("status", "erro");
            resposta.put("mensagem", "Erro ao atualizar filme: " + e.getMessage());
        } finally {
            response.getWriter().write(gson.toJson(resposta));
        }
    }
}
