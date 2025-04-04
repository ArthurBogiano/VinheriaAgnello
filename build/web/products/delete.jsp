<!DOCTYPE html>
<html>
<head>
    <title>Excluir Produto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<%@ page import="model.Products" %>
<%
    String idParam = request.getParameter("id");
    int productId = Integer.parseInt(idParam);

    if (request.getParameter("confirm") != null) {
        Products.deleteProduct(productId);
        response.sendRedirect("../dashboard.jsp");
        return;
    }
%>

<div class="container mt-5">
    <div class="card">
        <div class="card-body">
            <h3>Excluir Produto</h3>
            <p>Tem certeza que deseja excluir este produto?</p>
            <form method="post">
                <button type="submit" name="confirm" class="btn btn-danger">Excluir</button>
                <a href="../dashboard.jsp" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>