<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ page import="br.edu.ifsp.arq.model.Filme" %>
<%@ page import="br.edu.ifsp.arq.dao.FilmeDAO" %>

<%
    FilmeDAO filmeDAO = new FilmeDAO();
    int id = Integer.parseInt(request.getParameter("id"));
    Filme filme = filmeDAO.buscarPorId(id);
%>

    <div class="container mt-4">
        <h1>Editar Filme</h1>
        <form action="/atualizar-filme" method="post">
            <input type="hidden" name="id" value="<%= filme.getId() %>">
            <div class="form-group">
                <label for="titulo">Título</label>
                <input type="text" class="form-control" id="titulo" name="titulo" value="<%= filme.getTitulo() %>" required>
            </div>
            <div class="form-group">
                <label for="diretor">Diretor</label>
                <input type="text" class="form-control" id="diretor" name="diretor" value="<%= filme.getDiretor() %>" required>
            </div>
            <div class="form-group">
                <label for="anoLancamento">Ano de Lançamento</label>
                <input type="number" class="form-control" id="anoLancamento" name="anoLancamento" value="<%= filme.getAnoLancamento() %>" required>
            </div>
            <div class="form-group">
                <label for="sinopse">Sinopse</label>
                <textarea class="form-control" id="sinopse" name="sinopse" required><%= filme.getSinopse() %></textarea>
            </div>
            <div class="form-group">
                <label for="idioma">Idioma</label>
                <input type="text" class="form-control" id="idioma" name="idioma" value="<%= filme.getIdioma() %>" required>
            </div>
            <div class="form-group">
                <label for="formato">Formato</label>
                <input type="text" class="form-control" id="formato" name="formato" value="<%= filme.getFormato() %>" required>
            </div>
            <div class="form-group">
                <label for="duracao">Duração (minutos)</label>
                <input type="number" class="form-control" id="duracao" name="duracao" value="<%= filme.getDuracao() %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Atualizar Filme</button>
            <a href="home.jsp" class="btn btn-secondary">Cancelar</a>
        </form>
    </div>

<%@ include file="footer.jsp" %>
