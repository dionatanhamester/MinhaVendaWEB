<%-- 
    Document   : cadastro_grupos
    Created on : 04/06/2017, 20:57:01
    Author     : Dionatan
--%>

<%@include file="default/header.jsp" %>
<div class="header">
    <p> <i class="fa fa-briefcase fa-2x" aria-hidden="true"> </i> Cadastro de Grupos</p> 
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
                        <input type="text" id="nome" name="nome" style="width:100%" maxlength="50" required>                              
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