<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<div class="container mt-5">
    <h1 class="text-center">Bem-vindo ao Sistema de Filmes</h1>

    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <img class="card-img-top" src="https://via.placeholder.com/150" alt="Imagem 1">
                <div class="card-body">
                    <h5 class="card-title">Filme Destaque 1</h5>
                    <p class="card-text">Descrição breve do filme.</p>
                    <a href="visualizar-filme?id=1" class="btn btn-primary">Ver Detalhes</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <img class="card-img-top" src="https://via.placeholder.com/150" alt="Imagem 2">
                <div class="card-body">
                    <h5 class="card-title">Filme Destaque 2</h5>
                    <p class="card-text">Descrição breve do filme.</p>
                    <a href="visualizar-filme?id=2" class="btn btn-primary">Ver Detalhes</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <img class="card-img-top" src="https://via.placeholder.com/150" alt="Imagem 3">
                <div class="card-body">
                    <h5 class="card-title">Filme Destaque 3</h5>
                    <p class="card-text">Descrição breve do filme.</p>
                    <a href="visualizar-filme?id=3" class="btn btn-primary">Ver Detalhes</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
