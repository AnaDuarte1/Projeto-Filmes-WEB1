package br.edu.ifsp.arq.controller;

import br.edu.ifsp.arq.dao.UsuarioDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private UsuarioDAO usuarioDAO;

    @Override
    public void init() throws ServletException {
        usuarioDAO = new UsuarioDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email"); 
        String senha = request.getParameter("senha"); 

        if (usuarioDAO.autenticar(email, senha)) {
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogado", email);
            response.sendRedirect("home.jsp");  
        } else {
            request.setAttribute("errMessage", "Email ou senha inválidos!"); 
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
