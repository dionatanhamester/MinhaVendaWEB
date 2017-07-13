<%-- 
    Document   : registro
    Created on : 12/07/2017, 21:07:46
    Author     : Dionatan
--%>

<%@page import="br.univates.minhavenda.models.FormasPgto"%>
<%@page import="br.univates.minhavenda.controller.FormasPgtoDAO"%>

<%@include file="../default/header.jsp" %>

<script src="<%=request.getContextPath()%>/javascripts/utils.js"></script>

<div class="header">
    <% FormasPgtoDAO formaspgtoDAO = new FormasPgtoDAO();
       FormasPgto formapgto        = null;         
       if (request.getParameter("cod") != null) { 
           formapgto = formaspgtoDAO.getFormaPgto(request.getParameter("empr"), request.getParameter("cod"));
           
    %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Editar Grupo</p> 
    <% } else { %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Cadastro de Grupos</p> 
    <% }  %>         
    
</div>
<%@include file="../default/menu.jsp" %>
   
<div class="all">
    
<%@include file="view/view_formaspgto.jsp" %>

</div>
<script src="<%=request.getContextPath()%>/javascripts/formaspgto.js"></script>
<%@include file="../default/footer.jsp" %>  
