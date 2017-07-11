<%-- 
    Document   : header
    Created on : 02/06/2017, 00:29:57
    Author     : Dionatan
--%>

<%
    if ((session.getAttribute("login") == null) || (session.getAttribute("login") == "")) {
        response.sendRedirect(request.getContextPath()+"/login/index.jsp");
    } else {         
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Minha Venda</title>                   
    
    <link rel="stylesheet" type="text/css" href="../styles/stylesheet.css" />	
    <link rel="stylesheet" href="../resources/font-awesome/css/font-awesome.min.css">        
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>               
    <script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
  </head>
  <body> 

<script>
    var contextPath = "<%=request.getContextPath()%>";
</script>
