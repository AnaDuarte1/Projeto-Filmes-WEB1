<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="br.edu.ifsp.arq.model.Filme" %>
<%@ page import="br.edu.ifsp.arq.dao.FilmeDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CineWeb - Catálogo de Filmes</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<%@ include file="header.jsp" %>



<!-- Verificar se existem filmes para exibir -->
<% if (listaFilmes != null && !listaFilmes.isEmpty()) { %>
    
    <!-- Carrossel de Destaques -->
    <div id="movieCarousel" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-indicators">
        <c:forEach items="${filmes}" var="filme" varStatus="loop">
          <button type="button" data-bs-target="#movieCarousel" data-bs-slide-to="${loop.index}" class="${loop.index == 0 ? 'active' : ''}" aria-current="${loop.index == 0 ? 'true' : ''}"></button>
        </c:forEach>
      </div>
      <div class="carousel-inner">
        <c:forEach items="${filmes}" var="filme" varStatus="loop">
          <div class="carousel-item ${loop.index == 0 ? 'active' : ''}" style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('${filme.imagem}');">
            <div class="carousel-caption d-none d-md-block">
              <h2>${filme.titulo}</h2>
              <p>${filme.diretor} • ${filme.anoLancamento}</p>
              <p class="d-none d-lg-block">${filme.sinopse.length() > 150 ? filme.sinopse.substring(0, 150) + '...' : filme.sinopse}</p>
              <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#movieModal${filme.id}">
                Saiba Mais
              </button>
            </div>
          </div>
        </c:forEach>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#movieCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Anterior</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#movieCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Próximo</span>
      </button>
    </div>

    <!-- Lista de Todos os Filmes -->
    <div class="container mb-5">
        <h2 class="section-title">Todos os Filmes</h2>
        <div class="row">
            <c:forEach items="${filmes}" var="filme">
                <div class="col-md-4 col-lg-3 mb-4">
                    <div class="movie-card h-100">
                        <img src="${filme.imagem}" class="card-img-top" alt="${filme.titulo}">
                        <div class="card-body">
                            <h5 class="card-title">${filme.titulo}</h5>
                            <p class="card-text">
                                <small class="text-muted">${filme.diretor} • ${filme.anoLancamento}</small>
                            </p>
                            <button class="btn btn-primary mt-2" data-bs-toggle="modal" data-bs-target="#movieModal${filme.id}">
                                Detalhes
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Modal para cada filme -->
                <div class="modal fade" id="movieModal${filme.id}" tabindex="-1" aria-labelledby="movieModalLabel${filme.id}" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="movieModalLabel${filme.id}">${filme.titulo}</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <img src="${filme.imagem}" class="img-fluid" alt="${filme.titulo}">
                                    </div>
                                    <div class="col-md-8">
                                        <p><strong>Diretor:</strong> ${filme.diretor}</p>
                                        <p><strong>Ano de Lançamento:</strong> ${filme.anoLancamento}</p>
                                        <p><strong>Duração:</strong> ${filme.duracao} minutos</p>
                                        <p><strong>Idioma:</strong> ${filme.idioma}</p>
                                        <p><strong>Formato:</strong> ${filme.formato}</p>
                                        <hr>
                                        <h5>Sinopse</h5>
                                        <p>${filme.sinopse}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a href="editar-filme?id=${filme.id}" class="btn btn-warning">
                                    <i class="fas fa-edit"></i> Editar
                                </a>
                                <a href="excluir-filme?id=${filme.id}" class="btn btn-danger" onclick="return confirm('Tem certeza que deseja excluir este filme?')">
                                    <i class="fas fa-trash"></i> Excluir
                                </a>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
<% } else { %>
    <p>Nenhum filme encontrado.</p>
<% } %>

<!-- Footer -->
<%@ include file="footer.jsp" %>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
