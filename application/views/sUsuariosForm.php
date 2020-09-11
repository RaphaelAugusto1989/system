<?php
	$userId = '1';
	$nome = null;
	$cpf = null;
	$nascimento = null;
	$email = null;
	$login = null;
?>
<input type="hidden" name="id" class="" id="id" value="<?= $userId ?>">
<div class="corpo">
	<div class="row">
		<div class="col">
			<h5 class=""><?= $title ?></h5>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<label for="nome" class="m-0 mt-2 labelNome">Nome:</label>
			<input type="text" name="nome" class="form-control border-0" id="nome" value="<?= $nome ?>">
		</div>
	</div>
	<div class="row">
		<div class="col">
			<label for="" class="m-0 mt-2 labelCpf">CPF:</label>
			<input type="text" name="cpf" class="form-control border-0 cpf" id="cpf" value="<?= $cpf ?>">
		</div>
		<div class="col">
			<label for="" class="m-0 mt-2 labelNascimento">Data de Nascimento:</label>
			<input type="text" name="nascimento" class="form-control border-0 data datepicker-dmy" id="nascimento" value="<?= $nascimento ?>">
		</div>
		<div class="col">
			<label for="" class="m-0 mt-2 labelEmail">E-mail:</label>
			<input type="text" name="email" class="form-control border-0" id="email" value="<?= $email ?>">
		</div>
	</div>
	<?php 
		if ($userId == null) {
	?>
	<div class="row">
		<div class="col">
			<label for="" class="m-0 mt-2 labelLogin">Login:</label>
			<input type="text" name="login" class="form-control border-0" id="login" maxlength="15" value="<?= $login ?>">
		</div>
		<div class="col">
			<label for="" class="m-0 mt-2 labelPassword">Password:</label>
			<div class="input-group">
				<input type="password" name="pass" class="form-control border-0" id="password" maxlength="20">
				<div class="input-group-prepend">
					<a href="#" class="input-group-text rounded-right text-dark border-0" id="showPassword" style="background: #ffffff;">
						<i class="far fa-eye"></i>
					</a> 
				</div>
				<a href="javascript:geraPassword(this)" class="btn btn-warning ml-2 text-white" data-toggle="tooltip" data-placement="top" title="Gerar Senha Automática"> <i class="fas fa-key"></i> </a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col mt-3 text-right">
			<button class="btn btn-success pl-5 pr-5" id="buttonSalvar"> <i class="fas fa-save"></i> Salvar</button>
		</div>
	</div>

	<?php
		} else {
	?>
	<div class="row">
		<div class="col">
			<label for="" class="m-0 mt-2 labelLogin">Login:</label>
			<input type="text" name="login" class="form-control border-0" id="login" maxlength="15" value="<?= $login ?>">
		</div>
		<div class="col mt-3 pt-3 text-right">
			<button class="btn btn-warning pl-5 pr-5" data-toggle="modal" data-target="#alterarSenha"> <i class="fas fa-unlock-alt"></i> Alterar Senha</button>
		</div>
	</div>
	<div class="row">
		<div class="col mt-3 text-right">
			<button class="btn btn-success pl-5 pr-5" id="buttonAlterUser"> <i class="fas fa-save"></i> Alterar</button>
		</div>
	</div>
	<?php
		}
	?>
</div>

<!-- MODAL PARA ALTERAR SENHA -->
<div class="modal fade" id="alterarSenha" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content corpo_modal">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Alterar Senha</h5>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	  	<div class="container-fluid">
			<div class="row">
				<div class="col">
					<label for="" class="m-0 mt-2 labelPassword">Password:</label>
					<div class="input-group">
						<input type="password" name="pass" class="form-control border-0" id="password" maxlength="20">
						<div class="input-group-prepend">
							<a href="#" class="input-group-text rounded-right text-dark border-0" id="showPassword" style="background: #ffffff;">
								<i class="far fa-eye"></i>
							</a> 
						</div>
						<a href="javascript:geraPassword(this)" class="btn btn-warning ml-2 text-white" data-toggle="tooltip" data-placement="top" title="Gerar Senha Automática"> <i class="fas fa-key"></i> </a>
					</div>
				</div>
			</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
		<button class="btn btn-success pl-5 pr-5" id="buttonPassAlter"> <i class="fas fa-save"></i> Alterar</button>
      </div>
    </div>
  </div>
</div>
<script>
	$(document).ready(function() {
		$("#buttonSalvar").on('click', function() {
			var nome = $("#nome").val().toUpperCase(); //DEIXA TODAS AS LETRAS DO NOME MAIÚSCULA
			var cpf = $("#cpf").val();
			var nascimento = $("#nascimento").val();
			var email = $("#email").val().toLowerCase(); //DEIXA TODAS AS LETRAS DO NOME MINUSCULAS
			var login = $("#login").val();
			var password = $("#password").val();

			if (nome == '') {
				$(".labelNome").addClass('labelError'); //ADD COR VERMELHA DO TEXTO
       			$("input[name='nome']").removeClass('border-0').addClass('border border-5 border-danger'); //Remove a borda-0 e Add a Borda vermelha
				
				//MOSTRA POPUP DE ALERTA
				toastr.error('Nome Obrigatório!', '', {
				            "closeButton": true, //true or false
				            "debug": false, //true or false
				            "newestOnTop": false, //true or false
				            "progressBar": true, //true or false
				            "positionClass": "toast-top-right", //toast-top-right, toast-top-left, toast-top-full-width, toast-top-center, toast-bottom-right, toast-bottom-left, toast-bottom-full-width, toast-bottom-center
				            "preventDuplicates": false, //true or false
				            "onclick": null,
				            "showDuration": "300",
				            "hideDuration": "1000",
				            "timeOut": "5000",
				            "extendedTimeOut": "1000",
				            "showEasing": "swing",
				            "hideEasing": "linear",
				            "showMethod": "fadeIn", //fadeIn, show, slideDown
				            "hideMethod": "fadeOut" //fadeOut, hide
				});
			}

			if (cpf == '') {
				$(".labelCpf").addClass('labelError'); //Add a cor vermelha no texto
       			$("input[name='cpf']").removeClass('border-0').addClass('border border-5 border-danger'); //Remove a borda-0 e Add a Borda vermelha
				//Mostra o popup de alertaT
				toastr.error('CPF Obrigatório!', '', {
				            "closeButton": true, //true or false
				            "debug": false, //true or false
				            "newestOnTop": false, //true or false
				            "progressBar": true, //true or false
				            "positionClass": "toast-top-right", //toast-top-right, toast-top-left, toast-top-full-width, toast-top-center, toast-bottom-right, toast-bottom-left, toast-bottom-full-width, toast-bottom-center
				            "preventDuplicates": false, //true or false
				            "onclick": null,
				            "showDuration": "300",
				            "hideDuration": "1000",
				            "timeOut": "5000",
				            "extendedTimeOut": "1000",
				            "showEasing": "swing",
				            "hideEasing": "linear",
				            "showMethod": "fadeIn", //fadeIn, show, slideDown
				            "hideMethod": "fadeOut" //fadeOut, hide
				});
			}

			if (nascimento == '') {
				$(".labelNascimento").addClass('labelError'); //Add a cor vermelha no texto
       			$("input[name='nascimento']").removeClass('border-0').addClass('border border-5 border-danger'); //Remove a borda-0 e Add a Borda vermelha
				//Mostra o popup de alertaT
				toastr.error('Data de Nascimento Obrigatório!', '', {
				            "closeButton": true, //true or false
				            "debug": false, //true or false
				            "newestOnTop": false, //true or false
				            "progressBar": true, //true or false
				            "positionClass": "toast-top-right", //toast-top-right, toast-top-left, toast-top-full-width, toast-top-center, toast-bottom-right, toast-bottom-left, toast-bottom-full-width, toast-bottom-center
				            "preventDuplicates": false, //true or false
				            "onclick": null,
				            "showDuration": "300",
				            "hideDuration": "1000",
				            "timeOut": "5000",
				            "extendedTimeOut": "1000",
				            "showEasing": "swing",
				            "hideEasing": "linear",
				            "showMethod": "fadeIn", //fadeIn, show, slideDown
				            "hideMethod": "fadeOut" //fadeOut, hide
				});
			}

			if (email == '') {
				$(".labelEmail").addClass('labelError'); //Add a cor vermelha no texto
				$("input[name='email']").removeClass('border-0').addClass('border border-5 border-danger'); //Remove a borda-0 e Add a Borda vermelha
				   
				//Mostra o popup de alertaT
				toastr.error('E-mail Obrigatório!', '', {
				            "closeButton": true, //true or false
				            "debug": false, //true or false
				            "newestOnTop": false, //true or false
				            "progressBar": true, //true or false
				            "positionClass": "toast-top-right", //toast-top-right, toast-top-left, toast-top-full-width, toast-top-center, toast-bottom-right, toast-bottom-left, toast-bottom-full-width, toast-bottom-center
				            "preventDuplicates": false, //true or false
				            "onclick": null,
				            "showDuration": "300",
				            "hideDuration": "1000",
				            "timeOut": "5000",
				            "extendedTimeOut": "1000",
				            "showEasing": "swing",
				            "hideEasing": "linear",
				            "showMethod": "fadeIn", //fadeIn, show, slideDown
				            "hideMethod": "fadeOut" //fadeOut, hide
				});
			}

			if (login == '') {
				$(".labelLogin").addClass('labelError'); //Add a cor vermelha no texto
				$("input[name='login']").removeClass('border-0').addClass('border border-5 border-danger'); //Remove a borda-0 e Add a Borda vermelha
				   
				//Mostra o popup de alertaT
				toastr.error('Login é Obrigatório!', '', {
				            "closeButton": true, //true or false
				            "debug": false, //true or false
				            "newestOnTop": false, //true or false
				            "progressBar": true, //true or false
				            "positionClass": "toast-top-right", //toast-top-right, toast-top-left, toast-top-full-width, toast-top-center, toast-bottom-right, toast-bottom-left, toast-bottom-full-width, toast-bottom-center
				            "preventDuplicates": false, //true or false
				            "onclick": null,
				            "showDuration": "300",
				            "hideDuration": "1000",
				            "timeOut": "5000",
				            "extendedTimeOut": "1000",
				            "showEasing": "swing",
				            "hideEasing": "linear",
				            "showMethod": "fadeIn", //fadeIn, show, slideDown
				            "hideMethod": "fadeOut" //fadeOut, hide
				});
			}

			if (password == '') {
				$(".labelPassword").addClass('labelError'); //Add a cor vermelha no texto
				$("input[name='pass']").removeClass('border-0').addClass('border border-5 border-danger'); //Remove a borda-0 e Add a Borda vermelha
				   
				//Mostra o popup de alertaT
				toastr.error('Password Obrigatório!', '', {
				            "closeButton": true, //true or false
				            "debug": false, //true or false
				            "newestOnTop": false, //true or false
				            "progressBar": true, //true or false
				            "positionClass": "toast-top-right", //toast-top-right, toast-top-left, toast-top-full-width, toast-top-center, toast-bottom-right, toast-bottom-left, toast-bottom-full-width, toast-bottom-center
				            "preventDuplicates": false, //true or false
				            "onclick": null,
				            "showDuration": "300",
				            "hideDuration": "1000",
				            "timeOut": "5000",
				            "extendedTimeOut": "1000",
				            "showEasing": "swing",
				            "hideEasing": "linear",
				            "showMethod": "fadeIn", //fadeIn, show, slideDown
				            "hideMethod": "fadeOut" //fadeOut, hide
				});
			}

			$.ajax({
				url: site_url+'Usuarios/RegisterUser',
				type: 'POST',
				data: {
					nome: nome,
					cpf: cpf,
					nascimento: nascimento,
					email: email,
					login: login,
					password: password
				},
				dataType: 'JSON',
				beforeSend: function() {
					$('body').find('.loading_screen').show();
				},
				complete: function() {
					$('body').find('.loading_screen').hide();
				},
				success: function(i) {
					if(i.suc == true) {
						toastr.success('Usuário inserido com sucesso!', '', {
							"closeButton": true, //true or false
							"debug": false, //true or false
							"newestOnTop": false, //true or false
							"progressBar": true, //true or false
							"positionClass": "toast-top-right", //toast-top-right, toast-top-left, toast-top-full-width, toast-top-center, toast-bottom-right, toast-bottom-left, toast-bottom-full-width, toast-bottom-center
							"preventDuplicates": false, //true or false
							"onclick": null,
							"showDuration": "1000",
							"hideDuration": "1000",
							"timeOut": "10000",
							"extendedTimeOut": "1000",
							"showEasing": "swing",
							"hideEasing": "linear",
							"showMethod": "fadeIn", //fadeIn, show, slideDown
							"hideMethod": "fadeOut" //fadeOut, hide
						});
					} else {
						toastr.error('Erro ao cadastrar usuário, tente novamente mais tarde!', '', {
				            "closeButton": true, //true or false
				            "debug": false, //true or false
				            "newestOnTop": false, //true or false
				            "progressBar": true, //true or false
				            "positionClass": "toast-top-right", //toast-top-right, toast-top-left, toast-top-full-width, toast-top-center, toast-bottom-right, toast-bottom-left, toast-bottom-full-width, toast-bottom-center
				            "preventDuplicates": false, //true or false
				            "onclick": null,
				            "showDuration": "500",
				            "hideDuration": "1000",
				            "timeOut": "5000",
				            "extendedTimeOut": "1000",
				            "showEasing": "swing",
				            "hideEasing": "linear",
				            "showMethod": "fadeIn", //fadeIn, show, slideDown
				            "hideMethod": "fadeOut" //fadeOut, hide
						});
					}
				}
			})
		}); //FIM FUNÇÃO SALVAR DADOS

		$('#buttonPassAlter').on('click', function(){
			var id = $("#id").val();
			var pass = $("#password").val();

			if (pass == '') {
				$(".labelPassword").addClass('labelError'); //Add a cor vermelha no texto
				$("#password").removeClass('border-0').addClass('border border-5 border-danger'); //Remove a borda-0 e Add a Borda vermelha
				   
				//Mostra o popup de alertaT
				toastr.error('Password Obrigatório!', '', {
				            "closeButton": true, //true or false
				            "debug": false, //true or false
				            "newestOnTop": false, //true or false
				            "progressBar": true, //true or false
				            "positionClass": "toast-top-right", //toast-top-right, toast-top-left, toast-top-full-width, toast-top-center, toast-bottom-right, toast-bottom-left, toast-bottom-full-width, toast-bottom-center
				            "preventDuplicates": false, //true or false
				            "onclick": null,
				            "showDuration": "300",
				            "hideDuration": "1000",
				            "timeOut": "5000",
				            "extendedTimeOut": "1000",
				            "showEasing": "swing",
				            "hideEasing": "linear",
				            "showMethod": "fadeIn", //fadeIn, show, slideDown
				            "hideMethod": "fadeOut" //fadeOut, hide
				});
			}

			$.ajax({
				url: site_url+'Usuarios/AlterPass',
				type: 'POST',
				data: {
					password: pass
				},
				dataType: 'JSON',
			})

			
		});
	});
	
</script>

