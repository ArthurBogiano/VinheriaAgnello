<%@ page import="model.User" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String message = "";

    if (username != null && password != null) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);

        User authenticatedUser = user.authenticate(); 

        if (authenticatedUser != null) {
            session.setAttribute("user", authenticatedUser);
            
            if (authenticatedUser.getAdmin()) {
                response.sendRedirect("dashboard.jsp");
            } else {
                response.sendRedirect("user.jsp");
            }
        } else {
            message = "<h1>Usuário ou senha incorretos!</h1>";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center">Login</h3>
                        <form action="login.jsp" method="post">
                            <div class="mb-3">
                                <label for="username" class="form-label">Usuário:</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Senha:</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Entrar</button>
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