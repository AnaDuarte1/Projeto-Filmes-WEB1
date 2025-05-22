<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="css/index.css">


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

<div class="container">
    <!-- Carrossel de Destaques -->
    <h2 class="section-title">Em Destaque</h2>
    <div id="filmeCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <!-- Filme 1 estático -->
            <div class="carousel-item active">
                <img src="imagens/filmes-destaques/gato-de-botas.png" class="d-block w-100" alt="Gato de Botas 2: O Último Pedido">
                <div class="carousel-caption">
                    <h5>Gato de Botas 2: O Último Pedido</h5>
                    <p>O Gato de Botas descobre que sua paixão pela aventura cobrou seu preço: ele já gastou oito de suas nove vidas. Ele então parte em uma jornada épica para encontrar o mítico Último Desejo e restaurar suas nove vidas.</p>
                    <a href="https://www.netflix.com/br/title/81555726?source=35" class="btn btn-custom">Assistir Agora</a>
                </div>
            </div>
            
            <!-- Filme 2 estático -->
            <div class="carousel-item">
                <img src="imagens/filmes-destaques/Baila-Vini.png" class="d-block w-100" alt="Baila, Vini">
                <div class="carousel-caption">
                    <h5>Baila, Vini</h5>
                    <p>Em Baila, Vini, somos levados aos bastidores da vida do jogador de futebol do Real Madrid e da Seleção Brasileira 
                    Vinícius Júnior, que se tornou um dos esportistas mais conhecidos e bem-sucedidos do mundo. 
                    O documentário mostra todas as dificuldades pelas quais o atleta precisou passar ao longo dos anos, mas também as 
                    suas vitórias e conquistas.</p>
                    <a href="https://www.netflix.com/br/title/81667943" class="btn btn-custom">Assistir Agora</a>
                </div>
            </div>
            
            <!-- Filme 3 estático -->
            <div class="carousel-item">
                <img src="imagens/filmes-destaques/ad-vitam.jpg" class="d-block w-100" alt="Ad Vitam">
                <div class="carousel-caption">
                    <h5>Ad Vitam</h5>
                    <p>Após sobreviver a uma tentativa de assassinato, Franck Lazareff embarca em uma busca desesperada por sua esposa, Léo, 
                    que foi sequestrada por um grupo enigmático de homens armados. </p>
                    <a href="www.netflix.com/search?q=Ad%20Vitam%20&jbv=81752951" class="btn btn-custom">Assistir Agora</a>
                </div>
            </div>
            
            <!-- Filme 4 estático -->
            <div class="carousel-item">
                <img src="imagens/filmes-destaques/contra-ataque.jpg" class="d-block w-100" alt="Contra-ataque">
                <div class="carousel-caption">
                    <h5>Contra-ataque </h5>
                    <p>O longa acompanha o Capitão Armando Guerrero, das Forças Especiais do Exército Mexicano, que resgata duas mulheres das 
                    mãos do temido Josefo "O Ferrão" Urías, líder dos assassinos de aluguel do cartel de Tamaulipas. 
                    Ao enfrentar esse poderoso inimigo, Armando e sua equipe são obrigados a tirar alguns dias de descanso antes de sua próxima missão. 
                    No entanto, a trégua dura pouco. </p>
                    <a href="https://www.netflix.com/br/title/81936018" class="btn btn-custom">Assistir Agora</a>
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
        <span class="category-badge">Ação</span>
        <span class="category-badge">Aventura</span>
        <span class="category-badge">Drama</span>
        <span class="category-badge">Comédia</span>
        <span class="category-badge">Ficção Científica</span>
        <span class="category-badge">Terror</span>
        <span class="category-badge">Romance</span>
        <span class="category-badge">Documentário</span>
    </div>
    
    <!-- Nossa Coleção - Filmes estáticos + dinâmicos -->
    <h2 class="section-title">Nossa Coleção</h2>
    <div class="row">
        <!-- Filme estático 1 -->
        <div class="col-md-4 mb-4">
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
        <div class="col-md-4 mb-4">
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
        <div class="col-md-4 mb-4">
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
            <div class="col-md-4 mb-4">
                <div class="card h-100">
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
                            <a href="visualizar-filme?id=${filme.id}" class="btn btn-sm btn-custom">Detalhes</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    
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

<%@ include file="footer.jsp" %>