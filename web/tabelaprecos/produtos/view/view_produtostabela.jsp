<%-- 
    Document   : view_produtostabela
    Created on : 13/07/2017, 08:49:01
    Author     : Dionatan
--%>
<%@page import="br.univates.minhavenda.models.TabelaPrecos_Detalhes"%>
<%@page import="br.univates.minhavenda.controller.TabelaPrecosDetalhesDAO"%>
<%@page import="br.univates.minhavenda.models.Produtos"%>
<%@page import="br.univates.minhavenda.controller.ProdutosDAO"%>
<%@page import="java.util.List"%>
   
<script>
            <!-- Função javascript para chamar Srvlet de exclusão de registro data: -->
            function excluirRegistro(empresa, tabela, produto){
                if (confirm('Confirma exclusão do Produto?')) {
                    $.ajax({
                        type: "POST",
                        url : "<%=request.getContextPath()%>/TabelaPrecosProdutosExcluir", 
                        data: { td_tabelapreco: tabela, td_empresa: empresa, td_produto: produto },                        
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
                        <%if (tabelapreco != null) { %>
                            <input type="text" id="empresa" name="empresa" style="width:10%;display: none;" value='<%= tabelapreco.getEmpresa() %>'>                              
                        <%} %>                            
                        
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <%if (tabelapreco != null) { %>
                            <label for="codigoTabela">Tabela de Preços</label> 
                        <%}%>                           
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (tabelapreco != null) { %>
                            <input readonly type="text" id="codigoTabela" name="codigoTabela" style="width:10%" value='<%= tabelapreco.getCodigo() %>'>                              
                        <%}%>
                        
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Nome -->
                    <td align="left" style="width:15%">  
                        <label for="nome">Descrição</label>  
                    </td>
                    <td align="left" colspan="3">
                         <%if (tabelapreco != null) { %>
                            <input readonly type="text" id="nome" name="nome" style="width:100%" maxlength="50" required value='<%= tabelapreco.getNome() %>'>  
                        <%}%>                                                     
                    </td>
                </tr>   
                
                <tr><td><hr></td><td><hr></td><td><hr></td><td><hr></td></tr>
                                                               
                <tr>
                    <!-- INPUT Nome -->
                    <td align="left" style="width:15%">  
                        <label for="nome">Nome:</label>  
                    </td>
                    <td align="left" colspan="3">
                    <div class="field">
                        <input required id="nope" name="nope" placeholder="Digite o nome do Produto" maxlength="40" autocomplete="off" type="text"> 
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
                    <td align="left" style="width:15%">  
                        <label for="grupo">Grupo</label>  
                    </td>
                    <td align="left">
                        <%if (produto != null) { %>                                                                                                                                                        
                            <input readonly type="text" id="grupo" name="grupo" style="width:100%" maxlength="9" required value='<%= produto.getNome() %>'>                              
                        <%} else { %>
                            <input readonly  type="text" id="grupo" name="grupo" style="width:100%" maxlength="9" required>                              
                        <%}%>
                        
                    </td>        


                    <td align="right" style="width:10%">  
                        <label for="valor">Valor:</label>  
                    </td>
                    <td align="left">
                        <%if (produto != null) { %>                                                                                                                                                        
                            <input type="text" id="valor" name="valor" style="width:100%" maxlength="2" required value='<%= produto.getNome() %>'>                                             
                        <%} else { %>
                            <input type="text" id="valor" name="valor" style="width:100%" maxlength="2" required>               
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
                <th> Valor</th>            				                 
                <th> </th>                  
            </tr>
        </thead> 
        <tbody>
            <% 
                String where = "WHERE td_empresa = "+ String.valueOf(tabelapreco.getEmpresa()) 
                              +" and td_tabelapreco = " + String.valueOf(tabelapreco.getCodigo());
                // Se foi informado um valor no campo de pesquisa, adicionar ao SQL
                
                TabelaPrecosDetalhesDAO tabeladetalhesDAO = new TabelaPrecosDetalhesDAO();
                List<TabelaPrecos_Detalhes> list = tabeladetalhesDAO.listar(where);
                
                ProdutosDAO produtosDAO = new ProdutosDAO();
                for (int i = 0; i < list.size(); i++){    
                    Produtos prod = new Produtos();
                    prod = produtosDAO.getProduto(String.valueOf(tabelapreco.getEmpresa()), 
                                                     String.valueOf(list.get(i).getProduto()));
            %>                        
            <tr>
                <td><%= String.valueOf(list.get(i).getProduto()) %></td>
                <td> <%= prod.getNome()%></td>
                <td> R$ <%= list.get(i).getPreco()%></td>
                <td><a href="javascript:excluirRegistro(<%= list.get(i).getEmpresa()%>,<%= list.get(i).getTabelaPreco()%>,<%= list.get(i).getProduto()%>);"> <i class="fa fa-2x fa-times" aria-hidden="true"></i></a></td>                
            </tr>
            <% } %>
            <!-- Definição Rodapé -->    
        <tfoot>                
            <tr align="center"> 
                <td colspan="7">Registros apresentados <%= String.valueOf(list.size()) %></td>
            </tr>
        </tfoot>            
    </table>
    
    
      
                    
                
      
   