<!DOCTYPE html>
<html>
<head>
    <title>Editar Produto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<%@ page import="model.Products" %>
<%
    String idParam = request.getParameter("id");
    int productId = Integer.parseInt(idParam);
    Products product = Products.getProductById(productId);
    String message = "";

    if (request.getParameter("update") != null) {
        product.setName(request.getParameter("name"));
        product.setDescription(request.getParameter("description"));
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setStock(Integer.parseInt(request.getParameter("stock")));
        product.setImageUrl(request.getParameter("image_url"));

        if (product.update()) {
            message = "<div class='alert alert-success'>Produto atualizado com sucesso!</div>";
        } else {
            message = "<div class='alert alert-danger'>Erro ao atualizar produto.</div>";
        }
    }
%>

<div class="container mt-5">
    <div class="card">
        <div class="card-body">
            <h3>Editar Produto</h3>
            <%= message %>
            <form method="post" action="edit.jsp?id=<%= product.getId() %>">
                <div class="mb-3">
                    <label>Nome:</label>
                    <input type="text" name="name" value="<%= product.getName() %>" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Descrição:</label>
                    <textarea name="description" class="form-control" required><%= product.getDescription() %></textarea>
                </div>
                <div class="mb-3">
                    <label>Preço:</label>
                    <input type="number" name="price" value="<%= product.getPrice() %>" class="form-control" step="0.01" required>
                </div>
                <div class="mb-3">
                    <label>Estoque:</label>
                    <input type="number" name="stock" value="<%= product.getStock() %>" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>URL da Imagem (S3):</label>
                    <input type="text" name="image_url" value="<%= product.getImageUrl() %>" class="form-control">
                </div>
                <div class="d-grid">
                    <button type="submit" name="update" class="btn btn-primary">Atualizar</button>
                </div>
            </form>
            <a href="../dashboard.jsp" class="btn btn-secondary mt-3">Voltar</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>