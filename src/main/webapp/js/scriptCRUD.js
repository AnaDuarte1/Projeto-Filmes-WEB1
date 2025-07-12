document.addEventListener('DOMContentLoaded', () => {
    carregarComponente('header-placeholder', 'header.html', inicializarPagina);
    carregarComponente('footer-placeholder', 'footer.html');
});

function carregarComponente(idPlaceholder, urlComponente, callback) {
    const placeholder = document.getElementById(idPlaceholder);
    if (placeholder) {
        fetch(urlComponente)
            .then(response => {
                if (response.ok) {
                    return response.text();
                } else {
                    return Promise.reject(`Falha ao carregar ${urlComponente}`);
                }
            })
            .then(data => {
                placeholder.innerHTML = data;
                if (callback) {
                    callback();
                }
            })
            .catch(error => {
                placeholder.innerHTML = `<div class="alert alert-warning">Não foi possível carregar o componente: ${urlComponente}</div>`;
                console.error(error);
            });
    }
}

function inicializarPagina() {
    fetch('session-status')
        .then(response => {
            if (response.ok) {
                return response.json();
            } else {
                return Promise.reject('Serviço de sessão indisponível.');
            }
        })
        .then(usuarioLogado => {
            const usuario = usuarioLogado ? { ...usuarioLogado, logado: true } : { logado: false };
            atualizarHeader(usuario);
            if (document.getElementById('detalhes-filme-container')) {
                carregarDetalhesFilme(usuario);
            }
        })
        .catch(error => {
            console.error("Erro ao buscar status da sessão:", error);
            atualizarHeader({ logado: false });
            if (document.getElementById('detalhes-filme-container')) {
                carregarDetalhesFilme({ logado: false });
            }
        });
}

function atualizarHeader(usuario) {
    const adminLink = document.getElementById('admin-link-add-filme');
    const userNavLinks = document.getElementById('user-nav-links');

    if (!adminLink || !userNavLinks) {
        return;
    }

    // Se o usuário estiver LOGADO, ele é um ADMIN.
    if (usuario.logado) {
        adminLink.style.display = 'block'; // Mostra "Adicionar Filme"
        userNavLinks.innerHTML = `
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarUserDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-user me-1"></i> ${usuario.nome}
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarUserDropdown">
                    <li><a class="dropdown-item" href="#" onclick="logout()">Sair</a></li>
                </ul>
            </li>
        `;
    // Se NÃO estiver logado, é um usuário comum.
    } else {
        adminLink.style.display = 'none'; // Esconde "Adicionar Filme"
        userNavLinks.innerHTML = `
            <li class="nav-item">
                <a class="nav-link" href="login.html">Login (Admin)</a>
            </li>
        `;
    }
}

function logout() {
    fetch('logout', { method: 'POST' })
        .then(response => {
            if (response.ok) {
                window.location.href = 'login.html';
            } else {
                alert('Falha ao fazer logout.');
            }
        });
}

function carregarDetalhesFilme(usuario) {
    const container = document.getElementById('detalhes-filme-container');
    const urlParams = new URLSearchParams(window.location.search);
    const filmeId = urlParams.get('id');

    if (!filmeId) {
        container.innerHTML = `<div class="alert alert-danger">Erro: ID do filme não fornecido na URL.</div>`;
        return;
    }

    fetch(`visualizar-filme?id=${filmeId}`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`Filme não encontrado (Status: ${response.status})`);
            }
            return response.json();
        })
        .then(filme => {
            if (!filme || Object.keys(filme).length === 0) {
                throw new Error("Dados do filme retornados vazios.");
            }
            renderizarHtmlFilme(container, filme, usuario);
        })
        .catch(error => {
            container.innerHTML = `<div class="alert alert-danger text-center"><h4>Ops! Não foi possível carregar o filme.</h4><p>${error.message}</p></div>`;
            console.error("Erro ao buscar detalhes do filme:", error);
        });
}

function renderizarHtmlFilme(container, filme, usuario) {
    let adminButtons = '';
    // Se estiver logado, é admin, então mostramos os botões.
    if (usuario.logado) {
        adminButtons = `
            <a href="editar-filme.html?id=${filme.id}" class="btn btn-warning"><i class="fas fa-edit me-1"></i> Editar</a>
            <button onclick="excluirFilme(${filme.id}, '${filme.titulo}')" class="btn btn-danger"><i class="fas fa-trash me-1"></i> Excluir</button>
        `;
    }

    container.innerHTML = `
        <div class="card shadow-lg border-0 rounded-4">
            <div class="row g-0">
                <div class="col-md-4 d-flex align-items-center justify-content-center p-4">
                    <img src="${filme.imagem || 'https://placehold.co/300x450/6c757d/ffffff?text=Capa'}" alt="Capa de ${filme.titulo}" class="img-fluid rounded-3 shadow-sm">
                </div>
                <div class="col-md-8">
                    <div class="card-body p-4">
                        <h2 class="card-title text-primary fw-bold mb-3">${filme.titulo}</h2>
                        <div class="mb-4">
                            <dl class="row">
                                <dt class="col-sm-4 fw-semibold">🎬 Diretor:</dt>
                                <dd class="col-sm-8">${filme.diretor || 'Não informado'}</dd>
                                <dt class="col-sm-4 fw-semibold">📅 Lançamento:</dt>
                                <dd class="col-sm-8">${filme.anoLancamento || 'Não informado'}</dd>
                                <dt class="col-sm-4 fw-semibold">🗣️ Idioma:</dt>
                                <dd class="col-sm-8">${filme.idioma || 'Não informado'}</dd>
                                <dt class="col-sm-4 fw-semibold">⏱️ Duração:</dt>
                                <dd class="col-sm-8">${filme.duracao ? filme.duracao + ' min' : 'Não informado'}</dd>
                                <dt class="col-sm-4 fw-semibold">🏷️ Categoria:</dt>
                                <dd class="col-sm-8">${filme.categoria || 'Não informado'}</dd>
                            </dl>
                        </div>
                        <div>
                            <h5 class="text-secondary fw-bold">📝 Sinopse</h5>
                            <p class="text-justify">${filme.sinopse || 'Sinopse não disponível.'}</p>
                        </div>
                        <div class="mt-4 d-flex justify-content-end gap-2">
                            ${adminButtons}
                            <a href="catalogo.html" class="btn btn-outline-primary">⬅️ Voltar ao Catálogo</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>`;
}

function excluirFilme(id, titulo) {
    if (confirm(`Tem certeza que deseja excluir o filme "${titulo}"?`)) {
        fetch('excluir-filme', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: `id=${id}`
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'sucesso') {
                alert(data.mensagem);
                window.location.href = 'catalogo.html';
            } else {
                alert(`Erro ao excluir: ${data.mensagem}`);
            }
        })
        .catch(error => {
            console.error('Erro na requisição de exclusão:', error);
            alert('Ocorreu um erro na comunicação com o servidor.');
        });
    }
}