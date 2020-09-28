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
    
}