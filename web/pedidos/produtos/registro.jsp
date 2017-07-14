<%-- 
    Document   : registro
    Created on : 13/07/2017, 22:06:03
    Author     : Dionatan
--%>

<%@page import="br.univates.minhavenda.models.TabelaPrecos"%>
<%@page import="br.univates.minhavenda.controller.TabelaPrecosDAO"%>
<%@page import="br.univates.minhavenda.models.ItensPedido"%>
<%@page import="br.univates.minhavenda.controller.ItensPedidosDAO"%>
<%@page import="br.univates.minhavenda.models.Clientes"%>
<%@page import="br.univates.minhavenda.controller.ClientesDAO"%>
<%@page import="br.univates.minhavenda.models.Produtos"%>
<%@page import="br.univates.minhavenda.models.Pedidos"%>
<%@page import="br.univates.minhavenda.controller.PedidosDAO"%>

<%@include file="../../default/header.jsp" %>

<script src="<%=request.getContextPath()%>/javascripts/utils.js"></script>

<div class="header">
    <% PedidosDAO pedidosDAO         = new PedidosDAO();
       ClientesDAO clientesDAO       = new ClientesDAO();
       ItensPedidosDAO itenspedidoDAO = new ItensPedidosDAO();
       TabelaPrecosDAO tabelaprecosDAO = new TabelaPrecosDAO();
       
       Pedidos  pedido     = null;   
       Produtos produto    = null;
       Clientes cliente    = null;
       ItensPedido itempedido = null;
       TabelaPrecos tabelaprecos = null;
       
       if (request.getParameter("cod") != null) { 
           pedido  = pedidosDAO.getPedido(request.getParameter("empr"), request.getParameter("cod"));
           cliente = clientesDAO.getCliente(request.getParameter("empr"), String.valueOf(pedido.getCliente())); 
    %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Editar Itens - Pedido</p> 
    <% } %>    
    
</div>
<%@include file="../../default/menu.jsp" %>
   <script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/jquery.autocompleter.min.js"></script>

<div class="all">
    
<%@include file="view/view_produtospedido.jsp" %>

</div>
<script src="<%=request.getContextPath()%>/javascripts/produtospedidos.js"></script>

<script>
    setAutoCompleteProdutos(<%=request.getParameter("empr")%>,<%=request.getParameter("cod")%>);
</script>
<%@include file="../../default/footer.jsp" %>  