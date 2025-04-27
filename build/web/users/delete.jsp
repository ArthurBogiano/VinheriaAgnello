<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Excluir Usuário</title>
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
            message = "<div class='alert alert-success'>Usuário excluído com sucesso!</div><script>setTimeout(function(){ window.location.href = '../dashboard.jsp'; }, 2000);</script>";
        } else {
            message = "<div class='alert alert-danger'>Erro ao excluir usuário.</div>";
        }
    }
%>

<div class="container mt-5">
    <div class="card">
        <div class="card-body">
            <h3>Excluir Usuário</h3>
            <%= message %>
            <p>Você tem certeza que deseja excluir este usuário?</p>
            <form method="post" action="./delete.jsp?id=<%= userId %>">
                <button type="submit" name="confirm" class="btn btn-danger">Excluir</button>
                <a href="../dashboard.jsp" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>