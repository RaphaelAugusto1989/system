<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuario_model extends CI_Model {

	function __construct() {
		parent::__construct();
    }

    //LOGA O USUARIO NO SISTEMA
	public function LoginUser($login, $pass) {
		$this->db->where('email_user', $login);
		$this->db->or_where('login_user', $login);
		$this->db->where('password_user', $pass);
		return $this->db->get('users')->result();
	}

	//CADASTRA  DADOS DO USUÁRIO NO BANCO
	public function getUser() {
		return $this->db->get('users')->result();
	}
	
	//VERIFICA SE USUÁRIO JÁ ESTÁ CADASTRADO
	public function checksUser($cpf) {
		$this->db->where('cpf_user', $cpf);
		return $this->db->get('users')->result();
	}

	//CADASTRA  DADOS DO USUÁRIO NO BANCO
	public function insertUser($save) {
		$this->db->insert('users', $save);
		return true;
	}

	//MOSTRA USUARIO SELECIONADO
	public function userData($id_user) {
		$this->db->where('id_user', $id_user);
		return $this->db->get('users')->result();
	}

	//ALTERA SENHA DO USUÁRIO
	public function updateUser($id_user, $alter) {
		$this->db->where('id_user', $id_user);
		$this->db->update('users', $alter);
		return TRUE;
	}

	//ALTERA SENHA DO USUÁRIO
	public function UpdatePass($id_user, $alter) {
		$this->db->where('id_user', $id_user);
		$this->db->update('users', $alter);
		return TRUE;
	}
    
}