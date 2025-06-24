package br.edu.ifsp.arq.controller;

import br.edu.ifsp.arq.dao.FilmeDAO;
import br.edu.ifsp.arq.model.Filme;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/excluir-filme")
public class RemoverFilme extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final FilmeDAO filmeDAO = FilmeDAO.getInstance();

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Map<String, String> resposta = new HashMap<>();
        Gson gson = new Gson();

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            
            Filme filme = filmeDAO.buscarPorId(id);
            
            if (filme == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                resposta.put("status", "erro");
                resposta.put("mensagem", "Filme com ID " + id + " não encontrado.");
                response.getWriter().write(gson.toJson(resposta));
                return;
            }

            if (filme.getImagem() != null && !filme.getImagem().isEmpty()) {
                String uploadPath = getServletContext().getRealPath("");
                File imagemFile = new File(uploadPath, filme.getImagem());
                if (imagemFile.exists()) {
                    imagemFile.delete();
                }
            }
            
            boolean removido = filmeDAO.removerFilme(id);

            if (removido) {
                resposta.put("status", "sucesso");
                resposta.put("mensagem", "Filme '" + filme.getTitulo() + "' excluído com sucesso.");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                resposta.put("status", "erro");
                resposta.put("mensagem", "Não foi possível excluir o filme.");
            }

        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resposta.put("status", "erro");
            resposta.put("mensagem", "ID do filme inválido.");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resposta.put("status", "erro");
            resposta.put("mensagem", "Erro ao excluir filme: " + e.getMessage());
        } finally {
            response.getWriter().write(gson.toJson(resposta));
        }
    }
}
