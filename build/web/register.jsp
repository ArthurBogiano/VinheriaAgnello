<%@ page import="model.User" %>
<%
    String message = "";
    if (request.getParameter("username") != null) {
        User user = new User();
        user.setNome(request.getParameter("nome"));
        user.setDataNascimento(request.getParameter("data_nascimento"));
        user.setCpf(request.getParameter("cpf"));
        user.setEndereco(request.getParameter("endereco"));
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password"));

        if (user.save()) {
            message = "<h1>Usuário registrado com sucesso!</h1>";
        } else {
            message = "<h1>Falha ao registrar usuário.</h1>";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Registro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center">Registro</h3>
                        <form action="register.jsp" method="post">
                            <div class="mb-3">
                                <label>Nome:</label>
                                <input type="text" name="nome" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label>Data de Nascimento:</label>
                                <input type="date" name="data_nascimento" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label>CPF:</label>
                                <input type="text" name="cpf" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label>Endereço:</label>
                                <input type="text" name="endereco" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label>Usuário:</label>
                                <input type="text" name="username" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label>Senha:</label>
                                <input type="password" name="password" class="form-control" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success">Registrar</button>
                            </div>
                        </form>
                        <div class="mt-3">
                            <%= message %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>