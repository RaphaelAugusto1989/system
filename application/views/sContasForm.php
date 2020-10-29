<?php
	$id_conta = null;
?>
<input type="hidden" name="id_conta" id="id_conta" value="<?= $id_conta ?>">
<div class="row">
	<div class="col">
		<h5 class="pb-2 border-bottom"><?= $title ?></h5> 
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
					<div class="col-lg-6 col-sm-12">
						<label class="m-0 mt-2 labelTipoConta" for="">Tipo:</label>
						<select name="tipo_conta" class="form-control border-0" id="tipo_conta">
							<option value="" selected> -- Selecionar --</option>
							<option value="p"> A Pagar</option>
							<option value="r"> A Receber</option>
						</select>
					</div>
					<div class="col-lg-6 col-sm-12">
						<label class="m-0 mt-2 labelVencimento" for="">Vencimento:</label>
						<div class="input-group">
							<input type="text" name="vencimento" class="form-control border-0 data datepicker-dmy" id="vencimento" placeholder="dd/mm/YYYY">
							<div class="input-group-prepend rounded-right text-dark border-0">
							 	<div class="input-group-text rounded-right text-dark border-0" id="showPassword" style="background: #ffffff;"> 
									<i class="far fa-calendar-alt"></i>
								</div> 
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<label class="m-0 mt-2 labelNome" for="">Descrição:</label>
						<input type="text" class="form-control border-0" name="nome_conta" id="nome_conta" placeholder="Ex.: Salário ou Conta de Luz">
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4 col-sm-12">
						<label class="m-0 mt-2 labelValor" for="">Valor:</label>
						<div class="input-group">
							<div class="input-group-append" >
								<span class="input-group-text border-0 rounded-left" style="background: #ffffff;">R$</span>
							</div>
							<input type="text" class="form-control border-0 moeda" name="valor" id="valor" placeholder="0,00">
						</div>
					</div>

					<!-- MOSTRA QUANDO TIPO CONTA FOR A PAGAR -->
					<div class="col-lg-8 col-sm-12 mt-2" id="divparcelamento" style="display: none;">
						<div class="row">
							<div class="col-lg-8 col-sm-12">
								<label class="m-0  labelTipoParcela" for="">Tipo da Parcela:</label>
								<select name="tipo_parcela" class="form-control border-0" id="tipo_parcela">
									<option value="" selected> -- Selecionar --</option>
									<option value="v"> A Vista</option>
									<option value="p"> A Prazo</option>
								</select>
							</div>
							<div class="col-lg-4 col-sm-12" id="div_tipo_parcelamento" style="display: none;">
								<label class="m-0 labelParcelamento" for="">Parcelamento:</label>
								<div class="input-group">
									<input type="text" class="form-control border-0" name="parcelamento" id="parcelamento" placeholder="Só número! Ex.: 12">
									<div class="input-group-append">
										<span class="input-group-text border-0" style="background: #ffffff;">X</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- MOSTRA QUANDO TIPO CONTA FOR A PAGAR -->

					<!-- MOSTRA QUANDO TIPO CONTA FOR A RECEBER -->
					<div class="col-lg-8 col-sm-12" id="divcontafixa" style="display: none;">
						<label class="m-0 mt-2 labelContaFixa" for="">Conta Fixa:</label>
						<select name="conta_fixa" class="form-control border-0" id="conta_fixa">
							<option value="" selected>-- Selecionar --</option>
							<option value="s"> Sim</option>
							<option value="n"> Não</option>
						</select>
					</div>
					<!-- MOSTRA QUANDO TIPO CONTA FOR A RECEBER -->
				</div>
				<div class="row">
					<div class="col mt-3 text-right">
						<button class="btn btn-success pl-5 pr-5" id="buttonSalvar"> <i class="fas fa-save"></i> Salvar</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="<?= site_url('assets/js/sContasForm.js'); ?>"></script>