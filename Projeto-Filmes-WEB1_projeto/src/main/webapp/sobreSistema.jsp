<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%@ include file="styles/sobreSistema.jsp" %>

<section class="about-section container mt-5 mb-5 p-4 rounded">
    <h1 class="text-center mb-4 section-title">Sobre o Sistema</h1>

    <p class="about-intro text-center">
        Este sistema foi desenvolvido para facilitar o gerenciamento de filmes de forma intuitiva e eficiente.
        Com um design moderno e responsivo, ele permite que usuários realizem diversas ações de maneira prática.
    </p>

    <div class="about-actions row mt-5">
        <div class="col-md-6 mb-4">
            <div class="about-feature p-4">
                <h4><i class="bi bi-plus-circle-fill text-info me-2"></i>Adicionar novos filmes</h4>
                <p>Cadastre novos títulos com facilidade, incluindo informações como sinopse, gênero, e imagem promocional.</p>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="about-feature p-4">
                <h4><i class="bi bi-eye-fill text-info me-2"></i>Visualizar detalhes</h4>
                <p>Explore as informações completas de cada filme, organizadas de forma clara e acessível.</p>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="about-feature p-4">
                <h4><i class="bi bi-pencil-square text-info me-2"></i>Editar informações</h4>
                <p>Atualize dados dos filmes de forma simples e rápida, mantendo tudo sempre atualizado.</p>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="about-feature p-4">
                <h4><i class="bi bi-trash-fill text-danger me-2"></i>Excluir filmes</h4>
                <p>Remova filmes que não são mais necessários com segurança e praticidade.</p>
            </div>
        </div>
    </div>

    <p class="text-center mt-4 fst-italic">
        Criado com foco em <strong>usabilidade</strong>, <strong>eficiência</strong> e <strong>acessibilidade</strong> para todos os dispositivos.
    </p>
</section>

<section class="developers-section mt-5">
  <h2 class="section-title text-center mb-4">Conheça os Desenvolvedores</h2>
  <div class="developers-cards">
    <div class="dev-card">
      <img src="imagem/ana.jpeg" alt="Foto Ana Beatriz Rocha" class="dev-photo" />
      <h3 class="dev-name">Ana Beatriz Rocha</h3>
      <p class="dev-role">Desenvolvedora</p>
      <div class="dev-socials">
        <a href="https://www.linkedin.com/in/ana-beatriz-rocha-duarte-39046723a/" target="_blank" aria-label="LinkedIn Ana Beatriz">LinkedIn</a>
        <a href="#" target="_blank" aria-label="GitHub Ana Beatriz">GitHub</a>
      </div>
    </div>

    <div class="dev-card">
      <img src="imagem/rafael.jpeg" alt="Foto Rafael" class="dev-photo" />
      <h3 class="dev-name">Rafael Silva</h3>
      <p class="dev-role">Desenvolvedor</p>
      <div class="dev-socials">
        <a href="https://www.linkedin.com/in/rafael-matias-dev/" target="_blank" aria-label="LinkedIn Rafael">LinkedIn</a>
        <a href="#" target="_blank" aria-label="GitHub Rafael">GitHub</a>
      </div>
    </div>

    <div class="dev-card">
      <img src="imagem/otavio.jpeg" alt="Foto Otávio" class="dev-photo" />
      <h3 class="dev-name">Otavio Baroni</h3>
      <p class="dev-role">Desenvolvedor</p>
      <div class="dev-socials">
        <a href="https://www.linkedin.com/in/otaviobaroni/" target="_blank" aria-label="LinkedIn Otávio">LinkedIn</a>
        <a href="#" target="_blank" aria-label="GitHub Otávio">GitHub</a>
      </div>
    </div>
  </div>
</section>

<%@ include file="footer.jsp" %>
