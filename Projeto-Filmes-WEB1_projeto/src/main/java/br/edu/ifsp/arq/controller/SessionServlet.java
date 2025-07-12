package br.edu.ifsp.arq.controller;

import br.edu.ifsp.arq.model.Usuario;
import com.google.gson.Gson;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/session-status")
public class SessionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false); // Não cria uma nova sessão

        // Verifica se a sessão existe e se há um usuário logado nela
        if (session != null && session.getAttribute("usuarioLogado") != null) {
            Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");

            // Usa a biblioteca Gson para converter o objeto Usuario para JSON
            // Isso vai incluir o campo "tipo" se ele existir na sua classe Usuario
            String jsonResponse = new Gson().toJson(usuario);
            response.getWriter().write(jsonResponse);

        } else {
            // Se não houver usuário logado, retorna um JSON nulo, que o JavaScript entenderá como "deslogado"
            response.getWriter().write("null");
        }
    }
}