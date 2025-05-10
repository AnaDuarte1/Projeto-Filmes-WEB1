<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ page import="br.edu.ifsp.arq.model.Filme" %>
<%@ page import="br.edu.ifsp.arq.dao.FilmeDAO" %>

<%
    FilmeDAO filmeDAO = new FilmeDAO();
    int id = Integer.parseInt(request.getParameter("id"));
    Filme filme = filmeDAO.getFilme(id);
%>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Filmes</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="sobreSistema.jsp">Sobre o Sistema</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
            </ul>
        </div>
    </nav>

    <div class="container mt-4">
        <h1><%= filme.getTitulo() %></h1>
        <p><strong>Diretor:</strong> <%= filme.getDiretor() %></p>
        <p><strong>Ano de Lançamento:</strong> <%= filme.getAnoLancamento() %></p>
        <p><strong>Sinopse:</strong> <%= filme.getSinopse() %></p>
        <p><strong>Idioma:</strong> <%= filme.getIdioma() %></p>
        <p><strong>Formato:</strong> <%= filme.getFormato() %></p>
        <p><strong>Duração:</strong> <%= filme.getDuracao() %> minutos</p>
        <a href="editar-filme?id=<%= filme.getId() %>" class="btn btn-warning">Editar</a>
        <a href="excluir-filme?titulo=<%= filme.getTitulo() %>" class="btn btn-danger">Excluir</a>
        <a href="home.jsp" class="btn btn-secondary">Voltar</a>
    </div>

<%@ include file="footer.jsp" %>
