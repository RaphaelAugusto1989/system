$(document).ready(function() {

	$('#excluirUser').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget) // Botão que acionou o modal
		var id = button.data('id'); 
		var name  = button.data('name'); 
		console.log(id+'-'+name);
		//var modal = $(this);
		$(this).find('.nome_modal').text(name);
		$(this).find('.modal-body input').val(id);
	  })

	// $('#excluir').on('click', function() {
	// 	var id_user = $(this).data('id');
	// 	var name_user = $(this).data('name');

	// 	alert(id_user+' - '+name_user);
	// });

    $('#buttonDeleteUser').on('click', function(){
        var id_user = $("#id_user").val();

        $.ajax({
            url: site_url+'Usuarios/deleteUser',
            type: 'post',
            dataType: 'json',
            data: {
                id_user: id_user
            },
            before: function () {
                $('body').find('.loading_screen').show();
            }
        })
        .done( function(i) {
            var msg = "Usuário Excluído com sucesso!";
            msgSuccess(msg);
        })
        .fail( function () {
            var msg = 'Erro ao excluir usuário, tente novamente mais tarde!';
            msgErro(msg);
        })
        .always(function(){
            $('body').find('.loading_screen').hide();
            setTimeout(function(){ location.href = site_url+'Usuarios/UserViews'; }, 2000);
        })
    });
});
