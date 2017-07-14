/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function setAutoCompleteProdutos(empresa, codPedido){
    $('#nomeproduto').autocompleter({
        // marker for autocomplete matches
        highlightMatches: true,
        // object to local or url to remote search
        source: contextPath + "/ListProdutosPedidos?empr="+empresa+"&&pedd="+codPedido,
        // custom template
       // template: '{{ label }} <span>({{ pr_codigo }})</span>',
        // show hint
        hint: false,
        // abort source if empty field
        empty: true,
        // max results
        limit: 10,
        cache:false,
        callback: function (value, index, selected) {
           
            if (selected) {
               $('#nometabelapreco').autocompleter('destroy');
               document.getElementById("nometabelapreco").value = '';
               setAutoCompleteTabelaPrecos(selected.empresa, selected.produto);

               document.getElementById("empresa").value        = selected.empresa;
               document.getElementById("codigoProduto").value  = selected.produto;
               
               if (selected.quantidade != ''){
                  document.getElementById("quantidade").value    = selected.quantidade;
               } else {
                   document.getElementById("quantidade").value   = ''
               }
               
               if (selected.unitario != ''){
                   document.getElementById("valor").value   = selected.unitario;    
               } else {
                   document.getElementById("valor").value   = '';
               }    
               
               if (selected.tabelacodigo != ''){
                   document.getElementById("codigotabelapreco").value = selected.tabelacodigo; 
                   document.getElementById("nometabelapreco").value   = selected.tabelanome; 
               } else {
                   document.getElementById("codigotabelapreco").value  = '';
                   document.getElementById("nometabelapreco").value    = '';
               }
           }
        }
    });
}


function setAutoCompleteTabelaPrecos(empresa, produto){
    $('#nometabelapreco').autocompleter({
        // marker for autocomplete matches
        highlightMatches: true,
        // object to local or url to remote search
        source: contextPath + "/ListTabelaPrecos?empr="+empresa+"&&produto="+produto,
        // custom template
       // template: '{{ label }} <span>({{ pr_codigo }})</span>',
        // show hint
        hint: false,
        // abort source if empty field
        empty: true,
        // max results
        limit: 10,
        cache:false,
        callback: function (value, index, selected) {

            if (selected) {
                document.getElementById("codigotabelapreco").value = selected.codigotabela;
                
               if (selected.preco != ''){
                  document.getElementById("valor").value    = selected.preco;
               } else {
                   document.getElementById("valor").value   = ''
               } 
           }
        }
    });
}

 //Verifica se o usuário está alterando o registrando uma empresa
        function salvar(){
            jQuery('#formProdutos').submit( function(){                      
            $.ajax({
                type: "POST",
                url : contextPath + "/PedidosProdutosSave", 
                data: $(this).serializeArray(),                        
                success: function(returnFunction){                                                             
                    document.getElementById("formProdutos").reset();
                    window.location.reload();
                }
            });                     
            return false;
            });
            $("#formProdutos").submit();                        
        }
                
