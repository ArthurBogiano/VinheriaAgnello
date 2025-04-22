<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Vinheria Agnello</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
      <img src="https://vinheriaagnello.blob.core.windows.net/imagens/vinheria-agnello-logo.png" alt="Vinheria Logo">
    </div>
    <nav>
      <a href="#" class="active">Products</a>
      <a href="#">Suggestions</a>
      <a href="#">Community</a>
      <a href="#">Palate</a>
      <a href="#">Pricing</a>
      <a href="#">Contact</a>
      <a href="#">Link</a>
    </nav>
    <div class="actions">
      <button class="signin">Sign in</button>
      <button class="register">Register</button>
    </div>
  </header>
  <main class="container">
    <aside class="filters">
      <h3>Keywords</h3>
      <div>Cabernet</div><div>Merlot</div><div>Chardonnay</div>
      <h3>Languages</h3>
      <div><input type="checkbox" checked> French</div>
      <div><input type="checkbox" checked> Italian</div>
      <div><input type="checkbox" checked> Spanish</div>
      <h3>Types</h3>
      <div><input type="checkbox" checked> Dry</div>
      <div><input type="checkbox" checked> Sweet</div>
      <div><input type="checkbox" checked> White</div>
      <h3>Size</h3>
      <div><input type="checkbox" checked> 750 ml</div>
      <div><input type="checkbox"> 1 liter</div>
      <div><input type="checkbox"> 1.5 liter</div>
    </aside>
    <section class="products">
      <div class="search-bar">
        <input type="text" placeholder="Search for wines...">
        <div class="filter-buttons">
          <button class="selected">New</button>
          <button>Price ascending</button>
          <button>Price descending</button>
          <button>Rating</button>
        </div>
      </div>
      <div class="product-grid">
        <div class="card"><img src="https://vinheriaagnello.blob.core.windows.net/imagens/vaccaro.png"><h4>Vaccaro Chardonnay</h4><p>$15</p></div>
        <div class="card"><img src="https://vinheriaagnello.blob.core.windows.net/imagens/glaretta.png"><h4>Giaretta Merlot</h4><p>$20</p></div>
        <div class="card"><img src="https://vinheriaagnello.blob.core.windows.net/imagens/garziera.png"><h4>Garziera Cabernet</h4><p>$40</p></div>
        <div class="card"><img src="https://vinheriaagnello.blob.core.windows.net/imagens/quadretti.png"><h4>Quadretti Valpolicella</h4><p>$70</p></div>
        <div class="card"><img src="https://vinheriaagnello.blob.core.windows.net/imagens/guigal.png"><h4>Guigal Cotes Du Rhone</h4><p>$60</p></div>
        <div class="card"><img src="https://vinheriaagnello.blob.core.windows.net/imagens/laurona.png"><h4>Laurona Mitic</h4><p>$65</p></div>
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
      <div><h4>Use cases</h4><ul>
        <li>UI design</li><li>UX design</li><li>Wireframing</li><li>Diagramming</li><li>Brainstorming</li><li>Online whiteboard</li><li>Team collaboration</li>
      </ul></div>
      <div><h4>Explore</h4><ul>
        <li>Design</li><li>Prototyping</li><li>Development features</li><li>Design systems</li><li>Collaboration features</li><li>Design process</li><li>FigJam</li>
      </ul></div>
      <div><h4>Resources</h4><ul>
        <li>Blog</li><li>Best practices</li><li>Colors</li><li>Color wheel</li><li>Support</li><li>Developers</li><li>Resource library</li>
      </ul></div>
    </div>
  </footer>
</div>
</body>
</html>
