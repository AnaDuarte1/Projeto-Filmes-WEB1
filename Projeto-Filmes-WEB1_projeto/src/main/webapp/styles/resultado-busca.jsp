<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #121212;
        color: #E0FFFF;
    }
    
    .card-title {
	    font-size: 1.5rem;
	    margin-bottom: 10px;
	    color: #ffffff; /* cor clara */
	    text-align: center; /* centraliza o t�tulo */
	}
    

    h3 {
        color: #E0FFFF;
        text-align: center;
        margin-bottom: 30px;
    }

    .card {
        background-color: #1f1f1f;
        border: none;
        border-radius: 15px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.7);
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 20px rgba(255, 255, 255, 0.1);
    }

    .card-img-top {
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
        object-fit: cover;
        height: 250px;
    }

    .card-title {
        font-size: 1.5rem;
        margin-bottom: 10px;
    }

    .card-text {
        color: #ccc;
        font-size: 0.95rem;
    }

    .container {
        padding-top: 40px;
        padding-bottom: 40px;
    }

    .no-result {
        text-align: center;
        font-size: 1.5rem;
        margin-top: 50px;
        color: #bbb;
    }

    @media (max-width: 768px) {
        .card-img-top {
            height: 200px;
        }
    }
</style>
