<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuarios extends CI_Controller {

	function __construct() {
		parent::__construct(); 
		TimerExpired();
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
			if ($u['id'] == NULL) {
				$save = array (
					'name_user' => $u['nome'],
					'cpf_user' => $u['cpf'],
					'nascimento_user' => dateUSA($u['nascimento']),
					'email_user' => $u['email'],
					'login_user' => $u['login'],
					'password_user' => md5($u['password'])
				);

				$i = $this->Usuario_model->insertUser($save); //CADASTRA O USUÁRIO
				$tpReg = 1;
				$page = 'RegisterUser';
			} else {
				$save = array (
					'name_user' => $u['nome'],
					'cpf_user' => $u['cpf'],
					'nascimento_user' => dateUSA($u['nascimento']),
					'email_user' => $u['email'],
					'login_user' => $u['login']
				);

				$i = $this->Usuario_model->updateUser($u['id'], $save); //ALTERA O USUÁRIO
				$tpReg = 2;
				$page = 'AlterUser';
			}

			if (!empty($i)) {
				$data = array (
					'id_logado' => $this->input->post('id_logado'),
					'id_module' => 0,
					'tipoRegistro' => $tpReg,
					'page' => $page,
					'dateInsert' => date('Y-m-d H:i:s')
				);
				$this->RegisterLog($data);
			}

			echo json_encode(array ('suc' => $i, "p" => site_url('Usuarios/UserViews')));
		#} else {
		#	echo json_encode(array ('error' => $check));
		#} 
	}

	//ALTERA SENHA USUÁRIO
	public function AlterPass() {
		$id_user = $this->input->post('id');
		$senha = md5($this->input->post('password'));

		$alter = array(
			'password_user' => $senha
		);

		$this->load->model('usuario_model');
		$i = $this->usuario_model->UpdatePass($id_user, $alter);
		if (!empty($i)) {
            $data = array (
				'id_logado' => $this->input->post('id_logado'),
				'id_module' => 0,
                'tipoRegistro' => 2,
				'page' => 'AlterPass',
				'dateUpdate' => date('Y-m-d H:i:s')
            );
			$this->RegisterLog($data);
		}

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
	
	public function RegisterLog($data) {
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
