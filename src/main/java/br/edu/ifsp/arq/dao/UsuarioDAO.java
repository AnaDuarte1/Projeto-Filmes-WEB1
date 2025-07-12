    package br.edu.ifsp.arq.dao;

    import br.edu.ifsp.arq.model.Usuario;
    import java.io.*;
    import java.nio.charset.StandardCharsets; // Importar para UTF-8
    import java.util.ArrayList;
    import java.util.List;
    import java.util.concurrent.atomic.AtomicInteger;
    import java.util.stream.Collectors; // Importar para Collectors

    public class UsuarioDAO {
        private static final File dir = new File("C:\\Projeto-Filmes-WEB1\\Projeto-Filmes-WEB1_projeto\\src\\main\\webapp\\dados");
        private static final File arq = new File(dir, "usuarios.txt");
        
        private List<Usuario> usuarios; // Lista de usuários em memória
        private AtomicInteger proximoId;

        public UsuarioDAO() {
            this.usuarios = new ArrayList<>();
            this.proximoId = new AtomicInteger(1);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            carregarUsuarios(); // Carrega usuários na inicialização
        }

        private void carregarUsuarios() {
            if (!arq.exists()) {
                try {
                    arq.createNewFile();
                    // Adicionar um usuário admin padrão na primeira execução
                    // Usar o método 'adicionar' para garantir que o ID seja gerado e salvo corretamente
                    adicionar(new Usuario("Admin", "admin@cineweb.com", "admin123", "admin"));
                    return; // Sai após criar o arquivo e adicionar o admin
                } catch (IOException e) {
                    e.printStackTrace();
                    return;
                }
            }

            try (BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(arq), StandardCharsets.UTF_8))) {
                String linha;
                int maxId = 0;
                usuarios.clear(); // Limpa a lista antes de carregar para evitar duplicatas
                while ((linha = reader.readLine()) != null) {
                    if (!linha.trim().isEmpty()) {
                        String[] partes = linha.split("\\|");
                        if (partes.length == 4 || partes.length == 5) { // Ajuste para compatibilidade com o formato antigo (sem ID) ou novo (com ID)
                            int id;
                            String nome, email, senha, tipo;
                            if (partes.length == 5) { // Formato com ID
                                id = Integer.parseInt(partes[0]);
                                nome = partes[1];
                                email = partes[2];
                                senha = partes[3];
                                tipo = partes[4];
                            } else { 
                                id = proximoId.getAndIncrement(); // Atribui um novo ID se não houver
                                nome = partes[0];
                                email = partes[1];
                                senha = partes[2];
                                tipo = partes[3];
                            }
                            Usuario u = new Usuario(id, nome, email, senha, tipo);
                            usuarios.add(u);
                            if (id > maxId) {
                                maxId = id;
                            }
                        }
                    }
                }
                proximoId.set(maxId + 1); // Garante que o próximo ID seja maior que o maior ID existente
            } catch (IOException | NumberFormatException e) {
                e.printStackTrace();
            }
        }

        private void salvarTodosUsuarios() {
            try (PrintWriter writer = new PrintWriter(new OutputStreamWriter(new FileOutputStream(arq, false), StandardCharsets.UTF_8))) {
                for (Usuario u : usuarios) {
                    writer.println(u.getId() + "|" + u.getNome() + "|" + u.getEmail() + "|" + u.getSenha() + "|" + u.getTipo());
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        public boolean adicionar(Usuario usuario) {
            if (usuarios.stream().anyMatch(u -> u.getEmail().equalsIgnoreCase(usuario.getEmail()))) {
                return false; // Usuário com este email já existe
            }
            usuario.setId(proximoId.getAndIncrement()); 
            usuarios.add(usuario); 
            salvarTodosUsuarios(); 
            return true;
        }

        public Usuario autenticar(String email, String senha) {
            return usuarios.stream()
                           .filter(u -> u.getEmail().equals(email) && u.getSenha().equals(senha))
                           .findFirst()
                           .orElse(null);
        }
        
        public Usuario buscarPorEmail(String email) {
            return usuarios.stream()
                           .filter(u -> u.getEmail().equalsIgnoreCase(email))
                           .findFirst()
                           .orElse(null);
        }

        public Usuario buscarPorId(int id) {
            return usuarios.stream()
                           .filter(u -> u.getId() == id)
                           .findFirst()
                           .orElse(null);
        }
    }
    