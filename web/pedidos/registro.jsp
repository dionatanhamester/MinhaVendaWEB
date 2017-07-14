<%-- 
    Document   : registro
    Created on : 13/07/2017, 19:47:13
    Author     : Dionatan
--%>

<%@page import="br.univates.minhavenda.models.FormasPgto"%>
<%@page import="br.univates.minhavenda.controller.FormasPgtoDAO"%>
<%@page import="br.univates.minhavenda.models.Clientes"%>
<%@page import="br.univates.minhavenda.controller.ClientesDAO"%>
<%@page import="br.univates.minhavenda.models.Pedidos"%>
<%@page import="br.univates.minhavenda.controller.PedidosDAO"%>

<%@include file="../default/header.jsp" %>

<script src="<%=request.getContextPath()%>/javascripts/utils.js"></script>

<div class="header">
    <% PedidosDAO pedidosDAO = new PedidosDAO();
       ClientesDAO clientesDAO = new ClientesDAO();
       FormasPgtoDAO formaspgtoDAO = new FormasPgtoDAO();
       
       Pedidos pedido       = null;         
       Clientes cliente     = null;
       FormasPgto formapgto = null;
       
       if (request.getParameter("cod") != null) { 
           pedido = pedidosDAO.getPedido(request.getParameter("empr"), request.getParameter("cod"));           
           cliente = clientesDAO.getCliente(request.getParameter("empr"), String.valueOf(pedido.getCliente()));           
           formapgto = formaspgtoDAO.getFormaPgto(request.getParameter("empr"), String.valueOf(pedido.getFormaPgto()));           
           
    %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Editar Pedido</p> 
    <% } else { %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Cadastro de Pedido</p> 
    <% }  %>         
    
</div>
<%@include file="../default/menu.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/jquery.autocompleter.min.js"></script>  
<div class="all">
    
<%@include file="view/view_pedidos.jsp" %>

</div>
<script src="<%=request.getContextPath()%>/javascripts/pedidos.js"></script>

<script>
    setAutoCompleteClientes(<%= session.getAttribute("us_empresa") %>);
    setAutoCompleteFormasPgto(<%= session.getAttribute("us_empresa") %>);
</script>

<%@include file="../default/footer.jsp" %> 