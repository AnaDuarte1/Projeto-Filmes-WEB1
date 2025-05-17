<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ page import="br.edu.ifsp.arq.model.Filme" %>
<%@ page import="br.edu.ifsp.arq.dao.FilmeDAO" %>


 <div class="container mt-5">
        <div class="card">
            <div class="card-header">
                <h2>${filme.titulo}</h2>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <c:if test="${not empty filme.imagem}">
    						<img src="${filme.imagem}" class="img-fluid" alt="Capa do filme">
						</c:if>
                    </div>
                    <div class="col-md-8">
                        <dl class="row">
                            <dt class="col-sm-3">Diretor:</dt>
                            <dd class="col-sm-9">${filme.diretor}</dd>
                            
                            <dt class="col-sm-3">Ano de Lançamento:</dt>
                            <dd class="col-sm-9">${filme.anoLancamento}</dd>
                            
                            <dt class="col-sm-3">Idioma:</dt>
                            <dd class="col-sm-9">${filme.idioma}</dd>
                            
                            <dt class="col-sm-3">Formato:</dt>
                            <dd class="col-sm-9">${filme.formato}</dd>
                            
                            <dt class="col-sm-3">Duração:</dt>
                            <dd class="col-sm-9">${filme.duracao} minutos</dd>
                        </dl>
                        
                        <h4>Sinopse</h4>
                        <p>${filme.sinopse}</p>
                    </div>
                </div>
            </div>
          </div>
        </div>
    </div>


<%@ include file="footer.jsp" %>
