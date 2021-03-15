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
            <form action="#" method="post">
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
            </form>
            <div class="row">
                <div class="col col-lg-12 col-sm-12 m-1 text-dark text-right">
                    <button type="submit" class="btn btn-dark btn-lg btn-block" id="signIn"> Entrar</button>
                    <a href="#" class="small text-dark">Esqueci minha senha!</a>
                </div>
            </div>
            <div class="row">
                <div class="col ml-2 text-left">
                    <small>Versão: 1.2.6</small>
                </div>
            </div>
        </div>
        <footer class="rodape p-2">
        </footer>
    </div>
</body>
<script> var site_url = "<?php echo site_url(); ?>";</script>
<script type="text/javascript" src="<?= base_url('assets/js/jquery.min.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/jquery-ui.min.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/bootstrap.min.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/icons_fontawesome.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/alerts.toastr.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/datepicker.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/mask.jquery.min.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/mask.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/functions.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/login.js')?>"></script>
</html>