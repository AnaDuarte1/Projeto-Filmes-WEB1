<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<div class="container mt-5">
    <h1 class="text-center">Login</h1>

    <form action="login" method="POST">
        <div class="form-group">
            <label for="username">Usuário</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>

        <div class="form-group">
            <label for="password">Senha</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>

        <button type="submit" class="btn btn-primary">Entrar</button>
    </form>
</div>

<%@ include file="footer.jsp" %>
