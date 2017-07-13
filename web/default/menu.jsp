<div class="left">
    <a href="../index.jsp"><div class="leftlogo"></div></a>
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
            <li><a href="<%=request.getContextPath()%>/lista_pedidos.jsp"><i class="fa fa-tags" aria-hidden="true"> </i> Pedidos</a></li>           
            <% if (session.getAttribute("us_tipoacesso").equals("GERENTE")) { %>
                <li><a href="<%=request.getContextPath()%>/usuarios/listar.jsp"><i class="fa fa-users" aria-hidden="true"> </i> Usuários</a></li>           
            <%}%>    
            <br><br>
            <li><a href="<%=request.getContextPath()%>/login/logout.jsp"><i class="fa fa-users" aria-hidden="true"> </i> Logout</a></li>           
        </ul>   
    </div>    
</div>