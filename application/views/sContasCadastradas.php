
<div class="row">
	<div class="col">
		<h5 class="pb-2 border-bottom"><?= $title ?></h5>
	</div>
</div>
<!-- BOTÃO CADASTRAR -->
<div class="row">
	<div class="col-lg-3">
		<div class="input-group">
			<div class="input-group-prepend rounded-left text-dark border-0">
				<div class="input-group-text rounded-left text-dark border-0" id="showPassword" style="background: #ffffff;"> 
					<i class="far fa-calendar-alt"></i>
				</div> 
			</div>
			<input type="text" name="buscar" class="form-control border-0 rounded-0 data datepicker-ma" id="data" placeholder="mm/aaaa">
			<div class="input-group-prepend rounded-right text-dark border-0">
				<button class="btn btn-success rounded-right" id="searchDate" title="Buscar Data"><i class="fas fa-search"></i></button>
			</div>
		</div>
	</div>
	<div class="col-lg-4">
	</div>
	<div class="col-lg-5"">
		<a class="btn btn-success px-4 float-right" title="Cadastrar Usuário" href="<?= site_url('Contas/AccountForm')?>" ><i class="fas fa-user-plus"></i> Nova Conta</a>
	</div>
</div>
<!-- BOTÃO CADASTRAR -->
<div class="row mt-3">
	<div class="col">
		<div class="panel panel-default bg-success shadow-sm rounded table_receber">
			<div class="panel-heading box-valores text-white p-2">
				<strong>TOTAL A RECEBER</strong>
			</div>
			<div class="panel-body p-2 mt-4">
				<h2><b>R$ <?= moneyBR($total_receber)?> </b></h2>
			</div>
		</div>
	</div>
	<div class="col">
		<div class="panel panel-default bg-warning shadow-sm rounded table_receber">
			<div class="panel-heading box-valores text-white p-2">
				<strong>TOTAL PAGO</strong>
			</div>
			<div class="panel-body p-2 mt-4">
				<h2><b>R$ <?= moneyBR($total_pago)?> </b></h2>
			</div>
		</div>
	</div>
	<div class="col">
		<div class="panel panel-default bg-danger shadow-sm rounded table_receber">
			<div class="panel-heading box-valores text-white p-2">
				<strong>FALTA PAGAR</strong>
			</div>
			<div class="panel-body p-2 mt-4">
				<h2><b>R$ <?= moneyBR($total_pagar)?> </b></h2>
			</div>
		</div>
	</div>
	<div class="col">
		<div class="panel panel-default bg-info shadow-sm rounded table_receber">
			<div class="panel-heading box-valores text-white p-2">
				<strong>SALDO ATUAL</strong>
			</div>
			<div class="panel-body p-2 mt-4">
				<h2><b>R$ <?= moneyBR($saldo_atual)?> </b></h2>
			</div>
		</div>
	</div>
</div>
<div class="row mt-3">
	<div class="col-lg-6 col-sm-12 mt-2">
		<div class="panel panel-default border border-success rounded table_receber" style="background-color: #3cfa4c57;">
			<div class="panel-heading  bg-success text-white p-2">
				<strong>A RECEBER</strong>
				<div class="float-right">
					<strong> R$ <?= moneyBR($total_receber)  ?></strong>
				</div>
			</div>
			<div class="panel-body p-2 mt-4">
				<div class="table-responsive">
				<?php 
					if($receber) {
				?>
					<table class="table table-sm table-hover" style="width:100%" id="tb_transf">
						<thead>
							<tr>
								<th class="text-left">RECEBIMENTO</th>
								<th class="text-left">DESCRIÇÃO</th>
								<th class="text-right">VALOR</th>
								<th class="text-right">RECEBIDO?</th>
							</tr>		
						</thead>
						<tbody>
						<?php 
							$total = 0;
							foreach ($receber as $i => $c) {
								//debug_r($total_receber);
						?>
							<tr>
								<td class="text-left align-middle">
									<a href="<?= site_url('Contas/AccountForm/').$c->id_account ?>" class="text-white">
										<?= dateBR($c->data_vencimento) ?>
									</a>
								</td>
								<td class="align-middle">
									<a href="<?= site_url('Contas/AccountForm/').$c->id_account ?>" class="text-white">
										<?= $c->nome_conta ?>
									</a>
								</td>
								<td class="text-right align-middle">
									<a href="<?= site_url('Contas/AccountForm/').$c->id_account ?>" class="text-white">
										R$ <?= moneyBR($c->valor_conta) ?>
									</a>
								</td>
								<td class="text-right align-middle">
								<!-- SELECT DE RECEBIDOS -->
									<select name="recebido" id="status" data-tipo="recebido" data-id="<?= $c->id_account ?>" class="border-0 bg-transparent text-white">
										<option class="text-dark" value="n" <?php if($c->status == 'n'){ echo "selected"; } ?>>Não</option>
										<option class="text-dark" value="s" <?php if($c->status == 's'){ echo "selected"; } ?>>Sim</option>
									</select>
								</td>
							</tr>
						<?php
							$total += $c->valor_conta;
							}
						?>
							<tr>
								<td colspan="2" class="align-middle text-right">Total: </td>
								<td class="align-middle text-right">R$ <?= moneyBR($total_receber) ?> </td>
								<td class="align-middle text-right">R$ <?= moneyBR($total_recebido) ?> </td>
							</tr>
						</tbody>
					</table>
				<?php 
					} else {
						echo "<h5 class='text-center'>Nenhuma Conta a Receber este Mês! <i class='far fa-frown'></i> <h5>";
					}
				?>
				</div>	
			</div>
		</div>	
	</div>

	<div class="col-lg-6 col-sm-12 mt-2">
		<div class="panel panel-default border border-danger rounded table_receber" style="background-color: #f53a3a70;">
			<div class="panel-heading  bg-danger text-white p-2">
				<strong>A PAGAR</strong>
				<div class="float-right">
					<strong> R$ <?= moneyBR($total_pagar)?> </strong>
				</div>
			</div>
			<div class="panel-body p-2 mt-4">
				<div class="table-responsive">
				<?php
					if ($pagar) {
				?>
					<table class="table table-sm table-hover" style="width:100%" id="tb_transf">
						<thead>
							<tr>
								<th class="text-left">VENCIMENTO</th>
								<th class="text-left">DESCRIÇÃO</th>
								<th class="text-right">VALOR</th>
								<th class="text-right">PAGO?</th>
							</tr>		
						</thead>
						<tbody>
						<?php
							foreach($pagar as $i => $p) {
						?>
							<tr>
								<td class="text-left align-middle">
									<a href="<?= site_url('Contas/AccountForm/').$p->id_account ?>" class="text-white">
										<?= dateBR($p->data_vencimento) ?>
									</a>
								</td>
								<td class="align-middle">
									<a href="<?= site_url('Contas/AccountForm/').$p->id_account ?>" class="text-white">
										<?= $p->nome_conta ?>
									</a>
								</td>
								<td class="text-right align-middle">
									<a href="<?= site_url('Contas/AccountForm/').$p->id_account ?>" class="text-white">
										R$ <?= moneyBR($p->valor_conta) ?>
									</a>
								</td>
								<td class="text-right align-middle">
									<!-- SELECT DE PAGOS -->
									<select name="pago" id="status" data-tipo="pago" data-id="<?= $p->id_account ?>"  class="border-0 bg-transparent text-white">
										<option class="text-dark" value="n" <?php if($p->status == 'n'){ echo "selected"; } ?>>Não</option>
										<option class="text-dark" value="s" <?php if($p->status == 's'){ echo "selected"; } ?>>Sim</option>
									</select>
								</td>
							</tr>
							<?php
								}
							?>
							<tr>
								<td colspan="2" class="align-middle text-right">Total: </td>
								<td class="align-middle text-right">R$ <?= moneyBR($total_pagar)?> </td>
								<td class="align-middle text-right">R$ <?= moneyBR($total_pago) ?> </td>
							</tr>
						</tbody>
					</table>
					<?php
						} else {
							echo "<h5 class='text-center'>Nenhuma Conta a Pagar este Mês! <i class='far fa-smile-beam'></i> <h5>";
						}
					?>
				</div>	
			</div>
		</div>
	</div>
</div>
<script src="<?= site_url('assets/js/sContasCadastradas.js') ?>"></script>