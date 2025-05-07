<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<div class="container mt-5">
    <h1 class="text-center">Editar Filme</h1>

    <form action="atualizar-filme" method="POST">
        <input type="hidden" name="id" value="${filme.id}">
        
        <div class="form-group">
            <label for="titulo">Título</label>
            <input type="text" class="form-control" id="titulo" name="titulo" value="${filme.titulo}" required>
        </div>

        <div class="form-group">
            <label for="diretor">Diretor</label>
            <input type="text" class="form-control" id="diretor" name="diretor" value="${filme.diretor}" required>
        </div>

        <div class="form-group">
            <label for="anoLancamento">Ano de Lançamento</label>
            <input type="number" class="form-control" id="anoLancamento" name="anoLancamento" value="${filme.anoLancamento}" required>
        </div>

        <div class="form-group">
            <label for="sinopse">Sinopse</label>
            <textarea class="form-control" id="sinopse" name="sinopse" rows="4" required>${filme.sinopse}</textarea>
        </div>

        <div class="form-group">
            <label for="idioma">Idioma</label>
            <input type="text" class="form-control" id="idioma" name="idioma" value="${filme.idioma}" required>
        </div>

        <div class="form-group">
            <label for="formato">Formato</label>
            <input type="text" class="form-control" id="formato" name="formato" value="${filme.formato}" required>
        </div>

        <div class="form-group">
            <label for="duracao">Duração (em minutos)</label>
            <input type="number" class="form-control" id="duracao" name="duracao" value="${filme.duracao}" required>
        </div>

        <button type="submit" class="btn btn-primary">Salvar Alterações</button>
    </form>
</div>

<%@ include file="footer.jsp" %>
