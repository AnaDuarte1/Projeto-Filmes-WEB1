<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<style>
    :root {
        --primary-blue: #1a237e;
        --secondary-blue: #1976d2;
        --accent-blue: #4fc3f7;
        --dark-bg: #0d1117;
        --light-text: #f8f9fa;
        --dark-text: #212529;
    }
    
    body {
        background-color: var(--dark-bg);
        color: var(--light-text);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    .hero-section {
        background: linear-gradient(135deg, var(--primary-blue) 0%, var(--secondary-blue) 100%);
        padding: 4rem 0;
        border-radius: 0 0 20px 20px;
        margin-bottom: 3rem;
        box-shadow: 0 10px 20px rgba(0,0,0,0.3);
    }
    
    .hero-title {
        font-size: 3.5rem;
        font-weight: 700;
        text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
    }
    
    .hero-subtitle {
        font-size: 1.5rem;
        opacity: 0.9;
    }
    
    .search-box {
        max-width: 600px;
        margin: 2rem auto;
    }
    
    .card {
        margin-bottom: 25px;
        border: none;
        border-radius: 12px;
        overflow: hidden;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        background: linear-gradient(145deg, #1e283c 0%, #162033 100%);
        box-shadow: 0 8px 15px rgba(0,0,0,0.2);
    }
    
    .card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 25px rgba(0,0,0,0.3);
    }
    
    .card-img-top {
        height: 300px;
        object-fit: cover;
        border-bottom: 3px solid var(--accent-blue);
    }
    
    .card-title {
        font-weight: 600;
        color: var(--accent-blue);
    }
    
    .card-text {
        color: rgba(255,255,255,0.7);
        font-size: 0.9rem;
    }
    
    .btn-custom {
        background-color: var(--secondary-blue);
        color: white;
        border: none;
        border-radius: 50px;
        padding: 8px 20px;
        font-weight: 500;
        transition: all 0.3s ease;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }
    
    .btn-custom:hover {
        background-color: var(--accent-blue);
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(79, 195, 247, 0.4);
    }
    
    .section-title {
        position: relative;
        margin-bottom: 2rem;
        font-weight: 700;
        color: var(--accent-blue);
    }
    
    .section-title:after {
        content: '';
        position: absolute;
        left: 0;
        bottom: -10px;
        width: 50px;
        height: 3px;
        background: var(--accent-blue);
    }
    
    .carousel {
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 10px 25px rgba(0,0,0,0.3);
        margin-bottom: 3rem;
    }
    
    .carousel-item {
        height: 500px;
    }
    
    .carousel-item img {
        height: 100%;
        object-fit: cover;
        filter: brightness(0.7);
    }
    
    .carousel-caption {
        bottom: 30%;
        text-align: left;
        left: 10%;
        right: 10%;
    }
    
    .carousel-caption h5 {
        font-size: 2.5rem;
        font-weight: 700;
        text-shadow: 2px 2px 5px rgba(0,0,0,0.8);
    }
    
    .carousel-caption p {
        font-size: 1.1rem;
        max-width: 600px;
    }
    
    .carousel-control-prev, .carousel-control-next {
        width: 5%;
    }
    
    .category-badge {
        display: inline-block;
        background-color: rgba(79, 195, 247, 0.2);
        color: var(--accent-blue);
        padding: 5px 15px;
        border-radius: 50px;
        margin: 5px;
        transition: all 0.3s ease;
        cursor: pointer;
    }
    
    .category-badge:hover {
        background-color: var(--accent-blue);
        color: var(--dark-text);
        transform: scale(1.05);
    }
    
    footer {
        background: linear-gradient(135deg, var(--primary-blue) 0%, #0d1117 100%);
        padding: 2rem 0;
        margin-top: 3rem;
    }
    
    .no-image-placeholder {
        width: 100%;
        height: 300px;
        background: #1e283c;
        display: flex;
        align-items: center;
        justify-content: center;
        color: var(--accent-blue);
        font-size: 2rem;
    }
    
    .text-truncate-2 {
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    
    .estreias-section .card-img-top {
        height: 350px;
    }
</style>

<!-- Hero Section -->
<section class="hero-section text-center">
    <div class="container">
        <h1 class="hero-title">CineBlue</h1>
        <p class="hero-subtitle">Descubra os melhores filmes em nossa coleção exclusiva</p>
        
        <div class="search-box">
            <div class="input-group">
                <input type="text" class="form-control form-control-lg" placeholder="Pesquise por filmes, atores ou diretores...">
                <div class="input-group-append">
                    <button class="btn btn-custom" type="button">
                        <i class="fas fa-search"></i> Buscar
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Main Content -->
<div class="container">
    <!-- Carrossel de Destaques -->
    <h2 class="section-title">Em Destaque</h2>
    <div id="filmeCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <!-- Filme 1 estático -->
            <div class="carousel-item active">
                <img src="https://via.placeholder.com/800x400?text=Homem+com+H" class="d-block w-100" alt="Homem com H">
                <div class="carousel-caption">
                    <h5>Homem com H</h5>
                    <p>As diferentes fases da carreira do cantor Ney Matogrosso, desde a sua infância, passando pela adolescência e a vida adulta.</p>
                    <a href="#" class="btn btn-custom">Assistir Agora</a>
                </div>
            </div>
            
            <!-- Filme 2 estático -->
            <div class="carousel-item">
                <img src="https://via.placeholder.com/800x400?text=Aventura+no+Espaço" class="d-block w-100" alt="Aventura no Espaço">
                <div class="carousel-caption">
                    <h5>Aventura no Espaço</h5>
                    <p>Uma jornada épica através das galáxias em busca do planeta perdido.</p>
                    <a href="#" class="btn btn-custom">Assistir Agora</a>
                </div>
            </div>
            
            <!-- Filmes cadastrados pelo admin -->
            <c:forEach items="${filmes}" var="filme">
                <div class="carousel-item">
                    <c:choose>
                        <c:when test="${not empty filme.imagem}">
                            <img src="${pageContext.request.contextPath}/${filme.imagem}" class="d-block w-100" alt="${filme.titulo}">
                        </c:when>
                        <c:otherwise>
                            <div class="no-image-placeholder">
                                <i class="fas fa-film"></i>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <div class="carousel-caption">
                        <h5>${filme.titulo}</h5>
                        <p>${filme.sinopse}</p>
                        <p>${filme.categoria}</p>
                        <a href="visualizar-filme?id=${filme.id}" class="btn btn-custom">Assistir Agora</a>
                    </div>
                </div>
            </c:forEach>
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
   <!-- Categorias -->
<h2 class="section-title">Categorias</h2>
<div class="text-center mb-5">
    <span class="category-badge badge bg-primary text-white" data-categoria="Todos" style="cursor:pointer;">Todos</span>
    <span class="category-badge badge bg-secondary" data-categoria="Ação" style="cursor:pointer;">Ação</span>
    <span class="category-badge badge bg-secondary" data-categoria="Aventura" style="cursor:pointer;">Aventura</span>
    <span class="category-badge badge bg-secondary" data-categoria="Drama" style="cursor:pointer;">Drama</span>
    <span class="category-badge badge bg-secondary" data-categoria="Comédia" style="cursor:pointer;">Comédia</span>
    <span class="category-badge badge bg-secondary" data-categoria="Ficção Científica" style="cursor:pointer;">Ficção Científica</span>
    <span class="category-badge badge bg-secondary" data-categoria="Terror" style="cursor:pointer;">Terror</span>
    <span class="category-badge badge bg-secondary" data-categoria="Romance" style="cursor:pointer;">Romance</span>
    <span class="category-badge badge bg-secondary" data-categoria="Documentário" style="cursor:pointer;">Documentário</span>
</div>

<!-- Nossa Coleção -->
<h2 class="section-title">Nossa Coleção</h2>
<div class="row" id="colecao-filmes">
    <!-- Aqui ficam os cards dos filmes (estáticos e dinâmicos) -->
    <!-- Importante: adicionar atributo data-categoria nos cards estáticos também -->
    
    <!-- Filme estático 1 -->
    <div class="col-md-4 mb-4 filme-card" data-categoria="Documentário">
        <div class="card h-100">
            <img src="https://via.placeholder.com/300x450?text=Homem+com+H" class="card-img-top" alt="Homem com H">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Homem com H</h5>
                <p class="card-text"><small class="text-muted">João Jardim • 2023</small></p>
                <p class="card-text text-truncate-2">As diferentes fases da carreira do cantor Ney Matogrosso, desde a sua infância, passando pela adolescência e a vida adulta.</p>
                <div class="mt-auto d-flex justify-content-between align-items-center">
                    <span class="badge bg-secondary">Digital</span>
                    <a href="#" class="btn btn-sm btn-custom">Detalhes</a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Filme estático 2 -->
    <div class="col-md-4 mb-4 filme-card" data-categoria="Aventura">
        <div class="card h-100">
            <img src="https://via.placeholder.com/300x450?text=Aventura+no+Espaço" class="card-img-top" alt="Aventura no Espaço">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Aventura no Espaço</h5>
                <p class="card-text"><small class="text-muted">Carlos Saldanha • 2022</small></p>
                <p class="card-text text-truncate-2">Uma jornada épica através das galáxias em busca do planeta perdido.</p>
                <div class="mt-auto d-flex justify-content-between align-items-center">
                    <span class="badge bg-secondary">Blu-ray</span>
                    <a href="#" class="btn btn-sm btn-custom">Detalhes</a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Filme estático 3 -->
    <div class="col-md-4 mb-4 filme-card" data-categoria="Aventura">
        <div class="card h-100">
            <img src="https://via.placeholder.com/300x450?text=O+Mistério+da+Floresta" class="card-img-top" alt="O Mistério da Floresta">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">O Mistério da Floresta</h5>
                <p class="card-text"><small class="text-muted">Ana Maria • 2021</small></p>
                <p class="card-text text-truncate-2">Um grupo de exploradores descobre segredos antigos em uma floresta proibida.</p>
                <div class="mt-auto d-flex justify-content-between align-items-center">
                    <span class="badge bg-secondary">DVD</span>
                    <a href="#" class="btn btn-sm btn-custom">Detalhes</a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Filmes cadastrados pelo admin -->
    <c:forEach items="${filmes}" var="filme">
        <div class="col-md-4 mb-4 filme-card" data-categoria="${filme.categoria}">
            <div class="card h-100" >
                <c:choose>
                    <c:when test="${not empty filme.imagem}">
                        <img src="${pageContext.request.contextPath}/${filme.imagem}" class="card-img-top" alt="${filme.titulo}">
                    </c:when>
                    <c:otherwise>
                        <div class="no-image-placeholder">
                            <i class="fas fa-film"></i>
                        </div>
                    </c:otherwise>
                </c:choose>
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">${filme.titulo}</h5>
                    <p class="card-text"><small class="text-muted">${filme.diretor} • ${filme.anoLancamento}</small></p>
                    <p class="card-text text-truncate-2">${filme.sinopse}</p>
                    <div class="mt-auto d-flex justify-content-between align-items-center">
                        <span class="badge bg-secondary">${filme.formato}</span>
                        <span class="badge bg-secondary">${filme.categoria}</span>
                        <a href="visualizar-filme?id=${filme.id}" class="btn btn-sm btn-custom">Detalhes</a>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<nav aria-label="Paginação filmes">
    <ul class="pagination justify-content-center" id="pagination">
        <!-- Paginação será gerada pelo JavaScript -->
    </ul>
</nav>


    <!-- Próximas Estreias (seção estática) -->
    <h2 class="section-title mt-5">Próximas Estreias</h2>
    <div class="row estreias-section">
        <div class="col-md-3 mb-4">
            <div class="card">
                <div class="position-relative">
                    <img src="https://via.placeholder.com/300x450?text=Guerra+dos+Mundos" class="card-img-top" alt="Guerra dos Mundos">
                    <span class="position-absolute top-0 end-0 bg-danger text-white p-2">EM BREVE</span>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Guerra dos Mundos</h5>
                    <p class="card-text">A batalha final pela sobrevivência da humanidade.</p>
                </div>
            </div>
        </div>
        <div class="col-md-3 mb-4">
            <div class="card">
                <div class="position-relative">
                    <img src="https://via.placeholder.com/300x450?text=O+Segredo+do+Oceano" class="card-img-top" alt="O Segredo do Oceano">
                    <span class="position-absolute top-0 end-0 bg-danger text-white p-2">EM BREVE</span>
                </div>
                <div class="card-body">
                    <h5 class="card-title">O Segredo do Oceano</h5>
                    <p class="card-text">Descubra o mistério que está escondido nas profundezas.</p>
                </div>
            </div>
        </div>
        <div class="col-md-3 mb-4">
            <div class="card">
                <div class="position-relative">
                    <img src="https://via.placeholder.com/300x450?text=Riso+Contagioso" class="card-img-top" alt="Riso Contagioso">
                    <span class="position-absolute top-0 end-0 bg-danger text-white p-2">EM BREVE</span>
                </div>
                <div class="card-body">
                    <h5 class="card-title">Riso Contagioso</h5>
                    <p class="card-text">A comédia mais esperada do ano.</p>
                </div>
            </div>
        </div>
        <div class="col-md-3 mb-4">
            <div class="card">
                <div class="position-relative">
                    <img src="https://via.placeholder.com/300x450?text=O+Legado" class="card-img-top" alt="O Legado">
                    <span class="position-absolute top-0 end-0 bg-danger text-white p-2">EM BREVE</span>
                </div>
                <div class="card-body">
                    <h5 class="card-title">O Legado</h5>
                    <p class="card-text">Um segredo de família que mudará tudo.</p>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Script para filtro e paginação -->
<script>
document.addEventListener('DOMContentLoaded', function () {
    const filmes = Array.from(document.querySelectorAll('.filme-card'));
    const categorias = document.querySelectorAll('.category-badge');
    const colecaoFilmes = document.getElementById('colecao-filmes');
    const pagination = document.getElementById('pagination');
    
    const itensPorPagina = 6;  // Ajuste a quantidade de filmes por página
    let paginaAtual = 1;
    let filmesFiltrados = filmes;
    
    function mostrarFilmes(pagina) {
        const inicio = (pagina - 1) * itensPorPagina;
        const fim = inicio + itensPorPagina;
        
        filmes.forEach(filme => filme.style.display = 'none'); // Oculta todos
        
        filmesFiltrados.slice(inicio, fim).forEach(filme => {
            filme.style.display = 'block'; // Mostra apenas os filmes da página atual
        });
    }
    
    function criarPaginacao() {
        pagination.innerHTML = '';
        const totalPaginas = Math.ceil(filmesFiltrados.length / itensPorPagina);
        
        // Botão anterior
        const prevLi = document.createElement('li');
        prevLi.classList.add('page-item');
        if (paginaAtual === 1) prevLi.classList.add('disabled');
        prevLi.innerHTML = `<a class="page-link" href="#" aria-label="Anterior"><span aria-hidden="true">&laquo;</span></a>`;
        prevLi.addEventListener('click', function(e) {
            e.preventDefault();
            if(paginaAtual > 1){
                paginaAtual--;
                mostrarFilmes(paginaAtual);
                criarPaginacao();
            }
        });
        pagination.appendChild(prevLi);
        
        // Páginas numeradas
        for(let i = 1; i <= totalPaginas; i++) {
            const li = document.createElement('li');
            li.classList.add('page-item');
            if(i === paginaAtual) li.classList.add('active');
            li.innerHTML = `<a class="page-link" href="#">${i}</a>`;
            li.addEventListener('click', function(e) {
                e.preventDefault();
                paginaAtual = i;
                mostrarFilmes(paginaAtual);
                criarPaginacao();
            });
            pagination.appendChild(li);
        }
        
        // Botão próximo
        const nextLi = document.createElement('li');
        nextLi.classList.add('page-item');
        if (paginaAtual === totalPaginas) nextLi.classList.add('disabled');
        nextLi.innerHTML = `<a class="page-link" href="#" aria-label="Próximo"><span aria-hidden="true">&raquo;</span></a>`;
        nextLi.addEventListener('click', function(e) {
            e.preventDefault();
            if(paginaAtual < totalPaginas){
                paginaAtual++;
                mostrarFilmes(paginaAtual);
                criarPaginacao();
            }
        });
        pagination.appendChild(nextLi);
    }
    
    function filtrarFilmes(categoria) {
        if(categoria === 'Todos') {
            filmesFiltrados = filmes;
        } else {
            filmesFiltrados = filmes.filter(filme => filme.dataset.categoria === categoria);
        }
        paginaAtual = 1;
        mostrarFilmes(paginaAtual);
        criarPaginacao();
    }
    
    // Evento para clicar nas categorias
    categorias.forEach(cat => {
        cat.addEventListener('click', () => {
            // Remove a classe active das outras
            categorias.forEach(c => {
                c.classList.remove('bg-primary', 'text-white');
                c.classList.add('bg-secondary');
            });
            // Adiciona active na clicada
            cat.classList.remove('bg-secondary');
            cat.classList.add('bg-primary', 'text-white');
            
            filtrarFilmes(cat.dataset.categoria);
        });
    });
    
    // Inicialização: mostra todos e primeira página
    filtrarFilmes('Todos');
});
</script>

<%@ include file="footer.jsp" %> 