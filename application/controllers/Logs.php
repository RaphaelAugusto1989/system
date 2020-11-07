<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Logs extends CI_Controller {

	function __construct() {
		parent::__construct(); 
		# $this->ValidaLogin->TimerExpired();
    }
    
    //PAGINA DE VISUALIZAÇÃO LOGS DO SISTEMA
	public function LogsView () {
		$data = array(
				'title' => 'Logs'
				);

		$this->load->view('sHeader', $data);
		$this->load->view('sLogs', $data);
		$this->load->view('sFooter');
	}

	public function RegisterLog($data) {

		if ($_SERVER['HTTP_HOST'] == 'localhost') {
			$ipUser = '000.000.000.000';
		} else {
			$ipUser = $_SERVER['REMOTE_HOST'];
		}

		//$tipoRegistro = 1; //1 = INSERT, 2  =ALTERAÇÃO, 3 = EXCLUSÃO

		$log = array (
			'id_user_fk' => $data['id_logado'],
			'id_module' => $data['id_module'],
			'ip_user' => $ipUser,
			'browser_user' => $_SERVER['HTTP_USER_AGENT'],
			'url' => $_SERVER['REQUEST_URI'],
			'page' => $data['page'],
			'type' => $data['tipoRegistro'],
			'date_insert' => $data['dateInsert'],
			'date_update' => $data['dateUpdate'],
			'date_delete' => $data['dateDelete']
		);

		$this->load->model('Log_model');
		$this->Log_model->insertLog($log);
	}
}
