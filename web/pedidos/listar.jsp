<%-- 
    Document   : listar
    Created on : 13/07/2017, 19:16:59
    Author     : Dionatan
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.univates.minhavenda.models.Clientes"%>
<%@page import="br.univates.minhavenda.controller.ClientesDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="br.univates.minhavenda.models.Pedidos"%>
<%@page import="br.univates.minhavenda.controller.PedidosDAO"%>
<%@include file="../default/header.jsp" %>

<%
    //Cria os Controllers utilizados
    PedidosDAO pedidosDAO = new PedidosDAO();       
%>    
<div class="header">
    <p> <i class="fa fa-building-o fa-2x" aria-hidden="true"> </i> Pedidos </p>     
    <p>       </p>     
</div>
    <script>
            <!-- Função javascript para chamar edição de registro -->
            function editarRegistro(empresa, codigo) {
                window.location.href = "<%=request.getContextPath()%>/pedidos/registro.jsp?empr="+empresa+"&&cod=" + codigo;
            }
            <!-- Função javascript para chamar Srvlet de exclusão de registro data:  $(this).serializeArray(), -->
            function excluirRegistro(empresa, codigo, nome){
                if (confirm('Confirma cancelamento do Pedido' + codigo + ' - ' + nome + '?')) {
                    $.ajax({
                        type: "POST",
                        url : "<%=request.getContextPath()%>/PedidosExcluir", 
                        data: { pe_pedido: codigo, pe_empresa: empresa },                        
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
                    <p><label for="localizaPedidos">Pesquisar Pedido:</label> <input placeholder="Digite o código do pedido" type="text" name="localizaPedidos" value="" size="50"> 
            
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
                <th> Pedido</th>      
                <th> Data</th>            				
                <th> Cliente</th>            				
                <th> Valor Total</th>            				
                <th> </th>      
                <th> </th>      
            </tr>
        </thead> 
        <tbody>
            <% 
                String where = "WHERE pe_empresa = "+session.getAttribute("us_empresa");
                
                if (! session.getAttribute("us_tipoacesso").equals("GERENTE")) {
                    where = where + " and pe_usuario = "+ session.getAttribute("us_codigo");
                }
                    
                // Se foi informado um valor no campo de pesquisa, adicionar ao SQL
                if ( request.getParameter("localizaPedidos") != null && request.getParameter("localizaPedidos") != "" ){
                    String localizarValor = request.getParameter("localizaPedidos").toLowerCase();
                    out.write("<b><p>Pesquisando por: ");
                    out.write(localizarValor + "</p></b>");
                                
                    // Adicionar condição WHERE ao SQL
                    // Observe que o SQL busca o valor parcial (%) e em minúsculo (LOWER)
                    // Vamos pesquisar em todos os campos...
                    where += " AND CAST(pe_pedido as TEXT) LIKE '%"+localizarValor+"%' ";
                                
                    //out.write(query); // debug SQL
                }
                
                List<Pedidos> list = pedidosDAO.listar(where);                 
                ClientesDAO clientesDAO = new ClientesDAO();
                
                SimpleDateFormat formatoData = new SimpleDateFormat("dd/MM/yyyy"); 
                
                
                for (int i = 0; i < list.size(); i++){     
                Clientes clie = new Clientes();  
                clie = clientesDAO.getCliente(String.valueOf(list.get(i).getEmpresa()), String.valueOf(list.get(i).getCliente()));
            %>                        
            <tr>
                <td><%= String.valueOf(list.get(i).getPedido()) %></td>
                <td><%= formatoData.format(list.get(i).getData()) %></td>
                <td><%= clie.getNome() %></td>
                <td>R$ <%= list.get(i).getValorTotal() %></td>
                <td><a href="javascript:editarRegistro(<%= list.get(i).getEmpresa()%>, <%= list.get(i).getPedido()%>);"> <i class="fa fa-2x fa-pencil-square-o" aria-hidden="true"></i></a></td>                                    
                <td><a href="javascript:excluirRegistro(<%= list.get(i).getEmpresa()%>,<%= list.get(i).getPedido()%>, '<%= clie.getNome()%>' );"> <i class="fa fa-2x fa-times" aria-hidden="true"></i></a></td>                
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
