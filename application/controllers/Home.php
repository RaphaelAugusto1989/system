<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	function __construct() {
		parent::__construct(); 
		# $this->ValidaLogin->TimerExpired();
	}

	public function index() {
		//debug_r($_SERVER);
		$this->load->view('login');
	}

	public function SignIn () {
		$login = $this->input->post('login');
		$pass = md5($this->input->post('password'));

		$this->load->model('Usuario_model');
		$s = $this->Usuario_model->LoginUser($login, $pass);

		if (!empty($s)) {
			$this->session->set_userdata('timer', time() + (60 * 1)); //1 minuto
			$this->session->set_userdata('id_user', $s[0]->id_user);
			$this->session->set_userdata('nome_user', $s[0]->name_user);
			$this->session->set_userdata('perfil_user', $s[0]->perfil_user);
			$this->session->set_userdata('img_user', $s[0]->img_user);

			$this->output
			->set_content_type('application/json')
			->set_output(json_encode(array('sucesso' => true, "p" => site_url('Home/homeSystem'))));
		} else {
			$this->output
			->set_content_type('application/json')
			->set_output(json_encode(array('foo' => false)));
		}

		if (!empty($s)) {
			//1 = INSERT, 2 = UPDATE, 3 = DELETE, 4 = LOGIN, 5 = LOGOUT
            $data = array (
				'id_logado' => $this->session->userdata('id_user'),
				'id_module' => 0,
                'tipoRegistro' => 4,
				'page' => 'SignIn',
            );

			$this->RegisterLog($data);
		}
	}

	public function homeSystem () {
		$data = array(
				'title' => 'Sistema'
				);

		$this->load->view('sHeader', $data);
		$this->load->view('sHome', $data);
		$this->load->view('sFooter');
	}

	public function Logoff() {
		//session_start();
		$id_logado = $this->session->userdata('id_user');
		
		$_SESSION = array();
		session_unset();
		$d = session_destroy();

		if (!empty($d)) {
			//1 = INSERT, 2 = UPDATE, 3 = DELETE, 4 = LOGIN, 5 = LOGOUT
            $data = array (
				'id_logado' => $id_logado,
				'id_module' => 0,
                'tipoRegistro' => 5,
				'page' => 'Logoff',
            );

			$this->RegisterLog($data);
		}

		redirect(site_url());
	}

	public function RegisterLog($data) {
		//1 = INSERT, 2 = UPDATE, 3 = DELETE, 4 = LOGIN, 5 = LOGOUT

		if ($_SERVER['HTTP_HOST'] == 'localhost') {
			$ipUser = '000.000.000.000';
		} else {
			$ipUser = $_SERVER['REMOTE_ADDR'];
		}

		$log = array (
			'id_user_fk' => $data['id_logado'],
			'id_module' => $data['id_module'],
			'ip_user' => $ipUser,
			'browser_user' => $_SERVER['HTTP_USER_AGENT'],
			'url' => $_SERVER['REQUEST_URI'],
			'page' => $data['page'],
			'type' => $data['tipoRegistro'],
			'date_insert' => date('Y-m-d H:i:s')
		);

		$this->load->model('Log_model');
		$this->Log_model->insertLog($log);
	}
}
