<%-- 
    Document   : cadastro_pedidos
    Created on : 04/06/2017, 20:58:21
    Author     : Dionatan
--%>

<%@include file="default/header.jsp" %>
<div class="header">
    <p> <i class="fa fa-tags fa-2x" aria-hidden="true"> </i> Cadastro de Pedidos</p> 
</div>
<%@include file="default/menu.jsp" %>
<div class="all">
    <form method="post">
        <table align="center" style="width:100%">          
            <tbody>


                <tr>           
                    <td align="left" style="width:20%">  
                        <label for="pedido">Pedido:</label>  
                    </td>
                    <td align="left" colspan="1">
                        <input type="text" id="pedido" name="pedido" style="width:100%"  disabled>                              
                    </td>
                </tr>


                <tr>
                    <td align="left" style="width:20%">  
                        <label for="clientes">Clientes:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <select id="clientes" name="clientes" style="width:100%">               
                            <option value="1">1 - Cliente 01</option>
                            <option value="2">2 - Cliente 02</option>
                            <option value="3">3 - Cliente 03</option>
                            <option value="4">4 - Cliente 04</option>
                        </select>             
                    </td> 
                </tr> 

                <tr>           
                    <td align="left" style="width:20%">  
                        <label for="duracao">Duração:</label>  
                    </td>
                    <td align="left" colspan="1">
                        <input type="text" id="duracao" name="duracao" style="width:100%" required>                              
                    </td>
                </tr>

                <tr>           
                    <td align="left" style="width:20%">  
                        <label for="producao">Produção de Leite ( lts ):</label>  
                    </td>
                    <td align="left" colspan="1">
                        <input type="number" id="producao" name="producao" style="width:100%" required>                              
                    </td>
                </tr>

                <tr>           
                    <td align="left" style="width:20%">  
                        <label for="lactantes">Lactantes:</label>  
                    </td>
                    <td align="left" colspan="1">
                        <input type="number" id="lactantes" name="lactantes" style="width:100%" required>                              
                    </td>

                    <td align="right" style="width:20%">  
                        <label for="preparto">Pré-Parto:</label>  
                    </td>
                    <td align="left" colspan="1">
                        <input type="number" id="preparto" name="preparto" style="width:100%" required>                              
                    </td>
                </tr>

                <tr>           
                    <td align="left" style="width:20%">  
                        <label for="novilhas">Novilhas:</label>  
                    </td>
                    <td align="left" colspan="1">
                        <input type="number" id="novilhas" name="novilhas" style="width:100%" required>                              
                    </td>
                </tr>

                <tr>           
                    <td align="left" style="width:20%">  
                        <label for="terneiras_2meses">Terneiras ( 2 Meses ):</label>  
                    </td>
                    <td align="left" colspan="1">
                        <input type="number" id="terneiras_2meses" name="terneiras_2meses" style="width:100%" required>                              
                    </td>

                    <td align="right" style="width:20%">  
                        <label for="terneiras_6meses">Terneiras ( 6 Meses ):</label>  
                    </td>
                    <td align="left" colspan="1">
                        <input type="number" id="terneiras_6meses" name="terneiras_6meses" style="width:100%" required>                              
                    </td>
                </tr>

                <tr>
                    <!-- INPUT Unidade -->
                    <td align="left" style="width:15%">  
                        <label for="obs">Observação:</label>  
                    </td>
                    <td align="left">
                        <textarea id="obs" name="obs" style="width:100%"></textarea>                              
                    </td>
                </tr>

                <tr>
                    <td align="left" style="width:20%">  
                        <label for="formapgto">Forma de Pagamento:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <select id="formapgto" name="formapgto" style="width:100%">               
                            <option value="1">1 - Forma de Pagamento 01</option>
                            <option value="2">2 - Forma de Pagamento 02</option>
                            <option value="3">3 - Forma de Pagamento 03</option>
                            <option value="4">4 - Forma de Pagamento 04</option>
                        </select>             
                    </td> 
                </tr> 

                <tr>           
                    <td align="left" style="width:20%">  
                        <label for="total">Valor Total:</label>  
                    </td>
                    <td align="left" colspan="1">
                        <input type="text" id="total" name="total" style="width:100%"  disabled>                              
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


    <table class="datatable" border="1px" style="width:100%">  
        <thead>
            <tr>
                <th> Código</th>      
                <th> Nome</th>            				
                <th> Tabela</th>            				
                <th> Quantidade</th>            				
                <th> Preço</th>            				
                <th> Desc. ( % )</th>            				
                <th> Valor Total</th> 
                <th> </th>      
            </tr>
        </thead> 
        <tbody>

            <tr>
                <td>1</td>
                <td>Produto 01</td>    			
                <td>Tabela A</td>    			
                <td> 1 </td>  
                <td>R$ 25,69</td>    			
                <td> 0%</td>    
                <td>R$ 25,69</td>    			
                <td>
                    <a href="#"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                    <a href="#"> <i class="fa fa-times" aria-hidden="true"></i></a>

                </td>
            </tr>

            <tr>
                <td>2</td>
                <td>Produto 02</td>    			
                <td>Tabela B</td>  
                <td> 1 </td>    			
                <td>R$ 25,69</td> 
                <td> 0%</td>       			
                <td>R$ 25,69</td>    	
                <td>
                    <a href="#"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                    <a href="#"> <i class="fa fa-times" aria-hidden="true"></i></a>

                </td>
            </tr>


            <tr>
                <td>3</td>
                <td>Produto 03</td>    			
                <td>Tabela A</td>  
                <td> 2 </td>   
                <td>R$ 10,00</td> 
                <td> 0%</td>       			 			
                <td>R$ 20,00</td>   	 			
                <td>
                    <a href="#"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                    <a href="#"> <i class="fa fa-times" aria-hidden="true"></i></a>

                </td>
            </tr>


            <tr>
                <td>4</td>
                <td>Produto 04</td>    			
                <td>Tabela C</td>   
                <td> 1 </td>   	
                <td>R$ 86,90</td>
                <td> 0%</td>        					
                <td>R$ 86,90</td>     			   				
                <td>
                    <a href="#"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                    <a href="#"> <i class="fa fa-times" aria-hidden="true"></i></a>
                </td>
            </tr>
        <!-- Definição Rodapé -->    
        <tfoot>                
            <tr>   
                <td colspan="3">Registros apresentados 4</td>					
                <td colspan="5"><button class="button-success" id="adicionar">Adicionar Produto <i class="fa fa-plus" aria-hidden="true"></i></button></td>
            </tr>
        </tfoot>           	           
    </table>
</div>  			
<%@include file="default/footer.jsp" %>