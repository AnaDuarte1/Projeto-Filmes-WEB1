<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<div class="container mt-5">
    <h1 class="text-center">Login</h1>

    <%
        String errMessage = (String) request.getAttribute("errMessage");
        if (errMessage != null) {
    %>
        <div class="alert alert-danger text-center">
            <%= errMessage %>
        </div>
    <%
        }
    %>

    <form action="LoginServlet" method="POST">
        <div class="form-group">
            <label for="email">E-mail</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>

        <div class="form-group">
            <label for="senha">Senha</label>
            <input type="password" class="form-control" id="senha" name="senha" required>
        </div>

        <button type="submit" class="btn btn-primary">Entrar</button>
    </form>
</div>

<%@ include file="footer.jsp" %>
