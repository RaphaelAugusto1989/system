<div class="row">
	<div class="col">
		<h5 class="pb-2 border-bottom"><?= $title ?></h5>
	</div>
</div>
<div class="row">
	<div class="col">
        <a class="btn btn-success float-right" title="Cadastrar Usuário" href="<?= site_url('Usuarios/FormUser')?>" ><i class="fas fa-user-plus"></i> Cadastrar Usuário</a>
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
                    <table class="table table-striped table-hover table-dark datatable" style = "width:100%" id="tb_transf">
                        <thead>
                            <tr>
                            <th scope="col" class="text-center">NOME</th>
                            <th scope="col" class="text-center">CPF</th>
                            <th scope="col" class="text-center">E-MAIL</th>
                            <th scope="col" class="text-center">AÇÕES</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php 
                            foreach($users as $i => $us) { 
                        ?>
                            <tr>
                                <td class="align-middle"><?= $us->name_user ?></td>
                                <td class="text-center align-middle"><?= $us->cpf_user ?></td>
                                <td class="align-middle"><?= $us->email_user ?></td>
                                <td class="text-center align-middle">
                                    <a class="btn btn-primary"  href="<?= site_url('Usuarios/FormUser/'.$us->id_user)?>"> <i class="fas fa-pen"></i></a>
<!--                                     <button class="btn btn-primary" title="Alterar" id="AlterUser"> <i class="fas fa-pen"></i></button>
 -->                                    <button class="btn btn-danger" title="Excluir"> <i class="fas fa-trash-alt"></i></button>
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
