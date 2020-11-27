
//MENSAGEM DE ERRO NOS INPUTS
function msgErroObrigatorio(classLabel, nomeInput, msg) {
    $("."+classLabel+"").addClass('labelError'); //ADD COR VERMELHA DO TEXTO
    $("input[name='"+nomeInput+"']").removeClass('border-0').addClass('border border-5 border-danger'); //Remove a borda-0 e Add a Borda vermelha

	//MOSTRA POPUP DE ALERTA
	toastr.error(''+msg+'', '', {
				"closeButton": true, //true or false
				"debug": false, //true or false
				"newestOnTop": false, //true or false
				"progressBar": true, //true or false
				"positionClass": "toast-top-right", //toast-top-right, toast-top-left, toast-top-full-width, toast-top-center, toast-bottom-right, toast-bottom-left, toast-bottom-full-width, toast-bottom-center
				"preventDuplicates": false, //true or false
				"onclick": null,
				"showDuration": "300",
				"hideDuration": "1000",
				"timeOut": "5000",
				"extendedTimeOut": "1000",
				"showEasing": "swing",
				"hideEasing": "linear",
				"showMethod": "fadeIn", //fadeIn, show, slideDown
				"hideMethod": "fadeOut" //fadeOut, hide
	});
}
	
//MENSAGEM DE SUCESSO NO CADASTRO OU ALTERAÇÃO
function msgSuccess(msg) {
	toastr.success(''+msg+'', '', {
		"closeButton": true, //true or false
		"debug": false, //true or false
		"newestOnTop": false, //true or false
		"progressBar": true, //true or false
		"positionClass": "toast-top-right", //toast-top-right, toast-top-left, toast-top-full-width, toast-top-center, toast-bottom-right, toast-bottom-left, toast-bottom-full-width, toast-bottom-center
		"preventDuplicates": false, //true or false
		"onclick": null,
		"showDuration": "1000",
		"hideDuration": "1000",
		"timeOut": "5000",
		"extendedTimeOut": "1000",
		"showEasing": "swing",
		"hideEasing": "linear",
		"showMethod": "fadeIn", //fadeIn, show, slideDown
		"hideMethod": "fadeOut" //fadeOut, hide
	});
}

//MENSAGEM DE ERRO NO CADASTRO OU ALTERAÇÃO
function msgErro(msg) {
	//MOSTRA POPUP DE ALERTA
	toastr.error(''+msg+'', '', {
				"closeButton": true, //true or false
				"debug": false, //true or false
				"newestOnTop": false, //true or false
				"progressBar": true, //true or false
				"positionClass": "toast-top-right", //toast-top-right, toast-top-left, toast-top-full-width, toast-top-center, toast-bottom-right, toast-bottom-left, toast-bottom-full-width, toast-bottom-center
				"preventDuplicates": false, //true or false
				"onclick": null,
				"showDuration": "1000",
				"hideDuration": "1000",
				"timeOut": "10000",
				"extendedTimeOut": "1000",
				"showEasing": "swing",
				"hideEasing": "linear",
				"showMethod": "fadeIn", //fadeIn, show, slideDown
				"hideMethod": "fadeOut" //fadeOut, hide
	});
}

  //FUNÇÃO PARA DIGITAR SÓ NÚMEROS NO INPUT
  function number(e) {
	var charCode = e.charCode ? e.charCode : e.keyCode;
	// charCode 8 = backspace   
	// charCode 9 = tab
	if (charCode != 8 && charCode != 9) {
		// charCode 48 equivale a 0   
		// charCode 57 equivale a 9
		if (charCode < 48 || charCode > 57) {
			return false;
		}
	}
}

