package br.edu.ifsp.arq.controller;

import br.edu.ifsp.arq.dao.FilmeDAO;
import br.edu.ifsp.arq.model.Filme;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/visualizar-filme")
public class VisualizarFilme extends HttpServlet {
    private static final long serialVersionUID = 1L;

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        FilmeDAO filmeDAO = FilmeDAO.getInstance();
        Gson gson = new Gson();

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Filme filme = filmeDAO.buscarPorId(id);

            if (filme == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                Map<String, String> erro = new HashMap<>();
                erro.put("status", "erro");
                erro.put("mensagem", "Filme com ID " + id + " não encontrado.");
                response.getWriter().write(gson.toJson(erro));
                return;
            }

            String jsonResponse = gson.toJson(filme);
            response.getWriter().write(jsonResponse);

        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            Map<String, String> erro = new HashMap<>();
            erro.put("status", "erro");
            erro.put("mensagem", "O ID fornecido é inválido.");
            response.getWriter().write(gson.toJson(erro));
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            Map<String, String> erro = new HashMap<>();
            erro.put("status", "erro");
            erro.put("mensagem", "Ocorreu um erro ao buscar o filme: " + e.getMessage());
            response.getWriter().write(gson.toJson(erro));
        }
    }
}
