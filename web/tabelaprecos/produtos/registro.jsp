<%-- 
    Document   : registro
    Created on : 13/07/2017, 08:21:10
    Author     : Dionatan
--%>


<%@page import="br.univates.minhavenda.models.Produtos"%>
<%@page import="br.univates.minhavenda.models.TabelaPrecos"%>
<%@page import="br.univates.minhavenda.controller.TabelaPrecosDAO"%>

<%@include file="../../default/header.jsp" %>

<script src="<%=request.getContextPath()%>/javascripts/utils.js"></script>

<div class="header">
    <% TabelaPrecosDAO tabelaprecosDAO = new TabelaPrecosDAO();
       TabelaPrecos tabelapreco       = null;   
       Produtos produto = null;
       if (request.getParameter("cod") != null) { 
           tabelapreco = tabelaprecosDAO.getTabelaPreco(request.getParameter("empr"), request.getParameter("cod"));
           
    %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Editar Produtos - Tabela Preço</p> 
    <% } %>    
    
</div>
<%@include file="../../default/menu.jsp" %>
   <script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/jquery.autocompleter.min.js"></script>

<div class="all">
    
<%@include file="view/view_produtostabela.jsp" %>

</div>
<script src="<%=request.getContextPath()%>/javascripts/produtostabelaprecos.js"></script>

<script>
    setAutoComplete(<%=request.getParameter("empr")%>,<%=request.getParameter("cod")%>);
</script>
<%@include file="../../default/footer.jsp" %>  
