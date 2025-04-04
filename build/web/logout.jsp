<%
    session.invalidate(); // Encerra a sessão do usuário
    response.sendRedirect("login.jsp"); // Redireciona para a tela de login
%>
