<%
    session.invalidate(); // Encerra a sess�o do usu�rio
    response.sendRedirect("login.jsp"); // Redireciona para a tela de login
%>
