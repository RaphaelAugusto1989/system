$(document).ready(function() {
    $("#buttonAlterMyData").on('click', function() {
        var id_user = $("#id").val();
        var nome = $("#nome").val().toUpperCase(); //DEIXA TODAS AS LETRAS DO NOME MAIÚSCULA
        var cpf = $("#cpf").val();
        var nascimento = $("#nascimento").val();
        var email = $("#email").val().toLowerCase(); //DEIXA TODAS AS LETRAS DO NOME MINUSCULAS
        var login = $("#login").val();

        if (nome == '') {
            var msg = "Nome Obrigatório!"; //MSG DE ERRO
            var classLabel = "labelNome"; //NOME DA CLASS DA LABEL 
            var nomeInput = "nome"; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);
            return;
        }

        if (cpf == '') {
            var msg = "CPF Obrigatório!"; //MSG DE ERRO
            var classLabel = "labelCpf"; //NOME DA CLASS DA LABEL 
            var nomeInput = "cpf"; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);
            return;
        }

        if (nascimento == '') {
            var msg = "Data de Nascimento Obrigatório!"; //MSG DE ERRO
            var classLabel = "labelNascimento"; //NOME DA CLASS DA LABEL 
            var nomeInput = "nascimento"; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);
            return;
        }

        if (email == '') {
            var msg = "E-mail Obrigatório!"; //MSG DE ERRO
            var classLabel = "labelEmail"; //NOME DA CLASS DA LABEL 
            var nomeInput = "email"; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);
            return;
        }

        if (login == '') {
            var msg = "Login é Obrigatório!"; //MSG DE ERRO
            var classLabel = "labelLogin"; //NOME DA CLASS DA LABEL 
            var nomeInput = "login"; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);
            return;
        }

        $.ajax({
            url: site_url+'Usuarios/RegisterUser',
            type: 'POST',
            dataType: 'JSON',
            data: {
                id: id_user,
                nome: nome,
                cpf: cpf,
                nascimento: nascimento,
                email: email,
                login: login
            },
            beforeSend: function() {
                $('body').find('.loading_screen').show();
            },
            success: function(i) {
                //console.log(i);
                if(i.suc == true) {
                    var msg = 'Dados alterado com sucesso!';
                    msgSuccess(msg);
                } else {
                    var msg = 'Erro ao alterar dados, tente novamente mais tarde!';
                    msgErro(msg);
                }
            },
            complete: function() {
                $('body').find('.loading_screen').hide();
            }
        })
    }); //FIM FUNÇÃO ALTERAR DADOS

    //FUNÇÃO ALTERAR PASSWORD
    $('#buttonPassAlter').on('click', function(){
        var id = $("#id").val();
        var passOld= $("#showPassOld").val();
        var newpass = $("#showNewPass").val();
        var newpass2 = $("#showNewPass2").val();

        if (passOld == '') {
            var msg = "Senha antiga Obrigatório!"; //MSG DE ERRO
            var classLabel = "labelPassword"; //NOME DA CLASS DA LABEL 
            var nomeInput = "pass"; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);
            return;
        }

        if (newpass == '') {
            var msg = "Nova Senha Obrigatório!"; //MSG DE ERRO
            var classLabel = "labelPassword"; //NOME DA CLASS DA LABEL 
            var nomeInput = "pass"; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);
            return;
        }

        if (newpass2 == '') {
            var msg = "Campo Repetir Senha Obrigatório!"; //MSG DE ERRO
            var classLabel = "labelPassword"; //NOME DA CLASS DA LABEL 
            var nomeInput = "pass"; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);
            return;
        }

        if (newpass != newpass2) {
            var msg = "Senhas não são idênticas!"; //MSG DE ERRO
            var classLabel = "labelPassword"; //NOME DA CLASS DA LABEL 
            var nomeInput = ""; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);

            $("#password").removeClass('border-0').addClass('border border-5 border-danger'); //Remove a borda-0 e Add a Borda vermelha
            $("#password2").removeClass('border-0').addClass('border border-5 border-danger'); //Remove a borda-0 e Add a Borda vermelha
            return;
        } else {
            $.ajax({
                url: site_url+'Usuarios/AlterPass',
                type: 'POST',
                dataType: 'JSON',
                data: {
                    id: id,
                    password: newpass2 
                },
                beforeSend: function() {
                    $('body').find('.loading_screen').show();
                },
                success: function(i) {
                    if(i.suc == true) {
                        var msg = 'Senha alterada sucesso!';
                        msgSuccess(msg);
                        $('#alterarSenha').modal('hide');
                        $("#password_old").val();
                        $("#password").val();
                        $("#password2").val();
                    } 
                    else {
                        var msg = 'Erro ao alterar senha, tente novamente mais tarde!';
                        msgErro(msg);
                    }
                },
                complete: function() {
                    $('body').find('.loading_screen').hide();
                },
            })
        }
    });
});
