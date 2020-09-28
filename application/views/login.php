<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= base_url('assets/css/bootstrap.css')?>">
    <link rel="stylesheet" href="<?= base_url('assets/css/jquery_ui.css')?>">
    <link rel="stylesheet" href="<?= base_url('assets/css/alerts.toastr.css')?>">
    <link rel="stylesheet" href="<?= base_url('assets/css/style.css')?>">
    <title>.:: Login ::.</title>
</head>
<body>
    <div class="container text-white">
        <div class="box-login">
            <div class="row">
                <div class="col col-lg-12 col-sm-12 mb-2">
                    <!-- <h4 class="text-center"> <i class="far fa-user"></i></h4>
                    <h4 class="text-center"> LOGIN</h4> -->
                    <img src="<?= base_url('assets/img/userlogin.png')?>" class="userlogin" alt="Login" title="Login"> <h4 class="text-center"> LOGIN</h4>
                </div>
            </div>
            <div class="row">
                <div class="col col-lg-12 col-sm-12 m-1">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text border-0" style="background:#ffffff;"> <i class="far fa-envelope"></i> </div>
                        </div>
                        <input type="text" name="login" class="form-control border-0" id="login" placeholder="E-mail ou Login">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col col-lg-12 col-sm-12 m-1">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text border-0" style="background:#ffffff;"> <i class="fas fa-unlock-alt"></i> </div>
                        </div>
                        <input type="password" name="psw" class="form-control border-0" placeholder="Password" id="password">
                        <div class="input-group-prepend">
                            <a href="#" class="input-group-text rounded-right text-dark border-0" id="showPassword" style="background:#ffffff;"><i class="far fa-eye"></i></a> 
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col col-lg-12 col-sm-12 m-1 text-dark text-right">
                    <button type="button" class="btn btn-dark btn-lg btn-block" id="signIn"> Entrar</button>
                    <a href="#" class="small text-dark">Esqueci minha senha!</a>
                </div>
            </div>
        </div>
        <footer class="rodape p-2">
            <small>Versão: 0.1</small>
        </footer>
    </div>
</body>
<script type="text/javascript" src="<?= base_url('assets/js/jquery.min.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/jquery-ui.min.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/bootstrap.min.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/icons_fontawesome.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/alerts.toastr.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/datepicker.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/mask.jquery.min.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/mask.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/functions.js')?>"></script>

<script>
    var site_url = '<?php echo site_url(); ?>';

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
        }

        if (pass == '') {
            var msg = "Digite sua senha!"; //MSG DE ERRO
            var classLabel = "labelLogin"; //NOME DA CLASS DA LABEL 
            var nomeInput = "psw"; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);
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
                $('#signIn').html(imgLoad+' loading... ');
            },
            complete: function() {
                $('#signIn').html('Entrar');
            }
        }).done(function(response){
            if(response.sucesso){
                location.href = response.p;
            } else {
                var msg = 'Usuário ou senha incorreto!';
                msgErro(msg);
            }
        });

    });
</script>
</html>