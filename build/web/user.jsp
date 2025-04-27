<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Products, model.Sales, model.User" %>
<%@ page import="java.util.List" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String message = "";
    if (request.getParameter("buy") != null) {
        int productId = Integer.parseInt(request.getParameter("product_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Products product = Products.getProductById(productId);

        if (product != null && quantity <= product.getStock()) {
            Sales sale = new Sales();
            sale.setUserId(user.getId());
            sale.setProductId(productId);
            sale.setQuantity(quantity);
            sale.setTotalPrice(product.getPrice() * quantity);
            sale.save();

            message = "<div class='alert alert-success'>Compra realizada com sucesso!</div>";
        } else {
            message = "<div class='alert alert-danger'>Quantidade indisponível!</div>";
        }
    }

    List<Products> products = Products.getAllProducts();
%>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="assets/css/style2.css" />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Icons+Sharp"
    />
    <title>Painel Administrativo</title>
  </head>

  <body>
    <div class="container">
      <aside>
        <div class="top">
          <div class="logo">
            <img src="assets/img/logo.jpg" />
            <h2>Vinharia <span class="darkblue"> Agnello</span></h2>
          </div>
          <div class="close" id="close-btn"></div>
          <span class="material-icons-sharp">close</span>
        </div>

        <div class="sidebar">
          <a href="#">
            <span class="material-icons-sharp">grid_view</span>
            <h3>Painel</h3>
          </a>

          <a href="#">
            <span class="material-icons-sharp">person_outline</span>
            <h3>Produtos</h3>
          </a>

          <a href="#" class="active">
            <span class="material-icons-sharp">receipt_long</span>
            <h3>Pedidos</h3>
          </a>

          <a href="#">
            <span class="material-icons-sharp">insights</span>
            <h3>Analíticos</h3>
          </a>

          <a href="#">
            <span class="material-icons-sharp">mail_outline</span>
            <h3>Mensagens</h3>
            <span class="message-count">26</span>
          </a>

          <a href="#">
            <span class="material-icons-sharp">inventory</span>
            <h3>Produtos</h3>
          </a>

          <a href="#">
            <span class="material-icons-sharp">error_outline</span>
            <h3>Relatórios</h3>
          </a>

          <a href="#">
            <span class="material-icons-sharp">settings</span>
            <h3>Configurações</h3>
          </a>

          <a href="logout.jsp">
            <span class="material-icons-sharp">logout</span>
            <h3>Sair</h3>
          </a>
        </div>
      </aside>

      <main>
        <h1>Painel</h1>

        <div class="date">
          <input type="date" />
        </div>

        <div class="insights">
          <div class="sales">
            <span class="material-icons-sharp">analytics</span>
            <div class="middle">
              <div class="left">
                <h3>Total na Carteira</h3>
                <h1>R$77.424,67</h1>
              </div>

              <div class="progress">
                <svg>
                  <circle cx="38" cy="38" r="36"></circle>
                </svg>

                <div class="number">
                  <p>81%</p>
                </div>
              </div>
            </div>
            <small class="text-muted">Últimas 24 Horas</small>
          </div>

          <div class="expenses">
            <span class="material-icons-sharp">bar_chart</span>
            <div class="middle">
              <div class="left">
                <h3>Produtos Comprados</h3>
                <h1>2.792</h1>
              </div>

              <div class="progress">
                <svg>
                  <circle cx="38" cy="38" r="36"></circle>
                </svg>

                <div class="number">
                  <p>62%</p>
                </div>
              </div>
            </div>
            <small class="text-muted">Últimas 24 Horas</small>
          </div>

          <div class="income">
            <span class="material-icons-sharp">stacked_line_chart</span>
            <div class="middle">
              <div class="left">
                <h3>Mais Curtido</h3>
                <h1>Cabernet</h1>
              </div>

              <div class="progress">
                <svg>
                  <circle cx="38" cy="38" r="37"></circle>
                </svg>

                <div class="number">
                  <p>44%</p>
                </div>
              </div>
            </div>
            <small class="text-muted">Últimas 24 Horas</small>
          </div>
        </div>

        <div class="recent-orders">
          <h2>Novo pedido</h2>
            <table class="table table-bordered table-striped">
            <thead>
              <tr>
              <th>Imagem</th>
              <th>Nome</th>
              <th>Descrição</th>
              <th>Preço</th>
              <th>Estoque</th>
              <th>Comprar</th>
              </tr>
            </thead>
            <tbody>
              <% for (Products p : products) { %>
              <tr>
                <td>
                <% if (p.getImageUrl() != null && !p.getImageUrl().isEmpty()) { %>
                  <img src="<%= p.getImageUrl() %>" alt="Produto" width="100">
                <% } else { %>
                  <img src="assets/img/sem-foto.png" alt="Produto" width="100">
                <% } %>
                </td>
                <td><%= p.getName() %></td>
                <td><%= p.getDescription() %></td>
                <td>R$<%= String.format("%.2f", p.getPrice()) %></td>
                <td><%= p.getStock() %></td>
                <td>
                <form method="post" action="user.jsp">
                  <input type="hidden" name="product_id" value="<%= p.getId() %>">
                  <input type="number" name="quantity" class="form-control mb-2" placeholder="Quantidade" required>
                  <button type="submit" name="buy" class="btn button-color">Comprar</button>
                </form>
                </td>
              </tr>
              <% } %>
            </tbody>
            </table>
          <a href="#">Mostrar Todos</a>
        </div>
      </main>

      <div class="right">
        <div class="top">
          <button id="menu-btn">
            <span class="material-icons-sharp">menu</span>
          </button>
          <div class="theme-toggler">
            <span class="material-icons-sharp active">light_mode</span>
            <span class="material-icons-sharp">dark_mode</span>
          </div>

          <div class="profile">
            <div class="info">
              <p>Olá, <b><%= user.getNome() %></b></p>
              <small class="text-muted">Usuário</small>
            </div>
            <div class="profile-photo">
              <img src="./assets/img/profile-1.jpg" />
            </div>
          </div>
        </div>

        <div class="recent-updates">
          <h2>Contatos Recentes</h2>
          <div class="updates">
            <div class="update">
              <div class="profile-photo">
                <img src="./assets/img/profile-2.jpg" />
              </div>
              <div class="message">
                <p>
                  <b>Mike Tyson</b> miketyson@fakedomain.net
                </p>
                <small class="text-muted">2 Minutos Atrás</small>
              </div>
            </div>

            <div class="update">
              <div class="profile-photo">
                <img src="./assets/img/profile-3.jpg" />
              </div>
              <div class="message">
                <p><b>Diana Ayl</b> dianaayl@fakedomain.net</p>
                <small class="text-muted">4 Minutos Atrás</small>
              </div>
            </div>

            <div class="update">
              <div class="profile-photo">
                <img src="./assets/img/profile-4.jpg" />
              </div>
              <div class="message">
                <p><b>Mandy Ray</b> mandyray@fakedomain.net</p>
                <small class="text-muted">7 Minutos Atrás</small>
              </div>
            </div>
          </div>

          <div class="sales-analytics">
            <h2>Mais Vendidos</h2>
            <div class="item online">
              <div class="icon">
                <span class="material-icons-sharp">liquor</span>
              </div>
              <div class="right">
                <div class="info">
                  <h3>Valpolicella</h3>
                  <small class="text-muted">Últimas 24 Horas</small>
                </div>

                <h5 class="success">+0,29%</h5>
                <h3>R$70,90</h3>
              </div>
            </div>

            <div class="item offline">
              <div class="icon">
                <span class="material-icons-sharp">local_bar</span>
              </div>
              <div class="right">
                <div class="info">
                  <h3>Chardonnay</h3>
                  <small class="text-muted">Últimas 24 Horas</small>
                </div>

                <h5 class="success">+1,21%</h5>
                <h3>R$45,90</h3>
              </div>
            </div>

            <div class="item costumers">
              <div class="icon">
                <span class="material-icons-sharp">wine_bar</span>
              </div>
              <div class="right">
                <div class="info">
                  <h3>Cabernet</h3>
                  <small class="text-muted">Últimas 24 Horas</small>
                </div>

                <h5 class="success">+2,25%</h5>
                <h3>R$42,90</h3>
              </div>
            </div>

            
          </div>
        </div>
      </div>
    </div>

    <script src="assets/js/main2.js"></script>
    <script
      type="module"
      src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"
    ></script>
  </body>
</html>
