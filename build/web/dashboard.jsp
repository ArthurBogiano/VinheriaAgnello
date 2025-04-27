<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.User, model.Products" %>
<%@ page import="java.util.List" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !user.getAdmin()) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<User> users = User.getAllUsers();
    List<Products> products = Products.getAllProducts();
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Painel Administrativo</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="assets/css/style-admin.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
</head>
<body>
    <input type="checkbox" id="nav-toggle">
    <div class="sidebar"> 
        <div class="sidebar-brand">
            <h2><span class="lab la-accountsoft"></span>  <span>Vinheria Agnello</span></h2>
        </div>

        <div class="sidebar-menu">
            <ul>
                <li>
                    <a href="" class="active"><span class="las la-igloo"></span>
                        <span>Painel</span></a>
                </li>

                <li>
                    <a href=""><span class="las la-users"></span>
                        <span>Clientes</span></a>
                </li>

                <li>
                    <a href=""><span class="las la-clipboard-list"></span>
                        <span>Projetos</span></a>
                </li>

                <li>
                    <a href=""><span class="las la-shopping-bag"></span>
                        <span>Pedidos</span></a>
                </li>

                <li>
                    <a href=""><span class="las la-receipt"></span>
                        <span>Estoque</span></a>
                </li>

                <li>
                    <a href=""><span class="las la-user-circle"></span>
                        <span>Contas</span></a>
                </li>

                <li>
                    <a href=""><span class="las la-clipboard-list"></span>
                        <span>Tarefas</span></a>
                </li>

                <li>
                    <a href="logout.jsp"><span class="las la-caret-square-right"></span>
                        <span>Sair</span></a>
                </li>

            </ul>
        </div>
    </div>

    <div class="main-content">
        <header class="d-flex justify-content-between align-items-center">
            <h2>
                <label for="nav-toggle">
                    <span class="las la-bars"></span>
                </label>
                Painel Administrativo
            </h2>

            <div class="search-wrapper d-flex align-items-center">
                <span class="las la-search"></span>
                <input type="search" class="form-control ms-2" placeholder="Pesquisar Aqui">
            </div>

            <div class="user-wrapper d-flex align-items-center">
                <img src="assets/img/profile-1.jpg" class="rounded-circle me-2" width="40px" height="40px" alt="">
                <div>
                    <h4><%= user.getNome() %></h4>
                    <small>Administrador</small>
                </div>
            </div>
        </header>

        <main>
            <div class="row g-4">
                <div class="col-md-3">
                    <div class="card text-center">
                        <div class="card-body">
                            <h1>54</h1>
                            <span>Clientes</span>
                        </div>
                        <div class="card-footer">
                            <span class="las la-users"></span>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card text-center">
                        <div class="card-body">
                            <h1>79</h1>
                            <span>Produtos</span>
                        </div>
                        <div class="card-footer">
                            <span class="las la-clipboard-list"></span>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card text-center">
                        <div class="card-body">
                            <h1>124</h1>
                            <span>Pedidos</span>
                        </div>
                        <div class="card-footer">
                            <span class="las la-shopping-bag"></span>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card text-center">
                        <div class="card-body">
                            <h1>$6k</h1>
                            <span>Receita</span>
                        </div>
                        <div class="card-footer">
                            <span class="la la-google-wallet"></span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-4 mt-4">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h3>Usuários</h3>
                            <button class="btn btn-primary btn-sm">Ver Todos <span class="las la-arrow-right"></span></button>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Nome</th>
                                            <th>Usuário</th>
                                            <th>Admin</th>
                                            <th>Ações</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (User u : users) { %>
                                            <tr>
                                                <td><%= u.getId() %></td>
                                                <td><%= u.getNome() %></td>
                                                <td><%= u.getUsername() %></td>
                                                <td><%= u.getAdmin() ? "Sim" : "Não" %></td>
                                                <td class="d-flex gap-2">
                                                    <button class="btn button-color btn-sm" onclick="location.href='users/edit.jsp?id=<%= u.getId() %>'">Editar</button>
                                                    <button class="btn button-color btn-sm" onclick="location.href='users/delete.jsp?id=<%= u.getId() %>'">Excluir</button>
                                                </td>
                                            </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="card mb-5 p-4">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4>Produtos</h4>
                            <a href="products/add.jsp" class="btn button-color">Adicionar Produto</a>
                        </div>
                        <div class="row g-3">
                            <% for (Products p : products) { %>
                                <div class="col-md-3 col-sm-6">
                                    <div class="card p-3 h-100">
                                        <% if (p.getImageUrl() != null && !p.getImageUrl().isEmpty()) { %>
                                            <img src="<%= p.getImageUrl() %>" alt="Produto" class="img-fluid mb-3" style="border-radius: 10px;">
                                        <% } else { %>
                                            <img src="assets/img/sem-foto.png" alt="Produto" class="img-fluid mb-3" style="border-radius: 10px;">
                                        <% } %>
                                        <h5><%= p.getName() %></h5>
                                        <p><%= p.getDescription() %></p>
                                        <p><strong>Preço:</strong> R$ <%= p.getPrice() %></p>
                                        <p><strong>Estoque:</strong> <%= p.getStock() %></p>
                                        <div class="d-flex justify-content-between">
                                            <a href="products/edit.jsp?id=<%= p.getId() %>" class="btn button-color">Editar</a>
                                            <a href="products/delete.jsp?id=<%= p.getId() %>" class="btn button-color">Excluir</a>
                                        </div>
                                    </div>
                                </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
