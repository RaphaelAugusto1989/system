<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Contas extends CI_Controller {

	function __construct() {
		parent::__construct(); 
		# $this->ValidaLogin->TimerExpired();
	}

	public function ContasDoMes() {
        $mes = mes_port(date('d/m/Y'));
        $data = array(
            'title' => 'Contas de '.$mes,
            );

        $this->load->view('sHeader', $data);
        $this->load->view('sContasCadastradas', $data);
        $this->load->view('sFooter');

    }
    
    public function newAccount() {
        $data = array(
            'title' => 'Nova Conta'
            );

        $this->load->view('sHeader', $data);
        $this->load->view('sContasForm', $data);
        $this->load->view('sFooter');

    }
    
    public function InsertAccount() {
        $tipoConta = $this->input->post("tipoConta");
        $vencimento = $this->input->post("vencimento");
        $nome = $this->input->post("nome");
        $valor = $this->input->post("valor");
        $parcelamento = $this->input->post("parcelamento");
        $contaFixa = $this->input->post("contaFixa");

        $save = array (
           'tipoConta' => $tipoConta,
           'data_vencimento' => date_usa($vencimento),
           'nome' => $nome,
           'valor' => $valor,
           'parcelamento' => $parcelamento,
           'contaFixa' => $contaFixa
        );

        $tipoRegistro = 1; //1 = INSERT, 2  =ALTERAÇÃO, 3 = EXCLUSÃO
        $id_logado = 1;
		$log = array (
			'id_user_fk' => $id_logado,
			'ip_user' => $_SERVER['REMOTE_HOST'],
			'browser_user' => $_SERVER['HTTP_USER_AGENT'],
			'url' => $_SERVER['REQUEST_URI'],
			'page' => 'RegisterUser',
			'type' => $tipoRegistro,
			'datetime' => date('Y-m-d H:i:s')
        );
        
        // $this->load->model('Contas_model');
		// $i = $this->Contas_model->insertAccount ($save);

		// $this->load->model('Log_model');
        // $this->Log_model->insertLog ($log);
        
        $i = false;
        echo json_encode(array ('suc' => $i));        
	}
}
