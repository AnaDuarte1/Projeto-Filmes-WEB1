<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - CineWeb</title>
    <%@ include file="header.jsp" %>
</head>

<%@ include file="styles/login.jsp" %>


<body class="bg-light">
    <div class="container">
        <div class="login-container shadow">
            <div class="login-header">
                <h2><i class="fas fa-film me-2"></i>CineWeb</h2>
                <p class="text-muted">Acesse sua conta para gerenciar o catálogo</p>
            </div>
            
            <c:if test="${not empty errMessage}">
                <div class="alert alert-danger alert-dismissible fade show">
                    ${errMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success alert-dismissible fade show">
                    ${successMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            
            <form action="login" method="POST">
                <div class="mb-4">
                    <label for="email" class="form-label">E-mail</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                        <input type="email" class="form-control" id="email" name="email" 
                               placeholder="seu@email.com" required>
                    </div>
                </div>
                
                <div class="mb-4">
                    <label for="senha" class="form-label">Senha</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        <input type="password" class="form-control" id="senha" name="senha" 
                               placeholder="Sua senha" required>
                    </div>
                </div>
                
                <div class="d-grid gap-2 mb-3">
                    <button type="submit" class="btn btn-primary btn-login">
					    <i class="fas fa-sign-in-alt me-2"></i>Entrar
					</button>

                </div>
                
                <div class="text-center">
                    <p class="mb-1">Não tem uma conta? <a href="cadastrarUsuario.jsp">Cadastre-se</a></p>
                </div>
            </form>
        </div>
    </div>
    
    <%@ include file="footer.jsp" %>
</body>