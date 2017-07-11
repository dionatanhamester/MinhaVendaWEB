<%-- 
    Document   : listar
    Created on : 10/07/2017, 20:58:32
    Author     : Dionatan
--%>

<%@page import="br.univates.minhavenda.utils.Mask"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="br.univates.minhavenda.models.Produtos"%>
<%@page import="br.univates.minhavenda.controller.ProdutosDAO"%>
<%@include file="../default/header.jsp" %>

<%
    //Cria os Controllers utilizados
    ProdutosDAO produtosDAO = new ProdutosDAO();       
%>    
<div class="header">
    <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Produtos      </p>     
    
</div>
    <script>
            <!-- Função javascript para chamar edição de registro -->
            function editarRegistro(empresa, codigo) {
                window.location.href = "<%=request.getContextPath()%>/produtos/registro.jsp?empr="+empresa+"&&cod=" + codigo;
            }
            <!-- Função javascript para chamar Srvlet de exclusão de registro data:  $(this).serializeArray(), -->
            function excluirRegistro(empresa, codigo, nome){
                if (confirm('Confirma exclusão do Produto ' + codigo + ' - ' + nome + '?')) {
                    $.ajax({
                        type: "POST",
                        url : "<%=request.getContextPath()%>/ProdutosExcluir", 
                        data: { pr_codigo: codigo, pr_empresa: empresa },                        
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
                    <p><label for="localizaProdutos">Pesquisar:</label> <input type="text" name="localizaProdutos" value="" size="50"> 
            
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
                <th> Unidade</th>            				
                <th> </th>  
                <th> </th>                  
            </tr>
        </thead> 
        <tbody>
            <% 
                String where = "WHERE pr_empresa = "+ session.getAttribute("us_empresa");
                // Se foi informado um valor no campo de pesquisa, adicionar ao SQL
                if ( request.getParameter("localizaProdutos") != null && request.getParameter("localizaProdutos") != "" ){
                    String localizarValor = request.getParameter("localizaProdutos").toLowerCase();
                    out.write("<b><p>Pesquisando por: ");
                    out.write(localizarValor + "</p></b>");
                                
                    // Adicionar condição WHERE ao SQL
                    // Observe que o SQL busca o valor parcial (%) e em minúsculo (LOWER)
                    // Vamos pesquisar em todos os campos...
                    where += " AND LOWER(pr_nome) LIKE '%"+localizarValor+"%' ";
                                
                    //out.write(query); // debug SQL
                }
                
                List<Produtos> list = produtosDAO.listar(where);                 
                for (int i = 0; i < list.size(); i++){                                 
            %>                        
            <tr>
                <td><%= String.valueOf(list.get(i).getCodigo()) %></td>
                <td><%= list.get(i).getNome()%></td>
                <td><%= list.get(i).getUnidade()%></td>
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
