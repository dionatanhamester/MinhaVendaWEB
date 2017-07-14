<%-- 
    Document   : view_pedidos
    Created on : 13/07/2017, 20:27:03
    Author     : Dionatan
--%>

<form id="formPedidos" name="formPedidos" method="post" action="javascript:salvar();">
        <table align="center" style="width:100%">          
            <tbody>
                <tr>
                    <!-- INPUT Usuário -->
                    <td align="left" style="width:15%">  
                        <label style="display: none;" for="usuario">Usuário</label>                       
                    </td>                    
                    <td align="left" colspan="3">
                        <input  type="text" id="usuario" name="usuario" style="width:10%;display: none;" value='<%= session.getAttribute("us_codigo") %>'>                                                      
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <label style="display: none;" for="empresa">Empresa</label>                       
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (pedido != null) { %>
                            <input type="text" id="empresa" name="empresa" style="width:10%;display: none;" value='<%= pedido.getEmpresa() %>'>                              
                        <%} else { %>
                        <input  type="text" id="empresa" name="empresa" style="width:10%;display: none;" value='<%= session.getAttribute("us_empresa") %>'>                              
                        <%}%>
                        
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <%if (pedido != null) { %>
                            <label for="pedido">Pedido</label> 
                        <%} else { %>
                            <label style="display: none;" for="pedido">Código</label> 
                        <%}%>
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (pedido != null) { %>
                            <input readonly type="text" id="pedido" name="pedido" style="width:10%" value='<%= pedido.getPedido() %>'>                              
                        <%} else { %>
                            <input  type="text" id="pedido" name="pedido" style="width:10%;display: none;">                              
                        <%}%>
                        
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Código Cliente -->
                    <td align="left" style="width:15%">  
                        <label style="display: none;" for="codigoCliente">Código Cliente</label>                       
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (pedido != null) { %>
                            <input type="text" id="codigoCliente" name="codigoCliente" style="width:10%;display: none;" value='<%= pedido.getCliente() %>'>                              
                        <%} else { %>
                            <input  type="text" id="codigoCliente" name="codigoCliente" style="width:10%;display: none;">                              
                        <%}%>
                        
                    </td>
                </tr>
                
                <tr>
                    <td align="left" style="width:20%">  
                        <label for="nomecliente">Cliente:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <div class="field">
                        <%if (cliente != null) { %>                            
                            <input required id="nomecliente" name="nomecliente" placeholder="Digite o nome do Cliente" maxlength="40" autocomplete="off" type="text" value='<%= cliente.getNome() %>'> 
                        <%} else { %>
                            <input required id="nomecliente" name="nomecliente" placeholder="Digite o nome do Cliente" maxlength="40" autocomplete="off" type="text"> 
                        <%}%>                            
                        </div>                        
                    </td> 
                </tr>                                                 
                
                <tr>           
                    <td align="left" style="width:20%">  
                        <label for="duracao">Duração ( Dias ):</label>  
                    </td>
                    <td align="left" colspan="1">
                        <%if (pedido != null) { %>                            
                            <input type="text" id="duracao" name="duracao" style="width:100%" required value='<%= pedido.getDuracao() %>'>                                                            
                        <%} else { %>
                            <input type="text" id="duracao" name="duracao" style="width:100%" required>                              
                        <%}%>                                                
                    </td>
                </tr>

                
                <tr>           
                    <td align="left" style="width:20%">  
                        <label for="pesovivo">Peso Vivo ( Kgs ):</label>  
                    </td>
                    <td align="left" colspan="1">
                        <%if (pedido != null) { %>                                                                                   
                            <input type="number" id="pesovivo" name="pesovivo" style="width:100%" required value='<%= pedido.getPesoVivo() %>'>                             
                        <%} else { %>
                            <input type="number" id="pesovivo" name="pesovivo" style="width:100%" required>                              
                        <%}%>                        
                        
                    </td>
                </tr>

                
                <tr>           
                    <td align="left" style="width:20%">  
                        <label for="producao">Produção de Leite ( lts ):</label>  
                    </td>
                    <td align="left" colspan="1">
                        <%if (pedido != null) { %>                                                                                                               
                            <input type="number" id="producao" name="producao" style="width:100%" required value='<%= pedido.getProducaoLeite() %>'>                                                         
                        <%} else { %>
                            <input type="number" id="producao" name="producao" style="width:100%" required>                              
                        <%}%>                            
                    </td>
                </tr>

                <tr>           
                    <td align="left" style="width:20%">  
                        <label for="lactantes">Lactantes:</label>  
                    </td>
                    <td align="left" colspan="1">
                        <%if (pedido != null) { %>                                                                                                                                           
                            <input type="number" id="lactantes" name="lactantes" style="width:100%" required value='<%= pedido.getLactantes() %>'>                                                                                       
                        <%} else { %>
                            <input type="number" id="lactantes" name="lactantes" style="width:100%" required>                              
                        <%}%>    
                        
                    </td>

                    <td align="right" style="width:20%">  
                        <label for="preparto">Pré-Parto:</label>  
                    </td>
                    <td align="left" colspan="1">
                        <%if (pedido != null) { %>                                                                                                                                                                                              
                            <input type="number" id="preparto" name="preparto" style="width:100%" required value='<%= pedido.getPreparto() %>'>
                        <%} else { %>
                            <input type="number" id="preparto" name="preparto" style="width:100%" required>
                        <%}%>    
                                                      
                    </td>
                </tr>

                <tr>           
                    <td align="left" style="width:20%">  
                        <label for="novilhas">Novilhas:</label>  
                    </td>
                    <td align="left" colspan="1">
                        
                        <%if (pedido != null) { %>                                                                                                                                                                                                                          
                            <input type="number" id="novilhas" name="novilhas" style="width:100%" required value='<%= pedido.getNovilhas() %>'>                              
                        <%} else { %>
                            <input type="number" id="novilhas" name="novilhas" style="width:100%" required>                              
                        <%}%>  
                    </td>
                </tr>

                <tr>           
                    <td align="left" style="width:20%">  
                        <label for="terneiras_2meses">Terneiras ( 2 Meses ):</label>  
                    </td>
                    <td align="left" colspan="1">
                        
                        <%if (pedido != null) { %>                                                                                                                                                                                                                                                      
                            <input type="number" id="terneiras_2meses" name="terneiras_2meses" style="width:100%" required value='<%= pedido.getTerneiras_2Meses() %>'>                                                           
                        <%} else { %>
                            <input type="number" id="terneiras_2meses" name="terneiras_2meses" style="width:100%" required>                              
                        <%}%> 
                    </td>

                    <td align="right" style="width:20%">  
                        <label for="terneiras_6meses">Terneiras ( 6 Meses ):</label>  
                    </td>
                    <td align="left" colspan="1">
                        <%if (pedido != null) { %>                                                                                                                                                                                                                                                                                                 
                            <input type="number" id="terneiras_6meses" name="terneiras_6meses" style="width:100%" required value='<%= pedido.getTerneiras_6Meses() %>'>                              
                        <%} else { %>
                            <input type="number" id="terneiras_6meses" name="terneiras_6meses" style="width:100%" required>                              
                        <%}%> 
                        
                    </td>
                </tr>

                <tr>
                    <!-- INPUT Unidade -->
                    <td align="left" style="width:15%">  
                        <label for="obs">Observação:</label>  
                    </td>
                    <td align="left">
                        
                        <%if (pedido != null) { %>                                                                                                                                                                                                                                                                                                                             
                            <textarea id="obs" name="obs" style="width:100%"><%= pedido.getOBS() %></textarea>                              
                        <%} else { %>
                            <textarea id="obs" name="obs" style="width:100%"></textarea>                              
                        <%}%> 
                    </td>
                </tr>

                
                <tr>
                    <!-- INPUT Código Cliente -->
                    <td align="left" style="width:15%">  
                        <label style="display: none;" for="codigoformapgto">Código Cliente</label>                       
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (formapgto != null) { %>
                            <input type="text" id="codigoformapgto" name="codigoformapgto" style="width:10%;display: none;" value='<%= formapgto.getCodigo() %>'>                              
                        <%} else { %>
                            <input  type="text" id="codigoformapgto" name="codigoformapgto" style="width:10%;display: none;">                              
                        <%}%>
                        
                    </td>
                </tr>
                
                <tr>
                    <td align="left" style="width:20%">  
                        <label for="formapgto">Forma de Pagamento:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <div class="field">
                            
                            <%if (formapgto != null) { %>                                                          
                                <input required id="formapgto" name="formapgto" placeholder="Digite a forma de pagamento" maxlength="40" autocomplete="off" type="text" value='<%= formapgto.getDescricao() %>'>
                            <%} else { %>
                                <input required id="formapgto" name="formapgto" placeholder="Digite a forma de pagamento" maxlength="40" autocomplete="off" type="text"> 
                            <%}%>
                        </div>             
                    </td> 
                </tr> 

                <tr>           
                    <td align="left" style="width:20%">  
                        <label for="total">Valor Total:</label>  
                    </td>
                    <td align="left" colspan="1">
                        
                            <%if (pedido != null) { %>                                                          
                                <input type="text" id="total" name="total" style="width:100%"  disabled value='<%= pedido.getValorTotal() %>'>                              
                            <%} else { %>
                                <input type="text" id="total" name="total" style="width:100%"  disabled>                              
                            <%}%>
                    </td>
                </tr>
                
                <!-- Botoes -->
                <tr>          
                    <td align="right" colspan="4">
                        <%if (pedido == null) { %>
                            <input class="button-danger"  type="reset"  id="limpar" value=" Limpar">
                        <%} %>                                                    
                        <input class="button-success" type="submit" id="enviar" value=" Gravar!">          
                    </td>           
                </tr>  
            </tbody>                            
        </table>
</form>
                        
<table align="center" style="width:100%">          
    <tbody>
        <tr>          
            <td align="right" colspan="4">  
                <% if (request.getParameter("cod") != null) { %>
                    <a href="produtos/registro.jsp?empr=<%= request.getParameter("empr") %>&&cod=<%= request.getParameter("cod") %>" ><button class="button-primary" id="adicionar">Ajustar Itens <i class="fa fa-long-arrow-right" aria-hidden="true"></i></button></a>                     
                <%}%>
            </td>           
        </tr>  
    </tbody>                            
</table> 
            
            