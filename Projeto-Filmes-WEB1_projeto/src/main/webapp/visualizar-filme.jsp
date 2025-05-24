<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ page import="br.edu.ifsp.arq.model.Filme" %>
<%@ page import="br.edu.ifsp.arq.dao.FilmeDAO" %>

<div class="container my-5">
    <div class="card shadow-lg border-0 rounded-4">
        <div class="row g-0">
            <div class="col-md-4 d-flex align-items-center justify-content-center p-4">
                <c:choose>
                    <c:when test="${not empty filme.imagem}">
                        <img src="${filme.imagem}" alt="Capa do Filme" class="img-fluid rounded-3 shadow-sm">
                    </c:when>
                    <c:otherwise>
                        <div class="text-muted fst-italic">Imagem não disponível</div>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="col-md-8">
                <div class="card-body p-4">
                    <h2 class="card-title text-primary fw-bold mb-3">${filme.titulo}</h2>
                    
                    <div class="mb-4">
                        <dl class="row">
                            <dt class="col-sm-4 fw-semibold">🎬 Diretor:</dt>
                            <dd class="col-sm-8">${filme.diretor}</dd>

                            <dt class="col-sm-4 fw-semibold">📅 Lançamento:</dt>
                            <dd class="col-sm-8">${filme.anoLancamento}</dd>

                            <dt class="col-sm-4 fw-semibold">🗣️ Idioma:</dt>
                            <dd class="col-sm-8">${filme.idioma}</dd>

                            <dt class="col-sm-4 fw-semibold">💾 Formato:</dt>
                            <dd class="col-sm-8">${filme.formato}</dd>

                            <dt class="col-sm-4 fw-semibold">⏱️ Duração:</dt>
                            <dd class="col-sm-8">${filme.duracao} min</dd>

                            <dt class="col-sm-4 fw-semibold">🏷️ Categoria:</dt>
                            <dd class="col-sm-8">${filme.categoria}</dd>
                        </dl>
                    </div>

                    <div>
                        <h5 class="text-secondary fw-bold">📝 Sinopse</h5>
                        <p class="text-justify">${filme.sinopse}</p>
                    </div>

                    <div class="mt-4 d-flex justify-content-end">
                        <a href="listar-filmes" class="btn btn-outline-primary">⬅️ Voltar à lista</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
