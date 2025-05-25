<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<%@ include file="styles/home.jsp" %>


<section class="hero-section text-center">
    <div class="container">
        <h1 class="hero-title">CineWeb</h1>
        <p class="hero-subtitle">Descubra os melhores filmes em nossa coleção exclusiva</p>
        <form action="buscar-filme" method="get">
            <div class="search-box">
                <div class="input-group">
                    <input type="text" class="form-control form-control-lg" name="palavraChave" placeholder="Pesquise por filmes, atores ou diretores..." required>
                    <div class="input-group-append">
                        <button class="btn btn-custom" type="submit">
                            <i class="fas fa-search"></i> Buscar
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>

<!-- Main Content -->
<div class="container">
    <!-- Carrossel de Destaques -->
    <h2 class="section-title">Em Destaque</h2>
    <div id="filmeCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
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
            <!-- Filme 1 estático -->
            <div class="carousel-item active">
                <img src="imagem/missaoImpossivel.jpeg" class="d-block w-100" alt="Homem com H">
                <div class="carousel-caption">
                    <h5>Missão Impossível – O Acerto Final </h5>
                    <p>Ethan Hunt e seus amigos encaram mais um desafio internacional e o agente aprende que a vida é a soma de nossas escolhas..</p>
                    <a href="#" class="btn btn-custom">Assistir Agora</a>
                </div>
            </div>
            
            <!-- Filme 2 estático -->
            <div class="carousel-item">
                <img src="imagem/premonicao.jpg" class="d-block w-100" alt="Premonição">
                <div class="carousel-caption">
                    <h5>Premonição</h5>
                    <p>A estudante universitária Stefanie é atormentada por um pesadelo recorrente. Ela decide voltar para casa e rastrear a única pessoa que, talvez, possa ser capaz de quebrar o ciclo fatal anunciado e salvar sua família de um destino terrível..</p>
                    <a href="#" class="btn btn-custom">Assistir Agora</a>
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
	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3" id="colecao-filmes">
	
    <!-- Cards Estáticos -->
    
    <!-- Filme estático 1 -->
    <div class="col mb-4 filme-card" data-categoria="Aventura">
        <div class="card h-100">
            <img src="imagem/missaoImpossivel.jpeg" class="card-img-top" alt="Homem com H">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Missão Impossível: O Acerto Final</h5>
                <p class="card-text"><small class="text-muted">Tom Cruise • 2025</small></p>
                <p class="card-text text-truncate-2">Ethan Hunt e seus amigos encaram mais um desafio internacional e o agente aprende que a vida é a soma de nossas escolhas...</p>
                <div class="mt-auto d-flex justify-content-between align-items-center">
                    <span class="badge bg-secondary">Digital</span>
                    <a href="#" class="btn btn-sm btn-custom">Detalhes</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Filme estático 2 -->
    <div class="col mb-4 filme-card" data-categoria="Aventura">
        <div class="card h-100">
            <img src="imagem/premonicao.jpg" class="card-img-top" alt="Premonição">
            <div class="card-body d-flex flex-column">
                <h5 class="card-title">Premonição</h5>
                <p class="card-text"><small class="text-muted">Tony Todd • 2025</small></p>
                <p class="card-text text-truncate-2">A estudante universitária Stefanie é atormentada por um pesadelo recorrente.</p>
                <div class="mt-auto d-flex justify-content-between align-items-center">
                    <span class="badge bg-secondary">Blu-ray</span>
                    <a href="#" class="btn btn-sm btn-custom">Detalhes</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Filmes Dinâmicos (JSTL) -->
    <c:forEach items="${filmes}" var="filme">
        <div class="col mb-4 filme-card" data-categoria="${filme.categoria}">
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
                    <div class="mt-auto d-flex justify-content-between align-items-center flex-wrap gap-1">
                        <span class="badge bg-secondary">${filme.formato}</span>
                        <span class="badge bg-secondary">${filme.categoria}</span>
                        <a href="visualizar-filme?id=${filme.id}" class="btn btn-sm btn-custom">Detalhes</a>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
	</div>

	<!-- Paginação -->
	<nav aria-label="Paginação filmes">
	    <ul class="pagination justify-content-center" id="pagination">
	        <!-- Paginação será gerada pelo JavaScript -->
	    </ul>
	</nav>


    <!-- Próximas Estreias (seção estática) -->
	<h2 class="section-title mt-5">Próximas Estreias</h2>
	<div class="row estreias-section">
	    <div class="col-md-3 mb-4 h-100">
	        <div class="card d-flex flex-column h-100">
	            <div class="position-relative">
	                <span class="position-absolute top-0 end-0 bg-danger text-white p-2">EM BREVE</span>
	            </div>
	            <div class="card-body">
	                <h5 class="card-title">Guerra dos Mundos</h5>
	                <p class="card-text">A batalha final pela sobrevivência da humanidade.</p>
	            </div>
	        </div>
	    </div>
	    <div class="col-md-3 mb-4 h-100">
	        <div class="card d-flex flex-column h-100">
	            <div class="position-relative">
	                <span class="position-absolute top-0 end-0 bg-danger text-white p-2">EM BREVE</span>
	            </div>
	            <div class="card-body">
	                <h5 class="card-title">O Segredo do Oceano</h5>
	                <p class="card-text">Descubra o mistério que está escondido nas profundezas.</p>
	            </div>
	        </div>
	    </div>
	    <div class="col-md-3 mb-4 h-100">
	        <div class="card d-flex flex-column h-100">
	            <div class="position-relative">
	                <span class="position-absolute top-0 end-0 bg-danger text-white p-2">EM BREVE</span>
	            </div>
	            <div class="card-body">
	                <h5 class="card-title">Riso Contagioso</h5>
	                <p class="card-text">A comédia mais esperada do ano.</p>
	            </div>
	        </div>
	    </div>
	    <div class="col-md-3 mb-4 h-100">
	        <div class="card d-flex flex-column h-100">
	            <div class="position-relative">
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



<!-- Script para filtro e paginação -->
<script>
document.addEventListener('DOMContentLoaded', function () {
    const filmes = Array.from(document.querySelectorAll('.filme-card'));
    const categorias = document.querySelectorAll('.category-badge');
    const colecaoFilmes = document.getElementById('colecao-filmes');
    const pagination = document.getElementById('pagination');
    
    const itensPorPagina = 3; 
    let paginaAtual = 1;
    let filmesFiltrados = filmes;
    
    function mostrarFilmes(pagina) {
        const inicio = (pagina - 1) * itensPorPagina;
        const fim = inicio + itensPorPagina;
        
        filmes.forEach(filme => filme.style.display = 'none'); 
        
        filmesFiltrados.slice(inicio, fim).forEach(filme => {
            filme.style.display = 'block'; 
        });
    }
    
    function criarPaginacao() {
        pagination.innerHTML = '';
        const totalPaginas = Math.ceil(filmesFiltrados.length / itensPorPagina);

        // Função para criar um botão de paginação estilizado
        function criarBotao(texto, ativo, desativado, callback) {
            const li = document.createElement('li');
            li.classList.add('page-item');
            if (ativo) li.classList.add('active');
            if (desativado) li.classList.add('disabled');

            const a = document.createElement('a');
            a.classList.add('page-link', 'btn-custom');
            a.style.borderRadius = '30px';
            a.style.margin = '0 5px';
            a.style.padding = '6px 16px';
            a.href = '#';
            a.textContent = texto;

            if (!desativado) {
                a.addEventListener('click', function (e) {
                    e.preventDefault();
                    callback();
                });
            }

            li.appendChild(a);
            return li;
        }

        // Botão anterior
        pagination.appendChild(criarBotao('«', false, paginaAtual === 1, () => {
            paginaAtual--;
            mostrarFilmes(paginaAtual);
            criarPaginacao();
        }));

        // Páginas numeradas (ex: mostra até 5 páginas vizinhas)
        let maxPaginas = 5;
        let inicio = Math.max(1, paginaAtual - Math.floor(maxPaginas / 2));
        let fim = Math.min(totalPaginas, inicio + maxPaginas - 1);
        if (fim - inicio < maxPaginas - 1) {
            inicio = Math.max(1, fim - maxPaginas + 1);
        }

        for (let i = inicio; i <= fim; i++) {
            pagination.appendChild(criarBotao(i, i === paginaAtual, false, () => {
                paginaAtual = i;
                mostrarFilmes(paginaAtual);
                criarPaginacao();
            }));
        }

        // Botão próximo
        pagination.appendChild(criarBotao('»', false, paginaAtual === totalPaginas, () => {
            paginaAtual++;
            mostrarFilmes(paginaAtual);
            criarPaginacao();
        }));
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
           
            categorias.forEach(c => {
                c.classList.remove('bg-primary', 'text-white');
                c.classList.add('bg-secondary');
            });
            
            cat.classList.remove('bg-secondary');
            cat.classList.add('bg-primary', 'text-white');
            
            filtrarFilmes(cat.dataset.categoria);
        });
    });
    
    
    filtrarFilmes('Todos');
});
</script>