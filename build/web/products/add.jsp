<!DOCTYPE html>
<html>
<head>
    <title>Adicionar Produto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<%@ page import="model.Products" %>
<%
    String message = "";
    if (request.getParameter("create") != null) {
        Products product = new Products();
        product.setName(request.getParameter("name"));
        product.setDescription(request.getParameter("description"));
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setStock(Integer.parseInt(request.getParameter("stock")));
        product.setImageUrl(request.getParameter("image_url"));

        if (product.save()) {
            message = "<div class='alert alert-success'>Produto adicionado com sucesso!</div>";
        } else {
            message = "<div class='alert alert-danger'>Erro ao adicionar produto.</div>";
        }
    }
%>

<div class="container mt-5">
    <div class="card">
        <div class="card-body">
            <h3>Adicionar Produto</h3>
            <%= message %>
            <form method="post" action="add.jsp">
                <div class="mb-3">
                    <label>Nome:</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Descrição:</label>
                    <textarea name="description" class="form-control" required></textarea>
                </div>
                <div class="mb-3">
                    <label>Preço:</label>
                    <input type="number" name="price" class="form-control" step="0.01" required>
                </div>
                <div class="mb-3">
                    <label>Estoque:</label>
                    <input type="number" name="stock" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>URL da Imagem (S3):</label>
                    <input type="text" name="image_url" class="form-control" required>
                </div>
                <div class="d-grid">
                    <button type="submit" name="create" class="btn btn-success">Adicionar</button>
                </div>
            </form>
            <a href="../dashboard.jsp" class="btn btn-secondary mt-3">Voltar</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>