<%-- 
    Document   : view_clientes
    Created on : 10/07/2017, 23:32:11
    Author     : Dionatan
--%>

<form id="formClientes" name="formClientes" method="post" onsubmit="return validarCampos()"  action="javascript:salvar();">
        <table align="center" style="width:100%">          
            <tbody>
                
                <tr>
                    <!-- INPUT Empresa -->
                    <td align="left" style="width:15%">  
                        <label style="display: none;" for="empresa">Empresa</label>                       
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (cliente != null) { %>
                            <input type="text" id="empresa" name="empresa" style="width:10%;display: none;" value='<%= cliente.getEmpresa() %>'>                              
                        <%} else { %>
                        <input  type="text" id="empresa" name="empresa" style="width:10%;display: none;" value='<%= session.getAttribute("us_empresa") %>'>                              
                        <%}%>
                        
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <%if (cliente != null) { %>
                            <label for="codigo">Código</label> 
                        <%} else { %>
                            <label style="display: none;" for="codigo">Código</label> 
                        <%}%>
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (cliente != null) { %>
                            <input readonly type="text" id="codigo" name="codigo" style="width:10%" value='<%= cliente.getCodigo() %>'>                              
                        <%} else { %>
                            <input  type="text" id="codigo" name="codigo" style="width:10%;display: none;">                              
                        <%}%>
                        
                    </td>
                </tr>
                
                <tr>
                    <td align="left" style="width:15%">  
                        <label for="matricula">Matrícula:</label>  
                    </td>
                    <td align="left" colspan="1">
                        <%if (cliente != null) { %>                                        
                            <input type="text" id="matricula" name="matricula" style="width:100%" maxlength="20" required value='<%= cliente.getMatricula() %>'>                              
                        <%} else { %>
                            <input type="text" id="matricula" name="matricula" style="width:100%" maxlength="20" required>                              
                        <%}%>
                        
                    </td>
                </tr>

                <tr>

                    <td align="left" style="width:15%">  
                        <label for="nome">Nome:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <%if (cliente != null) { %>                                                                    
                            <input type="text" id="nome" name="nome" style="width:100%" maxlength="80" required value='<%= cliente.getNome() %>'>                                                            
                        <%} else { %>
                            <input type="text" id="nome" name="nome" style="width:100%" maxlength="80" required>                              
                        <%}%>
                        
                    </td>
                </tr>

                <tr>            
                    <td align="left" style="width:15%">  
                        <label for="cnpj">CNPJ:</label>  
                    </td>
                    <td align="left" colspan="1">
                        <%if (cliente != null) { %>                                                                                                
                            <input class="cnpj" type="text" id="cnpj" name="cnpj" style="width:100%" maxlength="14" value='<%= cliente.getCNPJ() %>'>                                                                                          
                        <%} else { %>
                            <input class="cnpj" type="text" id="cnpj" name="cnpj" style="width:100%" maxlength="14">                              
                        <%}%>
                        
                    </td>
                </tr>

                <tr>            
                    <td align="left" style="width:15%">  
                        <label for="cpf">CPF:</label>  
                    </td>
                    <td align="left" colspan="1">
                        <%if (cliente != null) { %>                                                                                                                            
                            <input class="cpf" type="text" id="cpf" name="cpf" style="width:100%" maxlength="11" required value='<%= cliente.getCPF() %>'>                                                                                                                        
                        <%} else { %>
                            <input class="cpf" type="text" id="cpf" name="cpf" style="width:100%" maxlength="11" required>                              
                        <%}%>
                        
                    </td>
                </tr>

                <tr>
                    <td align="left" style="width:15%">  
                        <label for="CEP">CEP:</label>  
                    </td>
                    <td align="left">
                        <%if (cliente != null) { %>                                                                                                                                                        
                            <input class="cep" type="text" id="CEP" name="CEP" style="width:100%" maxlength="9" required value='<%= cliente.getCEP() %>'>                              
                        <%} else { %>
                            <input class="cep" type="text" id="CEP" name="CEP" style="width:100%" maxlength="9" required>                              
                        <%}%>
                        
                    </td>        


                    <td align="right" style="width:10%">  
                        <label for="UF">UF:</label>  
                    </td>
                    <td align="left">
                        <%if (cliente != null) { %>                                                                                                                                                        
                            <input type="text" id="UF" name="UF" style="width:100%" maxlength="2" required value='<%= cliente.getUF() %>'>                                             
                        <%} else { %>
                            <input type="text" id="UF" name="UF" style="width:100%" maxlength="2" required>               
                        <%}%>
                        
                    </td>
                </tr> 

                <tr>

                    <td align="left" style="width:10%">  
                        <label for="cidade">Cidade:</label>  
                    </td>
                    <td align="left">
                        <%if (cliente != null) { %>                                                                                                                                                        
                            <input type="text" id="cidade" name="cidade" style="width:100%" maxlength="50" required value='<%= cliente.getCidade() %>'>                                             
                        <%} else { %>
                            <input type="text" id="cidade" name="cidade" style="width:100%" maxlength="50" required>               
                        <%}%>                                 
                    </td> 


                    <td align="right" style="width:15%">  
                        <label for="bairro">Bairro:</label>  
                    </td>
                    <td align="left">
                        <%if (cliente != null) { %>                                                                                                                                                        
                            <input type="text" id="bairro" name="bairro" style="width:100%" maxlength="30" value='<%= cliente.getBairro() %>'>                                                                          
                        <%} else { %>
                            <input type="text" id="bairro" name="bairro" style="width:100%" maxlength="30">                             
                        <%}%>        
                        
                    </td>
                </tr>      

                <tr>

                    <td align="left" style="width:15%">  
                        <label for="endereco">Endereço:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <%if (cliente != null) { %>                                                                                                                                                                                                                                                              
                            <input type="text" id="endereco" name="endereco" style="width:100%" maxlength="100" value='<%= cliente.getEndereco() %>'>                                                                                                        
                        <%} else { %>
                            <input type="text" id="endereco" name="endereco" style="width:100%" maxlength="100">                              
                        <%}%>    
                        
                    </td>
                </tr>    

                <tr>
                    <td align="left" style="width:15%">  
                        <label for="email">E-mail:</label>  
                    </td>
                    <td align="left">
                        <%if (cliente != null) { %>                                                                                                                                                                                                                                                                                          
                            <input type="text" id="email" name="email" style="width:100%" maxlength="100" value='<%= cliente.getEmail() %>'>                             
                        <%} else { %>
                            <input type="text" id="email" name="email" style="width:100%" maxlength="100">                             
                        <%}%> 
                        
                    </td>

                    <td align="right" style="width:15%">  
                        <label for="telefone">Telefone:</label>  
                    </td>
                    <td align="left">
                        <%if (cliente != null) { %>                                                                                                                                                                                                                                                                                          
                            <input class="phone_with_ddd" type="text" id="telefone" name="telefone" style="width:100%" maxlength="30" required value='<%= cliente.getFone() %>'>                             
                        <%} else { %>
                            <input class="phone_with_ddd" type="text" id="telefone" name="telefone" style="width:100%" maxlength="30" required>                             
                        <%}%> 
                        
                    </td>
                </tr>  

                <tr>
                    <!-- INPUT Status -->
                    <td align="left" style="width:10%">  
                        <label for="status">Status:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <select id="status" name="status" style="width:100%">               
                            <% if ((cliente != null) && (cliente.getInativo().equals("S"))){ %>
                                <option value="N">1 - Ativo</option>
                                <option selected value="S">2 - Inativo</option>
                            <%} else {%>
                                <option selected value="N">1 - Ativo</option>
                                <option value="S">2 - Inativo</option>                                
                             <%}%>
                        </select>             
                    </td> 
                </tr>
                <!-- Botoes -->
                <tr>          
                    <td align="right" colspan="4">
                        <%if (cliente == null) { %>
                            <input class="button-danger"  type="reset"  id="limpar" value=" Limpar">
                        <%} %>                                                    
                        <input class="button-success" type="submit" id="enviar" value=" Gravar!">          
                    </td>           
                </tr>  
            </tbody>                            
        </table>
</form>