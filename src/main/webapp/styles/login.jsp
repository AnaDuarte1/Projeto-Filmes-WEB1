<style>
		:root {
	        --primary-color: #0d6efd;
	        --dark-blue: #0a58ca;
	        
        .login-container {
            max-width: 500px;
            margin: 5rem auto;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(13, 110, 253, 0.1);
            background-color: white;
        }
        .login-header {
            color: var(--dark-blue);
            text-align: center;
            margin-bottom: 2rem;
        }
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }
        .btn-login {
            background-color: var(--primary-color);
            border: none;
            padding: 10px 0;
            font-weight: 600;
            transition: all 0.3s;
        }
        .btn-login:hover {
            background-color: var(--dark-blue);
            transform: translateY(-2px);
        }
</style>