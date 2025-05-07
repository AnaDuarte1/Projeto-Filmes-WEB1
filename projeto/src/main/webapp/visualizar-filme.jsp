<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<div class="container mt-5">
    <h1 class="text-center">Detalhes do Filme</h1>

    <div class="card mb-3">
        <div class="card-header bg-primary text-white">
            <h3>${filme.titulo}</h3>
        </div>
        <div class="card-body">
            <table class="table table-striped">
                <tr>
                    <th>Diretor</th>
                    <td>${filme.diretor}</td>
                </tr>
                <tr>
                    <th>Ano de Lançamento</th>
                    <td>${filme.anoLancamento}</td>
                </tr>
                <tr>
                    <th>Sinopse</th>
                    <td>${filme.sinopse}</td>
                </tr>
                <tr>
                    <th>Idioma</th>
                    <td>${filme.idioma}</td>
                </tr>
                <tr>
                    <th>Formato</th>
                    <td>${filme.formato}</td>
                </tr>
                <tr>
                    <th>Duração</th>
                    <td>${filme.duracao} minutos</td>
                </tr>
            </table>
        </div>
        <div class="card-footer text-center">
            <a href="listar-filmes" class="btn btn-secondary">Voltar para a lista de filmes</a>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
