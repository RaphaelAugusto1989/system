$(document).ready(function() {
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