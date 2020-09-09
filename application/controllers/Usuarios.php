<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuarios extends CI_Controller {

	function __construct() {
		parent::__construct(); 
		$this->load->helper('util_helper');
		// $this->ValidaLogin->TimerExpired();
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
	
	//PAGINA DE CADASTRO DE USUÁRIO
    public function InsertUser () {
		$data = array(
				'title' => 'Cadastrar Usuárioss'
				);

		$this->load->view('sHeader', $data);
		$this->load->view('sUsuariosForm', $data);
		$this->load->view('sFooter');
	}

	//PAGINA DE CADASTRO DE USUÁRIO
    public function RegisterUser () {
		$nome = $this->input->post('nome');
		$cpf = $this->input->post('cpf');
		$nascimento = $this->input->post('nascimento');
		$email = $this->input->post('email');
		$login = $this->input->post('login');
		$senha = md5($this->input->post('password'));
		// echo $nascimento;
		// echo date_usa($nascimento); exit;
		$save = array (
			'name_user' => $nome,
			'cpf_user' => $cpf,
			'nascimento_user'  => $nascimento,
			'email_user' => $email,
			'login_user' => $login,
			'password_user' => $senha
		);

		$id_user = 1;
		$log = array (
			'id_user_fk' => $id_user,
			'ip_user' => $_SERVER['REMOTE_HOST'],
			'browser_user' => $_SERVER['HTTP_USER_AGENT'],
			'datetime_insert' => date('Y-m-d H:m:i'),
		);

		echo '<pre>';
		// debug_r($save); 
		print_r($log); exit;
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

	public function Logoff () {
		session_start();
		$_SESSION = array();
		session_unset();
		session_destroy();
		redirect(site_url());
	}
}
