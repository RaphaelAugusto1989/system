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
					<div class="col-lg-6 col-sm-12">
						<label class="m-0 mt-2 labelValor" for="">Valor:</label>
						<div class="input-group">
							<div class="input-group-append" >
								<span class="input-group-text border-0 rounded-left" style="background: #ffffff;">R$</span>
							</div>
							<input type="text" class="form-control border-0 moeda" name="valor" id="valor" placeholder="0,00">
						</div>
					</div>
					<div class="col-lg-6 col-sm-12" id="divparcelamento" style="display: none;">
						<label class="m-0 mt-2 labelParcelamento" for="">Parcelamento:</label>
						<div class="input-group">
							<input type="text" class="form-control border-0" name="parcelamento" id="parcelamento" placeholder="Parcelamento">
							<div class="input-group-append">
								<span class="input-group-text border-0" style="background: #ffffff;">X</span>
							</div>
						</div>
						<small class="float-right">Á Vista digite 1</small>
					</div>
					<div class="col-lg-6 col-sm-12" id="divcontafixa" style="display: none;">
						<label class="m-0 mt-2 labelContaFixa" for="">Conta Fixa:</label>
						<select name="conta_fixa" class="form-control border-0" id="conta_fixa">
							<option value="" selected> -- Selecionar --</option>
							<option value="s"> Sim</option>
							<option value="n"> Não</option>
						</select>
					</div>
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
		} else {
			$("#titulo").html("Conta a pagar");
			$("#divparcelamento").fadeIn();
			$("#divcontafixa").hide();
		}
	});

	$("#buttonSalvar").on("click", function() {
		var tipoConta = $("#tipo_conta").val();
		var vencimento = $("#vencimento").val();
		var nome = $("#nome_conta").val().toUpperCase(); //DEIXA TODAS AS LETRAS DO NOME MAIÚSCULA
		var valor = $("#valor").val();
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

		if (tipoConta == 'p') {
			if (parcelamento == '') {
				var msg = "Campo Parcelameto Obrigatório!"; //MSG DE ERRO
				var classLabel = "labelParcelamento"; //NOME DA CLASS DA LABEL 
				var nomeInput = "parcelamento"; //NAME DO INPUT
				msgErroObrigatorio(classLabel, nomeInput, msg);
			}
		} else {
			if (contaFixa == '') {
				var msg = "Capo Conta Fixa Obrigatório!"; //MSG DE ERRO
				var classLabel = "labelContaFixa"; //NOME DA CLASS DA LABEL 
				var nomeInput = "conta_fixa"; //NAME DO INPUT
				msgErroObrigatorio(classLabel, nomeInput, msg);
			}
		}

		$.ajax({
			url: site_url+'Contas/InsertAccount',
			type: 'POST',
			data: {
				tipoConta: tipoConta,
				vencimento: vencimento,
				nome: nome,
				valor: valor,
				parcelamento: parcelamento,
				contaFixa: contaFixa
			},
			dataType: 'JSON',
			beforeSend: function() {
				$('body').find('.loading_screen').show();
			},
			success: function(i) {
				if (i.suc == true) {
					var msg = 'Conta cadastrada com sucesso!';
					msgSuccess(msg);
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