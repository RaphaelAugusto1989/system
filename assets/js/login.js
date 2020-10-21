$('#login').focus();
$('#showPassword').on('click', function(){
    var passwordField = $('#password');
    var passwordFieldType = passwordField.attr('type');

    if (passwordFieldType == 'password') {
        passwordField.attr('type', 'text');
        $(this).html('<i class="far fa-eye-slash"></i>');
    } else {
        passwordField.attr('type', 'password');
        $(this).html('<i class="far fa-eye"></i>');
    }
});

$('#signIn').on('click', function(){
    var imgLoad = '<img src="'+site_url+'assets/img/loading.gif" width="15px;">';
    var login = $('#login').val();
    var pass = $('#password').val();

    if (login == '') {
        var msg = "Digite seu login"; //MSG DE ERRO
        var classLabel = "labelLogin"; //NOME DA CLASS DA LABEL 
        var nomeInput = "login"; //NAME DO INPUT
        msgErroObrigatorio(classLabel, nomeInput, msg);
        return;
    }

    if (pass == '') {
        var msg = "Digite sua senha!"; //MSG DE ERRO
        var classLabel = "labelLogin"; //NOME DA CLASS DA LABEL 
        var nomeInput = "psw"; //NAME DO INPUT
        msgErroObrigatorio(classLabel, nomeInput, msg);
        return;
    }

    $.ajax({
        url: site_url+'Home/SignIn',
        type: 'POST',
        dataType: 'JSON',
        data: {
            login: login,
            password: pass
        },
        beforeSend: function() {
            setTimeout(function(){$("#signIn").html(imgLoad+' loading...')}, 100);
        },
        complete: function() {
            $('#signIn').html('Entrar');
        }
    }).done(function(response){
        if(response.sucesso){
            setTimeout(function(){ location.href = response.p; }, 3000);
        } else {
            var msg = 'Usuário ou senha incorreto!';
            msgErro(msg);
            return;
        }
    });

});