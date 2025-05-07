<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filme - Visualização</title>
    <!-- Link para o Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Link para o CSS customizado -->
    <link href="css/style.css" rel="stylesheet">
</head>
<body>

<!-- Menu de navegação -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="home">Sistema de Filmes</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="listar-filmes">Listar Filmes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="sobre-sistema">Sobre</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login">Login</a>
            </li>
        </ul>
    </div>
</nav>
