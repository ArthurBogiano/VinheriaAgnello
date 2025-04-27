<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Products" %>
<%@ page import="java.util.List" %>

<%
  List<Products> products = Products.getAllProducts();
%>

<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Vinheria Agnello</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="https://vinheriaagnello.blob.core.windows.net/imagens/vinheria-agnello-logo.png" type="image/x-icon">
  <style>
  * {
    box-sizing: border-box;
  }
  
  html, body {
    height: 100%;
    margin: 0;
  }
  
  body {
    font-family: Arial, sans-serif;
    background: linear-gradient(to bottom right, #422225, #e8bcb9);
  }
  
  .layout {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
  }
  
  header {
    background-color: #e8bcb9;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-between;
    padding: 15px 40px;
  }
  
  nav {
    display: flex;
    flex-wrap: wrap;
    gap: 40px;
  }
  
  nav a {
    text-decoration: none;
    color: #2c1a1a;
    font-weight: bold;
    padding: 6px 12px;
    border-radius: 8px;
    transition: background 0.2s ease, color 0.2s ease;
  }
  
  nav a:hover {
    background-color: #d9b3af;
  }
  
  nav a.active {
    background-color: white;
    border: 2px solid #2c1a1a;
  }
  
  .actions button {
    margin-left: 10px;
    padding: 8px 16px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
  }
  
  .signin {
    background-color: white;
  }
  
  .register {
    background-color: black;
    color: white;
  }
  
  .search-bar {
    padding: 20px 0;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-between;
    gap: 15px;
  }
  
  .search-bar input {
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
    width: 250px;
  }
  
  .filter-buttons button {
    background-color: white;
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 8px 14px;
    cursor: pointer;
    margin-left: 10px;
    font-weight: bold;
    transition: background 0.2s ease, color 0.2s ease;
  }
  
  .filter-buttons button:hover {
    background-color: #e8d1cf;
  }
  
  .filter-buttons .selected {
    background-color: #2c1a1a;
    color: white;
    border-color: #2c1a1a;
  }
  
  main.container {
    flex: 1;
    display: flex;
    padding: 30px 50px;
    flex-wrap: wrap;
  }
  
  .filters {
    width: 250px;
    background-color: #f8f0ef;
    border-radius: 8px;
    padding: 20px;
    margin-right: 30px;
    font-size: 14px;
    flex-shrink: 0;
  }
  
  .filters h3 {
    margin-top: 20px;
  }
  
  .filters input[type="checkbox"] {
    margin-right: 8px;
  }
  
  .products {
    flex: 1;
  }
  
  .product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
    gap: 25px;
  }
  
  .card {
    background-color: white;
    border-radius: 10px;
    padding: 10px;
    text-align: center;
    justify-items: center;
    overflow: hidden;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  }
  
  .card img {
    height: 220px;
    object-fit: contain;
  }
  
  .card h4 {
    margin: 10px 0 5px;
    font-size: 16px;
  }
  
  .card p {
    font-weight: bold;
    color: #222;
  }
  
  footer {
    background-color: #e8bcb9;
    padding: 60px 40px;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    color: #2c1a1a;
    font-size: 14px;
  }
  
  .footer-left {
    display: flex;
    flex-direction: column;
    gap: 20px;
    align-items: center;
  }
  
  .footer-socials img {
    height: 24px;
    margin-right: 15px;
    cursor: pointer;
  }
  
  .footer-columns {
    display: flex;
    gap: 120px;
    flex-wrap: wrap;
    flex: 1;
    justify-content: center;
  }
  
  .footer-columns h4 {
    margin-bottom: 12px;
    font-size: 15px;
  }
  
  .footer-columns ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }
  
  .footer-columns ul li {
    margin: 15px 0;
    color: #2c1a1a;
  }
  
  @media (max-width: 900px) {
    main.container {
    flex-direction: column;
    padding: 20px;
    }
  
    .filters {
    width: 100%;
    margin-bottom: 20px;
    }
  
    .search-bar {
    flex-direction: column;
    align-items: flex-start;
    padding: 20px;
    }
  
    .search-bar input {
    width: 100%;
    }
  
    .filter-buttons {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    }
  }
  </style>  
</head>
<body>
<div class="layout">
  <header>
  <div class="logo">
    <img src="https://vinheriaagnello.blob.core.windows.net/imagens/vinheria-agnello-logo.png" alt="Logo da Vinheria">
  </div>
  <nav>
    <a href="#" class="active">Produtos</a>
    <a href="#">Sugestões</a>
    <a href="#">Comunidade</a>
    <a href="#">Paladar</a>
    <a href="#">Preços</a>
    <a href="#">Contato</a>
    <a href="#">Link</a>
  </nav>
  <div class="actions">
    <button onclick="location.href = '/VinheriaAgnello/login.jsp'" class="signin">Entrar</button>
  </div>
  </header>
  <main class="container">
  <aside class="filters">
    <h3>Palavras-chave</h3>
    <div>Cabernet</div><div>Merlot</div><div>Chardonnay</div>
    <h3>Idiomas</h3>
    <div><input type="checkbox" checked> Francês</div>
    <div><input type="checkbox" checked> Italiano</div>
    <div><input type="checkbox" checked> Espanhol</div>
    <h3>Tipos</h3>
    <div><input type="checkbox" checked> Seco</div>
    <div><input type="checkbox" checked> Doce</div>
    <div><input type="checkbox" checked> Branco</div>
    <h3>Tamanho</h3>
    <div><input type="checkbox" checked> 750 ml</div>
    <div><input type="checkbox"> 1 litro</div>
    <div><input type="checkbox"> 1,5 litro</div>
  </aside>
  <section class="products">
    <div class="search-bar">
    <input type="text" placeholder="Buscar vinhos...">
    <div class="filter-buttons">
      <button class="selected">Novos</button>
      <button>Preço crescente</button>
      <button>Preço decrescente</button>
      <button>Avaliação</button>
    </div>
    </div>
    <div class="product-grid">
    <% int index = 0; %>
      <% for (Products p : products) { %>
        <div class="card">
        <% if (p.getImageUrl() != null && !p.getImageUrl().isEmpty()) { %>
          <img src="<%= p.getImageUrl() %>">
        <% } else { %>
          <img src="/VinheriaAgnello/assets/img/sem-foto.png">
        <% } %>
          <h4><%= p.getName() %></h4>
          <spam><%= p.getDescription() %></spam>
          <p>R$ <%= p.getPrice() %></p>
        </div>
        <% index++; %>
      <% } %>
    </div>
  </section>
  </main>
  <footer>
  <div class="footer-left">
    <img src="https://vinheriaagnello.blob.core.windows.net/imagens/vinheria-agnello-logo.png">
    <div class="footer-socials">
    <img src="https://vinheriaagnello.blob.core.windows.net/imagens/x-logo.png">
    <img src="https://vinheriaagnello.blob.core.windows.net/imagens/instagram-logo.png">
    <img src="https://vinheriaagnello.blob.core.windows.net/imagens/youtube-logo.png">
    <img src="https://vinheriaagnello.blob.core.windows.net/imagens/linkedin-logo.png">
    </div>
  </div>
  <div class="footer-columns">
    <div><h4>Casos de uso</h4><ul>
    <li>Design de UI</li><li>Design de UX</li><li>Wireframing</li><li>Diagramas</li><li>Brainstorming</li><li>Quadro branco online</li><li>Colaboração em equipe</li>
    </ul></div>
    <div><h4>Explorar</h4><ul>
    <li>Design</li><li>Prototipagem</li><li>Recursos de desenvolvimento</li><li>Sistemas de design</li><li>Recursos de colaboração</li><li>Processo de design</li><li>FigJam</li>
    </ul></div>
    <div><h4>Recursos</h4><ul>
    <li>Blog</li><li>Melhores práticas</li><li>Cores</li><li>Roda de cores</li><li>Suporte</li><li>Desenvolvedores</li><li>Biblioteca de recursos</li>
    </ul></div>
  </div>
  </footer>
</div>
</body>
</html>
