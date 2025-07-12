<style>
.about-section {
    background: linear-gradient(135deg, #1e283c 0%, #162033 100%);
    color: #f8f9fa;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.4);
    border-radius: 15px;
}

.about-section .section-title {
    font-weight: 700;
    font-size: 2.5rem;
    color: #4fc3f7;
    text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
}

.about-intro {
    font-size: 1.1rem;
    max-width: 800px;
    margin: 0 auto;
    line-height: 1.6;
    opacity: 0.9;
}

.about-feature {
    height: 100%;
    min-height: 150px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    background-color: rgba(255, 255, 255, 0.05);
    border-radius: 10px;
    transition: transform 0.3s ease, background-color 0.3s ease;
    color: rgba(255,255,255,0.9);
}


.about-feature:hover {
    background-color: rgba(79, 195, 247, 0.05);
    transform: translateY(-5px);
}

.about-feature h4 {
    font-size: 1.2rem;
    font-weight: 600;
    margin-bottom: 0.5rem;
}

.about-feature p {
    font-size: 0.95rem;
    line-height: 1.5;
}

/* �cones Bootstrap */
.bi {
    font-size: 1.3rem;
    vertical-align: middle;
}

.developers-section {
  padding: 2rem 0;
  background: linear-gradient(135deg, #1a237e, #1976d2);
  color: #f8f9fa;
  border-radius: 15px;
  box-shadow: 0 10px 25px rgba(0,0,0,0.3);
}

.developers-section .section-title {
  font-weight: 700;
  font-size: 2.5rem;
  margin-bottom: 3rem;
  color: #4fc3f7;
}

.developers-cards {
  display: flex;
  gap: 2rem;
  justify-content: center;
  flex-wrap: wrap;
}

.dev-card {
  background: #162033;
  border-radius: 15px;
  padding: 1.5rem 1rem 2rem;
  width: 250px;
  text-align: center;
  box-shadow: 0 6px 15px rgba(0,0,0,0.4);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.dev-card:hover {
  transform: translateY(-10px);
  box-shadow: 0 15px 30px rgba(79, 195, 247, 0.6);
}

.dev-photo {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid #4fc3f7;
  margin-bottom: 1rem;
}

.dev-name {
  font-size: 1.3rem;
  font-weight: 700;
  margin-bottom: 0.3rem;
  color: #4fc3f7;
}

.dev-role {
  font-size: 1rem;
  font-weight: 400;
  margin-bottom: 1rem;
  color: rgba(255,255,255,0.7);
}

.dev-socials a {
  color: #4fc3f7;
  margin: 0 0.5rem;
  text-decoration: none;
  font-weight: 600;
  transition: color 0.3s ease;
}

.dev-socials a:hover {
  color: #ffffff;
  text-decoration: underline;
}



/* Responsivo */
@media (max-width: 768px) {
  .developers-cards {
    flex-direction: column;
    align-items: center;
  }

  .dev-card {
    width: 80%;
    margin-bottom: 2rem;
  }
}

</style>