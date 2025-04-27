<%@ page import="model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String type = request.getParameter("type");
  String message = "";

  if ("login".equals(type)) {
    
    String username = request.getParameter("username");
    String password = request.getParameter("password");

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
        message = "<h4>Usuário ou senha incorretos!</h4>";
      }
    }

  } else if ("register".equals(type)) {
    
    if (request.getParameter("username") != null) {
      User user = new User();
      user.setNome(request.getParameter("nome"));
      user.setDataNascimento(request.getParameter("data_nascimento"));
      user.setCpf(request.getParameter("cpf"));
      user.setEndereco(request.getParameter("endereco"));
      user.setUsername(request.getParameter("username"));
      user.setPassword(request.getParameter("password"));

      if (user.save()) {
        message = "<h4>Usuário registrado com sucesso!</h4>";
      } else {
        message = "<h4>Falha ao registrar usuário.</h4>";
      }
    }

  }

%>

<!DOCTYPE html>
<html lang="pt-BR">
  <head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="assets/css/style.css" />
  <title>Vinharia Agnello | Login</title>
  </head>
  <body>
  <div class="form-container">
    <div class="form-col">
      <div class="btn-box">
        <button class="btn btn-1" id="login">Entrar</button>
        <button class="btn btn-2" id="register">Registrar</button>
      </div>
      <form method="POST" action="" class="form-box login-form">
        <div class="form-title">
        <span>Entrar</span>
        </div>

        <div class="form-inputs">
        <div class="input-box">
          <input
          type="text"
          class="inputs input-field"
          placeholder="Usuário"
          id="usernameInput"
          name="username"
          required
          />
          <ion-icon name="person-outline" class="icon"></ion-icon>
        </div>

        <div class="input-box">
          <input
          type="password"
          oniput="changeIcon(this.value)"
          id="logPassword"
          class="inputs input-field"
          placeholder="Senha"
          name="password"
          required
          />
          <ion-icon
          name="lock-closed-outline"
          class="icon"
          id="log-pass-icon"
          onclick="myLogPassword()"
          ></ion-icon>
        </div>
        <div class="forgot-pass">
          <a href="#">Esqueceu a senha?</a>
        </div>

        <input type="hidden" id="loginForm" name="type" value="login" />

        <div class="input-box">
          <button class="inputs submit-btn" type="submit">
          <span>Entrar</span>
          <ion-icon name="arrow-forward-outline"></ion-icon>
          </button>
        </div>
        </div>

        <div class="social-login">
        <div class="social-login-box">
          <ion-icon name="logo-google" class="social-login-icon"></ion-icon>
        </div>

        <div class="social-login-box">
          <ion-icon
          name="logo-facebook"
          class="social-login-icon"
          ></ion-icon>
        </div>

        <div class="social-login-box">
          <ion-icon
          name="logo-twitter"
          class="social-login-icon"
          ></ion-icon>
        </div>

        <div class="social-login-box">
          <ion-icon name="logo-github" class="social-login-icon"></ion-icon>
        </div>
        </div>

        <div class="message-box">
          <div class="message-text">
            <%= message %>
          </div>
        </div>
      </form>

      <form method="POST" action="" class="form-box register-form">
        <div class="form-title">
        <span>Registrar</span>
        </div>

        <div class="form-inputs">

        <div class="input-box">
          <input
          type="text"
          class="inputs input-field"
          placeholder="Usuário"
          name="username"
          required
          />
          <ion-icon name="person-outline" class="icon"></ion-icon>
        </div>

        <div class="input-box">
          <input
          type="password"
          oniput="changeIcon(this.value)"
          id="regPassword"
          class="inputs input-field"
          placeholder="Senha"
          name="password"
          required
          />
          <ion-icon
          name="lock-closed-outline"
          class="icon"
          id="reg-pass-icon"
          onclick="myRegPassword()"
          ></ion-icon>
        </div>
        <div class="remember-me">
          <input type="checkbox" id="remember-me-check" />
          <label for="remember-me-check">Lembrar-me</label>
        </div>

        <div class="input-box">
          <input
          type="text"
          class="inputs input-field"
          placeholder="Nome Completo"
          name="nome"
          required
          />
          <ion-icon name="person-outline" class="icon"></ion-icon>
        </div>

        <div class="input-box">
          <input
          type="date"
          class="inputs input-field"
          placeholder="Data de Nascimento"
          name="data_nascimento"
          required
          />
          <ion-icon name="calendar-outline" class="icon"></ion-icon>
        </div>

        <div class="input-box">
          <input
          type="text"
          class="inputs input-field"
          placeholder="CPF"
          name="cpf"
          required
          />
          <ion-icon name="card-outline" class="icon"></ion-icon>
        </div>

        <div class="input-box">
          <input
          type="text"
          class="inputs input-field"
          placeholder="Endereço"
          name="endereco"
          required
          />
          <ion-icon name="home-outline" class="icon"></ion-icon>
        </div>

        <input type="hidden" id="registerForm" name="type" value="register" />

        <div class="input-box">
          <button type="submit" class="inputs submit-btn">
          <span>Registrar</span>
          <ion-icon name="arrow-forward-outline"></ion-icon>
          </button>
        </div>
        </div>

        <div class="social-login">
        <div class="social-login-box">
          <ion-icon name="logo-google" class="social-login-icon"></ion-icon>
        </div>

        <div class="social-login-box">
          <ion-icon
          name="logo-facebook"
          class="social-login-icon"
          ></ion-icon>
        </div>

        <div class="social-login-box">
          <ion-icon
          name="logo-twitter"
          class="social-login-icon"
          ></ion-icon>
        </div>

        <div class="social-login-box">
          <ion-icon name="logo-github" class="social-login-icon"></ion-icon>
        </div>
        </div>
      </form>

    </div>
  </div>

  <script src="assets/js/main.js"></script>

  <script
    type="module"
    src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"
  ></script>
  <script
    nomodule
    src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"
  ></script>
  </body>
</html>
