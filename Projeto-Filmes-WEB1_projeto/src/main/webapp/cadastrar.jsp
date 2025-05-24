<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty error}">
    <div class="alert alert-danger">
        ${error}
    </div>
</c:if>
<%@ include file="header.jsp" %>

<%@ include file="styles/cadastrar.jsp" %>

  
<div class="container">
    <div class="form-container">
        <h1 class="form-title">🎬 Adicionar Novo Filme</h1>

        <form action="criar-filme" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="adicionar">

            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="titulo">Título</label>
                    <input type="text" class="form-control" id="titulo" name="titulo" required>
                </div>
                <div class="col-md-6">
                    <label for="diretor">Diretor</label>
                    <input type="text" class="form-control" id="diretor" name="diretor" required>
                </div>
            </div>

            <div class="mb-3">
                <label for="sinopse">Sinopse</label>
                <textarea class="form-control" id="sinopse" name="sinopse" rows="3" required></textarea>
            </div>

            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="anoLancamento">Ano de Lançamento</label>
                    <input type="number" class="form-control" id="anoLancamento" name="anoLancamento" min="1900" max="2025" required>
                </div>
                <div class="col-md-4">
                    <label for="idioma">Idioma</label>
                    <input type="text" class="form-control" id="idioma" name="idioma" required>
                </div>
                <div class="col-md-4">
                    <label for="duracao">Duração (minutos)</label>
                    <input type="number" class="form-control" id="duracao" name="duracao" min="1" required>
                </div>
            </div>

            <div class="mb-3">
                <label for="formato">Formato</label>
                <select class="form-select" id="formato" name="formato" required>
                    <option value="" selected disabled>Selecione...</option>
                    <option value="DVD">DVD</option>
                    <option value="Blu-ray">Blu-ray</option>
                    <option value="Digital">Digital</option>
                    <option value="Outro">Outro</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="categoria">Categoria</label>
                <select class="form-select" id="categoria" name="categoria" required>
                    <option value="" selected disabled>Selecione...</option>
                    <option value="Acao">Ação</option>
                    <option value="Aventura">Aventura</option>
                    <option value="Drama">Drama</option>
                    <option value="Comedia">Comédia</option>
                    <option value="Ficcao Cientifica">Ficção Científica</option>
                    <option value="Terror">Terror</option>
                    <option value="Romance">Romance</option>
                    <option value="Documentario">Documentário</option>
                </select>
            </div>

            <div class="mb-4">
                <label for="imagem">Capa do Filme</label>
                <input class="form-control" type="file" id="imagem" name="imagem" accept="image/*">
            </div>

            <div class="d-flex justify-content-end gap-2">
                <a href="<c:url value='/filme?action=listar'/>" class="btn btn-secondary">Cancelar</a>
                <button type="submit" class="btn btn-primary">Adicionar Filme</button>
            </div>
        </form>
    </div>
</div>

   <%@ include file="footer.jsp" %>
