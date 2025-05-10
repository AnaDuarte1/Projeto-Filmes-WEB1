<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Filmes</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="sobreSistema.jsp">Sobre o Sistema</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Buscar" aria-label="Buscar">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
            </form>
        </div>
    </nav>

    <div class="container mt-4">
        <h1>Filmes em Destaque</h1>
        <div class="row">
            <!-- Exibir filmes em destaque aqui -->
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
