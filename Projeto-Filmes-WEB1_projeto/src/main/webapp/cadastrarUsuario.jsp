<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<div class="container mt-5">
    <h1 class="text-center">Cadastro</h1>

    <%
        String errMessage = (String) request.getAttribute("errMessage");
        if (errMessage != null) {
    %>
        <script>
            alert("<%= errMessage %>"); // Exibe um alert com a mensagem de erro
        </script>
    <%
        }
    %>

    <form action="cadastrar" method="POST">
        <div class="form-group">
            <label for="nome">Nome</label>
            <input type="text" class="form-control" id="nome" name="nome" required>
        </div>

        <div class="form-group">
            <label for="email">E-mail</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>

        <div class="form-group">
            <label for="senha">Senha</label>
            <input type="password" class="form-control" id="senha" name="senha" required>
        </div>

        <button type="submit" class="btn btn-primary">Cadastrar</button>
    </form>
</div>

<%@ include file="footer.jsp" %>