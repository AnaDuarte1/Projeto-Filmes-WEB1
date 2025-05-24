<%@ include file="header.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.ifsp.arq.model.Filme" %>

     <style>
 body {
    font-family: Arial, sans-serif;
    background-color: #121212; /* Fundo escuro */
    color: #ffffff; /* Texto branco */
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.resultados {
    display: flex;
    justify-content: space-around;
    margin-top: 20px;
}

.card {
    background-color: #1e1e1e; /* Fundo mais escuro para os cards */
    border-radius: 15px; /* Bordas arredondadas */
    padding: 20px;
    width: 300px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5); /* Sombra sutil */
    text-align: center;
    color: #ffffff;
}

.card img {
    border-radius: 10%; /* Imagem circulada */
    width: auto;
    height: 100px;
}

.card h2 {
    font-size: 24px;
    margin: 10px 0;
}

.card p {
    margin: 5px 0;
}

.social-links {
    display: flex;
    justify-content: center;
    gap: 10px; /* Espaçamento entre os ícones */
}

.social-links a {
    color: #ffffff; /* Ícones brancos */
    text-decoration: none;
    font-size: 18px;
}

/* Efeito ao passar o mouse nos cards */
.card:hover {
    transform: scale(1.05);
    transition: transform 0.3s ease;
}


    </style>
    
    <main class="container mt-4">
            <h3>Resultados da Busca</h3>
        <div class="row">
            <c:if test="${not empty filmes}">
                <c:forEach var="filme" items="${filmes}">
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <img src="${filme.imagem}" class="card-img-top" alt="${filme.titulo}">
                            <div class="card-body">
                                <h5 class="card-title">${filme.titulo}</h5>
                                <p class="card-text">Diretor: ${filme.diretor}</p>
                                <p class="card-text">Ano de Lançamento: ${filme.anoLancamento}</p>
                                <p class="card-text">Sinopse: ${filme.sinopse}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty filmes}">
                <div class="col-12">
                    <h2>Nenhum filme encontrado para a sua busca.</h2>
                </div>
            </c:if>
        </div>
    </main>

<%@ include file="footer.jsp" %>
