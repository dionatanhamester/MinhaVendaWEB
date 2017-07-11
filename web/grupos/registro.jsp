<%-- 
    Document   : registro
    Created on : 09/07/2017, 21:18:57
    Author     : Dionatan
--%>


<%@page import="br.univates.minhavenda.models.Grupos"%>
<%@page import="br.univates.minhavenda.controller.GruposDAO"%>

<%@include file="../default/header.jsp" %>

<script src="<%=request.getContextPath()%>/javascripts/mask.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/utils.js"></script>

<div class="header">
    <% GruposDAO gruposDAO = new GruposDAO();
       Grupos grupo       = null;         
       if (request.getParameter("cod") != null) { 
           grupo = gruposDAO.getGrupo(request.getParameter("empr"), request.getParameter("cod"));
           
    %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Editar Grupo</p> 
    <% } else { %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Cadastro de Grupos</p> 
    <% }  %>         
    
</div>
<%@include file="../default/menu.jsp" %>
   
<div class="all">
    
<%@include file="view/view_grupos.jsp" %>

</div>
<script src="<%=request.getContextPath()%>/javascripts/grupos.js"></script>
<%@include file="../default/footer.jsp" %>  
