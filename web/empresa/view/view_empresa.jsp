<form id="formEmpresa" name="formEmpresa" method="post" onsubmit="return validarCampos()"  action="javascript:salvar();">
        <table align="center" style="width:100%">          
            <tbody>
                <tr >
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <%if (empresa != null) { %>
                            <label for="codigo">Código</label> 
                        <%} else { %>
                            <label style="display: none;" for="codigo">Código</label> 
                        <%}%>
                         
                    </td>
                    <td align="left" colspan="3">
                        <%if (empresa != null) { %>
                            <input readonly type="text" id="codigo" name="codigo" style="width:10%" value='<%= empresa.getCodigo() %>'>                              
                        <%} else { %>
                            <input  type="text" id="codigo" name="codigo" style="width:10%;display: none;">                              
                        <%}%>
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Razão Social -->
                    <td align="left" style="width:15%">  
                        <label for="razaosocial">Razão Social:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <%if (empresa != null) { %>
                            <input type="text" id="razaosocial" name="razaosocial" style="width:100%" maxlength="100" required value='<%= empresa.getRazaoSocial() %>'>                                                            
                        <%} else { %>
                            <input type="text" id="razaosocial" name="razaosocial" style="width:100%" maxlength="100" required>                              
                        <%}%>
                        
                    </td>
                </tr>

                <tr>
                    <!-- INPUT Fantasia -->
                    <td align="left" style="width:15%">  
                        <label for="fantasia">Fantasia:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <%if (empresa != null) { %>
                            <input type="text" id="fantasia" name="fantasia" style="width:100%" maxlength="100" value='<%= empresa.getFantasia() %>'>                                                                                          
                            
                        <%} else { %>
                            <input type="text" id="fantasia" name="fantasia" style="width:100%" maxlength="100">                              
                        <%}%>
                        
                    </td>
                </tr>

                <tr>
                    <!-- INPUT CNPJ -->
                    <td align="left" style="width:15%">  
                        <label for="cnpj">CNPJ:</label>  
                    </td>
                    <td align="left" colspan="1">                        
                        <%if (empresa != null) { %>
                            <input class="cnpj" type="text" id="cnpj" name="cnpj" style="width:100%" maxlength="14" required value='<%= empresa.getCNPJ() %>'>                                                                                                                      
                        <%} else { %>
                            <input class="cnpj" type="text" id="cnpj" name="cnpj" style="width:100%" maxlength="14" required>                                                            
                        <%}%>
                    </td>
                </tr>

                <tr>
                    <!-- INPUT CEP -->
                    <td align="left" style="width:15%">  
                        <label for="CEP">CEP:</label>  
                    </td>
                    <td align="left">
                        <%if (empresa != null) { %>
                            <input class="cep" type="text" id="CEP" name="CEP" style="width:100%" maxlength="9" required value='<%= empresa.getCEP() %>'>                                                                                                                      
                        <%} else { %>
                            <input class="cep" type="text" id="CEP" name="CEP" style="width:100%" maxlength="9" required>                              
                        <%}%>                                                
                    </td>        

                    <!-- INPUT UF -->
                    <td align="right" style="width:10%">  
                        <label for="UF">UF:</label>  
                    </td>
                    <td align="left">
                        <%if (empresa != null) { %>
                            <input type="text" id="UF" name="UF" style="width:100%" maxlength="2" required value='<%= empresa.getUF() %>'>                                                                                                                      
                        <%} else { %>
                            <input type="text" id="UF" name="UF" style="width:100%" maxlength="2" required>               
                        <%}%>                                                
                    </td>
                </tr> 

                <tr>
                    <!-- INPUT Cidade -->
                    <td align="left" style="width:10%">  
                        <label for="cidade">Cidade:</label>  
                    </td>
                    <td align="left">
                        <%if (empresa != null) { %>
                            <input type="text" id="cidade" name="cidade" style="width:100%" maxlength="30" value='<%= empresa.getCidade() %>'>                                                                                                                      
                        <%} else { %>
                            <input type="text" id="cidade" name="cidade" style="width:100%" maxlength="30">                             
                        <%}%>                                 
                    </td> 

                    <!-- INPUT Bairro -->
                    <td align="right" style="width:15%">  
                        <label for="bairro">Bairro:</label>  
                    </td>
                    <td align="left">
                        <%if (empresa != null) { %>
                            <input type="text" id="bairro" name="bairro" style="width:100%" maxlength="30" value='<%= empresa.getBairro() %>'>                                                                                                                      
                        <%} else { %>
                            <input type="text" id="bairro" name="bairro" style="width:100%" maxlength="30">                             
                        <%}%>                           
                    </td>
                </tr>      

                <tr>
                    <!-- INPUT CNPJ -->
                    <td align="left" style="width:15%">  
                        <label for="endereco">Endereço:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <%if (empresa != null) { %>
                            <input type="text" id="endereco" name="endereco" style="width:100%" maxlength="100" value='<%= empresa.getEndereco() %>'>                                                                                                                      
                        <%} else { %>
                            <input type="text" id="endereco" name="endereco" style="width:100%" maxlength="100">                              
                        <%}%>                           
                    </td>
                </tr>    

                <tr>
                    <!-- INPUT Email -->
                    <td align="left" style="width:15%">  
                        <label for="email">E-mail:</label>  
                    </td>
                    <td align="left">
                        <%if (empresa != null) { %>
                            <input type="text" id="email" name="email" style="width:100%" maxlength="50" value='<%= empresa.getEmail() %>'>                                                                                                                      
                        <%} else { %>
                            <input type="text" id="email" name="email" style="width:100%" maxlength="50">                             
                        <%}%>                           
                    </td>


                    <!-- INPUT Telefone -->
                    <td align="right" style="width:15%">  
                        <label for="telefone">Telefone:</label>  
                    </td>
                    <td align="left">
                        <%if (empresa != null) { %>
                            <input class="phone_with_ddd" type="text" id="telefone" name="telefone" style="width:100%" maxlength="20" required value='<%= empresa.getTelefone() %>'>                                                                                                                      
                        <%} else { %>
                            <input class="phone_with_ddd" type="text" id="telefone" name="telefone" style="width:100%" maxlength="20" required>                             
                        <%}%>                           
                    </td>
                </tr>                   

                <!-- Botoes -->
                <tr>          
                    <td align="right" colspan="4">
                        <%if (empresa == null) { %>
                            <input class="button-danger"  type="reset"  id="limpar" value=" Limpar">
                        <%} %>                                                    
                        <input class="button-success" type="submit" id="enviar" value=" Gravar!">              
                    </td>           
                </tr>  
            </tbody>                            
        </table>
    </form>