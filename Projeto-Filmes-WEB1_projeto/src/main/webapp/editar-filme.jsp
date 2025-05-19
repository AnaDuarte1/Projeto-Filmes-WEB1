<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ page import="br.edu.ifsp.arq.model.Filme" %>
<%@ page import="br.edu.ifsp.arq.dao.FilmeDAO" %>

<%
    FilmeDAO filmeDAO = new FilmeDAO();
    int id = Integer.parseInt(request.getParameter("id"));
    Filme filme = filmeDAO.buscarPorId(id);
%>

<div class="container">
        <div class="edit-movie-container shadow">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="text-primary mb-0"><i class="fas fa-edit me-2"></i>Editar Filme</h2>
                <a href="listar-filmes" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left me-1"></i> Voltar
                </a>
            </div>
            
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show">
                    ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            
            <form action="atualizar-filme" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${filme.id}">
                
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="titulo" class="form-label">Título *</label>
                        <input type="text" class="form-control" id="titulo" name="titulo" 
                               value="${filme.titulo}" required>
                    </div>
                    <div class="col-md-6">
                        <label for="diretor" class="form-label">Diretor *</label>
                        <input type="text" class="form-control" id="diretor" name="diretor" 
                               value="${filme.diretor}" required>
                    </div>
                </div>
                
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label for="anoLancamento" class="form-label">Ano de Lançamento *</label>
                        <input type="number" class="form-control" id="anoLancamento" name="anoLancamento" 
                               value="${filme.anoLancamento}" min="1900" max="2030" required>
                    </div>
                    <div class="col-md-4">
                        <label for="duracao" class="form-label">Duração (min) *</label>
                        <input type="number" class="form-control" id="duracao" name="duracao" 
                               value="${filme.duracao}" min="1" required>
                    </div>
                    <div class="col-md-4">
                        <label for="formato" class="form-label">Formato *</label>
                        <select class="form-select" id="formato" name="formato" required>
                            <option value="Digital" ${filme.formato == 'Digital' ? 'selected' : ''}>Digital</option>
                            <option value="Blu-ray" ${filme.formato == 'Blu-ray' ? 'selected' : ''}>Blu-ray</option>
                            <option value="DVD" ${filme.formato == 'DVD' ? 'selected' : ''}>DVD</option>
                        </select>
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="idioma" class="form-label">Idioma *</label>
                    <input type="text" class="form-control" id="idioma" name="idioma" 
                           value="${filme.idioma}" required>
                </div>
                
                <div class="mb-3">
                    <label for="sinopse" class="form-label">Sinopse *</label>
                    <textarea class="form-control" id="sinopse" name="sinopse" rows="4" required>${filme.sinopse}</textarea>
                </div>
                
                <div class="mb-4">
                    <label for="imagem" class="form-label">Imagem</label>
                    <input type="file" class="form-control" id="imagem" name="imagem" accept="image/*">
                    <div class="mt-3">
                        <p class="text-muted mb-2">Imagem atual:</p>
                        <c:choose>
                            <c:when test="${not empty filme.imagem}">
                                <img src="${filme.imagem}" alt="Imagem atual" class="current-image img-thumbnail">
                            </c:when>
                            <c:otherwise>
                                <p class="text-muted">Nenhuma imagem cadastrada</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <small class="text-muted">Deixe em branco para manter a imagem atual</small>
                </div>
                
                <div class="d-flex justify-content-between">
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">
                        <i class="fas fa-trash me-1"></i> Excluir Filme
                    </button>
                    <button type="submit" class="btn btn-primary px-4">
                        <i class="fas fa-save me-1"></i> Salvar Alterações
                    </button>
                </div>
            </form>
        </div>
    </div>
    
    <!-- Modal de Confirmação de Exclusão -->
    <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title"><i class="fas fa-exclamation-triangle me-2"></i>Confirmar Exclusão</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Tem certeza que deseja excluir o filme <strong>${filme.titulo}</strong>? Esta ação não pode ser desfeita.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <a href="excluir-filme?id=${filme.id}" class="btn btn-danger">
                        <i class="fas fa-trash me-1"></i> Confirmar Exclusão
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="rodape.jsp" %>
    
    <script>
        // Validação básica do formulário
        document.querySelector('form').addEventListener('submit', function(e) {
            const ano = document.getElementById('anoLancamento').value;
            const duracao = document.getElementById('duracao').value;
            
            if (ano < 1900 || ano > new Date().getFullYear() + 5) {
                alert('Por favor, insira um ano válido');
                e.preventDefault();
            }
            
            if (duracao <= 0) {
                alert('A duração deve ser maior que zero');
                e.preventDefault();
            }
        });
    </script>


<%@ include file="footer.jsp" %>
