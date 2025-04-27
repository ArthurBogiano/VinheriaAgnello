<!DOCTYPE html>
<html>
<head>
    <title>Painel de Administração</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body class="bg-light">
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

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3>Painel de Administração</h3>
        <a href="logout.jsp" class="btn btn-danger">Logout</a>
    </div>

    <div class="card mb-5 p-4">
        <h4>Usuários</h4>
        <table class="table table-bordered table-striped">
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
                        <td>
                            <a href="users/edit.jsp?id=<%= u.getId() %>" class="btn btn-warning btn-sm">Editar</a>
                            <a href="users/delete.jsp?id=<%= u.getId() %>" class="btn btn-danger btn-sm">Excluir</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <div class="card mb-5 p-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4>Produtos</h4>
            <a href="products/add.jsp" class="btn btn-success">Adicionar Produto</a>
        </div>
        <div class="card-container">
            <% for (Products p : products) { %>
                <div class="card p-3">
                    <% if (p.getImageUrl() != null && !p.getImageUrl().isEmpty()) { %>
                        <img src="<%= p.getImageUrl() %>" alt="Produto" class="img-fluid mb-3" style="border-radius: 10px;">
                    <% } else { %>
                        <div class="bg-secondary text-white text-center p-3 mb-3" style="border-radius: 10px;">Sem Imagem</div>
                    <% } %>
                    <h5><%= p.getName() %></h5>
                    <p><%= p.getDescription() %></p>
                    <p><strong>Preço:</strong> R$ <%= p.getPrice() %></p>
                    <p><strong>Estoque:</strong> <%= p.getStock() %></p>
                    <div class="d-flex justify-content-between">
                        <a href="products/edit.jsp?id=<%= p.getId() %>" class="btn btn-warning">Editar</a>
                        <a href="products/delete.jsp?id=<%= p.getId() %>" class="btn btn-danger">Excluir</a>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>