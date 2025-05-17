<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty error}">
    <div class="alert alert-danger">
        ${error}
    </div>
</c:if>
<%@ include file="header.jsp" %>
    <style>
        body {
            padding: 20px;
            background-color: #f8f9fa;
        }
        .form-container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-title {
            text-align: center;
            margin-bottom: 30px;
            color: #0d6efd;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h1 class="form-title">Adicionar Novo Filme</h1>
            
<form action="criar-filme" method="post" enctype="multipart/form-data">
    <input type="hidden" name="action" value="adicionar">
                
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="titulo" class="form-label">Título</label>
                        <input type="text" class="form-control" id="titulo" name="titulo" required>
                    </div>
                    <div class="col-md-6">
                        <label for="diretor" class="form-label">Diretor</label>
                        <input type="text" class="form-control" id="diretor" name="diretor" required>
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="sinopse" class="form-label">Sinopse</label>
                    <textarea class="form-control" id="sinopse" name="sinopse" rows="3" required></textarea>
                </div>
                
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label for="anoLancamento" class="form-label">Ano de Lançamento</label>
                        <input type="number" class="form-control" id="anoLancamento" name="anoLancamento" min="1900" max="2025" required>
                    </div>
                    <div class="col-md-4">
                        <label for="idioma" class="form-label">Idioma</label>
                        <input type="text" class="form-control" id="idioma" name="idioma" required>
                    </div>
                    <div class="col-md-4">
                        <label for="duracao" class="form-label">Duração (minutos)</label>
                        <input type="number" class="form-control" id="duracao" name="duracao" min="1" required>
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="formato" class="form-label">Formato</label>
                    <select class="form-select" id="formato" name="formato" required>
                        <option value="" selected disabled>Selecione...</option>
                        <option value="DVD">DVD</option>
                        <option value="Blu-ray">Blu-ray</option>
                        <option value="Digital">Digital</option>
                        <option value="Outro">Outro</option>
                    </select>
                </div>
                
                <div class="mb-3">
                    <label for="imagem" class="form-label">Capa do Filme</label>
                    <input class="form-control" type="file" id="imagem" name="imagem" accept="image/*">
                </div>
                
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <a href="<c:url value='/filme?action=listar'/>" class="btn btn-secondary me-md-2">Cancelar</a>
                    <button type="submit" class="btn btn-primary">Adicionar Filme</button>
                </div>
                
                
            </form>
        </div>
    </div>

   <%@ include file="footer.jsp" %>

</body>
</html>