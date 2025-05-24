<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<%@ include file="styles/erro.jsp" %>


<div class="error-container">
    <div class="error-icon">
        <i class="fas fa-exclamation-triangle"></i>
    </div>
    <h1 class="error-title">Algo deu errado</h1>
    <p class="error-message">Desculpe, não conseguimos completar sua solicitação.<br>
    Isso pode ter acontecido por um problema interno, ou pela tentativa de acessar uma página que não existe.</p>
    <a href="${pageContext.request.contextPath}/home" class="btn-home"><i class="fas fa-home me-2"></i>Voltar para a Home</a>
</div>

<%@ include file="footer.jsp" %>
