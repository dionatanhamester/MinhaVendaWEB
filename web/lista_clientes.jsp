<%-- 
    Document   : lista_clientes
    Created on : 04/06/2017, 19:41:51
    Author     : Dionatan
--%>

<%@include file="default/header.jsp" %>

<div class="header">
    <p> <i class="fa fa fa-user-circle-o fa-2x" aria-hidden="true"> </i> Clientes</p> 
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
                    <a href="cadastro_clientes.jsp"><button class="button-success" id="adicionar">Adicionar <i class="fa fa-plus" aria-hidden="true"></i></button></a>
                    <button class="button-primary" id="pesquisar">Pesquisar <i class="fa fa-search" aria-hidden="true"></i></button>              
                </td>	    			
            </tr>  
        </tbody>  	    	 
    </table>


    <!-- Table com a Listagem dos dados -->


    <table class="datatable" border="1px" style="width:100%">  
        <thead>
            <tr>
                <th> Matrícula</th>      
                <th> Nome</th>            				
                <th> Cidade</th>            				
                <th> Telefone</th>            				
                <th> Email</th>            				
                <th> </th>      
            </tr>
        </thead> 
        <tbody>

            <tr>
                <td>1</td>
                <td>Nome 01</td>    			
                <td>Cidade 01</td>    			
                <td>Telefone 01</td>    			
                <td>Email 01</td>    			
                <td>
                    <a href="#"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                    <a href="#"> <i class="fa fa-times" aria-hidden="true"></i></a>
            </tr>

            <tr>
                <td>2</td>
                <td>Nome 02</td>    			
                <td>Cidade 02</td>    			
                <td>Telefone 02</td>    			
                <td>Email 02</td>    			
                <td>
                    <a href="#"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                    <a href="#"> <i class="fa fa-times" aria-hidden="true"></i></a>
                </td>
            </tr>

            <tr>
                <td>3</td>
                <td>Nome 03</td>    			
                <td>Cidade 03</td>    			
                <td>Telefone 03</td>    			
                <td>Email 03</td>    			
                <td>
                    <a href="#"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                    <a href="#"> <i class="fa fa-times" aria-hidden="true"></i></a>
                </td>
            </tr>


            <tr>
                <td>4</td>
                <td>Nome 04</td>    			
                <td>Cidade 04</td>    			
                <td>Telefone 04</td>    			
                <td>Email 04</td>    			
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