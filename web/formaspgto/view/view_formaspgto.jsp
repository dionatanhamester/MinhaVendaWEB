<%-- 
    Document   : view_formaspgto
    Created on : 12/07/2017, 21:09:05
    Author     : Dionatan
--%>

<form id="formFormasPgto" name="formFormasPgto" method="post" action="javascript:salvar();">
        <table align="center" style="width:100%">          
            <tbody>
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <label style="display: none;" for="empresa">Empresa</label>                       
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (formapgto != null) { %>
                            <input type="text" id="empresa" name="empresa" style="width:10%;display: none;" value='<%= formapgto.getEmpresa() %>'>                              
                        <%} else { %>
                        <input  type="text" id="empresa" name="empresa" style="width:10%;display: none;" value='<%= session.getAttribute("us_empresa") %>'>                              
                        <%}%>
                        
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <%if (formapgto != null) { %>
                            <label for="codigo">Código</label> 
                        <%} else { %>
                            <label style="display: none;" for="codigo">Código</label> 
                        <%}%>
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (formapgto != null) { %>
                            <input readonly type="text" id="codigo" name="codigo" style="width:10%" value='<%= formapgto.getCodigo() %>'>                              
                        <%} else { %>
                            <input  type="text" id="codigo" name="codigo" style="width:10%;display: none;">                              
                        <%}%>
                        
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Nome -->
                    <td align="left" style="width:15%">  
                        <label for="descricao">Descrição:</label>  
                    </td>
                    <td align="left" colspan="3">
                         <%if (formapgto != null) { %>
                            <input type="text" id="descricao" name="descricao" style="width:100%" maxlength="50" required value='<%= formapgto.getDescricao() %>'>  
                        <%} else { %>
                            <input type="text" id="descricao" name="descricao" style="width:100%" maxlength="50" required>                           
                        <%}%>
                                                     
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Nome -->
                    <td align="left" style="width:15%">  
                        <label for="nrovezes">Nro Vezes:</label>  
                    </td>
                    <td align="left" colspan="1">
                         <%if (formapgto != null) { %>
                            <input type="number" id="nrovezes" name="nrovezes" style="width:100%" maxlength="50" required value='<%= formapgto.getNroVezes() %>'>  
                        <%} else { %>
                            <input type="number" id="nrovezes" name="nrovezes" style="width:100%" maxlength="50" required>                           
                        <%}%>
                                                     
                    </td>
                </tr>
                
                <!-- Botoes -->
                <tr>          
                    <td align="right" colspan="4">
                        <%if (formapgto == null) { %>
                            <input class="button-danger"  type="reset"  id="limpar" value=" Limpar">
                        <%} %>                                                    
                        <input class="button-success" type="submit" id="enviar" value=" Gravar!">          
                    </td>           
                </tr>  
            </tbody>                            
        </table>
</form>
