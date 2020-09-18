<div class="row">
	<div class="col">
		<h5 class="pb-2 border-bottom"><?= $title ?></h5>
	</div>
</div>
<!-- BOTÃO CADASTRAR -->
<div class="row">
	<div class="col">
		<a class="btn btn-success px-4 float-right" title="Cadastrar Usuário" href="<?= site_url('Contas/newAccount')?>" ><i class="fas fa-user-plus"></i> Nova Conta</a>
	</div>
</div>
<!-- BOTÃO CADASTRAR -->
<div class="row">
	<div class="col-lg-6 col-sm-12 mt-2">
		<div class="panel panel-default border border-success rounded table_receber">
			<div class="panel-heading  bg-success text-white p-2">
				<strong>A RECEBER</strong>
				<div class="float-right">
					<strong> R$ 4.080,00</strong>
				</div>
			</div>
			<div class="panel-body p-2 mt-4">
				<div class="table-responsive">
					<table class="table table-sm table-hover" style="width:100%" id="tb_transf">
						<thead>
							<tr>
								<th class="text-center">DATA</th>
								<th class="text-center">CONTA</th>
								<th class="text-center">VALOR</th>
								<th class="text-right">RECEBIDO?</th>
							</tr>		
						</thead>
						<tbody>
							<tr>
								<td class="text-center align-middle">08/09/2020</td>
								<td class="align-middle">SALARIO</td>
								<td class="text-right align-middle">R$ 3.900,00</td>
								<td class="text-right align-middle">
									<select name="recebido" id="recebido" class="border-0 bg-transparent text-white">
										<option class="text-dark" value="n" selected>Não</option>
										<option class="text-dark" value="s" >Sim</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="text-center align-middle">05/09/2020</td>
								<td class="align-middle">VENDA CADEIRA</td>
								<td class="text-right align-middle">R$ 80,00</td>
								<td class="text-right align-middle">
									<select name="recebido" id="recebido" class="border-0 bg-transparent text-white">
										<option class="text-dark" value="n" selected>Não</option>
										<option class="text-dark" value="s" >Sim</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="text-center align-middle">15/09/2020</td>
								<td class="align-middle">CONCERTO NOTEBOOK</td>
								<td class="text-right align-middle">R$ 100,00</td>
								<td class="text-right align-middle">
									<select name="recebido" id="recebido" class="border-0 bg-transparent text-white">
										<option class="text-dark" value="n" selected>Não</option>
										<option class="text-dark" value="s" >Sim</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="align-middle text-right">Total: </td>
								<td class="align-middle text-right">R$ 4.080,00</td>
								<td class="align-middle text-right">R$ 80,00</td>
							</tr>
						</tbody>
					</table>
				</div>	
			</div>
		</div>	
	</div>

	<div class="col-lg-6 col-sm-12 mt-2">
		<div class="panel panel-default border border-danger rounded table_receber">
			<div class="panel-heading  bg-danger text-white p-2">
				<strong>A PAGAR</strong>
				<div class="float-right">
					<strong> R$ 4.080,00</strong>
				</div>
			</div>
			<div class="panel-body p-2 mt-4">
				<div class="table-responsive">
					<table class="table table-sm table-hover" style="width:100%" id="tb_transf">
						<thead>
							<tr>
								<th class="text-center">DATA</th>
								<th class="text-center">CONTA</th>
								<th class="text-center">VALOR</th>
								<th class="text-right">PAGO?</th>
							</tr>		
						</thead>
						<tbody>
							<tr>
								<td class="text-center align-middle">08/09/2020</td>
								<td class="align-middle">SALARIO</td>
								<td class="text-right align-middle">R$ 3.900,00</td>
								<td class="text-right align-middle">
									<select name="recebido" id="recebido" class="border-0 bg-transparent text-white">
										<option class="text-dark" value="n" selected>Não</option>
										<option class="text-dark" value="s" >Sim</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="text-center align-middle">05/09/2020</td>
								<td class="align-middle">VENDA CADEIRA</td>
								<td class="text-right align-middle">R$ 80,00</td>
								<td class="text-right align-middle">
									<select name="recebido" id="recebido" class="border-0 bg-transparent text-white">
										<option class="text-dark" value="n" selected>Não</option>
										<option class="text-dark" value="s" >Sim</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="text-center align-middle">15/09/2020</td>
								<td class="align-middle">CONCERTO NOTEBOOK</td>
								<td class="text-right align-middle">R$ 100,00</td>
								<td class="text-right align-middle">
									<select name="recebido" id="recebido" class="border-0 bg-transparent text-white">
										<option class="text-dark" value="n" selected>Não</option>
										<option class="text-dark" value="s" >Sim</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="align-middle text-right">Total: </td>
								<td class="align-middle text-right">R$ 4.080,00</td>
								<td class="align-middle text-right">R$ 80,00</td>
							</tr>
						</tbody>
					</table>
				</div>	
			</div>
		</div>
	</div>
</div>

<div class="row mt-5">
	<div class="col">
		<div class="panel panel-default bg-success shadow-sm rounded table_receber">
			<div class="panel-heading box-valores text-white p-2">
				<strong>TOTAL A RECEBER</strong>
			</div>
			<div class="panel-body p-2 mt-4">
				<h2><b>R$ 3.000,00</b></h2>
			</div>
		</div>
	</div>
	<div class="col">
		<div class="panel panel-default bg-warning shadow-sm rounded table_receber">
			<div class="panel-heading box-valores text-white p-2">
				<strong>TOTAL PAGO</strong>
			</div>
			<div class="panel-body p-2 mt-4">
				<h2><b>R$ 3.000,00</b></h2>
			</div>
		</div>
	</div>
	<div class="col">
		<div class="panel panel-default bg-danger shadow-sm rounded table_receber">
			<div class="panel-heading box-valores text-white p-2">
				<strong>FALTA PAGAR</strong>
			</div>
			<div class="panel-body p-2 mt-4">
				<h2><b>R$ 3.000,00</b></h2>
			</div>
		</div>
	</div>
	<div class="col">
		<div class="panel panel-default bg-info shadow-sm rounded table_receber">
			<div class="panel-heading box-valores text-white p-2">
				<strong>SALDO ATUAL</strong>
			</div>
			<div class="panel-body p-2 mt-4">
				<h2><b>R$ 3.000,00</b></h2>
			</div>
		</div>
	</div>
</div>