<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>


    <div class="container mt-4">
        <h1>Filmes em Destaque</h1>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <img src="../imagem/imagem.jpg" class="card-img-top" alt="Título do Filme">
                    <div class="card-body">
                        <h5 class="card-title">Título do Filme</h5>
                        <p class="card-text">Sinopse do filme em destaque.</p>
                        <a href="visualizar-filme?id=1" class="btn btn-primary">Ver Detalhes</a>
                    </div>
                </div>
            </div>
            <!-- Adicionar mais filmes conforme necessário -->
        </div>
    </div>

<%@ include file="footer.jsp" %>
