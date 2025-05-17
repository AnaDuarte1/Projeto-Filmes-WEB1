package br.edu.ifsp.arq.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtém a sessão atual
        HttpSession session = request.getSession(false);
        
        // Verifica se a sessão não é nula
        if (session != null) {
            // Invalida a sessão
            session.invalidate();
        }
        
        // Redireciona para a página de login ou página inicial
        response.sendRedirect("login.jsp");
    }
}
