<%-- 
    Document   : listar
    Created on : 10/07/2017, 23:07:14
    Author     : Dionatan
--%>

<%@page import="br.univates.minhavenda.utils.Mask"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="br.univates.minhavenda.models.Clientes"%>
<%@page import="br.univates.minhavenda.controller.ClientesDAO"%>
<%@include file="../default/header.jsp" %>

<%
    //Cria os Controllers utilizados
    ClientesDAO clientesDAO = new ClientesDAO();       
%>    
<div class="header">
    <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Clientes </p>     
    <p>       </p>     
</div>
    <script>
            <!-- Fun��o javascript para chamar edi��o de registro -->
            function editarRegistro(empresa, codigo) {
                window.location.href = "<%=request.getContextPath()%>/clientes/registro.jsp?empr="+empresa+"&&cod=" + codigo;
            }
            <!-- Fun��o javascript para chamar Srvlet de exclus�o de registro data:  $(this).serializeArray(), -->
            function excluirRegistro(empresa, codigo, nome){
                if (confirm('Confirma exclus�o do Cliente ' + codigo + ' - ' + nome + '?')) {
                    $.ajax({
                        type: "POST",
                        url : "<%=request.getContextPath()%>/ClientesExcluir", 
                        data: { cl_codigo: codigo, cl_empresa: empresa },                            
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
                <!-- Formul�rio com campo para pesquisar usu�rio -->
                <form name="frmLocalizar" action="listar.jsp" method="POST">
                    <p><label for="localizaClientes">Pesquisar:</label> <input type="text" name="localizaClientes" value="" size="50"> 
            
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
                <th> Matr�cula</th>      
                <th> Nome</th>            				
                <th> Cidade</th> 
                <th> UF</th>                  
                <th> Telefone</th>            				
                <th> Email</th>            				
                <th> </th> 
                <th> </th> 
            </tr>
        </thead> 
        <tbody>
            <% 
                String where = "WHERE cl_empresa = "+session.getAttribute("us_empresa");
                // Se foi informado um valor no campo de pesquisa, adicionar ao SQL
                if ( request.getParameter("localizaClientes") != null && request.getParameter("localizaClientes") != "" ){
                    String localizarValor = request.getParameter("localizaClientes").toLowerCase();
                    out.write("<b><p>Pesquisando por: ");
                    out.write(localizarValor + "</p></b>");
                                
                    // Adicionar condi��o WHERE ao SQL
                    // Observe que o SQL busca o valor parcial (%) e em min�sculo (LOWER)
                    // Vamos pesquisar em todos os campos...
                    where += " AND LOWER(cl_nome) LIKE '%"+localizarValor+"%' ";
                                
                    //out.write(query); // debug SQL
                }
                
                List<Clientes> list = clientesDAO.listar(where);                 
                for (int i = 0; i < list.size(); i++){                                 
            %>                        
            <tr>
                <td><%= String.valueOf(list.get(i).getCodigo()) %></td>
                <td><%= list.get(i).getNome()%></td>
                <td><%= list.get(i).getCidade()%></td>
                <td><%= list.get(i).getUF()%></td>
                <td><%= Mask.formatString(list.get(i).getFone(), Mask.TELEFONE) %></td>
                <td><%= list.get(i).getEmail()%></td>
                <td><a href="javascript:editarRegistro(<%= list.get(i).getEmpresa()%>, <%= list.get(i).getCodigo() %>);"> <i class="fa fa-2x fa-pencil-square-o" aria-hidden="true"></i></a></td>                                    
                <td><a href="javascript:excluirRegistro(<%= list.get(i).getEmpresa()%>,<%= list.get(i).getCodigo()%>, '<%= list.get(i).getNome()%>' );"> <i class="fa fa-2x fa-times" aria-hidden="true"></i></a></td>                
            </tr>
            <% } %>
            <!-- Defini��o Rodap� -->    
        <tfoot>                
            <tr align="center"> 
                <td colspan="8">Registros apresentados <%= String.valueOf(list.size()) %></td>
            </tr>
        </tfoot>            

    </table>
</div>
<%@include file="../default/footer.jsp" %>