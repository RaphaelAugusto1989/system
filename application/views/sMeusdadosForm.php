<?php
	$userId = null;
	$nome = null;
	$cpf = null;
	$nascimento = null;
	$email = null;
	$login = null;

	foreach($us as $i => $user) {
		$userId = $user->id_user;
		$nome = $user->name_user;
		$cpf = $user->cpf_user;
		$nascimento = dateBr($user->nascimento_user);
		$email = $user->email_user;
		$login = $user->login_user;		
?>
<div class="row mb-4">
	<div class="col">
		<h5 class="pb-2 border-bottom"><?= $title ?></h5>
	</div>
</div>

<input type="hidden" name="id" class="" id="id" value="<?= $userId ?>">
<div class="panel panel-default rounded corpo">
    <div class="panel-heading text-white p-2 title">
        <h5>Olá <?= ucfirst(strtolower($nome)) ?> </h5>
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
					<input type="text" name="nascimento" class="form-control border-0 data datepicker-dmy" id="nascimento" placeholder="dd/mm/yyyy" value="<?= $nascimento ?>">
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
				<button class="btn btn-success pl-5 pr-5" id="buttonAlterUser"> <i class="fas fa-save"></i> Salvar Alterações</button>
			</div>
		</div>
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
					<label for="" class="m-0 mt-2 labelPasswordOld">Senha antiga:</label>
					<div class="input-group">
						<input type="password" name="pass_old" class="form-control border-0 showpass" id="showPassOld" maxlength="20">
						<div class="input-group-prepend">
							<a href="#" class="input-group-text rounded-right text-dark border-0 showPassword" data-id="showPassOld" style="background: #ffffff;" required>
								<i class="far fa-eye"></i>
							</a> 
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<label for="" class="m-0 mt-2 labelPassword">Nova Senha:</label>
					<div class="input-group">
						<input type="password" name="new_pass" class="form-control border-0 showpass" id="showNewPass" maxlength="20">
						<div class="input-group-prepend">
							<a href="#" class="input-group-text rounded-right text-dark border-0 showPassword" data-id="showNewPass" style="background: #ffffff;" required>
								<i class="far fa-eye"></i>
							</a> 
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<label for="" class="m-0 mt-2 labelPassword">Repita a Nova Senha:</label>
					<div class="input-group">
						<input type="password" name="new_pass2" class="form-control border-0 showpass" id="showNewPass2" maxlength="20">
						<div class="input-group-prepend">
							<a href="#" class="input-group-text rounded-right text-dark border-0 showPassword" data-id="showNewPass2" style="background: #ffffff;" required>
								<i class="far fa-eye"></i>
							</a> 
						</div>
					</div>
				</div>
			</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
		<button class="btn btn-success pl-5 pr-5" id="buttonPassAlter"> <i class="fas fa-save"></i> Salvar Alteração</button>
      </div>
    </div>
  </div>
</div>
<?php 
	} //FIM DO FOREACH
?>
<script src="<?= site_url('assets/js/sMeusdadosForm.js'); ?>"></script>

