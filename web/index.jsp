<%-- 
    Document   : index.jsp
    Created on : 02/06/2017, 00:31:32
    Author     : Dionatan
--%>
 
<%
    if ((session.getAttribute("us_nome") == null) || (session.getAttribute("us_nome") == "")) {
        response.sendRedirect(request.getContextPath()+"/login/index.jsp");
    } else {         
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Minha Venda</title>                   
    
    <link rel="stylesheet" type="text/css" href="styles/stylesheet.css" />	
    <link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css">        
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>               
    <script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
  </head>
  <body> 

    <div class="header">
        <p> <i class="fa fa-cubes fa-2x" aria-hidden="true"> </i> Dashboard</p> 
    </div>
    <div class="left">
    <a href="index.jsp"><div class="leftlogo"></div></a>
    <div id="navbarleft">         
        <ul>
             <% if (session.getAttribute("us_tipoacesso").equals("GERENTE")) { %>
                <li><a href="<%=request.getContextPath()%>/empresa/listar.jsp"><i class="fa fa-building-o" aria-hidden="true"> </i> Empresa</a></li>  			   	
            <%}%>
            <li><a href="<%=request.getContextPath()%>/grupos/listar.jsp"><i class="fa fa-briefcase" aria-hidden="true"> </i> Grupos</a></li>           
            <li><a href="<%=request.getContextPath()%>/produtos/listar.jsp"><i class="fa fa-database " aria-hidden="true"> </i> Produtos</a></li>           
            <li><a href="<%=request.getContextPath()%>/clientes/listar.jsp"><i class="fa fa-user-circle-o" aria-hidden="true"> </i> Clientes</a></li>           
            <% if (session.getAttribute("us_tipoacesso").equals("GERENTE")) { %>
                <li><a href="<%=request.getContextPath()%>/formaspgto/listar.jsp"><i class="fa fa-google-wallet" aria-hidden="true"> </i> Formas de Pgto</a></li>           
                <li><a href="<%=request.getContextPath()%>/tabelaprecos/listar.jsp"><i class="fa fa-table" aria-hidden="true"> </i> Tabela de Preços</a></li>           
            <%}%>       
            <li><a href="<%=request.getContextPath()%>/pedidos/listar.jsp"><i class="fa fa-tags" aria-hidden="true"> </i> Pedidos</a></li>           
            <% if (session.getAttribute("us_tipoacesso").equals("GERENTE")) { %>
                <li><a href="<%=request.getContextPath()%>/usuarios/listar.jsp"><i class="fa fa-users" aria-hidden="true"> </i> Usuários</a></li>           
            <%}%>    
            <br><br>
            <li><a href="login/logout.jsp"><i class="fa fa-users" aria-hidden="true"> </i> Logout</a></li>           
        </ul>   
    </div>    
</div>
    <div class="all">
    </div>  
                     
    <div class="all">
        Seja bem - vindo <br><b><%= session.getAttribute("us_nome") %></b> | Tipo de Acesso: <%= session.getAttribute("us_tipoacesso") %> 
    </div>
            
    </body>
</html>  
<%}%>
