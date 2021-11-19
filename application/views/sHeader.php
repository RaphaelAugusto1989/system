<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= base_url('assets/css/bootstrap.css')?>">
    <link rel="stylesheet" href="<?= base_url('assets/css/style.css')?>">
    <link rel="stylesheet" href="<?= base_url('assets/css/jquery_ui.css')?>">
    <link rel="stylesheet" href="<?= base_url('assets/css/alerts.toastr.css')?>">
    <link rel="stylesheet" href="<?= base_url('assets/css/dataTables.bootstrap4.min.css')?>">
    <link rel="stylesheet" href="<?= base_url('assets/css/datepicker.css');?>">
    <link rel="stylesheet" href="<?= base_url('assets/css/sweetalert2.min.css');?>">

    <script type="text/javascript" src="<?= base_url('assets/js/jquery.min.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/jquery-ui.min.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/popper.min.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/bootstrap.min.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/icons_fontawesome.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/alerts.toastr.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/datepicker.js');?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/datepicker.pt-BR.min.js');?>"></script>		
    <script type="text/javascript" src="<?= base_url('assets/js/mask.jquery.min.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/mask.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/functions.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/jquery.dataTables.min.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/dataTables.bootstrap4.min.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/sweetalert2.min.js')?>"></script>
    <script>
        var site_url = '<?php echo site_url(); ?>';
    </script>
    <title>.:: <?= $title ?> ::.</title>
</head>
<body>
    <div class="container-fluid"><!--INICIO CONTAINER-->
        <div class="row menu">
            <nav class="col navbar navbar-dark navbar-expand-lg">
                <a class="navbar-brand" href="#">System</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <div class="submenu-user m-0">
                            <div class="submenu-img">
                                <div class="rounded-circle text-center p-2 mr-3 img_user"> 
                                    <?php 
                                        $n = explode(' ', $this->session->userdata('nome_user')); 
                                        echo substr($n[0], 0, 2); 
                                    ?>
                                </div>
                            </div>
                            <!-- <img src="<?= base_url('assets/img/photos/user.png') ?>" class="rounded-circle img_user float-right">  -->
                            <ul class="navbar-nav">
                                <li class="nav-item text-center align-middle">
                                    <a class="nav-link submenu_name p-0" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
                                        <?php $n = explode(' ', $this->session->userdata('nome_user')); echo $n[0].' '.$n[1]; ?>
                                    </a>
                                    <div class="submenu text-center" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item p-0" href="<?= site_url('Usuarios/DataUser/'.$this->session->userdata('id_user')) ?>"><i class="fas fa-user-cog"></i> Meus Dados</a>
                                        <a class="dropdown-item p-0" href="<?= site_url('Home/Logoff') ?>"><i class="fas fa-door-open"></i> Sair</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    
                        <li class="nav-item active">
                            <a class="nav-link" href="<?= site_url('Home/homeSystem/') ?>"><i class="fas fa-home"></i> Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fas fa-user-friends"></i> Clientes</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
                                <i class="fas fa-hand-holding-usd"></i> Financeiro 
                            </a>
                            <div class="dropdown-menu submenu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="<?= site_url('Contas/ContasDoMes')?>"><i class="fas fa-comments-dollar"></i> Contas</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
                                <i class="fas fa-copy"></i> Relatórios 
                            </a>
                            <div class="dropdown-menu submenu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="#"><i class="fas fa-user-friends"></i> Clientes</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-comments-dollar"></i> Financeiro</a>
                            </div>
                        </li>
						<?php 
							if($this->session->userdata('perfil_user') == '1') { 
						?>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
                                <i class="fas fa-cogs"></i> Configurações </a>
                            <div class="dropdown-menu submenu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="<?= site_url('Usuarios/UserViews') ?>"><i class="fas fa-user-tie"></i> Usuários</a>
                                <a class="dropdown-item" href="<?= site_url('Usuarios/LogsView') ?>"><i class="fas fa-book-dead"></i> Logs do Sistema</a>
                            </div>
                        </li>
						<?php 
							} 
						?>
                    </ul>
                </div>
                <div class="menu-user">
                    <!-- <img src="<?= base_url('assets/img/photos/user.png') ?>" class="rounded-circle img_user float-right">  -->
                    <ul class="navbar-nav float-right">
                        <li class="nav-item dropdown text-right align-middle">
                            <a class="nav-link dropdown-toggle " href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
                            <?php $n = explode(' ', $this->session->userdata('nome_user')); echo $n[0].' '.$n[1]; ?>
                            </a>
                            <div class="dropdown-menu submenu text-right" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="<?= site_url('Usuarios/DataUser/'.$this->session->userdata('id_user')) ?>"><i class="fas fa-user-cog"></i> Meus Dados</a>
                                <a class="dropdown-item" href="<?= site_url('Home/Logoff') ?>"><i class="fas fa-door-open"></i> Sair</a>
                            </div>
                        </li>
                    </ul>
                    <div class="rounded-circle text-center p-2 img_user float-right"> 
                        <?php 
                            $n = explode(' ', $this->session->userdata('nome_user')); 
                            echo substr($n[0], 0, 2); 
                        ?>
                    </div>
                </div>
            </nav>
        </div>
        <input type="hidden" name="id_logado" id="id_logado" value="<?= $this->session->userdata('id_user');?>">
        <div class="loading_screen" style = "display:none;"></div>
        <div class="container p-3 mt-2 mb-3">
