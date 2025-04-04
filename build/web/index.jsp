<!DOCTYPE html>
<html>
<head>
    <title>Vinheria Agnello</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .carousel-item {
            display: flex;
            justify-content: center;
            padding: 20px;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .card img {
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }
        .hero {
            background-color: #6c757d;
            padding: 50px;
            border-radius: 15px;
            color: white;
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body class="bg-light">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Products" %>
<%@ page import="java.util.List" %>

<%
    List<Products> products = Products.getAllProducts();
%>

<div class="container mt-5">
    <div class="hero">
        <h1>Vinheria Agnello</h1>
        <p>Os melhores vinhos selecionados especialmente para você. Desfrute de uma experiência única e exclusiva.</p>
        <div>
            <a href="login.jsp" class="btn btn-primary me-2">Login</a>
            <a href="register.jsp" class="btn btn-success">Registro</a>
        </div>
    </div>

    <h2 class="mb-4">Nossos Produtos</h2>
    <div id="productCarousel" class="carousel slide mb-5" data-bs-ride="carousel">
        <div class="carousel-inner">
            <% int index = 0; %>
            <% for (Products p : products) { %>
                <div class="carousel-item <%= index == 0 ? "active" : "" %>">
                    <div class="card mx-auto" style="width: 20rem;">
                        <% if (p.getImageUrl() != null && !p.getImageUrl().isEmpty()) { %>
                            <img src="<%= p.getImageUrl() %>" class="card-img-top" alt="Produto">
                        <% } else { %>
                            <div class="card-img-top bg-secondary text-white text-center p-4">Sem Imagem</div>
                        <% } %>
                        <div class="card-body">
                            <h5 class="card-title"><%= p.getName() %></h5>
                            <p class="card-text"><%= p.getDescription() %></p>
                            <p><strong>Preço:</strong> R$ <%= p.getPrice() %></p>
                        </div>
                    </div>
                </div>
                <% index++; %>
            <% } %>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>