<%-- 
    Document   : login
    Created on : 10/07/2017, 21:59:02
    Author     : Dionatan
--%>    


<%@page import="br.univates.minhavenda.controller.UsuarioDAO"%>
<%@page import="br.univates.minhavenda.models.Usuario"%>

<%@ page import ="java.sql.*" %>
<%     
    String user = request.getParameter("usuario");
    String pass = request.getParameter("senha");
 
    UsuarioDAO usuarioDAO = new UsuarioDAO();
    
    Usuario usuario = null;
    usuario = usuarioDAO.getUsuarioLogin(user, pass);
    
    // Se algum registro foi encontrado, registrar na sess�o
    if (usuario != null) {
        // Registrar informa��o de login na sess�o
        session.setAttribute("us_nome", usuario.getNome());
        session.setAttribute("us_tipoacesso", usuario.getTipoAcesso());
        session.setAttribute("us_codigo",  usuario.getCodigo());
        session.setAttribute("us_empresa", usuario.getEmpresa());
        
        String caminho = request.getContextPath() + "/index.jsp";
        
        // Redirecionar para o arquivo principal.jsp
        response.sendRedirect( caminho );
    } else {
        out.println("Usu�rio ou Senha Inv�lida, <a href='index.jsp'>tente novamente!</a>");
    }
%>

