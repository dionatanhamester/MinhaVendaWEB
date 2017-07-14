<%-- 
    Document   : view_produtospedido
    Created on : 13/07/2017, 23:05:21
    Author     : Dionatan
--%>
<%@page import="br.univates.minhavenda.controller.ItensPedidosDAO"%>
<%@page import="br.univates.minhavenda.models.ItensPedido"%>
<%@page import="br.univates.minhavenda.models.TabelaPrecos_Detalhes"%>
<%@page import="br.univates.minhavenda.controller.TabelaPrecosDetalhesDAO"%>
<%@page import="br.univates.minhavenda.models.Produtos"%>
<%@page import="br.univates.minhavenda.controller.ProdutosDAO"%>
<%@page import="java.util.List"%>
   
<script>
            <!-- Função javascript para chamar Srvlet de exclusão de registro data: -->
            function excluirRegistro(empresa, usuario, pedidocod, produto){
                if (confirm('Confirma exclusão do Produto?')) {
                    $.ajax({
                        type: "POST",
                        url : "<%=request.getContextPath()%>/PedidosProdutosExcluir", 
                        data: { ip_pedido: pedidocod, ip_empresa: empresa, ip_usuario: usuario, ip_produto: produto },                        
                        success: function(returnFunction){                                                                                         
                            window.location.reload();
                        }
                    });      
                }
                            
            }
    </script> 

    <form id="formProdutos" name="formProdutos" method="post" action="javascript:salvar();">
        <table align="center" style="width:100%">          
            <tbody>                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <label style="display: none;" for="empresa">Empresa</label>                       
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (pedido != null) { %>
                            <input type="text" id="empresa" name="empresa" style="width:10%;display: none;" value='<%= pedido.getEmpresa() %>'>                              
                        <%} %>                            
                        
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <label style="display: none;" for="usuario">Usuario</label>                       
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (pedido != null) { %>
                            <input type="text" id="usuario" name="usuario" style="width:10%;display: none;" value='<%= pedido.getUsuario() %>'>                              
                        <%} %>                            
                        
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <%if (pedido != null) { %>
                            <label for="codigopedido">Pedido</label> 
                        <%}%>                           
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (pedido != null) { %>
                            <input readonly type="text" id="codigopedido" name="codigopedido" style="width:10%" value='<%= pedido.getPedido() %>'>                              
                        <%}%>
                        
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Nome -->
                    <td align="left" style="width:15%">  
                        <label for="nome">Cliente</label>  
                    </td>
                    <td align="left" colspan="3">
                         <%if (cliente != null) { %>
                            <input readonly type="text" id="nome" name="nome" style="width:100%" maxlength="50" required value='<%= cliente.getNome() %>'>  
                        <%}%>                                                     
                    </td>
                </tr>   
                
                <tr>
                    <!-- INPUT Nome -->
                    <td align="left" style="width:15%">  
                        <label for="duracao">Duração do Pedido</label>  
                    </td>
                    <td align="left" colspan="3">
                         <%if (pedido != null) { %>
                            <input readonly type="text" id="duracao" name="duracao" style="width:100%" maxlength="50" required value='<%= pedido.getDuracao() %>'>  
                        <%}%>                                                     
                    </td>
                </tr>   
                
                <tr><td><hr></td><td><hr></td><td><hr></td><td><hr></td></tr>
                                                               
                <tr>
                    <!-- INPUT Nome -->
                    <td align="left" style="width:15%">  
                        <label for="nomeproduto">Produto:</label>  
                    </td>
                    <td align="left" colspan="3">
                    <div class="field">
                        <input required id="nomeproduto" name="nomeproduto" placeholder="Digite o nome do Produto" maxlength="40" autocomplete="off" type="text"> 
                    </div>                                          
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <label for="codigoProduto">Código Produto</label> 
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (produto != null) { %>
                            <input readonly type="text" id="codigoProduto" name="codigoProduto" style="width:10%" value='<%= produto.getCodigo() %>'>                              
                        <%} else { %>
                            <input readonly type="text" id="codigoProduto" name="codigoProduto" style="width:10%">                              
                        <%}%>
                        
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%;display: none;">  
                        <label for="codigotabelapreco">Código Tabela Preco</label> 
                    </td>
                    
                    <td align="left" colspan="3">  
                        <input readonly type="text" id="codigotabelapreco" name="codigotabelapreco" style="width:10%;display: none;">                              
                    </td>
                </tr>
                
   
                <tr>
                    <td align="left" style="width:15%">  
                        <label for="nometabelapreco">Tabela Preço</label>  
                    </td>
                    <td align="left">
                        <div class="field">
                            <input required id="nometabelapreco" name="nometabelapreco" placeholder="Digite o nome da Tabela" maxlength="40" autocomplete="off" type="text"> 
                        </div>                          
                    </td>        


                    <td align="right" style="width:10%">  
                        <label for="valor">Valor:</label>  
                    </td>
                    <td align="left">
                        <%if (itempedido != null) { %>                                                                                                                                                        
                            <input readonly type="text" id="valor" name="valor" style="width:100%" maxlength="2" value='<%= itempedido.getValorUnitario() %>'>                                             
                        <%} else { %>
                            <input readonly type="text" id="valor" name="valor" style="width:100%" maxlength="2" >               
                        <%}%>
                        
                    </td>
                </tr> 
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <label for="quantidade">Quantidade</label> 
                    </td>
                    
                    <td align="left">
                        <%if (itempedido != null) { %>
                            <input type="text" id="quantidade" name="quantidade" style="width:100%" value='<%= itempedido.getQuantidade() %>'>                              
                        <%} else { %>
                            <input type="text" id="quantidade" name="quantidade" style="width:100%">                              
                        <%}%>
                        
                    </td>
                </tr>

                <!-- Botoes -->
                <tr>          
                    <td align="right" colspan="4">
                        <%if (produto == null) { %>
                            <input class="button-danger"  type="reset"  id="limpar" value=" Limpar">
                        <%} %>                                                    
                        <input class="button-success" type="submit" id="enviar" value=" Gravar Produto!">          
                    </td>           
                </tr>  
            </tbody>                            
        </table>
</form>
<hr>
    <!-- Table com a Listagem dos dados -->
    <table class="datatable" border="1px" style="width:100%">  
        <thead>
            <tr>
                <th> Código</th>      
                <th> Produto</th>    
                <th> Quant.</th>                
                <th> Valor Unit.</th>   
                <th> Valor Total</th>                  
                <th> </th>                  
            </tr>
        </thead> 
        <tbody>
            <% 
                String where = "WHERE ip_emresa = "+ String.valueOf(pedido.getEmpresa()) 
                              +" and ip_pedido = " + String.valueOf(pedido.getPedido());
                // Se foi informado um valor no campo de pesquisa, adicionar ao SQL
                List<ItensPedido> list = itenspedidoDAO.listar(where);
                
                ProdutosDAO produtosDAO = new ProdutosDAO();
                for (int i = 0; i < list.size(); i++){    
                    Produtos prod = new Produtos();
                    prod = produtosDAO.getProduto(String.valueOf(pedido.getEmpresa()), 
                                                     String.valueOf(list.get(i).getProduto()));
            %>                        
            <tr>
                <td><%= String.valueOf(list.get(i).getProduto()) %></td>
                <td><%= prod.getNome()%></td>
                <td><%= String.valueOf(list.get(i).getQuantidade()) %></td>
                <td>R$ <%= String.valueOf(list.get(i).getValorUnitario()) %></td>
                <td>R$ <%= String.valueOf(list.get(i).getValorTotal()) %></td>
                <td><a href="javascript:excluirRegistro(<%= list.get(i).getEmpresa()%>,<%= list.get(i).getUsuario()%>,<%= list.get(i).getPedido()%>, <%= list.get(i).getProduto()%>);"> <i class="fa fa-2x fa-times" aria-hidden="true"></i></a></td>                
            </tr>
            <% } %>
            <!-- Definição Rodapé -->    
        <tfoot>                
            <tr align="center"> 
                <td colspan="7">Registros apresentados <%= String.valueOf(list.size()) %></td>
            </tr>
        </tfoot>            
    </table>
    
    
      
                    
                
      
   