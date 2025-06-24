/**
 * js/visualizar-filme.js
 * * Contém a lógica para buscar os detalhes de um filme da API
 * e exibi-los na página, além da funcionalidade de exclusão.
 */

// A função `excluirFilme` precisa ser global para ser acessível pelo `onclick` no HTML.
function excluirFilme(id, titulo) {
    // Pede confirmação ao usuário antes de prosseguir
    if (confirm(`Tem certeza que deseja excluir o filme "${titulo}"?`)) {
        const params = new URLSearchParams();
        params.append('id', id);

        // Faz a requisição POST para o servlet de exclusão
        fetch('excluir-filme', {
            method: 'POST',
            body: params
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'sucesso') {
                alert(data.mensagem);
                window.location.href = 'visualizar-filme.html'; // Redireciona para o catálogo após o sucesso
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

// Lógica principal executada quando o conteúdo da página é carregado
document.addEventListener('DOMContentLoaded', () => {
    const urlParams = new URLSearchParams(window.location.search);
    const filmeId = urlParams.get('id');
    const container = document.getElementById('detalhes-filme-container');

    // Verifica se o ID do filme foi passado na URL
    if (!filmeId) {
        container.innerHTML = `<div class="alert alert-danger">Erro: ID do filme não fornecido na URL.</div>`;
        return;
    }

    // Busca os dados do filme no servlet
    fetch(`/visualizar-filme?id=${filmeId}`)
        .then(response => {
            if (!response.ok) {
                // Tenta ler o corpo do erro como JSON para uma mensagem mais específica
                return response.json().then(err => { throw new Error(err.mensagem || 'Filme não encontrado'); });
            }
            return response.json();
        })
        .then(filme => {
            // Preenche dinamicamente o container com a estrutura HTML e os dados do filme
            container.innerHTML = `
                <div class="card shadow-lg border-0 rounded-4">
                    <div class="row g-0">
                        <div class="col-md-4 d-flex align-items-center justify-content-center p-4">
                            <img src="${filme.imagem || 'https://placehold.co/300x450/6c757d/ffffff?text=CineWeb'}" alt="Capa de ${filme.titulo}" id="filme-imagem" class="img-fluid rounded-3 shadow-sm">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body p-4">
                                <h2 class="card-title text-primary fw-bold mb-3" id="filme-titulo">${filme.titulo}</h2>
                                <div class="mb-4">
                                    <dl class="row">
                                        <dt class="col-sm-4 fw-semibold">🎬 Diretor:</dt>
                                        <dd class="col-sm-8" id="filme-diretor">${filme.diretor}</dd>
                                        <dt class="col-sm-4 fw-semibold">📅 Lançamento:</dt>
                                        <dd class="col-sm-8" id="filme-ano">${filme.anoLancamento}</dd>
                                        <dt class="col-sm-4 fw-semibold">🗣️ Idioma:</dt>
                                        <dd class="col-sm-8" id="filme-idioma">${filme.idioma}</dd>
                                        <dt class="col-sm-4 fw-semibold">💾 Formato:</dt>
                                        <dd class="col-sm-8" id="filme-formato">${filme.formato}</dd>
                                        <dt class="col-sm-4 fw-semibold">⏱️ Duração:</dt>
                                        <dd class="col-sm-8" id="filme-duracao">${filme.duracao} min</dd>
                                        <dt class="col-sm-4 fw-semibold">🏷️ Categoria:</dt>
                                        <dd class="col-sm-8" id="filme-categoria">${filme.categoria}</dd>
                                    </dl>
                                </div>
                                <div>
                                    <h5 class="text-secondary fw-bold">📝 Sinopse</h5>
                                    <p class="text-justify" id="filme-sinopse">${filme.sinopse}</p>
                                </div>
                                <div class="mt-4 d-flex justify-content-end gap-2">
                                    <a href="editar-filme.html?id=${filme.id}" class="btn btn-warning">
                                        <i class="fas fa-edit me-1"></i> Editar
                                    </a>
                                    <button onclick="excluirFilme(${filme.id}, '${filme.titulo}')" class="btn btn-danger">
                                        <i class="fas fa-trash me-1"></i> Excluir
                                    </button>
                                    <a href="catalogo.html" class="btn btn-outline-primary">⬅️ Voltar ao Catálogo</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            `;
        })
        .catch(error => {
            console.error('Erro ao buscar detalhes do filme:', error);
            container.innerHTML = `<div class="alert alert-danger text-center"><h4>Oops!</h4><p>Não foi possível carregar os detalhes do filme. ${error.message}</p></div>`;
        });
});
