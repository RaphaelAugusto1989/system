<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuarios extends CI_Controller {

	function __construct() {
		parent::__construct(); 
		# $this->ValidaLogin->TimerExpired();
	}

	//PAGINA DE VISUALIZAÇÃO DE USUÁRIOS CADASTRADS
	public function UserViews () {
		$data = array(
				'title' => 'Usuários Cadastrados'
				);

		$this->load->view('sHeader', $data);
		$this->load->view('sUsuariosCadastrados', $data);
		$this->load->view('sFooter');
    }
	
	//PAGINA DE CADASTRO E ALTERAÇÃO DE USUÁRIO
    public function FormUser () {
		$id = $this->uri->segment(3);

		if ($id == '') {
			$data = array(
				'title' => 'Cadastrar Usuário'
				);
		} else {
			$data = array(
				'title' => 'Alterar Usuário'
				);
		}

			$this->load->view('sHeader', $data);
			$this->load->view('sUsuariosForm', $data);
			$this->load->view('sFooter');
		
	}

	//PAGINA DE CADASTRO DE USUÁRIO
    public function RegisterUser () {
		$nome = $this->input->post('nome');
		$cpf = $this->input->post('cpf');
		$nascimento = date_usa($this->input->post('nascimento'));
		$email = $this->input->post('email');
		$login = $this->input->post('login');
		$senha = md5($this->input->post('password'));
		
		$save = array (
			'name_user' => $nome,
			'cpf_user' => $cpf,
			'nascimento_user' => $nascimento,
			'email_user' => $email,
			'login_user' => $login,
			'password_user' => $senha
		);

		$id_logado = 1;
		$log = array (
			'id_user_fk' => $id_logado,
			'ip_user' => $_SERVER['REMOTE_HOST'],
			'browser_user' => $_SERVER['HTTP_USER_AGENT'],
			'url' => $_SERVER['REQUEST_URI'],
			'type' => 'insert_user',
			'datetime' => date('Y-m-d H:i:s'),
		);

		$this->load->model('Usuario_model');
		$i = $this->Usuario_model->insertUser ($save);

		$this->load->model('Log_model');
		$this->Log_model->insertLog ($log);

		$i = false;
		echo json_encode(array ('suc' => $i));
	}

	//ALTERA SENHA USUÁRIO
	public function AlterPass() {
		$id = $this->input->post('id');
		$senha = $this->input->post('password');

		$alter = array(
			'id' => $id,
			'password_user' => $senha
		);

		debug_r($alter);

	}

	//PAGINA DE DADOS DO USUARIO
	public function DataUser () {
		$data = array(
				'title' => 'Meus Dados'
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

	public function Logoff () {
		session_start();
		$_SESSION = array();
		session_unset();
		session_destroy();
		redirect(site_url());
	}
}
