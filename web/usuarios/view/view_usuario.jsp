<%-- 
    Document   : view_usuario
    Created on : 12/07/2017, 19:04:56
    Author     : Dionatan
--%>

<form id="formUsuario" name="formUsuario" method="post" onsubmit="return validarCampos()"  action="javascript:salvar();">
        <table align="center" style="width:100%">          
            <tbody>
                
                <tr>
                    <!-- INPUT Empresa -->
                    <td align="left" style="width:15%">  
                        <label style="display: none;" for="empresa">Empresa</label>                       
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (usuario != null) { %>
                            <input type="text" id="empresa" name="empresa" style="width:10%;display: none;" value='<%= usuario.getEmpresa() %>'>                              
                        <%} else { %>
                        <input  type="text" id="empresa" name="empresa" style="width:10%;display: none;" value='<%= session.getAttribute("us_empresa") %>'>                              
                        <%}%>
                        
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <%if (usuario != null) { %>
                            <label for="codigo">Código</label> 
                        <%} else { %>
                            <label style="display: none;" for="codigo">Código</label> 
                        <%}%>
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (usuario != null) { %>
                            <input readonly type="text" id="codigo" name="codigo" style="width:10%" value='<%= usuario.getCodigo() %>'>                              
                        <%} else { %>
                            <input  type="text" id="codigo" name="codigo" style="width:10%;display: none;">                              
                        <%}%>
                        
                    </td>
                </tr>
                                
                <tr>
                    <td align="left" style="width:15%">  
                        <label for="nome">Nome:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <%if (usuario != null) { %>                                                                    
                            <input type="text" id="nome" name="nome" style="width:100%" maxlength="80" required value='<%= usuario.getNome() %>'>                                                            
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
                        <%if (usuario != null) { %>                                                                                                
                            <input class="cnpj" type="text" id="cnpj" name="cnpj" style="width:100%" maxlength="14" value='<%= usuario.getCNPJ() %>'>                                                                                          
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
                        <%if (usuario != null) { %>                                                                                                                            
                            <input class="cpf" type="text" id="cpf" name="cpf" style="width:100%" maxlength="11" required value='<%= usuario.getCPF() %>'>                                                                                                                        
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
                        <%if (usuario != null) { %>                                                                                                                                                        
                            <input class="cep" type="text" id="CEP" name="CEP" style="width:100%" maxlength="9" required value='<%= usuario.getCEP() %>'>                              
                        <%} else { %>
                            <input class="cep" type="text" id="CEP" name="CEP" style="width:100%" maxlength="9" required>                              
                        <%}%>
                        
                    </td>        


                    <td align="right" style="width:10%">  
                        <label for="UF">UF:</label>  
                    </td>
                    <td align="left">
                        <%if (usuario != null) { %>                                                                                                                                                        
                            <input type="text" id="UF" name="UF" style="width:100%" maxlength="2" required value='<%= usuario.getUF() %>'>                                             
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
                        <%if (usuario != null) { %>                                                                                                                                                        
                            <input type="text" id="cidade" name="cidade" style="width:100%" maxlength="50" required value='<%= usuario.getCidade() %>'>                                             
                        <%} else { %>
                            <input type="text" id="cidade" name="cidade" style="width:100%" maxlength="50" required>               
                        <%}%>                                 
                    </td> 


                    <td align="right" style="width:15%">  
                        <label for="bairro">Bairro:</label>  
                    </td>
                    <td align="left">
                        <%if (usuario != null) { %>                                                                                                                                                        
                            <input type="text" id="bairro" name="bairro" style="width:100%" maxlength="30" value='<%= usuario.getBairro() %>'>                                                                          
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
                        <%if (usuario != null) { %>                                                                                                                                                                                                                                                              
                            <input type="text" id="endereco" name="endereco" style="width:100%" maxlength="100" value='<%= usuario.getEndereco() %>'>                                                                                                        
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
                        <%if (usuario != null) { %>                                                                                                                                                                                                                                                                                          
                            <input type="text" id="email" name="email" style="width:100%" maxlength="100" value='<%= usuario.getEmail() %>'>                             
                        <%} else { %>
                            <input type="text" id="email" name="email" style="width:100%" maxlength="100">                             
                        <%}%> 
                        
                    </td>

                    <td align="right" style="width:15%">  
                        <label for="telefone">Telefone:</label>  
                    </td>
                    <td align="left">
                        <%if (usuario != null) { %>                                                                                                                                                                                                                                                                                          
                            <input class="phone_with_ddd" type="text" id="telefone" name="telefone" style="width:100%" maxlength="30" required value='<%= usuario.getTelefone() %>'>                             
                        <%} else { %>
                            <input class="phone_with_ddd" type="text" id="telefone" name="telefone" style="width:100%" maxlength="30" required>                             
                        <%}%> 
                        
                    </td>
                </tr>  

                <tr>
                    <!-- INPUT TipoAcesso -->
                    <td align="left" style="width:15%">  
                        <label for="tipoacesso">Tipo Acesso</label>  
                    </td>
                    <td align="left" colspan="1">
                        <select id="tipoacesso" name="tipoacesso" style="width:100%">               
                            <% if ((usuario != null) && (usuario.getTipoAcesso().equals("USUARIO"))){ %>
                                <option value="GERENTE">1 - Gerente</option>
                                <option selected value="USUARIO">2 - Usuário</option>
                            <%} else {%>
                                <option selected value="GERENTE">1 - Gerente</option>
                                <option value="USUARIO">2 - Usuário</option>                                
                             <%}%>
                        </select>             
                    </td>                     
                </tr>
                
                <tr>
                    <td align="left" style="width:15%">  
                        <label for="usuario">Usuário</label>  
                    </td>
                    <td align="left">
                        <%if (usuario != null) { %>                                                                                                                                                                                                                                                                                          
                            <input type="text" id="usuario" name="usuario" style="width:100%" maxlength="100" value='<%= usuario.getUsuario() %>' required>                             
                        <%} else { %>
                            <input type="text" id="usuario" name="usuario" style="width:100%" maxlength="100" required>                             
                        <%}%> 
                        
                    </td>

                    <td align="right" style="width:15%">  
                        <label for="senha">Senha</label>  
                    </td>
                    <td align="left">
                        <%if (usuario != null) { %>                                                                                                                                                                                                                                                                                          
                            <input type="password" id="senha" name="senha" style="width:100%" maxlength="30" required value='<%= usuario.getSenha() %>'>                             
                        <%} else { %>
                            <input type="password" id="senha" name="senha" style="width:100%" maxlength="30" required>                             
                        <%}%> 
                        
                    </td>
                </tr>  
                
                
                
                
                
                <!-- Botoes -->
                <tr>          
                    <td align="right" colspan="4">
                        <%if (usuario == null) { %>
                            <input class="button-danger"  type="reset"  id="limpar" value=" Limpar">
                        <%} %>                                                    
                        <input class="button-success" type="submit" id="enviar" value=" Gravar!">          
                    </td>           
                </tr>  
            </tbody>                            
        </table>
</form>