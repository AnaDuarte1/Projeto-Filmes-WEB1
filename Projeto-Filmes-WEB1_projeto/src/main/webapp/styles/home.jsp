<style>
    :root {
        --primary-blue: #1a237e;
        --secondary-blue: #1976d2;
        --accent-blue: #4fc3f7;
        --dark-bg: #0d1117;
        --light-text: #f8f9fa;
        --dark-text: #212529;
    }
    
    body {
        background-color: var(--dark-bg);
        color: var(--light-text);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    .hero-section {
        background: linear-gradient(135deg, var(--primary-blue) 0%, var(--secondary-blue) 100%);
        padding: 4rem 0;
        border-radius: 0 0 20px 20px;
        margin-bottom: 3rem;
        box-shadow: 0 10px 20px rgba(0,0,0,0.3);
    }
    
    .hero-title {
        font-size: 3.5rem;
        font-weight: 700;
        text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
    }
    
    .hero-subtitle {
        font-size: 1.5rem;
        opacity: 0.9;
    }
    
    .search-box {
        max-width: 600px;
        margin: 2rem auto;
    }
    
    .card {
        margin-bottom: 25px;
        border: none;
        border-radius: 12px;
        overflow: hidden;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        background: linear-gradient(145deg, #1e283c 0%, #162033 100%);
        box-shadow: 0 8px 15px rgba(0,0,0,0.2);
    }
    
    .card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 25px rgba(0,0,0,0.3);
    }
    
    .card-img-top {
        height: 450px;
  		object-fit: cover;
  		object-position: center;
  		border-top-left-radius: 10px;
  		border-top-right-radius: 10px;
    }
    
    .card-title {
        font-weight: 600;
        color: var(--accent-blue);
    }
    
    .card-text {
        color: rgba(255,255,255,0.7);
        font-size: 0.9rem;
    }
    
    .btn-custom {
        background-color: var(--secondary-blue);
        color: white;
        border: none;
        border-radius: 50px;
        padding: 8px 20px;
        font-weight: 500;
        transition: all 0.3s ease;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }
    
    .btn-custom:hover {
        background-color: var(--accent-blue);
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(79, 195, 247, 0.4);
    }
    
    .section-title {
        position: relative;
        margin-bottom: 2rem;
        font-weight: 700;
        color: var(--accent-blue);
    }
    
    .section-title:after {
        content: '';
        position: absolute;
        left: 0;
        bottom: -10px;
        width: 50px;
        height: 3px;
        background: var(--accent-blue);
    }
    
    .carousel {
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 10px 25px rgba(0,0,0,0.3);
        margin-bottom: 3rem;
    }
    
    .carousel-item {
        height: 500px;
    }
    
   .carousel-item img {
    width: 100%;
    height: auto;
    max-height: 500px;
    object-fit: cover;
    object-position: center;
    border-radius: 10px;
    image-rendering: auto;
}

    
    .carousel-caption {
        bottom: 30%;
        text-align: left;
        left: 10%;
        right: 10%;
    }
    
    .carousel-caption h5 {
        font-size: 2.5rem;
        font-weight: 700;
        text-shadow: 2px 2px 5px rgba(0,0,0,0.8);
    }
    
    .carousel-caption p {
        font-size: 1.1rem;
        max-width: 600px;
    }
    
    .carousel-control-prev, .carousel-control-next {
        width: 5%;
    }
  .category-badge {
        display: inline-block;
        background-color: rgba(79, 195, 247, 0.2);
        color: var(--accent-blue);
        padding: 5px 15px;
        border-radius: 50px;
        margin: 5px;
        transition: all 0.3s ease;
        cursor: pointer;
    }
    
    .category-badge:hover {
        background-color: var(--accent-blue);
        color: var(--dark-text);
        transform: scale(1.05);
    }
    
    .pagination .page-item .btn-custom {
    background-color: var(--secondary-blue);
    color: white;
    transition: all 0.3s ease;
    box-shadow: 0 4px 10px rgba(0,0,0,0.15);
	}
	
	
	.pagination .page-item .btn-custom:hover:not(.disabled) {
	    background-color: var(--accent-blue);
	    box-shadow: 0 6px 15px rgba(79, 195, 247, 0.3);
	    transform: translateY(-2px);
	}
	    
    
   footer {
	    background: linear-gradient(135deg, var(--primary-blue) 0%, #0d1117 100%);
	    color: var(--light-text);
	    width: 100%;
	    padding: 20px 0;
	}

    
    .no-image-placeholder {
        width: 100%;
        height: 300px;
        background: #1e283c;
        display: flex;
        align-items: center;
        justify-content: center;
        color: var(--accent-blue);
        font-size: 2rem;
    }
    
    .text-truncate-2 {
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    
    
    .estreias-section .card {
	    min-height: 130px; 
	    display: flex;
	    flex-direction: column;
	    justify-content: space-between;
	}
    
    
    
</style>