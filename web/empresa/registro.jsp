<%-- 
    Document   : cadastro_empresa
    Created on : 04/06/2017, 20:38:45
    Author     : Dionatan
--%>

<%@page import="br.univates.minhavenda.models.Empresa"%>
<%@page import="br.univates.minhavenda.controller.EmpresaDAO"%>

<%@include file="../default/header.jsp" %>

<script src="<%=request.getContextPath()%>/javascripts/mask.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/utils.js"></script>

<div class="header">
    <% EmpresaDAO empresaDAO = new EmpresaDAO();
       Empresa empresa       = null;         
       if (request.getParameter("cod") != null) { 
           empresa = empresaDAO.getEmpresa(request.getParameter("cod"));
    %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Editar Empresa</p> 
    <% } else { %>
        <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Cadastro de Empresa</p> 
    <% }  %>         
    
</div>
<%@include file="../default/menu.jsp" %>
   
<div class="all">
    
<%@include file="view/view_empresa.jsp" %>

</div>
<script src="<%=request.getContextPath()%>/javascripts/empresa.js"></script>
<%@include file="../default/footer.jsp" %>  