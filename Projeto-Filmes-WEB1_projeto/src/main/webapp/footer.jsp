<footer class="bg-dark text-white pt-4 pb-3 mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-4 mb-md-0">
                <h5 class="text-primary mb-3"><i class="fas fa-film me-2"></i>CineWeb</h5>
                <p class="text-muted">O melhor catalogo de filmes online para os amantes de cinema.</p>
                <div class="social-icons mt-3">
                    <a href="#" class="text-white me-3"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="text-white me-3"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="text-white me-3"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-white"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
            
            <div class="col-md-4 mb-4 mb-md-0">
                <h5 class="text-primary mb-3">Links Uteis</h5>
                <ul class="list-unstyled">
                    <li class="mb-2"><a href="listar-filmes" class="text-white text-decoration-none">Catalogo de Filmes</a></li>
                    <li class="mb-2"><a href="sobreSistema.jsp" class="text-white text-decoration-none">Sobre o Sistema</a></li>
                    <li class="mb-2"><a href="cadastrar.jsp" class="text-white text-decoration-none">Adicionar Filme</a></li>
                    <li><a href="login.jsp" class="text-white text-decoration-none">Área do Administrador</a></li>
                </ul>
            </div>
            
            <div class="col-md-4">
                <h5 class="text-primary mb-3">Contato</h5>
                <ul class="list-unstyled text-muted">
                    <li class="mb-2"><i class="fas fa-envelope me-2"></i> contato@cineweb.com</li>
                    <li class="mb-2"><i class="fas fa-phone me-2"></i> (11) 1234-5678</li>
                    <li><i class="fas fa-map-marker-alt me-2"></i> São Paulo, SP</li>
                </ul>
            </div>
        </div>
        
        <hr class="my-4 bg-light">
        
        <div class="row">
            <div class="col-md-6 text-center text-md-start">
                <p class="mb-0">&copy; 2025 <span class="text-primary">CineWeb</span>. Todos os direitos reservados.</p>
            </div>
            <div class="col-md-6 text-center text-md-end">
                <p class="mb-0">Desenvolvido por <span class="text-primary">Ana Beatriz, Rafael e Otavio</span> - IFSP</p>
            </div>
        </div>
    </div>
</footer>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
<script>
    // Efeito de hover nos links do footer
    $(document).ready(function() {
        $('footer a').hover(function() {
            $(this).css('color', '#0d6efd');
        }, function() {
            $(this).css('color', 'white');
        });
    });
</script>