<div class="row ">
    <div class="col">
		<h4 class="text-center">Meus Dados</h4>
    </div>
</div>
<div class="corpo">
	<div class="row">
		<div class="col">
			<label for="" class="m-0 mt-2">Nome:</label>
			<input type="text" name="nome" class="form-control border-0" id="">
		</div>
	</div>
	<div class="row">
		<div class="col">
			<label for="" class="m-0 mt-2">CPF:</label>
			<input type="text" name="cpf" class="form-control border-0 cpf" id="" disabled>
		</div>
		<div class="col">
			<label for="" class="m-0 mt-2">Data de Nascimento:</label>
			<input type="text" name="nascimento" class="form-control border-0 data datepicker-dmy" id="">
		</div>
		<div class="col">
			<label for="" class="m-0 mt-2">E-mail:</label>
			<input type="text" name="email" class="form-control border-0" id="">
		</div>
	</div>
	<div class="row">
		<div class="col">
			<label for="" class="m-0 mt-2">Login:</label>
			<input type="text" name="login" class="form-control border-0" id="" maxlength="15">
		</div>
		<div class="col">
			<label for="" class="m-0 mt-2">Password:</label>
			<div class="input-group">
				<input type="password" name="pass" class="form-control border-0" id="password" maxlength="15">
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
			<button class="btn btn-success pl-5 pr-5"> <i class="fas fa-save"></i> Salvar</button>
		</div>
	</div>
</div>

