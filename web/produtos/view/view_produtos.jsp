<%-- 
    Document   : view_produtos
    Created on : 10/07/2017, 21:01:51
    Author     : Dionatan
--%>

<%@page import="br.univates.minhavenda.models.Grupos"%>
<%@page import="java.util.List"%>
<%@page import="br.univates.minhavenda.controller.GruposDAO"%>
<form id="formProdutos" name="formProdutos" method="post" action="javascript:salvar();">
        <table align="center" style="width:100%">          
            <tbody>
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <label style="display: none;" for="empresa">Empresa</label>                       
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (produto != null) { %>
                            <input type="text" id="empresa" name="empresa" style="width:10%;display: none;" value='<%= produto.getEmpresa() %>'>                              
                        <%} else { %>
                        <input  type="text" id="empresa" name="empresa" style="width:10%;display: none;" value='<%= session.getAttribute("us_empresa") %>'>                                
                        <%}%>
                        
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Código -->
                    <td align="left" style="width:15%">  
                        <%if (produto != null) { %>
                            <label for="codigo">Código</label> 
                        <%} else { %>
                            <label style="display: none;" for="codigo">Código</label> 
                        <%}%>
                    </td>
                    
                    <td align="left" colspan="3">
                        <%if (produto != null) { %>
                            <input readonly type="text" id="codigo" name="codigo" style="width:10%" value='<%= produto.getCodigo() %>'>                              
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
                        <%if (produto != null) { %>
                            <input type="text" id="nome" name="nome" style="width:100%" maxlength="50" required value='<%= produto.getNome() %>'>  
                        <%} else { %>
                            <input type="text" id="nome" name="nome" style="width:100%" maxlength="50" required>                           
                        <%}%>                                                     
                    </td>
                </tr>
                
                <tr>
                    <!-- INPUT Grupo -->
                    <td align="left" style="width:10%">  
                        <label for="grupo">Grupo:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <select id="grupo" name="grupo" style="width:100%">    
                            <%
                                String where = "WHERE gr_empresa = "+session.getAttribute("us_empresa");
                                
                                GruposDAO gruposDAO = new GruposDAO();                                
                                List<Grupos> listGrupos = gruposDAO.listar(where);
                                     
                                for( int i = 0; i < listGrupos.size(); i++){
                                    if ((produto != null) && (produto.getGrupo() == listGrupos.get(i).getCodigo())){ %>
                                        <option selected value="<%= listGrupos.get(i).getCodigo() %>"><%= listGrupos.get(i).getCodigo() + " - " + listGrupos.get(i).getNome() %></option>                                                        
                                    <%  } else { %>
                                        <option value="<%= listGrupos.get(i).getCodigo() %>"><%= listGrupos.get(i).getCodigo() + " - " + listGrupos.get(i).getNome() %></option>        
                                    <%  }
                                %>                                                            
                            <%}%>
                            
                        </select>             
                    </td> 
                </tr> 
                
                <tr>
                    <!-- INPUT Unidade -->
                    <td align="left" style="width:15%">  
                        <label for="unidade">Unidade:</label>  
                    </td>
                    <td align="left">
                        <%if (produto != null) { %>                            
                            <input type="text" id="unidade" name="unidade" style="width:100%" maxlength="2" required value='<%= produto.getUnidade() %>'>                              
                        <%} else { %>
                            <input type="text" id="unidade" name="unidade" style="width:100%" maxlength="2" required>                              
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
                            <% if ((produto != null) && (produto.getInativo().equals("S"))){ %>
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
                        <%if (produto == null) { %>
                            <input class="button-danger"  type="reset"  id="limpar" value=" Limpar">
                        <%} %>                                                    
                        <input class="button-success" type="submit" id="enviar" value=" Gravar!">          
                    </td>           
                </tr>  
            </tbody>                            
        </table>
</form>
