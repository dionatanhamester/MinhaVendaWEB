<%-- 
    Document   : lista_pedidos
    Created on : 04/06/2017, 20:28:10
    Author     : Dionatan
--%>

<%@include file="default/header.jsp" %>	
<div class="header">
    <p> <i class="fa fa fa-tags fa-2x" aria-hidden="true"> </i> Pedidos</p> 
</div>
<%@include file="default/menu.jsp" %>
<div class="all">
    <table align="center" style="width:100%">  	    	
        <tbody>
            <!-- INPUT Codigo -->
            <tr>	    			
                <td align="right" style="width:15%">  
                    <label for="codigo">Pesquisa:</label>	 
                </td>
                <td align="left" colspan="3">
                    <input type="text" id="codigo" name="codigo" style="width:100%">    	    			
                </td>	
            </tr>	    			    		

            <tr>	    		
                <td align="right" colspan="4">
                    <a href="cadastro_pedidos.jsp"><button class="button-success" id="adicionar">Adicionar <i class="fa fa-plus" aria-hidden="true"></i></button></a>
                    <button class="button-primary" id="pesquisar">Pesquisar <i class="fa fa-search" aria-hidden="true"></i></button>	    				
                </td>	    			
            </tr>  
        </tbody>  	    	 
    </table>

    <!-- Table com a Listagem dos dados -->

    <table class="datatable" border="1px" style="width:100%">  
        <thead>
            <tr>
                <th> Pedido</th>      
                <th> Data</th>            				
                <th> Cliente</th>            				
                <th> Valor Total</th>            				
                <th> </th>      
            </tr>
        </thead> 
        <tbody>

            <tr>
                <td>1</td>
                <td> 00/00/0000</td>    			
                <td> Cliente Pedido 01 </td>
                <td> R$ 0,00 </td>
                <td>
                    <a href="#"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                    <a href="#"> <i class="fa fa-times" aria-hidden="true"></i></a>

                </td>
            </tr>

            <tr>
                <td>2</td>
                <td> 00/00/0000</td>    			
                <td> Cliente Pedido 02 </td>
                <td> R$ 0,00 </td>
                <td>
                    <a href="#"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                    <a href="#"> <i class="fa fa-times" aria-hidden="true"></i></a>

                </td>
            </tr>

            <tr>
                <td>3</td>
                <td> 00/00/0000</td>    			
                <td> Cliente Pedido 03 </td>
                <td> R$ 0,00 </td>
                <td>
                    <a href="#"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                    <a href="#"> <i class="fa fa-times" aria-hidden="true"></i></a>

                </td>
            </tr>

            <tr>
                <td>4</td>
                <td> 00/00/0000</td>    			
                <td> Cliente Pedido 04 </td>
                <td> R$ 0,00 </td>
                <td>
                    <a href="#"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                    <a href="#"> <i class="fa fa-times" aria-hidden="true"></i></a>

                </td>
            </tr>




            <!-- Definição Rodapé -->    
        <tfoot>                
            <tr align="center"> 
                <td colspan="6">Registros apresentados 4</td>
            </tr>
        </tfoot>            

    </table>

</div>
<%@include file="default/footer.jsp" %>