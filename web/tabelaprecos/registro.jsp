<%-- 
    Document   : registro
    Created on : 12/07/2017, 22:03:16
    Author     : Dionatan
--%>

<%@page import="br.univates.minhavenda.models.TabelaPrecos"%>
<%@page import="br.univates.minhavenda.controller.TabelaPrecosDAO"%>

<%@include file="../default/header.jsp" %>


<script src="<%=request.getContextPath()%>/javascripts/utils.js"></script>

<div class="header">
    <% TabelaPrecosDAO tabelaprecosDAO = new TabelaPrecosDAO();
       TabelaPrecos tabelapreco       = null;         
       if (request.getParameter("cod") != null) { 
           tabelapreco = tabelaprecosDAO.getTabelaPreco(request.getParameter("empr"), request.getParameter("cod"));
           
    %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Editar Tabela Preço</p> 
    <% } else { %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Cadastro de Tabela Preço</p> 
    <% }  %>         
    
</div>
<%@include file="../default/menu.jsp" %>
   
<div class="all">
    
<%@include file="view/view_tabelaprecos.jsp" %>


</div>
<script src="<%=request.getContextPath()%>/javascripts/tabelaprecos.js"></script>
<%@include file="../default/footer.jsp" %>  