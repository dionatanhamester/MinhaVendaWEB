<%-- 
    Document   : registro
    Created on : 10/07/2017, 23:30:54
    Author     : Dionatan
--%>


<%@page import="br.univates.minhavenda.models.Clientes"%>
<%@page import="br.univates.minhavenda.controller.ClientesDAO"%>

<%@include file="../default/header.jsp" %>

<script src="<%=request.getContextPath()%>/javascripts/mask.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/utils.js"></script>

<div class="header">
    <% ClientesDAO clientesDAO = new ClientesDAO();
       Clientes cliente       = null;         
       if (request.getParameter("cod") != null) { 
           cliente = clientesDAO.getCliente(request.getParameter("empr"), request.getParameter("cod"));
           
    %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Editar Cliente</p> 
    <% } else { %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Cadastro de Cliente</p> 
    <% }  %>         
    
</div>
<%@include file="../default/menu.jsp" %>
   
<div class="all">
    
<%@include file="view/view_clientes.jsp" %>

</div>
<script src="<%=request.getContextPath()%>/javascripts/clientes.js"></script>
<%@include file="../default/footer.jsp" %>  

