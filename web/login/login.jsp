<%-- 
    Document   : login
    Created on : 10/07/2017, 21:59:02
    Author     : Dionatan
--%>


<%@ page import ="java.sql.*" %>
<%
    String usuario = request.getParameter("usuario");
    String senha   = request.getParameter("senha");

    /*Class.forName("org.postgresql.Driver");
    Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/progr_web", "postgres", "postgres");
    Statement st = conn.createStatement();

    ResultSet rs;
    // SQL para verificar se existe algum usu�rio e senha correspondente
    String sql = "select * from usuarios where login='" + usuario + "' and senha='" + senha + "'";
    
    //out.write(sql);
    
    rs = st.executeQuery(sql);

    // Se algum registro foi encontrado, registrar na sess�o
    if (rs.next()) {*/
        // Registrar informa��o de login na sess�o
        session.setAttribute("login", "Dionatan Hamester");
        session.setAttribute("us_codigo",  0);
        session.setAttribute("us_empresa", 9);
        
        String caminho = request.getContextPath() + "/index.jsp";
        
        // Redirecionar para o arquivo principal.jsp
        response.sendRedirect( caminho );
    /*} else {
        out.println("Senha Inv�lida, <a href='index.jsp'>tente novamente!</a>");
    }*/
%>

