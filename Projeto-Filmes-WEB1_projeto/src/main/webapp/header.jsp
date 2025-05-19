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
    <style>
        .navbar {
            background-color: #052c65 !important;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .navbar-brand {
            font-weight: 700;
            color: white !important;
            font-size: 1.5rem;
        }
        .navbar-brand:hover {
            color: #d1e3ff !important;
        }
        .nav-link {
            color: rgba(255, 255, 255, 0.85) !important;
            font-weight: 500;
            padding: 0.5rem 1rem;
            margin: 0 0.2rem;
            border-radius: 4px;
            transition: all 0.3s ease;
        }
        .nav-link:hover {
            color: white !important;
            background-color: rgba(255, 255, 255, 0.1);
        }
        .nav-link.active {
            color: white !important;
            background-color: rgba(255, 255, 255, 0.2);
        }
        .navbar-toggler {
            border-color: rgba(255, 255, 255, 0.1);
        }
        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3e%3cpath stroke='rgba(255, 255, 255, 0.8)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
        }
    </style>
</head>
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
                            <i class="fas fa-list me-1"></i> Catálogo
                        </a>
                    </li>
                    <c:if test="${not empty sessionScope.usuarioLogado}">
                        <li class="nav-item ${param.activePage == 'adicionar' ? 'active' : ''}">
                            <a class="nav-link" href="adicionar.jsp">
                                <i class="fas fa-plus-circle me-1"></i> Adicionar Filme
                            </a>
                        </li>
                    </c:if>
                    <li class="nav-item ${param.activePage == 'sobre' ? 'active' : ''}">
                        <a class="nav-link" href="sobre.jsp">
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