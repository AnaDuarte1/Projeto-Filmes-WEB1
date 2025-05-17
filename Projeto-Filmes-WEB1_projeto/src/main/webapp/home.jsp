<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<style>

body {
    background-color: #121212; /* Cor de fundo escura */
}
.card {
    margin-bottom: 20px; /* Espaçamento entre os cards */
    border-radius: 15px; /* Bordas arredondadas */
}
.card-img-top {
    border-top-left-radius: 15px; /* Bordas arredondadas na parte superior */
    border-top-right-radius: 15px; /* Bordas arredondadas na parte superior */
}
.btn-custom {
    background-color: #87CEEB; /* Cor de fundo do botão */
    color: white; /* Cor do texto do botão */
}
.btn-custom:hover {
    background-color: #0056b3; /* Cor do botão ao passar o mouse */
}
footer {
    position: relative;
    bottom: 0;
    width: 100%;
}


</style>

<div class="container mt-4">
    <h1>Filmes em Destaque</h1>
    
    <!-- Carrossel de Filmes em Destaque -->
    <div id="filmeCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="imagem/filme1" class="d-block w-100" alt="Filme 1" style="height: 400px; object-fit: cover;">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Homem com H</h5>
                    <p>As diferentes fases da carreira do cantor Ney Matogrosso, desde a sua infância, passando pela adolescência e a vida adulta. Uma jornada através do tempo que acompanha um rapaz de origem humilde que quebra preconceitos e se torna um artista influente.</p>
                    <a href="visualizar-filme?id=1" class="btn btn-custom">Ver Detalhes</a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="../imagem/filme2.jpg" class="d-block w-100" alt="Filme 2" style="height: 400px; object-fit: cover;">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Título do Filme 2</h5>
                    <p>Descrição do Filme 2.</p>
                    <a href="visualizar-filme?id=2" class="btn btn-custom">Ver Detalhes</a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="../imagem/filme3.jpg" class="d-block w-100" alt="Filme 3" style="height: 400px; object-fit: cover;">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Título do Filme 3</h5>
                    <p>Descrição do Filme 3.</p>
                    <a href="visualizar-filme?id=3" class="btn btn-custom">Ver Detalhes</a>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#filmeCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Anterior</span>
        </a>
        <a class="carousel-control-next" href="#filmeCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Próximo</span>
        </a>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="card bg-dark text-light rounded">
                <img src="imagem/filme1" class="card-img-top rounded" alt="Filme 4" style="height: 250px; object-fit: cover;">
                <div class="card-body">
                    <h5 class="card-title">Homem com H</h5>
                    <p class="card-text">As diferentes fases da carreira do cantor Ney Matogrosso, desde a sua infância, passando pela adolescência e a vida adulta. Uma jornada através do tempo que acompanha um rapaz de origem humilde que quebra preconceitos e se torna um artista influente.</p>
                    <a href="visualizar-filme?id=4" class="btn btn-custom btn-block">Ver Detalhes</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card bg-dark text-light rounded">
                <img src="imagem/filme5.jpg" class="card-img-top rounded" alt="Filme 5" style="height: 250px; object-fit: cover;">
                <div class="card-body">
                    <h5 class="card-title">Título do Filme 5</h5>
                    <p class="card-text">Sinopse do filme 5.</p>
                    <a href="visualizar-filme?id=5" class="btn btn-custom btn-block">Ver Detalhes</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card bg-dark text-light rounded">
                <img src="../imagem/filme6.jpg" class="card-img-top rounded" alt="Filme 6" style="height: 250px; object-fit: cover;">
                <div class="card-body">
                    <h5 class="card-title">Título do Filme 6</h5>
                    <p class="card-text">Sinopse do filme 6.</p>
                    <a href="visualizar-filme?id=6" class="btn btn-custom btn-block">Ver Detalhes</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>