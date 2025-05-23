<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CineWeb - ${param.title}</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    
</head>

<%@ include file="styles/header.jsp" %>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="home">
                <i class="fas fa-film me-2"></i>CineWeb
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item ${param.activePage == 'filmes' ? 'active' : ''}">
                        <a class="nav-link" href="listar-filmes">
                            <i class="fas fa-list me-1"></i> Catalogo
                        </a>
                    </li>
                    <c:if test="${not empty sessionScope.usuarioLogado}">
                        <li class="nav-item ${param.activePage == 'adicionar' ? 'active' : ''}">
                            <a class="nav-link" href="cadastrar.jsp">
                                <i class="fas fa-plus-circle me-1"></i> Adicionar Filme
                            </a>
                        </li>
                    </c:if>
                    <li class="nav-item ${param.activePage == 'sobre' ? 'active' : ''}">
                        <a class="nav-link" href="sobreSistema.jsp">
                            <i class="fas fa-info-circle me-1"></i> Sobre
                        </a>
                    </li>
                    <c:choose>
                        <c:when test="${not empty sessionScope.usuarioLogado}">
                            <li class="nav-item">
                                <a class="nav-link text-warning" href="logout">
                                    <i class="fas fa-sign-out-alt me-1"></i> Sair
                                </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item ${param.activePage == 'login' ? 'active' : ''}">
                                <a class="nav-link" href="login.jsp">
                                    <i class="fas fa-sign-in-alt me-1"></i> Login
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>