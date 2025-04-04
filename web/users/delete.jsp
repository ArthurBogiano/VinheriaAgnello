<!DOCTYPE html>
<html>
<head>
    <title>Excluir Usu�rio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<%@ page import="model.User" %>
<%
    User adminUser = (User) session.getAttribute("user");
    if (adminUser == null || !adminUser.getAdmin()) {
        response.sendRedirect("/login.jsp");
        return;
    }

    String idParam = request.getParameter("id");
    int userId = Integer.parseInt(idParam);

    String message = "";
    if (request.getParameter("confirm") != null) {
        if (User.deleteUser(userId)) {
            message = "<div class='alert alert-success'>Usu�rio exclu�do com sucesso!</div>";
        } else {
            message = "<div class='alert alert-danger'>Erro ao excluir usu�rio.</div>";
        }
    }
%>

<div class="container mt-5">
    <div class="card">
        <div class="card-body">
            <h3>Excluir Usu�rio</h3>
            <%= message %>
            <p>Voc� tem certeza que deseja excluir este usu�rio?</p>
            <form method="post" action="./delete_user.jsp?id=<%= userId %>">
                <button type="submit" name="confirm" class="btn btn-danger">Excluir</button>
                <a href="../dashboard.jsp" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>