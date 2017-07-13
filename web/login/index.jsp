<%-- 
    Document   : index
    Created on : 10/07/2017, 21:51:26
    Author     : Dionatan
--%>


<%
    // Se j� estiver logado, ir direto para a p�gina principal
    if ((session.getAttribute("login") != null) && (session.getAttribute("login") != "")) {
        response.sendRedirect(request.getContextPath() + "/principal.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/styles/tabela.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/styles/form.css">
        <title>Tela de Login</title>
    </head>
    <body>

        <div class="main-content">

            <form class="form-register" method="post" action="login.jsp">
                <div class="form-register-with-email">
                    <div class="form-white-background">
                        <div class="form-title-row">
                            <h1>Efetuar Login</h1>
                        </div>
                        <div class="form-row">
                            <label>
                                <span>Nome usuário:</span>
                                <input type="text" required="true" id="usuario" name="usuario">
                            </label>
                        </div>
                        <div class="form-row">
                            <label>
                                <span>Senha:</span>
                                <input type="password" required="true" id="senha" name="senha">
                            </label>
                        </div>
                        <div class="form-row">
                            <button type="submit">Login</button>
                        </div>
                    </div>
                    <div class="form-log-in-with-existing">Ainda não tem registro? Solicite o acesso junto ao administrador.</a>
                </div>
            </form>
        </div>
    </body>
</html>

