/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function setAutoCompleteClientes(empresa){
    $('#nomecliente').autocompleter({
        // marker for autocomplete matches
        highlightMatches: true,
        // object to local or url to remote search
        source: contextPath + "/ListClientes?empr="+empresa,
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
               document.getElementById("codigoCliente").value = selected.codigo;               
           }
        }
    });
}

function setAutoCompleteFormasPgto(empresa){
    $('#formapgto').autocompleter({
        // marker for autocomplete matches
        highlightMatches: true,
        // object to local or url to remote search
        source: contextPath + "/ListFormasPgto?empr="+empresa,
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
              document.getElementById("codigoformapgto").value = selected.codigo;     
           }
        }
    });
}
 
        //Verifica se o usuário está alterando o registrando uma empresa
        function salvar(){
            var codigo = $('#pedido').val();
            
            if (codigo == ''){                
                Registrar();
            } else {       
                Alterar()
            }
        }
                
        //Função javascript para chamar Srvlet de Inserçao de registro
        function Registrar(){                        
            
            jQuery('#formPedidos').submit( function(){                      
            $.ajax({
                type: "POST",
                url : contextPath + "/PedidosInsert", 
                data: $(this).serializeArray(),                        
                success: function(returnFunction){                                                             
                    alert(returnFunction);
                }
            });                     
            return false;
            });
            $("#formPedidos").submit();                             
        }                     
        
        //Função javascript para chamar Srvlet de Inserçao de registro
        function Alterar(){                        
            jQuery('#formPedidos').submit( function(){                      
            $.ajax({
                type: "POST",
                url : contextPath + "/PedidosUpdate", 
                data: $(this).serializeArray(),                        
                success: function(returnFunction){                                                             
                    alert(returnFunction);
                }
            });                     
            return false;
            });
            $("#formPedidos").submit();                             
        }  
