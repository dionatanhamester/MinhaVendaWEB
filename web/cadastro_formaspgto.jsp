<%-- 
    Document   : cadastro_formaspgto
    Created on : 04/06/2017, 20:40:14
    Author     : Dionatan
--%>

<%@include file="default/header.jsp" %>
<div class="header">
    <p> <i class="fa fa-google-wallet fa-2x" aria-hidden="true"> </i> Cadastro de Formas de Pagamento</p> 
</div>
<%@include file="default/menu.jsp" %>
<div class="all">
    <form method="post">
        <table align="center" style="width:100%">          
            <tbody>
                <tr>
                    <td align="left" style="width:15%">  
                        <label for="descricao">Descrição:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <input type="text" id="descricao" name="descricao" style="width:100%" maxlength="20" required>                              
                    </td>
                </tr>
                <tr>
                    <td align="left" style="width:15%">  
                        <label for="vezes">Número de Vezes:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <input type="number" id="vezes" name="vezes" style="width:100%" maxlength="80" required>                              
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
