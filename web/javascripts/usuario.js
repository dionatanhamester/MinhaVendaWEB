/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */ 
$(document).ready(function(){	//Se a página foi carregada    
    $('.cnpj').mask('00.000.000/0000-00', {reverse: false});
    $('.cpf').mask('000.000.000-00', {reverse: false});
    $('.cep').mask('00000-000');
    $('.phone_with_ddd').mask('(00) 00000-0000');                      
});

    function validarCampos(){
        var tudoOK   = true;
        var cnpj     = $('#cnpj').val();
        var cpf     = $('#cpf').val();
        
        if (cnpj != ""){
            if (! validarCNPJ(cnpj)){
                tudoOK = false;
                alert("CNPJ Inválido. Verifique!")               
            }
        }
        
        if (cpf != ""){
            if (! validarCPF(cpf)){
                tudoOK = false;
                alert("CPF Inválido. Verifique!")               
            }
        }
        

        return tudoOK;
    }    
        
        
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
            jQuery('#formUsuario').submit( function(){                      
            $.ajax({
                type: "POST",
                url : contextPath + "/UsuariosInsert", 
                data: $(this).serializeArray(),                        
                success: function(returnFunction){                                                             
                    alert(returnFunction);
                }
            });                     
            return false;
            });
            $("#formUsuario").submit();                             
        }                     
        
        //Função javascript para chamar Srvlet de Inserçao de registro
        function Alterar(){                        
            jQuery('#formUsuario').submit( function(){                      
            $.ajax({
                type: "POST",
                url : contextPath + "/UsuariosUpdate", 
                data: $(this).serializeArray(),                        
                success: function(returnFunction){                                                             
                    alert(returnFunction);
                }
            });                     
            return false;
            });
            $("#formUsuario").submit();                             
        }  