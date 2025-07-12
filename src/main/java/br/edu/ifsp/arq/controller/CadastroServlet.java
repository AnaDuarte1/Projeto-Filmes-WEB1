    package br.edu.ifsp.arq.controller;

    import br.edu.ifsp.arq.dao.UsuarioDAO;
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

    @WebServlet("/cadastrar")
    public class CadastroServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;
        private UsuarioDAO usuarioDAO;

        // Adicionar o construtor para inicializar usuarioDAO
        public CadastroServlet() {
            super();
            this.usuarioDAO = new UsuarioDAO();
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            // Por padrão, novos usuários são do tipo "comum".
            String tipo = "comum"; 

            Gson gson = new Gson();
            Map<String, String> resposta = new HashMap<>();

            // Verifica se o email já existe ANTES de tentar salvar.
            if (usuarioDAO.buscarPorEmail(email) != null) {
                response.setStatus(HttpServletResponse.SC_CONFLICT); // 409 Conflict
                resposta.put("status", "erro");
                resposta.put("mensagem", "Erro: este e-mail já está em uso!");
            } else {
                // Usa o construtor de Usuario que não requer um ID.
                // O DAO será responsável por atribuir o ID ao novo usuário.
                Usuario novoUsuario = new Usuario(nome, email, senha, tipo);
                
                // Usa o método correto para adicionar, que é 'adicionar'.
                boolean adicionado = usuarioDAO.adicionar(novoUsuario); // Captura o retorno booleano

                if (adicionado) {
                    resposta.put("status", "sucesso");
                    resposta.put("mensagem", "Usuário cadastrado com sucesso! Faça o login.");
                } else {
                    // Caso o adicionar retorne false por algum motivo inesperado (embora a verificação já seja feita antes)
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    resposta.put("status", "erro");
                    resposta.put("mensagem", "Erro interno ao cadastrar usuário.");
                }
            }
            
            response.getWriter().write(gson.toJson(resposta));
        }
    }
    