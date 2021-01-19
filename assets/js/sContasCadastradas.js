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
							var msg = 'Conta Recebida!';
							msgSuccess(msg);
						} else {
							var msg = 'Conta Não Foi Recebida Ainda!';
							msgErro(msg);
						}
					} else {
						if (status == 's') {
							var msg = 'Conta Paga!';
							msgSuccess(msg);
						} else {
							var msg = 'Conta Não Foi Paga Ainda!';
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

	/* $("#searchDate").on("click", function(){
		var data = $("#data").val();
		$.ajax({
			url: site_url+'Contas/ContasDoMes',
			type: 'post',
			dataType: 'json',
			data: {
				data: data,
			},
			beforeSend: function() {
				$('body').find('.loading_screen').show();
			},
			complete: function(data) {
				$('body').find('.loading_screen').hide();
				console.log(data);
				console.log(data.responseJSON.cadastradas);
				/* alert('teste');
				$('#teste').html(data.responseJSON.cadastradas);
			},
		})
	}); */
});
