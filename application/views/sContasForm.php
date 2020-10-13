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

<script>
$(document).ready(function() {

	$("#tipo_conta").change(function(){
		var tipoConta = $("#tipo_conta").val();
		
		if (tipoConta == 'r') {
			$("#titulo").html("Pagamento à receber");
			$("#divcontafixa").fadeIn();
			$("#divparcelamento").hide();
			$("#tipo_parcela").val( $('option:contains("-- Selecionar --")').val() );
			$("#parcelamento").val("");
		} else {
			$("#titulo").html("Conta a pagar");
			$("#conta_fixa").val( $('option:contains("-- Selecionar --")').val() );
			$("#divparcelamento").fadeIn();
			$("#divcontafixa").hide();
		}
	});

	$("#tipo_parcela").change(function(){
		var tipoParcela = $("#tipo_parcela").val();
		
		if (tipoParcela == 'p') {
			$("#div_tipo_parcelamento").fadeIn();
		} else {
			$("#div_tipo_parcelamento").fadeOut();
		}
	});

	$("#buttonSalvar").on("click", function() {
		var id_logado = $("#id_logado").val(); //ID DE QUEM ESTÁ LOGADO NO MOMENTO
		var tipoConta = $("#tipo_conta").val();
		var vencimento = $("#vencimento").val();
		var nome = $("#nome_conta").val().toUpperCase(); //DEIXA TODAS AS LETRAS DO NOME MAIÚSCULA
		var valor = $("#valor").val();
		var tipoParcela = $("#tipo_parcela").val();
		var parcelamento = $("#parcelamento").val();
		var contaFixa = $("#conta_fixa").val();

		if (tipoConta == '') {
			var msg = "Selecione o tipo de conta primeiro!"; //MSG DE ERRO
			var classLabel = "labelTipoConta"; //NOME DA CLASS DA LABEL 
			var nomeInput = "tipo_conta"; //NAME DO INPUT
			msgErroObrigatorio(classLabel, nomeInput, msg);
		}

		if (vencimento == '') {
			var msg = "Data de Vencimento Obrigatório!"; //MSG DE ERRO
			var classLabel = "labelVencimento"; //NOME DA CLASS DA LABEL 
			var nomeInput = "vencimento"; //NAME DO INPUT
			msgErroObrigatorio(classLabel, nomeInput, msg);
		}

		if (nome == '') {
			var msg = "Nome da Conta Obrigatório!"; //MSG DE ERRO
			var classLabel = "labelNome"; //NOME DA CLASS DA LABEL 
			var nomeInput = "nome_conta"; //NAME DO INPUT
			msgErroObrigatorio(classLabel, nomeInput, msg);
		}

		if (valor == '') {
			var msg = "Valor da Conta Obrigatório!"; //MSG DE ERRO
			var classLabel = "labelValor"; //NOME DA CLASS DA LABEL 
			var nomeInput = "valor"; //NAME DO INPUT
			msgErroObrigatorio(classLabel, nomeInput, msg);
		}

		if (tipoConta == 'r') {
			if (contaFixa == '') {
				var msg = "Capo Conta Fixa Obrigatório!"; //MSG DE ERRO
				var classLabel = "labelContaFixa"; //NOME DA CLASS DA LABEL 
				var nomeInput = "conta_fixa"; //NAME DO INPUT
				msgErroObrigatorio(classLabel, nomeInput, msg);
			}
		} else {
			if (tipoParcela == 'p') {
				if (parcelamento == '') {
					var msg = "Campo Parcelameto Obrigatório!"; //MSG DE ERRO
					var classLabel = "labelParcelamento"; //NOME DA CLASS DA LABEL 
					var nomeInput = "parcelamento"; //NAME DO INPUT
					msgErroObrigatorio(classLabel, nomeInput, msg);
				}
			}
		}

		$.ajax({
			url: site_url+'Contas/RegisterAccount',
			type: 'POST',
			dataType: 'JSON',
			data: {
				id_logado: id_logado,
				tipoConta: tipoConta,
				nome: nome,
				vencimento: vencimento,
				valor: valor,
				tipoParcela: tipoParcela,
				parcelamento: parcelamento,
				contaFixa: contaFixa
			},
			beforeSend: function() {
				$('body').find('.loading_screen').show();
			},
			success: function(i) {
				if (i.suc == true) {
					var msg = 'Conta cadastrada com sucesso!';
					msgSuccess(msg);
					setTimeout(function(){ location.href = i.p; }, 4000).find('.loading_screen').show();
				} else {
					var msg = 'Erro ao cadastrar conta, tente novamente mais tarde!';
					msgErro(msg);
				}
			},
			complete: function() {
				$('body').find('.loading_screen').hide();
			}
		});
	});
});

</script>