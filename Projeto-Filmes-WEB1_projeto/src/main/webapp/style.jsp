<%@ page contentType="text/css; charset=UTF-8"%>
<style>
:root {
    --primary-color: #0d6efd;
    --dark-blue: #052c65;
    --light-blue: #d1e3ff;
}

body {
    background-color: #f8f9fa;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.navbar {
    background-color: var(--dark-blue) !important;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.navbar-brand {
    font-weight: 700;
    color: white !important;
}

.carousel-item {
    height: 500px;
    background-size: cover;
    background-position: center;
}

.carousel-caption {
    background: rgba(0, 0, 0, 0.7);
    border-radius: 10px;
    padding: 20px;
    bottom: 50px;
}

.movie-card {
    transition: all 0.3s ease;
    border: none;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    background-color: white;
}

.movie-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 10px 20px rgba(13, 110, 253, 0.2);
}

.movie-card .card-img-top {
    height: 300px;
    object-fit: cover;
}

.movie-card .card-body {
    padding: 15px;
}

.movie-card .card-title {
    font-weight: 600;
    color: var(--dark-blue);
    margin-bottom: 10px;
}

.movie-card .card-text {
    color: #6c757d;
    font-size: 0.9rem;
}

.movie-card .btn {
    background-color: var(--primary-color);
    border: none;
    width: 100%;
}

.movie-card .btn:hover {
    background-color: var(--dark-blue);
}

.section-title {
    color: var(--dark-blue);
    position: relative;
    padding-bottom: 10px;
    margin-bottom: 30px;
    font-weight: 700;
}

.section-title:after {
    content: '';
    position: absolute;
    left: 0;
    bottom: 0;
    width: 50px;
    height: 3px;
    background-color: var(--primary-color);
}

footer {
    background-color: var(--dark-blue);
    color: white;
    padding: 30px 0;
    margin-top: 50px;
}

/* Modal styles */
.modal-content {
    border-radius: 15px;
    border: none;
}

.modal-header {
    background-color: var(--primary-color);
    color: white;
    border-radius: 15px 15px 0 0;
}

.modal-body img {
    border-radius: 10px;
    margin-bottom: 20px;
    max-height: 400px;
    object-fit: cover;
    width: 100%;
}
</style>