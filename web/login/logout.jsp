<%-- 
    Document   : logout
    Created on : 10/07/2017, 22:10:07
    Author     : Dionatan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/tabela.css">
        <title>Logout</title>
    </head>
    <body>
        
        <% 
            session.removeAttribute("us_nome");
            session.removeAttribute("us_tipoacesso");
            session.removeAttribute("us_codigo");
            session.removeAttribute("us_empresa");
            
            String caminho = request.getContextPath() + "/index.jsp"; 
        %>
        
        <h1>Usuário desconectado.</h1>
        
        
    </body>
</html>

