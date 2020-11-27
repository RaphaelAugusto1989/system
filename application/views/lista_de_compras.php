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
    <title>.:: Lista de Compras ::.</title>
</head>
<body>
    <div class="container text-white">
    <h3 class="text-center mb-3 mt-3">Lista de Compras</h3>
        <div class="row">
            <div class="col-lg-6 mb-2">
                <input type="text" class="form-control" id="produto" placeholder="Produto" >
            </div>
            <div class="col-lg-3 mb-2">
                <div class="input-group">
                    <div class="input-group-append" >
                        <span class="input-group-text border-0 rounded-left" style="background: #ffffff;">R$</span>
                    </div>
                    <input type="text" class="form-control border-0 moeda" name="valor" id="valor" placeholder="0,00" >
                </div>
            </div>
            <div class="col-lg-2 mb-2">
                <input type="text" class="form-control" id="qtd" placeholder="Qtd" maxlength="2" onkeypress="return number(event)">
            </div>
            <div class="col-lg-1 mb-2">
                <button class="btn btn-success btn-block btn-sm"><i class="fas fa-save"></i></button>
            </div>
        </div>
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