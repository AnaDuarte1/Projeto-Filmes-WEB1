<%@ include file="header.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.ifsp.arq.model.Filme" %>

<%@ include file="styles/resultado-busca.jsp" %>
 
    <main class="container mt-4">
            <h3>Resultados da Busca</h3>
        <div class="row">
            <c:if test="${not empty filmes}">
                <c:forEach var="filme" items="${filmes}">
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <img src="${filme.imagem}" class="card-img-top" alt="${filme.titulo}">
                            <div class="card-body">
                                <h5 class="card-title">${filme.titulo}</h5>
                                <p class="card-text">Diretor: ${filme.diretor}</p>
                                <p class="card-text">Ano de Lançamento: ${filme.anoLancamento}</p>
                                <p class="card-text">Sinopse: ${filme.sinopse}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty filmes}">
                <div class="col-12">
                    <h2>Nenhum filme encontrado para a sua busca.</h2>
                </div>
            </c:if>
        </div>
    </main>

<%@ include file="footer.jsp" %>
