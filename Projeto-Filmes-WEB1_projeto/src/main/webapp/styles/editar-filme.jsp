<style>
/* Container geral */
.edit-movie-container {
    background-color: #ffffff;
    padding: 40px;
    border-radius: 1rem;
    max-width: 900px;
    margin: 0 auto;
    margin-top: 40px;
    margin-bottom: 40px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

/* T�tulos e cabe�alhos */
.edit-movie-container h2 {
    font-weight: 700;
    color: #0d6efd;
}

/* Bot�es */
.edit-movie-container .btn {
    font-weight: 500;
    transition: all 0.2s ease-in-out;
}

.edit-movie-container .btn-primary {
    background-color: #0d6efd;
    border: none;
}

.edit-movie-container .btn-primary:hover {
    background-color: #0b5ed7;
}

.edit-movie-container .btn-danger:hover {
    background-color: #bb2d3b;
}

.edit-movie-container .btn-outline-secondary:hover {
    background-color: #e9ecef;
}

/* Campos do formul�rio */
.edit-movie-container .form-label {
    font-weight: 500;
    color: #333;
}

.edit-movie-container .form-control,
.edit-movie-container .form-select {
    border-radius: 0.5rem;
    padding: 10px;
    font-size: 15px;
}

/* Texto de ajuda */
.edit-movie-container small.text-muted {
    font-size: 13px;
}

/* Imagem atual */
.current-image {
    max-height: 200px;
    margin-top: 10px;
    border-radius: 10px;
    object-fit: contain;
}

/* Modal de exclus�o */
.modal-header.bg-danger {
    background-color: #dc3545 !important;
}

.modal-title {
    font-weight: 600;
}

/* Responsividade */
@media (max-width: 768px) {
    .edit-movie-container {
        padding: 20px;
    }
    
    .edit-movie-container .d-flex.justify-content-between {
        flex-direction: column;
        gap: 1rem;
    }
}
</style>
