<%-- 
    Document   : view_tabelaprecos
    Created on : 12/07/2017, 22:02:43
    Author     : Dionatan
--%>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
<form id="formTabelaPrecos" name="formTabelaPrecos" method="post" action="javascript:salvar();">
        <table align="center" style="width:100%">          
            <tbody>
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <label style="display: none;" for="empresa">Empresa</label>                       
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (tabelapreco != null) { %>
                            <input type="text" id="empresa" name="empresa" style="width:10%;display: none;" value='<%= tabelapreco.getEmpresa() %>'>                              
                        <%} else { %>
                        <input  type="text" id="empresa" name="empresa" style="width:10%;display: none;" value='<%= session.getAttribute("us_empresa") %>'>                              
                        <%}%>
                        
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <%if (tabelapreco != null) { %>
                            <label for="codigo">Código</label> 
                        <%} else { %>
                            <label style="display: none;" for="codigo">Código</label> 
                        <%}%>
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (tabelapreco != null) { %>
                            <input readonly type="text" id="codigo" name="codigo" style="width:10%" value='<%= tabelapreco.getCodigo() %>'>                              
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
                         <%if (tabelapreco != null) { %>
                            <input type="text" id="nome" name="nome" style="width:100%" maxlength="50" required value='<%= tabelapreco.getNome() %>'>  
                        <%} else { %>
                            <input type="text" id="nome" name="nome" style="width:100%" maxlength="50" required>                           
                        <%}%>
                                                     
                    </td>
                </tr>
                <!-- Botoes -->
                <tr>          
                    <td align="right" colspan="4">
                        <%if (tabelapreco == null) { %>
                            <input class="button-danger"  type="reset"  id="limpar" value=" Limpar">
                        <%} %>                                                    
                        <input class="button-success" type="submit" id="enviar" value=" Gravar!">
                        <br>
                        <br>                      
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
                    <a href="produtos/registro.jsp?empr=<%= request.getParameter("empr") %>&&cod=<%= request.getParameter("cod") %>" ><button class="button-primary" id="adicionar">Ajustar Produtos <i class="fa fa-long-arrow-right" aria-hidden="true"></i></button></a>                     
                <%}%>
            </td>           
        </tr>  
    </tbody>                            
</table> 
            
            
            
