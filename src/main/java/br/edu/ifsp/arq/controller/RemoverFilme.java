package br.edu.ifsp.arq.controller;

import br.edu.ifsp.arq.dao.FilmeDAO;
import br.edu.ifsp.arq.model.Usuario;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/excluir-filme")
public class RemoverFilme extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession(false);
        Usuario usuarioLogado = (session != null) ? (Usuario) session.getAttribute("usuarioLogado") : null;
        
        Gson gson = new Gson();
        Map<String, String> resposta = new HashMap<>();

        if (usuarioLogado == null || !"admin".equals(usuarioLogado.getTipo())) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            resposta.put("status", "erro");
            resposta.put("mensagem", "Acesso não autorizado.");
            response.getWriter().write(gson.toJson(resposta));
            return;
        }

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean removido = FilmeDAO.getInstance().removerFilme(id);

            if (removido) {
                resposta.put("status", "sucesso");
                resposta.put("mensagem", "Filme excluído com sucesso.");
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                resposta.put("status", "erro");
                resposta.put("mensagem", "Filme não encontrado ou não pôde ser removido.");
            }

        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resposta.put("status", "erro");
            resposta.put("mensagem", "ID do filme inválido.");
        }
        
        response.getWriter().write(gson.toJson(resposta));
    }
}