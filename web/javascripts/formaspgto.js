/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */ 
        
        //Verifica se o usuário está alterando o registrando uma empresa
        function salvar(){
            var codigo = $('#codigo').val();
            
            if (codigo == ''){
                Registrar();
            } else {       ;
                Alterar()
            }
        }
                
        //Função javascript para chamar Srvlet de Inserçao de registro
        function Registrar(){                        
            jQuery('#formFormasPgto').submit( function(){                      
            $.ajax({
                type: "POST",
                url : contextPath + "/FormasPgtoInsert", 
                data: $(this).serializeArray(),                        
                success: function(returnFunction){                                                             
                    alert(returnFunction);
                }
            });                     
            return false;
            });
            $("#formFormasPgto").submit();                             
        }                     
        
        //Função javascript para chamar Srvlet de Inserçao de registro
        function Alterar(){                        
            jQuery('#formFormasPgto').submit( function(){                      
            $.ajax({
                type: "POST",
                url : contextPath + "/FormasPgtoUpdate", 
                data: $(this).serializeArray(),                        
                success: function(returnFunction){                                                             
                    alert(returnFunction);
                }
            });                     
            return false;
            });
            $("#formFormasPgto").submit();                             
        }  