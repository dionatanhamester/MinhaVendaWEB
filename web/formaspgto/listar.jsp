<%-- 
    Document   : listar
    Created on : 12/07/2017, 18:57:46
    Author     : Dionatan
--%>


<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="br.univates.minhavenda.models.FormasPgto"%>
<%@page import="br.univates.minhavenda.controller.FormasPgtoDAO"%>
<%@include file="../default/header.jsp" %>

<%
    //Cria os Controllers utilizados
    FormasPgtoDAO formaspgtoDAO = new FormasPgtoDAO();       
%>    
<div class="header">
    <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Formas de Pagametno </p>     
    <p>       </p>     
</div>
    <script>
            <!-- Fun��o javascript para chamar edi��o de registro -->
            function editarRegistro(empresa, codigo) {
                window.location.href = "<%=request.getContextPath()%>/formaspgto/registro.jsp?empr="+empresa+"&&cod=" + codigo;
            }
            <!-- Fun��o javascript para chamar Srvlet de exclus�o de registro data:  $(this).serializeArray(), -->
            function excluirRegistro(empresa, codigo, nome){
                if (confirm('Confirma exclus�o da Forma de Pagamento ' + codigo + ' - ' + nome + '?')) {
                    $.ajax({
                        type: "POST",
                        url : "<%=request.getContextPath()%>/FormasPgtoExcluir", 
                        data: { fp_codigo: codigo, fp_empresa: empresa },                        
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
                    <p><label for="localizaFormaPgto">Pesquisar:</label> <input type="text" name="localizaFormaPgto" value="" size="50"> 
            
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
                <th> C�digo</th>      
                <th> Descri��o</th>            				                          				
                <th> </th>   
                <th> </th> 
            </tr>
        </thead> 
        <tbody>
            <% 
                String where = "WHERE fp_empresa = "+session.getAttribute("us_empresa");
                // Se foi informado um valor no campo de pesquisa, adicionar ao SQL
                if ( request.getParameter("localizaFormaPgto") != null && request.getParameter("localizaFormaPgto") != "" ){
                    String localizarValor = request.getParameter("localizaFormaPgto").toLowerCase();
                    out.write("<b><p>Pesquisando por: ");
                    out.write(localizarValor + "</p></b>");
                                
                    // Adicionar condi��o WHERE ao SQL
                    // Observe que o SQL busca o valor parcial (%) e em min�sculo (LOWER)
                    // Vamos pesquisar em todos os campos...
                    where += " AND LOWER(fp_descricao) LIKE '%"+localizarValor+"%' ";
                                
                    //out.write(query); // debug SQL
                }
                
                List<FormasPgto> list = formaspgtoDAO.listar(where);                 
                for (int i = 0; i < list.size(); i++){                                 
            %>                        
            <tr>
                <td><%= String.valueOf(list.get(i).getCodigo()) %></td>
                <td><%= list.get(i).getDescricao()%></td>
                <td><a href="javascript:editarRegistro(<%= list.get(i).getEmpresa()%>, <%= list.get(i).getCodigo() %>);"> <i class="fa fa-2x fa-pencil-square-o" aria-hidden="true"></i></a></td>                                    
                <td><a href="javascript:excluirRegistro(<%= list.get(i).getEmpresa()%>,<%= list.get(i).getCodigo()%>, '<%= list.get(i).getDescricao()%>' );"> <i class="fa fa-2x fa-times" aria-hidden="true"></i></a></td>                
            </tr>
            <% } %>
            <!-- Defini��o Rodap� -->    
        <tfoot>                
            <tr align="center"> 
                <td colspan="7">Registros apresentados <%= String.valueOf(list.size()) %></td>
            </tr>
        </tfoot>            

    </table>
</div>
<%@include file="../default/footer.jsp" %>

