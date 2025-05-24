<style>
    body {
        background-color: #0d1117;
        color: #f8f9fa;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .error-container {
        text-align: center;
        padding: 5rem 2rem;
    }

    .error-icon {
        font-size: 6rem;
        color: #4fc3f7;
        margin-bottom: 2rem;
        animation: pulse 1.5s infinite;
    }

    @keyframes pulse {
        0%, 100% {
            transform: scale(1);
            opacity: 1;
        }
        50% {
            transform: scale(1.1);
            opacity: 0.8;
        }
    }

    .error-title {
        font-size: 3rem;
        font-weight: bold;
        color: #4fc3f7;
        margin-bottom: 1rem;
    }

    .error-message {
        font-size: 1.2rem;
        color: #cccccc;
        margin-bottom: 2rem;
    }

    .btn-home {
        background-color: #1976d2;
        color: #fff;
        padding: 0.75rem 2rem;
        border-radius: 30px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 1px;
        transition: all 0.3s ease;
        border: none;
        text-decoration: none;
    }

    .btn-home:hover {
        background-color: #4fc3f7;
        color: #212529;
        box-shadow: 0 5px 15px rgba(79, 195, 247, 0.4);
    }
</style>