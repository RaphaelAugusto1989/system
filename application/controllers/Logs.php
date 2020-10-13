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

	public function RegisterLog($id_logado, $tipoRegistro) {

		if ($_SERVER['HTTP_HOST'] == 'localhost') {
			$ipUser = '000.000.000.000';
		} else {
			$ipUser = $_SERVER['REMOTE_HOST'];
		}

		//$tipoRegistro = 1; //1 = INSERT, 2  =ALTERAÇÃO, 3 = EXCLUSÃO

		$log = array (
			'id_user_fk' =>$id_logado,
			'ip_user' => $ipUser,
			'browser_user' => $_SERVER['HTTP_USER_AGENT'],
			'url' => $_SERVER['REQUEST_URI'],
			'page' => 'RegisterUser',
			'type' => $tipoRegistro,
			'datetime' => date('Y-m-d H:i:s')
		);

		$this->load->model('Log_model');
		$this->Log_model->insertLog($log);
	}
}
