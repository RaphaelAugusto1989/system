<?php
	$id_conta = $sub_id = $tipo = $vencimento = $descricao = $valor = $contaFixa = $tipoParcela = $parcelamento = $status = null;

	if ($conta != null ) {
		foreach($conta as $i => $c) {
			$id_conta = $c->id_account;
			$sub_id = $c->id_account_one;
			$tipo = $c->tipo_conta;
			$vencimento = dateBR($c->data_vencimento);
			$descricao = $c->nome_conta;
			$valor = moneyBR($c->valor_conta);
			$contaFixa = $c->conta_fixa;
			$tipoParcela = $c->tipo_parcela;
			$parcelamento = $c->parcelamento;
			$status = $c->status;
		}
	}
?>
<input type="hidden" name="id_conta" id="id_conta" value="<?= $id_conta ?>">
<input type="hidden" name="sub_id_conta" id="sub_id_conta" value="<?= $sub_id ?>">
<div class="row">
	<div class="col">
		<h5 class="pb-2 border-bottom"><?= $title ?> <a href="#" onclick="backPage()" class="btn btn-link text-secondary float-right" data-toggle="tooltip" data-placement="right" title="voltar"><i class="fas fa-arrow-left"></i> </a></h5> 
	</div>
</div>
<div class="row mt-2">
	<div class="col-lg-12 col-sm-12 mt-2">
		<div class="panel panel-default rounded corpo">
			<div class="panel-heading  text-white p-2 title">
				<h5 id="titulo"></h5>
			</div>
			<div class="panel-body p-2 mt-4">
				<div class="row">
					<div class="col-lg-4 col-sm-12">
						<label class="m-0 mt-2 labelTipoConta" for="">Tipo:</label>
						<select name="tipo_conta" class="form-control border-0" id="tipo_conta">	
							<option <?php if ($tipo == null) {echo 'selected';} else {echo "";} ?> disabled> -- Selecione -- </option>
							<option value="p" <?php if ($tipo == 'p') {echo "selected";} else {echo "";} ?>> Saída</option> <!-- Pagar -->
							<option value="r" <?php if ($tipo == 'r') {echo "selected";} else {echo "";} ?>> Entrada</option> <!-- Receber -->
						</select>
					</div>
					<div class="col-lg-4 col-sm-12">
						<label class="m-0 mt-2 labelVencimento" for="">Vencimento:</label>
						<div class="input-group">
							<input type="text" name="vencimento" class="form-control border-0 data datepicker-dmy" id="vencimento" placeholder="dd/mm/aaaa" value="<?= $vencimento ?>">
							<div class="input-group-prepend rounded-right text-dark border-0">
							 	<div class="input-group-text rounded-right text-dark border-0" id="showPassword" style="background: #ffffff;"> 
									<i class="far fa-calendar-alt"></i>
								</div> 
							</div>
						</div>
					</div>
					<!-- <div class="col-lg-8 col-sm-12" id="divcontafixa" <?php if ($tipo == null OR $tipo == "p") { echo 'style="display: none;"';} ?>> -->
					<div class="col-lg-4 col-sm-12" id="divcontafixa" >
						<label class="m-0 mt-2 labelContaFixa" for="">Conta Fixa:</label>
						<select name="conta_fixa" class="form-control border-0" id="conta_fixa">
							<option value=" " <?php if ($contaFixa == null) {echo 'selected="selected"';} else {echo "";} ?> disabled>-- Selecionar --</option>
							<option value="s" <?php if ($contaFixa == 's') {echo 'selected="selected"';} else {echo "";} ?>> Sim</option>
							<option value="n" <?php if ($contaFixa == 'n') {echo 'selected="selected"';} else {echo "";} ?>> Não</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<label class="m-0 mt-2 labelNome" for="">Descrição:</label>
						<input type="text" class="form-control border-0" name="nome_conta" id="nome_conta" placeholder="Ex.: Salário, Conta de Luz, Internet"  value="<?= $descricao ?>">
					</div>
				</div>
				<div class="row">
					<div class="col-lg-3 col-sm-12">
						<label class="m-0 mt-2 labelValor" for="">Valor:</label>
						<div class="input-group">
							<div class="input-group-append" >
								<span class="input-group-text border-0 rounded-left" style="background: #ffffff;">R$</span>
							</div>
							<input type="text" class="form-control border-0 moeda" name="valor" id="valor" placeholder="0,00" value="<?= $valor ?>">
						</div>
					</div>
					<!-- MOSTRA QUANDO TIPO CONTA FOR A PAGAR -->
					<div class="col-lg-6 col-sm-12 mt-2" id="divparcelamento" <?php if ($tipo == null OR $tipo == "r") { echo 'style="display: none;"';} ?>>
						<div class="row">
							<div class="col-lg-12 col-sm-12" id="subDivParcelamento">
								<label class="m-0  labelTipoParcela" for="">Tipo da Parcela:</label>
								<select name="tipo_parcela" class="form-control border-0" id="tipo_parcela">
									<option class="" value=" " <?php if ($tipoParcela == null) {echo 'selected="selected"';} else {echo "";} ?> disabled> -- Selecione -- </option>
									<option class="" value="v" <?php if ($tipoParcela == "v") {echo 'selected="selected"';} else {echo "";} ?>> A Vista </option>
									<option class="" value="p" <?php if ($tipoParcela == "p") {echo 'selected="selected"';} else {echo "";} ?>> A Prazo </option>
								</select>
							</div>
							<div class="col-lg-5 col-sm-12" id="div_tipo_parcelamento" <?php if ($tipoParcela == null OR $tipoParcela == "v") { echo 'style="display: none;"';} ?>>
								<label class="m-0 labelParcelamento" for="">Parcelamento:</label>
								<div class="input-group">
									<input type="text" class="form-control border-0" name="parcelamento" id="parcelamento" placeholder="Ex.:12" maxlength="3" onkeypress="return number(event)"  value="<?= $parcelamento ?>">
									<div class="input-group-append">
										<span class="input-group-text border-0" style="background: #ffffff;">X</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- MOSTRA QUANDO TIPO CONTA FOR A PAGAR -->

					<!-- MOSTRA QUANDO CONTA FIXA FOR NÃO -->
					<div class="col-lg-3 col-sm-12" id="divStatus" <?php if ($contaFixa == null OR $contaFixa == "s") { echo 'style="display: none;"';} ?>>
						<label class="m-0 mt-2 labelStatus" for="">Pago:</label>
						<select name="status" class="form-control border-0" id="status">
							<option value="s" <?php if ($status == 's') {echo 'selected';} else {echo "";} ?>> Sim</option>
							<option value="n" <?php if ($status == 'n' OR $status == null) {echo 'selected';} else {echo "";} ?>> Não</option>
						</select>
					</div>
					<!-- MOSTRA QUANDO CONTA FIXA FOR NÃO -->
				</div>
				<div class="row">
					<?php if ($id_conta == null ) { ?>
						<div class="col-lg-9 col-sm-12 mt-3 text-right"></div>
						<div class="col-lg-3 col-sm-12  mt-3 text-right">
							<button class="btn btn-success btn-block pl-5 pr-5" id="buttonSalvar"> <i class="fas fa-save"></i> Salvar</button>
						</div>
						<?php } else { ?>
							<div class="col-lg-6 col-sm-12 mt-3 text-right"></div>
							<div class="col-lg-3 col-sm-12 mt-3 text-right">
								<button class="btn btn-danger btn-block pl-5 pr-5" data-toggle="modal" data-target="#excluirConta"> <i class="fas fa-trash-alt"></i> Exluir Conta</button>
							</div>
							<div class="col-lg-3 col-sm-12  mt-3 text-right">
								<button class="btn btn-success btn-block pl-5 pr-5"  data-toggle="modal" data-target="#alterarConta"> <i class="fas fa-save"></i> Salvar Alterações</button>
							</div>
						<?php } ?>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- MOSTRA TODAS AS CONTAS PARCELADAS DA CONTA SELECIONADA -->
<?php 
	if ($tipoParcela == "p") {
?>
<h4 class="text-center mt-5">Parcelas</h4>
<div class="row">
	<div class="col-lg-12">
		<table class="table table-sm table-borderless table-hover mt-2" style="width:100%">
			<thead>
				<tr>
					<th class="text-left">NOME</th>
					<th class="text-left">VENCIMENTO</th>
					<th class="text-right">VALOR</th>
					<th class="text-right">STATUS</th>
				</tr>		
			</thead>
			<tbody>
				<?php 
					foreach ($parcelas as $v => $p) {
						$data_hoje = date('Y-m-d');

						if ($p->status == 's' && $p->data_vencimento <= $data_hoje) {
							$text = "text-success";
						} else if ($p->status == 'n' && $p->data_vencimento <= $data_hoje) { 
							$text = "text-danger"; 
						} else {
							$text = "text-white"; 
						}
				?>
				<tr>
					<td class="text-left align-middle">
						<a href="<?= site_url('Contas/AccountForm/').$p->id_account ?>" class="<?= $text ?>">
							<?= $p->nome_conta; ?>
						</a>
					</td>
					<td class="text-left align-middle">
						<a href="<?= site_url('Contas/AccountForm/').$p->id_account ?>" class="<?= $text ?>">
							<?= dateBR($p->data_vencimento) ?>
						</a>
					</td>
					<td class="text-right align-middle">
						<a href="<?= site_url('Contas/AccountForm/').$p->id_account ?>" class="<?= $text ?>">
							R$ <?= moneyBR($p->valor_conta)  ?>
						</a>
					</td>
					<td class="text-right align-middle">
						<a href="<?= site_url('Contas/AccountForm/').$p->id_account ?>" class="<?= $text ?>">
							<?php 
								if ($p->status == 's') {
									echo 'Sim';
								} else {
									echo 'Não';
								}
							 ?>
						</a>
					</td>
				</tr>
				<?php 
					}
				?>
			</tbody>
		</table>
	</div>
</div>
<?php 
	} 
?>
<!-- MOSTRA TODAS AS CONTAS PARCELADAS DA CONTA SELECIONADA -->

<!-- MODAL PARA EXCLUSÃO -->
<div class="modal fade" id="excluirConta" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content corpo_modal">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Excluir Conta</h5>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	  	<div class="container-fluid">
		  <div class="row">
				<div class="col text-center">
				Deseja realmente excluir a conta <strong><?= $descricao ?></strong>?
				</div>
			</div>
		</div>
      </div>
      <div class="modal-footer">
		<div class="mx-auto align-center">
			<div class="row">
				<div class="<?php if ($contaFixa == 's' || $tipoParcela == 'p'){ echo 'col-lg-6'; } else { echo 'col-lg-12'; }?> col-sm-12 mb-2">
					<button class="btn btn-danger btn-block pl-5 pr-5" id="buttonDeleteAccount"> <i class="fas fa-trash-alt"></i>  Excluir Conta</button>
				</div>
				<?php if ($contaFixa == 's' || $tipoParcela == 'p'){ ?>
					<div class="col-lg-6 col-sm-12 mb-2">
						<button class="btn btn-outline-danger btn-block pl-3 pr-3" id="buttonDeleteAllAccount"> <i class="fas fa-exclamation-triangle"></i> Excluir Todas as Contas</button>
					</div>
				<?php }?>
			</div>
		</div>
	  </div>
    </div>
  </div>
</div>
<!-- MODAL PARA EXCLUSÃO -->

<!-- MODAL PARA ALTERAR CONTA -->
<div class="modal fade" id="alterarConta" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content corpo_modal">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Alterar Conta</h5>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	  	<div class="container-fluid">
		  <div class="row">
				<div class="col text-center">
					Deseja realmente alterar a conta <strong><?= $descricao ?></strong>?
				</div>
			</div>
		</div>
      </div>
      <div class="modal-footer">
		<div class="mx-auto">
			<div class="row">
				<div class="<?php if ($contaFixa == 's' || $tipoParcela == 'p') { echo 'col-lg-6'; } else {echo 'col-lg-12';}?> col-sm-12">
					<button class="btn btn-success pl-5 pr-5 mb-2" id="buttonSalvar"> <i class="fas fa-save"></i> Salvar Alteração desta Conta</button>
				</div>
				<!-- <div class="col-lg-6 col-sm-12">
					<?php if ($contaFixa == 's' || $tipoParcela == 'p') { ?>
						<button class="btn btn-outline-success pl-3 pr-3 mb-2" id="buttonAlterarTodos"> <i class="fas fa-share-square"></i> Salvar Alteração em Todas as Contas</button>
					<?php }?>
				</div> -->
			</div>
		</div>
	  </div>
    </div>
  </div>
</div>
<!-- MODAL PARA ALTERAR CONTA -->
<script src="<?= site_url('assets/js/sContasForm.js'); ?>"></script>
