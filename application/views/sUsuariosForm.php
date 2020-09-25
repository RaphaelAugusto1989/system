<?php
	$userId = null;
	$nome = null;
	$cpf = null;
	$nascimento = null;
	$email = null;
	$login = null;
?>
<div class="row mb-4">
	<div class="col">
		<h5 class="pb-2 border-bottom"><?= $title ?></h5>
	</div>
</div>
<input type="hidden" name="id" class="" id="id" value="<?= $userId ?>">
<div class="panel panel-default rounded corpo">
    <div class="panel-heading text-white p-2 title">
        <h5></h5>
    </div>
    <div class="panel-body p-2 mt-4">
		<div class="row">
			<div class="col">
				<label for="nome" class="m-0 mt-2 labelNome">Nome:</label>
				<input type="text" name="nome" class="form-control border-0" id="nome" value="<?= $nome ?>">
			</div>
		</div>
		<div class="row">
			<div class="col">
				<label for="" class="m-0 mt-2 labelCpf">CPF:</label>
				<input type="text" name="cpf" class="form-control border-0 cpf" id="cpf" placeholder="xxx.xxx.xxx-xx" value="<?= $cpf ?>">
			</div>
			<div class="col">
				<label for="" class="m-0 mt-2 labelNascimento">Data de Nascimento:</label>
				<div class="input-group">
					<input type="text" name="nascimento" class="form-control border-0 data datepicker-dmy" id="nascimento" value="<?= $nascimento ?>">
					<div class="input-group-prepend rounded-right text-dark border-0">
						<div class="input-group-text rounded-right text-dark border-0" id="showPassword" style="background: #ffffff;"> 
							<i class="far fa-calendar-alt"></i>
						</div> 
					</div>
				</div>
			</div>
			<div class="col">
				<label for="" class="m-0 mt-2 labelEmail">E-mail:</label>
				<input type="text" name="email" class="form-control border-0" id="email" placeholder="seuemail@site.com.br" value="<?= $email ?>">
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
					<input type="password" name="pass" class="form-control border-0 showpass" id="showPassRegUser" maxlength="20">
					<div class="input-group-prepend">
						<a href="#" class="input-group-text rounded-right text-dark border-0 showPassword" data-id="showPassRegUser" style="background: #ffffff;">
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
				<button class="btn btn-success pl-5 pr-5" id="buttonAlterUser"> <i class="fas fa-save"></i> Salvar Alteração</button>
			</div>
		</div>
		<?php
			}
		?>
	</div>
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
						<input type="password" name="pass" class="form-control border-0 showpass" id="showPassAltUser" maxlength="20">
						<div class="input-group-prepend">
							<a href="#" class="input-group-text rounded-right text-dark border-0 showPassword" data-id="showPassAltUser" style="background: #ffffff;">
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
			var password = $("#showPassRegUser").val();

			if (nome == '') {
				var msg = "Nome Obrigatório!"; //MSG DE ERRO
				var classLabel = "labelNome"; //NOME DA CLASS DA LABEL 
				var nomeInput = "nome"; //NAME DO INPUT
				msgErroObrigatorio(classLabel, nomeInput, msg);
			}

			if (cpf == '') {
				var msg = "CPF Obrigatório!"; //MSG DE ERRO
				var classLabel = "labelCpf"; //NOME DA CLASS DA LABEL 
				var nomeInput = "cpf"; //NAME DO INPUT
				msgErroObrigatorio(classLabel, nomeInput, msg);
			}

			if (nascimento == '') {
				var msg = "Data de Nascimento Obrigatório!"; //MSG DE ERRO
				var classLabel = "labelNascimento"; //NOME DA CLASS DA LABEL 
				var nomeInput = "nascimento"; //NAME DO INPUT
				msgErroObrigatorio(classLabel, nomeInput, msg);
			}

			if (email == '') {
				var msg = "E-mail Obrigatório!"; //MSG DE ERRO
				var classLabel = "labelEmail"; //NOME DA CLASS DA LABEL 
				var nomeInput = "email"; //NAME DO INPUT
				msgErroObrigatorio(classLabel, nomeInput, msg);
			}

			if (login == '') {
				var msg = "Login é Obrigatório!"; //MSG DE ERRO
				var classLabel = "labelLogin"; //NOME DA CLASS DA LABEL 
				var nomeInput = "login"; //NAME DO INPUT
				msgErroObrigatorio(classLabel, nomeInput, msg);
			}

			if (password == '') {
				var msg = "Password Obrigatório!"; //MSG DE ERRO
				var classLabel = "labelPassword"; //NOME DA CLASS DA LABEL 
				var nomeInput = "pass"; //NAME DO INPUT
				msgErroObrigatorio(classLabel, nomeInput, msg);
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
				success: function(i) {
					if(i.suc == true) {
						var msg = 'Usuário inserido com sucesso!';
						msgSuccess(msg);
					} else {
						var msg = 'Erro ao cadastrar usuário, tente novamente mais tarde!';
						msgErro(msg);
					}
				},
				complete: function() {
					$('body').find('.loading_screen').hide();
				}
			})
		}); //FIM FUNÇÃO SALVAR DADOS

		$('#buttonPassAlter').on('click', function(){
			var id = $("#id").val();
			var pass = $("#showPassAltUser").val();

			if (pass == '') {
				var msg = "Password Obrigatório!"; //MSG DE ERRO
				var classLabel = "labelPassword"; //NOME DA CLASS DA LABEL 
				var nomeInput = "pass"; //NAME DO INPUT
				msgErroObrigatorio(classLabel, nomeInput, msg);
			}

			$.ajax({
				url: site_url+'Usuarios/AlterPass',
				type: 'POST',
				data: {
					id: id,
					password: pass
				},
				dataType: 'JSON',
			})
		});
	});
</script>

