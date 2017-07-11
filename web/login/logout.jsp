<%-- 
    Document   : logout
    Created on : 10/07/2017, 22:10:07
    Author     : Dionatan
--%>

<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/tabela.css">
        <title>Logout</title>
    </head>
    <body>
        
        <% 
            session.removeAttribute("login");
            session.removeAttribute("us_codigo");
            session.removeAttribute("us_empresa");
            
            String caminho = request.getContextPath() + "/index.jsp"; 
        %>
        
        <h1>Usuário desconectado.</h1>
        
        
    </body>
</html>

