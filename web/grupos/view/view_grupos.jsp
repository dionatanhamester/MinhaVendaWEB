<%-- 
    Document   : view_grupos
    Created on : 09/07/2017, 21:16:11
    Author     : Dionatan
--%>
<form id="formGrupos" name="formGrupos" method="post" action="javascript:salvar();">
        <table align="center" style="width:100%">          
            <tbody>
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <label style="display: none;" for="empresa">Empresa</label>                       
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (grupo != null) { %>
                            <input type="text" id="empresa" name="empresa" style="width:10%;display: none;" value='<%= grupo.getEmpresa() %>'>                              
                        <%} else { %>
                        <input  type="text" id="empresa" name="empresa" style="width:10%;display: none;" value='<%= session.getAttribute("us_empresa") %>'>                              
                        <%}%>
                        
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <%if (grupo != null) { %>
                            <label for="codigo">Código</label> 
                        <%} else { %>
                            <label style="display: none;" for="codigo">Código</label> 
                        <%}%>
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (grupo != null) { %>
                            <input readonly type="text" id="codigo" name="codigo" style="width:10%" value='<%= grupo.getCodigo() %>'>                              
                        <%} else { %>
                            <input  type="text" id="codigo" name="codigo" style="width:10%;display: none;">                              
                        <%}%>
                        
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Nome -->
                    <td align="left" style="width:15%">  
                        <label for="nome">Nome:</label>  
                    </td>
                    <td align="left" colspan="3">
                         <%if (grupo != null) { %>
                            <input type="text" id="nome" name="nome" style="width:100%" maxlength="50" required value='<%= grupo.getNome() %>'>  
                        <%} else { %>
                            <input type="text" id="nome" name="nome" style="width:100%" maxlength="50" required>                           
                        <%}%>
                                                     
                    </td>
                </tr>
                <!-- Botoes -->
                <tr>          
                    <td align="right" colspan="4">
                        <%if (grupo == null) { %>
                            <input class="button-danger"  type="reset"  id="limpar" value=" Limpar">
                        <%} %>                                                    
                        <input class="button-success" type="submit" id="enviar" value=" Gravar!">          
                    </td>           
                </tr>  
            </tbody>                            
        </table>
</form>