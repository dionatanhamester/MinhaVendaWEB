/**
 * Crayola colors in JSON format
 * from: https://gist.github.com/jjdelc/1868136
 * 
 */

function setAutoComplete(empresa, tabela){
    $('#nope').autocompleter({
        // marker for autocomplete matches
        highlightMatches: true,
        // object to local or url to remote search
        source: contextPath + "/ListProdutosTabelaPrecos?empr="+empresa+"&&tabl="+tabela,
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
               document.getElementById("empresa").value = selected.empresa;
               document.getElementById("codigoProduto").value  = selected.produto;
               document.getElementById("grupo").value   = selected.grupo;
               if (selected.preco != ''){
                   document.getElementById("valor").value   = selected.preco;    
               } else {
                   document.getElementById("valor").value   = '';
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
                url : contextPath + "/TabelaPrecosProdutosSave", 
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
                