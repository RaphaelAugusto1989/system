<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuarios extends CI_Controller {

	function __construct() {
		parent::__construct(); 
		# $this->ValidaLogin->TimerExpired();
	}

	//PAGINA DE VISUALIZAÇÃO DE USUÁRIOS CADASTRADS
	public function UserViews () {
		$this->load->model('Usuario_model');
		$u = $this->Usuario_model->getUser();

		$data = array(
				'title' => 'Usuários Cadastrados',
				'users' => $u
				);

		$this->load->view('sHeader', $data);
		$this->load->view('sUsuariosCadastrados', $data);
		$this->load->view('sFooter');
    }
	
	//PAGINA DE CADASTRO E ALTERAÇÃO DE USUÁRIO
    public function FormUser () {
		$id_user = $this->uri->segment(3);

		if ($id_user == '') {
			$data = array(
				'title' => 'Cadastrar Usuário',
				'us' => null
				);
		} else {
			$this->load->model('Usuario_model');
			$i = $this->Usuario_model->userData($id_user);

			$data = array(
				'title' => 'Alterar Usuário',
				'us' => $i
				);
		}

			$this->load->view('sHeader', $data);
			$this->load->view('sUsuariosForm', $data);
			$this->load->view('sFooter');
		
	}

	//PAGINA DE CADASTRO DE USUÁRIO
    public function RegisterUser () {
		$u = $this->input->post();

		$this->load->model('Usuario_model');
		#$check = $this->Usuario_model->checksUser($this->input->post('cpf'));

		#if (empty($check)) {
			$save = array (
				'name_user' => $u['nome'],
				'cpf_user' => $u['cpf'],
				'nascimento_user' => date_usa($u['nascimento']),
				'email_user' => $u['email'],
				'login_user' => $u['login'],
				'password_user' => md5($u['password'])
			);


			if ($_SERVER['HTTP_HOST'] == 'localhost') {
				$ipUser = '000.000.000.000';
			} else {
				$ipUser = $_SERVER['REMOTE_HOST'];
			}

			$tipoRegistro = 1; //1 = INSERT, 2  =ALTERAÇÃO, 3 = EXCLUSÃO

			$log = array (
				'id_user_fk' =>$u['id_logado'],
				'ip_user' => $ipUser,
				'browser_user' => $_SERVER['HTTP_USER_AGENT'],
				'url' => $_SERVER['REQUEST_URI'],
				'page' => 'RegisterUser',
				'type' => $tipoRegistro,
				'datetime' => date('Y-m-d H:i:s')
			);

			$this->load->model('Log_model');
			$this->Log_model->insertLog($log);

			$i = $this->Usuario_model->insertUser($save);

			echo json_encode(array ('suc' => $i, "p" => site_url('Usuarios/UserViews')));
		#} else {
		#	echo json_encode(array ('error' => $check));
		#} 
	}

	//ALTERA SENHA USUÁRIO
	public function AlterPass() {
		$id_user = $this->input->post('id');
		$senha = md5($this->input->post('password'));
		$id_logado = $this->input->post('id_logado');
		$tipoRegistro = 2; //1 = INSERT, 2  = ALTERAÇÃO, 3 = EXCLUSÃO

		$alter = array(
			'password_user' => $senha
		);

		$this->RegisterLog($id_logado, $tipoRegistro);

		$this->load->model('usuario_model');
		$i = $this->usuario_model->UpdatePass($id_user, $alter);

		echo json_encode(array ('suc' => $i));
	}

	//PAGINA DE DADOS DO USUARIO
	public function DataUser () {
		$id_user = $this->uri->segment(3);
		$this->load->model('Usuario_model');
		$us = $this->Usuario_model->userData($id_user);

		$data = array(
				'title' => 'Meus Dados',
				'us' => $us
				);

		$this->load->view('sHeader', $data);
		$this->load->view('sMeusdadosForm', $data);
		$this->load->view('sFooter');
	}

	//PAGINA DE VISUALIZAÇÃO DE USUÁRIOS CADASTRADS
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

	public function Logoff () {
		session_start();
		$_SESSION = array();
		session_unset();
		session_destroy();
		redirect(site_url());
	}
}
