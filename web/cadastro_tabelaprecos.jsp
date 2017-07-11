<%-- 
    Document   : cadastro_tabelaprecos
    Created on : 04/06/2017, 21:01:24
    Author     : Dionatan
--%>

<%@include file="default/header.jsp" %>
<div class="header">
    <p> <i class="fa fa-table fa-2x" aria-hidden="true"> </i> Cadastro de Tabelas de Preços</p> 
</div>
<%@include file="default/menu.jsp" %>
<div class="all">
    <form method="post">
        <table align="center" style="width:100%">          
            <tbody>

                <tr>            
                    <td align="left" style="width:15%">  
                        <label for="nome">Nome:</label>  
                    </td>
                    <td align="left" colspan="3">
                        <input type="text" id="nome" name="nome" style="width:100%" maxlength="100" required>                              
                    </td>
                </tr>

                <tr>            
                    <td align="left" style="width:15%">  
                        <label for="obs">Observação:</label>  
                    </td>
                    <td align="left">
                        <textarea id="obs" name="obs" style="width:100%" maxlength="2" required></textarea>                              
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
                <th> Unidade</th>            				
                <th> Preço</th>            				
                <th> </th>      
            </tr>
        </thead> 
        <tbody>

            <tr>
                <td>1</td>
                <td>Produto 01</td>    			
                <td>UN</td>    			
                <td>R$ 25,69</td>    			
                <td>
                    <a href="#"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                    <a href="#"> <i class="fa fa-times" aria-hidden="true"></i></a>

                </td>
            </tr>

            <tr>
                <td>2</td>
                <td>Produto 02</td>    			
                <td>UN</td>    			
                <td>R$ 13,09</td>    			
                <td>
                    <a href="#"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                    <a href="#"> <i class="fa fa-times" aria-hidden="true"></i></a>

                </td>
            </tr>


            <tr>
                <td>3</td>
                <td>Produto 03</td>    			
                <td>UN</td>   
                <td>R$ 10,00</td>    			 			
                <td>
                    <a href="#"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                    <a href="#"> <i class="fa fa-times" aria-hidden="true"></i></a>

                </td>
            </tr>


            <tr>
                <td>4</td>
                <td>Produto 04</td>    			
                <td>UN</td>    	
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
                <td colspan="2"><button class="button-success" id="adicionar">Adicionar Produto <i class="fa fa-plus" aria-hidden="true"></i></button></td>
            </tr>

        </tfoot>            

    </table>
</div>  			
<%@include file="default/footer.jsp" %>