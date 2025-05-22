<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<div class="container mt-4">
    <h2 class="mb-4">${tituloPagina}</h2>
    
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>
    
    <a href="cadastrar.jsp" class="btn btn-primary mb-3">
        <i class="fas fa-plus"></i> Adicionar Novo Filme
    </a>
    
    <div class="table-responsive">
        <c:choose>
            <c:when test="${empty filmes}">
                <div class="alert alert-info">Nenhum filme cadastrado ainda.</div>
            </c:when>
            <c:otherwise>
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Poster</th>
                            <th>Título</th>
                            <th>Categoria</th>
                            <th>Diretor</th>
                            <th>Ano</th>
                            <th>Duração</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${filmes}" var="filme">
                            <tr>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty filme.imagem}">
                                            <img src="${pageContext.request.contextPath}/${filme.imagem}" 
                                                 alt="${filme.titulo}" 
                                                 class="img-thumbnail" 
                                                 style="width: 50px; height: auto;">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="no-image-placeholder" style="width:50px; height:75px; background:#eee; display:flex; align-items:center; justify-content:center;">
                                                <i class="fas fa-film text-muted"></i>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${filme.titulo}</td>
                                <td>${filme.categoria}</td>
                                <td>${filme.diretor}</td>
                                <td>${filme.anoLancamento}</td>
                                <td>${filme.duracao} min</td>
                                <td>
                                    <div class="btn-group btn-group-sm" role="group">
                                        <a href="visualizar-filme?id=${filme.id}" 
                                           class="btn btn-info" title="Ver detalhes">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="editar-filme?id=${filme.id}" 
                                           class="btn btn-warning" title="Editar">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="excluir-filme?id=${filme.id}" 
                                           class="btn btn-danger" title="Excluir"
                                           onclick="return confirm('Tem certeza que deseja excluir o filme ${filme.titulo}?')">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<%@ include file="footer.jsp" %>