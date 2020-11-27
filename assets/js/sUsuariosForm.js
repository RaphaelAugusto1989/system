$(document).ready(function() {
	$("#buttonSalvar").on('click', function() {
		var id = $("#id").val();
		var id_logado = $("#id_logado").val(); //ID DE QUEM ESTÁ LOGADO NO MOMENTO
		var nome = $("#nome").val().toUpperCase(); //DEIXA TODAS AS LETRAS DO NOME MAIÚSCULA
		var cpf = $("#cpf").val();
		var nascimento = $("#nascimento").val();
		var email = $("#email").val().toLowerCase(); //DEIXA TODAS AS LETRAS DO NOME MINUSCULAS
		var login = $("#login").val();
		var password = $("#showPassRegUser").val();

		if (nome == '') {
			var msg = "Nome Obrigatório!"; //MSG DE ERRO
			var classLabel = "labelNome"; //NOME DA CLASS DA LABEL 
			var nomeInput = "nome"; //NAME DO INPUT
			msgErroObrigatorio(classLabel, nomeInput, msg);
			return;
		}

		if (cpf == '') {
			var msg = "CPF Obrigatório!"; //MSG DE ERRO
			var classLabel = "labelCpf"; //NOME DA CLASS DA LABEL 
			var nomeInput = "cpf"; //NAME DO INPUT
			msgErroObrigatorio(classLabel, nomeInput, msg);
			return;
		}

		if (nascimento == '') {
			var msg = "Data de Nascimento Obrigatório!"; //MSG DE ERRO
			var classLabel = "labelNascimento"; //NOME DA CLASS DA LABEL 
			var nomeInput = "nascimento"; //NAME DO INPUT
			msgErroObrigatorio(classLabel, nomeInput, msg);
			return;
		}

		if (email == '') {
			var msg = "E-mail Obrigatório!"; //MSG DE ERRO
			var classLabel = "labelEmail"; //NOME DA CLASS DA LABEL 
			var nomeInput = "email"; //NAME DO INPUT
			msgErroObrigatorio(classLabel, nomeInput, msg);
			return;
		}

		if (login == '') {
			var msg = "Login é Obrigatório!"; //MSG DE ERRO
			var classLabel = "labelLogin"; //NOME DA CLASS DA LABEL 
			var nomeInput = "login"; //NAME DO INPUT
			msgErroObrigatorio(classLabel, nomeInput, msg);
			return;
		}

		if (password == '') {
			var msg = "Password Obrigatório!"; //MSG DE ERRO
			var classLabel = "labelPassword"; //NOME DA CLASS DA LABEL 
			var nomeInput = "pass"; //NAME DO INPUT
			msgErroObrigatorio(classLabel, nomeInput, msg);
			return;
		}

		$.ajax({
			url: site_url+'Usuarios/RegisterUser',
			type: 'POST',
			dataType: 'JSON',
			data: {
				id: id,
				id_logado: id_logado,
				nome: nome,
				cpf: cpf,
				nascimento: nascimento,
				email: email,
				login: login,
				password: password
			},
			beforeSend: function() {
				$('body').find('.loading_screen').show();
			},
			success: function(i) {
				if(i.suc == true) {
					var msg = 'Usuário inserido com sucesso!';
					msgSuccess(msg);
					setTimeout(function(){ location.href = i.p; }, 5000);
				} 
				else {
					var msg = 'Erro ao cadastrar usuário, tente novamente mais tarde!';
					msgErro(msg);
				}
			},
			/* error: function(i) {
				if(i.error == true) {
					alert('aqui');
					var msg = "CPF já cadastrado!"; //MSG DE ERRO
					var classLabel = "labelCpf"; //NOME DA CLASS DA LABEL 
					var nomeInput = "cpf"; //NAME DO INPUT
					msgErroObrigatorio(classLabel, nomeInput, msg);
				}
			}, */
			complete: function() {
				$('body').find('.loading_screen').hide();
			},
		})
	}); //FIM FUNÇÃO SALVAR DADOS

	$('#buttonPassAlter').on('click', function(){
		var id_logado = $("#id_logado").val(); //ID DE QUEM ESTÁ LOGADO NO MOMENTO
		var id = $("#id").val();
		var pass = $("#showPassAltUser").val();

		if (pass == '') {
			var msg = "Password Obrigatório!"; //MSG DE ERRO
			var classLabel = "labelPassword"; //NOME DA CLASS DA LABEL 
			var nomeInput = "pass"; //NAME DO INPUT
			msgErroObrigatorio(classLabel, nomeInput, msg);
			return;
		}

		$.ajax({
			url: site_url+'Usuarios/AlterPass',
			type: 'POST',
			dataType: 'JSON',
			data: {
				id_logado: id_logado,
				id: id,
				password: pass
			},
			beforeSend: function() {
				$('body').find('.loading_screen').show();
			},
			success: function(i) {
				if(i.suc == true) {
					var msg = 'Senha alterada sucesso!';
					msgSuccess(msg);
					$('#alterarSenha').modal('hide');
					$("#showPassAltUser").val('');
					//setTimeout(function(){ location.href = i.p; }, 5000);
				} 
				else {
					var msg = 'Erro ao alterar senha, tente novamente mais tarde!';
					msgErro(msg);
				}
			},
			complete: function() {
				$('body').find('.loading_screen').hide();
			},
			
		})
	});
});