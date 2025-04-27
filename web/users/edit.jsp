<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Editar Usuário</title>
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
    User user = User.getUserById(userId);

    String message = "";
    if (request.getParameter("update") != null) {
        user.setNome(request.getParameter("nome"));
        user.setUsername(request.getParameter("username"));
        user.setDataNascimento(request.getParameter("data_nascimento"));
        user.setCpf(request.getParameter("cpf"));
        user.setEndereco(request.getParameter("endereco"));
        user.setAdmin(request.getParameter("admin") != null);

        if (user.update()) {
            message = "<div class='alert alert-success'>Usuário atualizado com sucesso!</div><script>setTimeout(function(){ window.location.href = '../dashboard.jsp'; }, 2000);</script>";
        } else {
            message = "<div class='alert alert-danger'>Erro ao atualizar usuário.</div>";
        }
    }
%>

<div class="container mt-5">
    <div class="card">
        <div class="card-body">
            <h3>Editar Usuário</h3>
            <%= message %>
            <form method="post" action="./edit.jsp?id=<%= user.getId() %>">
                <div class="mb-3">
                    <label>Nome:</label>
                    <input type="text" name="nome" value="<%= user.getNome() %>" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Usuário:</label>
                    <input type="text" name="username" value="<%= user.getUsername() %>" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Data de Nascimento:</label>
                    <input type="date" name="data_nascimento" value="<%= user.getDataNascimento() %>" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>CPF:</label>
                    <input type="text" name="cpf" value="<%= user.getCpf() %>" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Endereço:</label>
                    <input type="text" name="endereco" value="<%= user.getEndereco() %>" class="form-control" required>
                </div>
                <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" name="admin" id="admin" <%= user.getAdmin() ? "checked" : "" %>>
                    <label class="form-check-label" for="admin">Administrador</label>
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