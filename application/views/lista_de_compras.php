<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?= base_url('assets/css/bootstrap.css')?>">
    <link rel="stylesheet" href="<?= base_url('assets/css/jquery_ui.css')?>">
    <link rel="stylesheet" href="<?= base_url('assets/css/alerts.toastr.css')?>">
    <link rel="stylesheet" href="<?= base_url('assets/css/style.css')?>">
    <title>.:: Lista de Compras ::.</title>
    <style>
        .inputPress {
            width: 80%;
            border: none;
            background-color: transparent;
            color: #ffffff;
        }
    </style>
</head>
<body>
<div class="loading_screen" style = "display:none;"></div>
    <div class="container-fluid text-white">
    <h3 class="text-center mb-3 mt-3">Lista de Compras</h3>
        <div class="row">
            <div class="col-lg-6 mb-2">
                <input type="text" class="form-control" id="produto" placeholder="Produto" >
            </div>
            <div class="col-lg-3 mb-2">
                <div class="input-group">
                    <div class="input-group-append" >
                        <span class="input-group-text border-0 rounded-left" style="background: #ffffff;">R$</span>
                    </div>
                    <input type="text" class="form-control border-0 moeda" name="valor" id="valor" placeholder="0,00" >
                </div>
            </div>
            <div class="col-lg-2 mb-2">
                <input type="text" class="form-control" id="qtd" placeholder="Qtd" maxlength="2" onkeypress="return number(event)">
            </div>
            <div class="col-lg-1 mb-2">
                <button class="btn btn-success btn-block btn-sm py-2" id="salvarCompras"><i class="fas fa-save"></i></button>
            </div>
        </div>
        <?php if (!empty($list)) { ?>
        <h4 class="text-center mt-4">Produtos</h4>
        <div class="table-responsive">
            <table class="table table-sm b-0">
                <!-- <thead>
                    <tr>
                        <th>Produtos</th>
                        <th>Preço</th>
                        <th class="text-center">Qtd</th>
                        <th class="text-center">Excluir</th>
                    </tr>
                </thead> -->
                <?php  foreach ($list as $i => $l) { ?> 
                <tr>
                    <input type="hidden" class="idProduto" value="<?= $l->id_product?>">
                    <td width="150"><?= $idPrd = $l->id_product?> - <?= $l->product?></td>
                    <td><input type="text" class="inputPress" id="prod" value="<?= moneyBR($l->price) ?>"> </td>
                    <td><input type="text" class="inputPress text-center" id="quant" value="<?= $l->amount ?>"> </td>
                    <td class="text-center">
                        <a href="" class="text-danger" data-toggle="modal" data-placement="top" data-target="#excluirProduto"><i class="fas fa-times"></i></a>
                    </td>
                </tr>
                <?php } ?>
                <tfoot>
                    <tr>
                        <th>Total: </th>
                        <th><?= $total ?></th>
                        <th></th>
                        <th></th>
                    </tr>
                </tfoot>
            </table>
        </div>
        <?php } ?>
    </div>

<!-- MODAL PARA EXCLUSÃO -->
<div class="modal fade" id="excluirProduto" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content corpo_modal">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Excluir Conta</h5>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	  	<div class="container-fluid">
		  <div class="row">
				<div class="col text-center">
				    Deseja realmente excluir este produto?
				</div>
			</div>
		</div>
      </div>
      <div class="modal-footer">
		<div class="mx-auto">
			<button class="btn btn-danger pl-5 pr-5" data-id="<?= $idPrd ?>" id="buttonDeleteProduct"> <i class="fas fa-trash-alt"></i>  Excluir</button>
		</div>
	  </div>
    </div>
  </div>
</div>
<!-- MODAL PARA EXCLUSÃO -->

</body>
<script> var site_url = "<?php echo site_url(); ?>";</script>
<script type="text/javascript" src="<?= base_url('assets/js/jquery.min.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/jquery-ui.min.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/bootstrap.min.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/icons_fontawesome.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/alerts.toastr.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/datepicker.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/mask.jquery.min.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/mask.js')?>"></script>
<script type="text/javascript" src="<?= base_url('assets/js/functions.js')?>"></script>
<script>
$(document).ready(function() {
    $('#salvarCompras').on('click', function(){
        var produto = $('#produto').val();
        var valor = $('#valor').val();
        var qtd = $('#qtd').val();

        $.ajax({
            url: site_url+'Compras/insereProduto',
            type: 'post',
            dataType: 'json',
            data: {
                product : produto,
                price : valor,
                amount: qtd
            },
            beforeSend: function() {
                $('.loading_screen').show();
            }
        })
        .done(function(data){
            var msg = 'Produto inserido com sucesso!';
            msgSuccess(msg);
            setTimeout(function(){ location.reload() }, 2000);

        })
        .fail(function() {
            var msg = "Falha ao inserir produto, tente novamente!"; //MSG DE ERRO
			msgErro(msg);
			return;

        })
        .always(function() {
            $('.loading_screen').hide();
        })
    });
    
    // function idExcluir(id) {
    //     alert(id);
    //     $('#idProdutoExcluir').val(id);
    // }

    $('#buttonDeleteProduct').on('click', function(){
        //var id = $('#idProduto')this.val();
        var id = $(this).data('id');

        alert (id);
        $.ajax({
            url: site_url+'Compras/excluiProduto',
            type: 'post',
            dataType: 'json',
            data: {
                id_produto : id
            }, 
            beforeSend: function() {
                $('.loading_screen').show();
            }
        })
        .done(function(i){
            var msg = 'Produto Excluído!';
            msgSuccess(msg);
            setTimeout(function(){ location.reload() }, 2000);

        })
        .fail(function() {
            var msg = "Falha ao excluir produto, tente novamente!"; //MSG DE ERRO
			msgErro(msg);
			return;

        })
        .always(function() {
            $('.loading_screen').hide();
        })
    });
})
</script>
</html>