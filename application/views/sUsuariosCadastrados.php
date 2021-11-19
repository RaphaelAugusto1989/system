<div class="row">
	<div class="col">
		<h5 class="pb-2 border-bottom"><?= $title ?></h5>
	</div>
</div>
<div class="row">
    <div class="col-lg-9 col-sm-12"></div>
	<div class="col-lg-3 col-sm-12">
        <a class="btn btn-success btn-block float-right" href="<?= site_url('Usuarios/FormUser')?>" ><i class="fas fa-user-plus"></i> Cadastrar Usuário</a>
	</div>
</div>
<div class="row mt-2">
    <div class="col">
        <div class="panel panel-default rounded corpo">
            <div class="panel-heading text-white p-2 title">
                <h5></h5>
            </div>
            <div class="panel-body p-2 mt-4">
                <div class="table-responsive">
                    <table class="table table-fluid table-sm table-hover datatable" style = "width:100%" id="tb_transf">
                        <thead >
                            <tr class="title">
                                <th scope="col" class="text-left">NOME</th>
                                <th scope="col" class="text-center">CPF</th>
                                <th scope="col" class="text-left">E-MAIL</th>
                                <th scope="col" class="text-center">AÇÕES</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php 
                            foreach($users as $i => $us) { 
                        ?>
                            <tr>
                                <td class="align-middle"><?= $nome = $us->name_user ?></td>
                                <td class="text-center align-middle"><?= $us->cpf_user ?></td>
                                <td class="align-middle"><?= $us->email_user ?></td>
                                <td class="text-center align-middle">
                                    <a class="btn btn-primary" data-toggle="tooltip" data-placement="top" href="<?= site_url('Usuarios/FormUser/'.$us->id_user);?>">
										<i class="fas fa-pen"></i>
									</a>
                                    <button class="btn btn-danger" data-toggle="modal" data-placement="top" id="excluir" data-target="#excluirUser" data-name="<?= $us->name_user?>" data-id="<?= $us->id_user?>">
										<i class="fas fa-trash-alt"></i>
									</button>
                                </td>
                            </tr>
                        <?php
                            }
                        ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- MODAL PARA EXCLUSÃO -->
<div class="modal fade" id="excluirUser" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content corpo_modal">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Excluir Usuário</h5>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	  	<div class="container-fluid">
		  <div class="row">
				<div class="col text-center">
				<input type="hidden" id="id_user" value="">
				Deseja realmente excluir usuário <strong class="nome_modal"></strong>?
				</div>
			</div>
		</div>
      </div>
      <div class="modal-footer">
		<div class="mx-auto">
			<button class="btn btn-danger pl-5 pr-5" id="buttonDeleteUser"> <i class="fas fa-trash-alt"></i>  Excluir Usuário</button>
		</div>
	  </div>
    </div>
  </div>
</div>
<!-- MODAL PARA EXCLUSÃO -->

<script src="<?= site_url('assets/js/sUsuariosCadastrados.js'); ?>"></script>

