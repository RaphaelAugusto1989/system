$(document).ready(function() {
	$(document).on('change', "#status" ,function() {
		var id_logado = $("#id_logado").val(); //ID DE QUEM ESTÁ LOGADO NO MOMENTO
		var data_id_conta = $(this).attr("data-id"); //PEGANDO O DATA-ATTRIBUTE //
		var status = $(this).val();
		var tipo = $(this).attr("data-tipo");

		$.ajax({
			url: site_url+'Contas/AlterStatus',
			type: 'post',
			dataType: 'json',
			data: {
				id_logado: id_logado,
				id_conta : data_id_conta,
				status: status
			},
			beforeSend: function() {
				$('body').find('.loading_screen').show();
			},
			success: function(i) {
				if(i.suc == true) {
					if (tipo == 'recebido') {
						if (status == 's') {
							var msg = 'Conta Recebida! <i class="far fa-smile-beam"></i> ';
							msgSuccess(msg);
						} else {
							var msg = 'Conta Não Foi Recebida Ainda! <i class="far fa-frown"></i>';
							msgErro(msg);
						}
					} else {
						if (status == 's') {
							var msg = 'Conta Paga! <i class="far fa-frown"></i>';
							msgSuccess(msg);
						} else {
							var msg = 'Conta Não Foi Paga Ainda! <i class="far fa-frown"></i>';
							msgErro(msg);
						}
					}

					setTimeout(function(){ location.href = i.p; }, 800).find('.loading_screen').show();

				} else {
					var msg = 'Erro ao mudar status da conta, tente novamente mais tarde!';
					msgErro(msg);
				}
			},
			complete: function() {
				$('body').find('.loading_screen').hide();
			},
		})
	});
});
