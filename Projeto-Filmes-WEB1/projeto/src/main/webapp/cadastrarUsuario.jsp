<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="header.jsp" %>

<div class="container mt-5">
    <h2>Cadastro de Usuário</h2>

    <form action="cadastrar" method="post">
        <div class="form-group">
            <label for="nome">Nome:</label>
            <input type="text" class="form-control" name="nome" required>
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" name="email" required>
        </div>

        <div class="form-group">
            <label for="senha">Senha:</label>
            <input type="password" class="form-control" name="senha" required>
        </div>

        <button type="submit" class="btn btn-primary">Cadastrar</button>
    </form>

    <div class="mt-3">
        <p style="color: red;"><%= request.getAttribute("mensagem") != null ? request.getAttribute("mensagem") : "" %></p>
    </div>
</div>

<%@ include file="footer.jsp" %>
