    package br.edu.ifsp.arq.controller;

    import br.edu.ifsp.arq.dao.FilmeDAO;
    import br.edu.ifsp.arq.dao.UsuarioDAO; // Importar UsuarioDAO
    import br.edu.ifsp.arq.model.Comentario;
    import br.edu.ifsp.arq.model.Usuario;
    import com.google.gson.Gson;
    import javax.servlet.ServletException;
    import javax.servlet.annotation.WebServlet;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    import javax.servlet.http.HttpSession;
    import java.io.IOException;
    import java.util.HashMap;
    import java.util.Map;

    @WebServlet("/adicionar-comentario")
    public class AdicionarComentario extends HttpServlet {
        private static final long serialVersionUID = 1L;
        private FilmeDAO filmeDAO;
        private UsuarioDAO usuarioDAO; // Adicionar instância de UsuarioDAO

        public AdicionarComentario() {
            super();
            this.filmeDAO = FilmeDAO.getInstance();
            this.usuarioDAO = new UsuarioDAO(); // Inicializar UsuarioDAO
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        	request.setCharacterEncoding("UTF-8");
            response.setContentType("application/json");
            
            HttpSession session = request.getSession(false);
            Usuario usuarioLogado = (session != null) ? (Usuario) session.getAttribute("usuarioLogado") : null;

            Map<String, String> resposta = new HashMap<>();
            Gson gson = new Gson();

            if (usuarioLogado == null) {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                resposta.put("status", "erro");
                resposta.put("mensagem", "Você precisa estar logado para comentar.");
                response.getWriter().write(gson.toJson(resposta));
                return;
            }

            try {
                int filmeId = Integer.parseInt(request.getParameter("filmeId"));
                String texto = request.getParameter("texto");
                int nota = Integer.parseInt(request.getParameter("nota"));

                Comentario comentario = new Comentario(texto, nota, usuarioLogado);
                
                // Carregar comentários do FilmeDAO, passando o UsuarioDAO
                filmeDAO.carregarComentarios(usuarioDAO); 
                filmeDAO.adicionarComentario(filmeId, comentario);

                resposta.put("status", "sucesso");
                resposta.put("mensagem", "Comentário adicionado com sucesso!");
                response.getWriter().write(gson.toJson(resposta));

            } catch (Exception e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                resposta.put("status", "erro");
                resposta.put("mensagem", "Erro ao processar seu comentário: " + e.getMessage());
                response.getWriter().write(gson.toJson(resposta));
            }
        }
    }
    