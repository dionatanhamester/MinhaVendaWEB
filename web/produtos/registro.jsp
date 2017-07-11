<%-- 
    Document   : registro
    Created on : 10/07/2017, 21:01:24
    Author     : Dionatan
--%>


<%@page import="br.univates.minhavenda.models.Produtos"%>
<%@page import="br.univates.minhavenda.controller.ProdutosDAO"%>

<%@include file="../default/header.jsp" %>

<script src="<%=request.getContextPath()%>/javascripts/mask.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/utils.js"></script>

<div class="header">
    <% ProdutosDAO produtosDAO = new ProdutosDAO();
       Produtos produto       = null;         
       if (request.getParameter("cod") != null) { 
           produto = produtosDAO.getProduto(request.getParameter("empr"), request.getParameter("cod"));
           
    %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Editar Produto</p> 
    <% } else { %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Cadastro de Produto</p> 
    <% }  %>         
    
</div>
<%@include file="../default/menu.jsp" %>
   
<div class="all">
    
<%@include file="view/view_produtos.jsp" %>

</div>
<script src="<%=request.getContextPath()%>/javascripts/produtos.js"></script>
<%@include file="../default/footer.jsp" %>  
