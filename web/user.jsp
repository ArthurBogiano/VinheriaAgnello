<!DOCTYPE html>
<html>
<head>
    <title>Comprar Produtos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
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

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Bem-vindo, <%= user.getNome() %>!</h3>
        <a href="logout.jsp" class="btn btn-danger">Logout</a>
    </div>
    <%= message %>

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
                            <span>Sem Imagem</span>
                        <% } %>
                    </td>
                    <td><%= p.getName() %></td>
                    <td><%= p.getDescription() %></td>
                    <td><%= p.getPrice() %></td>
                    <td><%= p.getStock() %></td>
                    <td>
                        <form method="post" action="user.jsp">
                            <input type="hidden" name="product_id" value="<%= p.getId() %>">
                            <input type="number" name="quantity" class="form-control mb-2" placeholder="Quantidade" required>
                            <button type="submit" name="buy" class="btn btn-primary">Comprar</button>
                        </form>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>