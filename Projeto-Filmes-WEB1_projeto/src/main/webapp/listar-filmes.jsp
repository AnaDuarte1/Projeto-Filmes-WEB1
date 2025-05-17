<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="br.edu.ifsp.arq.model.Filme" %>
<%@ page import="br.edu.ifsp.arq.dao.FilmeDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>

<div class="container">
    <h1>Lista de Filmes</h1>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Título</th>
                <th>Diretor</th>
                <th>Ano de Lançamento</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${not empty filmes}">
                <c:forEach var="filme" items="${filmes}">
                    <tr>
                        <td>${filme.titulo}</td>
                        <td>${filme.diretor}</td>
                        <td>${filme.anoLancamento}</td>
                        <td>
                            <a href="visualizar-filme?id=${filme.id}" class="btn btn-info" aria-label="Visualizar filme ${filme.titulo}">Visualizar</a>
                            <a href="editar-filme?id=${filme.id}" class="btn btn-warning" aria-label="Editar filme ${filme.titulo}">Editar</a>
                            <a href="excluir-filme?id=${filme.id}" class="btn btn-danger" onclick="return confirm('Tem certeza que deseja excluir este filme?');" aria-label="Excluir filme ${filme.titulo}">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty filmes}">
                <tr>
                    <td colspan="4" class="text-center">Nenhum filme encontrado.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    <a href="cadastrar.jsp" class="btn btn-success">Adicionar Novo Filme</a>
</div>

<%@ include file="footer.jsp" %>