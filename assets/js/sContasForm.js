$(document).ready(function() {
   
    $("#tipo_conta").change(function(){
        var tipoConta = $("#tipo_conta").val();
        
        if (tipoConta == 'r') {
            $("#titulo").html("Pagamento à receber");
            //$("#divcontafixa").fadeIn();
            $("#divparcelamento").fadeOut();
            $("#tipo_parcela").val( $('option:contains("-- Selecionar --")').val() );
            $("#parcelamento").val("");
        } else {
            $("#titulo").html("Conta a pagar");
            //$("#conta_fixa").val( $('option:contains("-- Selecionar --")').val() );
            //$("#divparcelamento").fadeIn();
            //$("#divcontafixa").hide();
        }
    });

    $("#conta_fixa").change(function(){
        var cFixa = $("#conta_fixa").val();
       // alert(cFixa);
        if (cFixa == 's') {
            $("#divparcelamento").fadeIn();
            $("#divStatus").fadeIn();
            $("#divparcelamento").removeClass('col-lg-6');
            $("#divparcelamento").addClass('col-lg-5');
            $("#subDivParcelamento").removeClass('col-lg-6');
            $("#subDivParcelamento").addClass('col-lg-12');
            $("#divStatus").removeClass('col-lg-3');
            $("#divStatus").addClass('col-lg-4');
            $("#div_tipo_parcelamento").hide();
            $("#tipo_parcela option[value='v']").attr('selected', 'true');
            $("#tipo_parcela option[value='p']").addClass('d-none');
        } else {
            $("#divparcelamento").fadeIn();
            $("#divStatus").hide();
            $("#div_tipo_parcelamento").hide();
            $("#subDivParcelamento").removeClass('col-lg-6');
            $("#divStatus").fadeIn();
            $("#tipo_parcela option[value='']").attr('selected', 'true');
            $("#tipo_parcela option[value='v']").attr('selected', 'false');
            $("#tipo_parcela option[value='p']").removeClass('d-none');            
        }
    });

    $('#tipo_parcela').ready(function() {
        var tipoParcela = $('#tipo_parcela').val();
        //alert(tipoParcela);
        if (tipoParcela == 'p') {
            $("#subDivParcelamento").removeClass('col-lg-12');
            $("#subDivParcelamento").addClass('col-lg-7');
        }
    })

    $("#tipo_parcela").change(function(){
        var tipoParcela = $('#tipo_parcela').val();
        
        if (tipoParcela == 'p') {
            $("#div_tipo_parcelamento").fadeIn();
            $("#subDivParcelamento").removeClass('col-lg-12');
            $("#subDivParcelamento").addClass('col-lg-7');
            // $("#div_tipo_parcelamento").removeClass('col-lg-6');
            // $("#div_tipo_parcelamento").addClass('col-lg-5');
        } else {
            $("#div_tipo_parcelamento").hide();
            $("#subDivParcelamento").removeClass('col-lg-7');
            $("#subDivParcelamento").addClass('col-lg-12');
        }
    });

    function SaveAccount() {
        var id_conta = $("#id_conta").val();
        var id_logado = $("#id_logado").val(); //ID DE QUEM ESTÁ LOGADO NO MOMENTO
        var tipoConta = $("#tipo_conta").val();
        var contaFixa = $("#conta_fixa").val();
        var vencimento = $("#vencimento").val();
        var nome = $("#nome_conta").val().toUpperCase(); //DEIXA TODAS AS LETRAS DO NOME MAIÚSCULA
        var valor = $("#valor").val();
        var tipoParcela = $("#tipo_parcela").val();
        var parcelamento = $("#parcelamento").val();
        var status = $("#status").val();
		var observacao = $("#observacao").val();

		if (tipoConta == '') {
            var msg = "Selecione o tipo de conta primeiro!"; //MSG DE ERRO
            var classLabel = "labelTipoConta"; //NOME DA CLASS DA LABEL 
            var nomeInput = "tipo_conta"; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);
            return;
        }

        if (vencimento == '') {
            var msg = "Data de Vencimento Obrigatório!"; //MSG DE ERRO
            var classLabel = "labelVencimento"; //NOME DA CLASS DA LABEL 
            var nomeInput = "vencimento"; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);
            return;
        }

        if (nome == '') {
            var msg = "Descrição da Conta Obrigatório!"; //MSG DE ERRO
            var classLabel = "labelNome"; //NOME DA CLASS DA LABEL 
            var nomeInput = "nome_conta"; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);
            return;
        }

        if (valor == '') {
            var msg = "Valor da Conta Obrigatório!"; //MSG DE ERRO
            var classLabel = "labelValor"; //NOME DA CLASS DA LABEL 
            var nomeInput = "valor"; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);
            return;
        }

        if (tipoConta == 'r') {
            if (contaFixa == '') {
                var msg = "Capo Conta Fixa Obrigatório!"; //MSG DE ERRO
                var classLabel = "labelContaFixa"; //NOME DA CLASS DA LABEL 
                var nomeInput = "conta_fixa"; //NAME DO INPUT
                msgErroObrigatorio(classLabel, nomeInput, msg);
                return;
            }
        } else {
            if (tipoParcela == 'p') {
                if (parcelamento == '') {
                    var msg = "Campo Parcelameto Obrigatório!"; //MSG DE ERRO
                    var classLabel = "labelParcelamento"; //NOME DA CLASS DA LABEL 
                    var nomeInput = "parcelamento"; //NAME DO INPUT
                    msgErroObrigatorio(classLabel, nomeInput, msg);
                    return;
                }
            }
        }

        $.ajax({
            url: site_url+'Contas/RegisterAccount',
            type: 'POST',
            dataType: 'JSON',
            data: {
                id_conta: id_conta,
                id_logado: id_logado,
                tipoConta: tipoConta,
                contaFixa: contaFixa,
                nome: nome,
                vencimento: vencimento,
                valor: valor,
                tipoParcela: tipoParcela,
                parcelamento: parcelamento,
                status: status,
				observacao: observacao
            },
            beforeSend: function() {
                $('body').find('.loading_screen').show();
            },
            success: function(i) {
                //alert(i.suc);
                if (i.suc) {
                    var msg = i.msg;
                    msgSuccess(msg);
                    setTimeout(function(){ location.reload() }, 2000).find('.loading_screen').show();
                } else {
                    var msg = 'Erro ao cadastrar conta, tente novamente mais tarde!';
                    msgErro(msg);
                }
            },
            complete: function() {
                $('body').find('.loading_screen').hide();
            }
        });
    };

	function updateAccount(modo) {
		var formData = {
			modo_alteracao: modo,
			id_conta: $("#id_conta").val(),
			sub_id: $("#sub_id_conta").val(),
			id_logado: $("#id_logado").val(), //ID DE QUEM ESTÁ LOGADO NO MOMENTO
			tipoConta: $("#tipo_conta").val(),
			contaFixa: $("#conta_fixa").val(),
			vencimento_original: $("#data_vencimento_original").val(),
			vencimento: $("#vencimento").val(),
			nome: $("#nome_conta").val().toUpperCase(), //DEIXA TODAS AS LETRAS DO NOME MAIÚSCULA
			valor: $("#valor").val(),
			tipoParcela: $("#tipo_parcela").val(),
			parcelamento: $("#parcelamento").val(),
			status: $("#status").val(),
			observacao: $("#observacao").val()
		};


        if (formData.tipoConta == '') {
            var msg = "Selecione o tipo de conta primeiro!"; //MSG DE ERRO
            var classLabel = "labelTipoConta"; //NOME DA CLASS DA LABEL 
            var nomeInput = "tipo_conta"; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);
            return;
        }

        if (formData.vencimento == '') {
            var msg = "Data de Vencimento Obrigatório!"; //MSG DE ERRO
            var classLabel = "labelVencimento"; //NOME DA CLASS DA LABEL 
            var nomeInput = "vencimento"; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);
            return;
        }

        if (formData.nome == '') {
            var msg = "Descrição da Conta Obrigatório!"; //MSG DE ERRO
            var classLabel = "labelNome"; //NOME DA CLASS DA LABEL 
            var nomeInput = "nome_conta"; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);
            return;
        }

        if (formData.valor == '') {
            var msg = "Valor da Conta Obrigatório!"; //MSG DE ERRO
            var classLabel = "labelValor"; //NOME DA CLASS DA LABEL 
            var nomeInput = "valor"; //NAME DO INPUT
            msgErroObrigatorio(classLabel, nomeInput, msg);
            return;
        }

        if (formData.tipoConta == 'r') {
            if (contaFixa == '') {
                var msg = "Capo Conta Fixa Obrigatório!"; //MSG DE ERRO
                var classLabel = "labelContaFixa"; //NOME DA CLASS DA LABEL 
                var nomeInput = "conta_fixa"; //NAME DO INPUT
                msgErroObrigatorio(classLabel, nomeInput, msg);
                return;
            }
        } else {
            if (formData.tipoParcela == 'p') {
                if (formData.parcelamento == '') {
                    var msg = "Campo Parcelameto Obrigatório!"; //MSG DE ERRO
                    var classLabel = "labelParcelamento"; //NOME DA CLASS DA LABEL 
                    var nomeInput = "parcelamento"; //NAME DO INPUT
                    msgErroObrigatorio(classLabel, nomeInput, msg);
                    return;
                }
            }
        }
		var urlDestino;
		if (modo === 'only') {
			urlDestino = site_url+'Contas/RegisterAccount'; // Use o nome da sua função de alteração única
		} else {
			urlDestino = site_url+'Contas/AlterAccountSmart';
		}

        $.ajax({
            url: urlDestino,
            type: 'POST',
            dataType: 'JSON',
            data: formData,
            beforeSend: function() {
                $('body').find('.loading_screen').show();
            },
            success: function(i) {
                //alert(i.suc);
                if (i.suc) {
                    var msg = i.msg;
                    msgSuccess(msg);
                    setTimeout(function(){ location.reload() }, 2000).find('.loading_screen').show();
                } else {
                    var msg = 'Erro ao cadastrar conta, tente novamente mais tarde!';
                    msgErro(msg);
                }
            },
            complete: function() {
                $('body').find('.loading_screen').hide();
            }
        });
    };

	// 1. Salvar apenas esta conta
	$(document).on('click', '#buttonSaveAccount', function(e) {
		e.preventDefault();
		updateAccount('only');
	});

	// 2. Salvar esta conta e as futuras
	$(document).on('click', '#buttonUpdateAccountAndFutures', function(e) {
		e.preventDefault();
		updateAccount('after');
	});

	// 3. Salvar todas as contas do grupo
	$(document).on('click', '#buttonUpdateAllAccount', function(e) {
		e.preventDefault();
		updateAccount('all');
	});

    $('#buttonDeleteAccount').on('click', function(){
        var id_conta = $("#id_conta").val();
        var id_logado = $("#id_logado").val(); //ID DE QUEM ESTÁ LOGADO NO MOMENTO

        $.ajax({
            url: site_url+'Contas/deleteAccount',
            type: 'post',
            dataType: 'json',
            data: {
                id_conta: id_conta,
                id_logado: id_logado
            },
            before: function () {
                $('body').find('.loading_screen').show();
            }
        })
        .done( function(i) {
            var msg = "Conta Excluída com sucesso!";
            msgSuccess(msg);
        })
        .fail( function () {
            var msg = 'Erro ao excluir conta, tente novamente mais tarde!';
            msgErro(msg);
        })
        .always(function(){
            $('body').find('.loading_screen').hide();
            setTimeout(function(){ location.href = site_url+'Contas/ContasDoMes'; }, 2000);
        })
    });

    $('#buttonDeleteAllAccount').on('click', function(){
        var sub_id_conta = $("#sub_id_conta").val();
        var id_logado = $("#id_logado").val(); //ID DE QUEM ESTÁ LOGADO NO MOMENTO

        $.ajax({
            url: site_url+'Contas/deleteAllAccount',
            type: 'post',
            dataType: 'json',
            data: {
                sub_id_conta: sub_id_conta,
                id_logado: id_logado
            },
            before: function () {
                $('body').find('.loading_screen').show();
            }
        })
        .done( function(i) {
            var msg = "Todas as Contas foram Excluídas com sucesso!";
            msgSuccess(msg);
        })
        .fail( function () {
            var msg = 'Erro ao excluir contas, tente novamente mais tarde!';
            msgErro(msg);
        })
        .always(function(){
            $('body').find('.loading_screen').hide();
            setTimeout(function(){ location.href = site_url+'Contas/ContasDoMes'; }, 2000);
        })
    });
});
