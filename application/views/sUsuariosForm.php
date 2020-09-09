<div class="row ">
    <div class="col">
		<h4 class="text-center">Cadastrar Usuário</h4>
    </div>
</div>
<div class="corpo">
	<div class="row">
		<div class="col">
			<label for="nome" class="m-0 mt-2 labelNome">Nome:</label>
			<input type="text" name="nome" class="form-control border-0" id="nome">
		</div>
	</div>
	<div class="row">
		<div class="col">
			<label for="" class="m-0 mt-2 labelCpf">CPF:</label>
			<input type="text" name="cpf" class="form-control border-0 cpf" id="cpf">
		</div>
		<div class="col">
			<label for="" class="m-0 mt-2">Data de Nascimento:</label>
			<input type="text" name="nascimento" class="form-control border-0 data datepicker-dmy" id="nascimento">
		</div>
		<div class="col">
			<label for="" class="m-0 mt-2 labelEmail">E-mail:</label>
			<input type="text" name="email" class="form-control" id="email">
		</div>
	</div>
	<div class="row">
		<div class="col">
			<label for="" class="m-0 mt-2">Login:</label>
			<input type="text" name="login" class="form-control border-0" id="login" maxlength="15">
		</div>
		<div class="col">
			<label for="" class="m-0 mt-2">Password:</label>
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
				$(".labelNome").addClass('labelError'); //Add a cor vermelha no texto
       			$("input[name='nome']").addClass('border border-4 border-danger'); //Add a Bordar vermelha
				//Mostra o popup de alertaT
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
       			$("input[name='cpf']").addClass('border border-4 border-danger'); //Add a Bordar vermelha
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

			if (email == '') {
				$(".labelEmail").addClass('labelError'); //Add a cor vermelha no texto
       			$("input[name='email']").addClass('border border-4 border-danger'); //Add a Bordar vermelha
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
				}

			})

		});
	});
	
</script>

