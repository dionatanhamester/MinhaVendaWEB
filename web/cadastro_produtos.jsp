<%-- 
    Document   : cadastro_produtos
    Created on : 04/06/2017, 20:59:57
    Author     : Dionatan
--%>

<%@include file="default/header.jsp" %>	
<div class="header">
    <p> <i class="fa fa-database fa-2x" aria-hidden="true"> </i> Cadastro de Produtos</p> 
</div>
<%@include file="default/menu.jsp" %>
<div class="all">
    <form method="post">
        <table align="center" style="width:100%">          
            <tbody>

                <tr>
                    <!-- INPUT Razão Social -->
                    <td align="left" style="width:15%">  
                        <label for="nome">Nome:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <input type="text" id="nome" name="nome" style="width:100%" maxlength="100" required>                              
                    </td>
                </tr>


                <tr>
                    <!-- INPUT Grupo -->
                    <td align="left" style="width:10%">  
                        <label for="grupo">Grupo:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <select id="grupo" name="grupo" style="width:100%">               
                            <option value="1">1 - Grupo 01</option>
                            <option value="2">2 - Grupo 02</option>
                            <option value="3">3 - Grupo 03</option>
                            <option value="4">4 - Grupo 04</option>
                        </select>             
                    </td> 
                </tr> 

                <tr>
                    <!-- INPUT Unidade -->
                    <td align="left" style="width:15%">  
                        <label for="unidade">Unidade:</label>  
                    </td>
                    <td align="left">
                        <input type="text" id="unidade" name="unidade" style="width:100%" maxlength="2" required>                              
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