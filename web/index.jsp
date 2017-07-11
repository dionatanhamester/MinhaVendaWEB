<%-- 
    Document   : index.jsp
    Created on : 02/06/2017, 00:31:32
    Author     : Dionatan
--%>
 <%
        if ((session.getAttribute("login") == null) || (session.getAttribute("login") == "")) {
            response.sendRedirect("login/index.jsp");
        } else {
    %>
    <%@include file="default/header.jsp" %>
    <div class="header">
        <p> <i class="fa fa-cubes fa-2x" aria-hidden="true"> </i> Dashboard</p> 
    </div>
    <%@include file="default/menu.jsp" %>
    <div class="all">
    </div>  	
    <%@include file="default/footer.jsp" %>
    <%
            }
    %>   
