<%-- 
    Document   : listar
    Created on : 12/07/2017, 18:59:10
    Author     : Dionatan
--%>

<%@page import="br.univates.minhavenda.utils.Mask"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="br.univates.minhavenda.models.Usuario"%>
<%@page import="br.univates.minhavenda.controller.UsuarioDAO"%>
<%@include file="../default/header.jsp" %>

<%
    //Cria os Controllers utilizados
    UsuarioDAO usuarioDAO = new UsuarioDAO();       
%>    
<div class="header">
    <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Usuários </p>     
    <p>       </p>     
</div>
    <script>
            <!-- Função javascript para chamar edição de registro -->
            function editarRegistro(empresa, codigo) {
                window.location.href = "<%=request.getContextPath()%>/usuarios/registro.jsp?empr="+empresa+"&&cod=" + codigo;
            }
            <!-- Função javascript para chamar Srvlet de exclusão de registro data:  $(this).serializeArray(), -->
            function excluirRegistro(empresa, codigo, nome){
                if (confirm('Confirma exclusão do Usuário ' + codigo + ' - ' + nome + '?')) {
                    $.ajax({
                        type: "POST",
                        url : "<%=request.getContextPath()%>/UsuariosExcluir", 
                        data: { us_codigo: codigo, us_empresa: empresa },                        
                        success: function(returnFunction){                                                             
                            window.location.reload();
                        }
                    });      
                }
                            
            }
    </script> 

<%@include file="../default/menu.jsp" %>

<div class="all">
    <table align="center" style="width:100%">  	    	
        <tbody>
            <tr>
                <!-- Formulário com campo para pesquisar usuário -->
                <form name="frmLocalizar" action="listar.jsp" method="POST">
                    <p><label for="localizaUsuario">Pesquisar:</label> <input type="text" name="localizaUsuario" value="" size="50"> 
            
                    <button type="submit" class="button-primary" name="btnLocaliza" id="btnLocaliza">Pesquisar <i class="fa fa-search" aria-hidden="true"></i></button>
                </form>
                <a href="registro.jsp"><button class="button-success" id="adicionar">Adicionar <i class="fa fa-plus" aria-hidden="true"></i></button></a>
            </tr>
        </tbody>  	    	 
    </table>

    <!-- Table com a Listagem dos dados -->
    <table class="datatable" border="1px" style="width:100%">  
        <thead>
            <tr>
                <th> Código</th>      
                <th> Nome</th>            				
                <th> Tipo Acesso</th>            				
                <th> </th>   
                <th> </th> 
            </tr>
        </thead> 
        <tbody>
            <% 
                String where = "WHERE us_empresa = "+session.getAttribute("us_empresa");
                // Se foi informado um valor no campo de pesquisa, adicionar ao SQL
                if ( request.getParameter("localizaUsuario") != null && request.getParameter("localizaUsuario") != "" ){
                    String localizarValor = request.getParameter("localizaUsuario").toLowerCase();
                    out.write("<b><p>Pesquisando por: ");
                    out.write(localizarValor + "</p></b>");
                                
                    // Adicionar condição WHERE ao SQL
                    // Observe que o SQL busca o valor parcial (%) e em minúsculo (LOWER)
                    // Vamos pesquisar em todos os campos...
                    where += " AND LOWER(us_nome) LIKE '%"+localizarValor+"%' ";
                                
                    //out.write(query); // debug SQL
                }
                
                List<Usuario> list = usuarioDAO.listar(where);                 
                for (int i = 0; i < list.size(); i++){                                 
            %>                        
            <tr>
                <td><%= String.valueOf(list.get(i).getCodigo()) %></td>
                <td><%= list.get(i).getNome()%></td>
                <td><%= list.get(i).getTipoAcesso()%></td>
                <td><a href="javascript:editarRegistro(<%= list.get(i).getEmpresa()%>, <%= list.get(i).getCodigo() %>);"> <i class="fa fa-2x fa-pencil-square-o" aria-hidden="true"></i></a></td>                                    
                <td><a href="javascript:excluirRegistro(<%= list.get(i).getEmpresa()%>,<%= list.get(i).getCodigo()%>, '<%= list.get(i).getNome()%>' );"> <i class="fa fa-2x fa-times" aria-hidden="true"></i></a></td>                
            </tr>
            <% } %>
            <!-- Definição Rodapé -->    
        <tfoot>                
            <tr align="center"> 
                <td colspan="7">Registros apresentados <%= String.valueOf(list.size()) %></td>
            </tr>
        </tfoot>            

    </table>
</div>
<%@include file="../default/footer.jsp" %>
