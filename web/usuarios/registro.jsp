<%-- 
    Document   : registro
    Created on : 12/07/2017, 19:03:13
    Author     : Dionatan
--%>


<%@page import="br.univates.minhavenda.models.Usuario"%>
<%@page import="br.univates.minhavenda.controller.UsuarioDAO"%>

<%@include file="../default/header.jsp" %>

<script src="<%=request.getContextPath()%>/javascripts/mask.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/utils.js"></script>

<div class="header">
    <% UsuarioDAO usuarioDAO = new UsuarioDAO();
       Usuario usuario       = null;         
       if (request.getParameter("cod") != null) { 
           usuario = usuarioDAO.getUsuario(request.getParameter("empr"), request.getParameter("cod"));
           
    %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Editar Usuário</p> 
    <% } else { %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Cadastro de Usuário</p> 
    <% }  %>         
    
</div>
<%@include file="../default/menu.jsp" %>
   
<div class="all">
    
<%@include file="view/view_usuario.jsp" %>

</div>
<script src="<%=request.getContextPath()%>/javascripts/usuario.js"></script>
<%@include file="../default/footer.jsp" %>  

