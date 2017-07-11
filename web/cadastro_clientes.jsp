<%-- 
    Document   : cadastro_clientes
    Created on : 04/06/2017, 20:32:50
    Author     : Dionatan
--%>

<%@include file="default/header.jsp" %>
<div class="header">
    <p> <i class="fa fa-user-circle-o fa-2x" aria-hidden="true"> </i> Cadastro de Clientes</p> 
</div>
<%@include file="default/menu.jsp" %>
<div class="all">

    <form method="post">
        <table align="center" style="width:100%">          
            <tbody>

                <tr>

                    <td align="left" style="width:15%">  
                        <label for="matricula">Matrícula:</label>  
                    </td>
                    <td align="left" colspan="1">
                        <input type="text" id="matricula" name="matricula" style="width:100%" maxlength="20" required>                              
                    </td>
                </tr>

                <tr>

                    <td align="left" style="width:15%">  
                        <label for="nome">Nome:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <input type="text" id="nome" name="nome" style="width:100%" maxlength="80" required>                              
                    </td>
                </tr>

                <tr>            
                    <td align="left" style="width:15%">  
                        <label for="cnpj">CNPJ:</label>  
                    </td>
                    <td align="left" colspan="1">
                        <input type="text" id="cnpj" name="cnpj" style="width:100%" maxlength="14">                              
                    </td>
                </tr>

                <tr>            
                    <td align="left" style="width:15%">  
                        <label for="cpf">CPF:</label>  
                    </td>
                    <td align="left" colspan="1">
                        <input type="text" id="cpf" name="cpf" style="width:100%" maxlength="11" required>                              
                    </td>
                </tr>

                <tr>
                    <td align="left" style="width:15%">  
                        <label for="CEP">CEP:</label>  
                    </td>
                    <td align="left">
                        <input type="text" id="CEP" name="CEP" style="width:100%" maxlength="9" required>                              
                    </td>        


                    <td align="right" style="width:10%">  
                        <label for="UF">UF:</label>  
                    </td>
                    <td align="left">
                        <input type="text" id="UF" name="UF" style="width:100%" maxlength="2" required>               
                    </td>
                </tr> 

                <tr>

                    <td align="left" style="width:10%">  
                        <label for="cidade">Cidade:</label>  
                    </td>
                    <td align="left">
                        <select id="cidade" name="cidade" style="width:100%">               
                            <option value="1">1 - Teutônia</option>
                            <option value="2">2 - Lajeado</option>
                            <option value="3">3 - Estrela</option>
                            <option value="4">4 - Encantado</option>
                        </select>             
                    </td> 


                    <td align="right" style="width:15%">  
                        <label for="bairro">Bairro:</label>  
                    </td>
                    <td align="left">
                        <input type="text" id="bairro" name="bairro" style="width:100%" maxlength="30">                             
                    </td>
                </tr>      

                <tr>

                    <td align="left" style="width:15%">  
                        <label for="endereco">Endereço:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <input type="text" id="endereco" name="endereco" style="width:100%" maxlength="100">                              
                    </td>
                </tr>    

                <tr>
                    <td align="left" style="width:15%">  
                        <label for="email">E-mail:</label>  
                    </td>
                    <td align="left">
                        <input type="text" id="email" name="email" style="width:100%" maxlength="100">                             
                    </td>

                    <td align="right" style="width:15%">  
                        <label for="telefone">Telefone:</label>  
                    </td>
                    <td align="left">
                        <input type="text" id="telefone" name="telefone" style="width:100%" maxlength="30" required>                             
                    </td>
                </tr>  

                <tr>
                    <!-- INPUT Status -->
                    <td align="left" style="width:10%">  
                        <label for="status">Status:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <select id="status" name="status" style="width:100%">               
                            <option value="N">1 - Ativo</option>
                            <option value="S">2 - Inativo</option>
                        </select>             
                    </td> 
                </tr>                                  
                <!-- Botoes -->
                <tr>          
                    <td align="right" colspan="4">
                        <input class="button-danger"  type="reset"  id="limpar" value=" Limpar">
                        <input class="button-success" type="submit" id="enviar" value=" Gravar!">              
                    </td>           
                </tr>  
            </tbody>                            
        </table>
    </form>
</div>
<%@include file="default/footer.jsp" %>  