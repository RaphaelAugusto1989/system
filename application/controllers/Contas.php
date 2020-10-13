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
    
    public function RegisterAccount() {
        $u = $this->input->post();
        
        $save = array (
           'tipo_conta' => $u['tipoConta'],
           'nome_conta' => $u['nome'], 
           'data_vencimento' => dateUSA($u['vencimento']),
           'valor_conta' => moneyUSA($u['valor']),
           'tipo_parcela' => $u['tipoParcela'],
           'parcelamento' => $u['parcelamento'],
           'conta_fixa' => $u['contaFixa']
        );

        $this->load->model('Contas_model');
		$i = $this->Contas_model->insertAccount ($save);

		if (!empty($i)) {
            $data = array (
                'id_logado' => $this->input->post('id_logado'),
                'tipoRegistro' => 1,
                'page' => 'RegisterAccount'
            );
			$this->RegisterLog($data);
		}
             
        echo json_encode(array ('suc' => $i, "p" => site_url('Contas/ContasDoMes')));
    }
    
    public function RegisterLog($data) {
		if ($_SERVER['HTTP_HOST'] == 'localhost') {
			$ipUser = '000.000.000.000';
		} else {
			$ipUser = $_SERVER['REMOTE_HOST'];
		}

		$log = array (
			'id_user_fk' => $data['id_logado'],
			'ip_user' => $ipUser,
			'browser_user' => $_SERVER['HTTP_USER_AGENT'],
			'url' => $_SERVER['REQUEST_URI'],
			'page' => $data['page'],
			'type' => $data['tipoRegistro'],
			'datetime' => date('Y-m-d H:i:s')
		);

		$this->load->model('Log_model');
		$this->Log_model->insertLog($log);
	}
}
