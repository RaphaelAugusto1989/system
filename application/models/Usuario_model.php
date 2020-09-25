<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuario_model extends CI_Model {

	function __construct() {
		parent::__construct();
    }

    //LOGA O USUARIO NO SISTEMA
	public function LoginUser($login, $pass) {
		$this->db->where('cpf_user', $login);
		$this->db->or_where('email_user', $login);
		$this->db->where('password_user', $pass);
		return $this->db->get('users')->result();
	}
	
	//CADASTRA  DADOS DO USUÁRIO NO BANCO
	public function insertUser($save) {
		$this->db->insert('users', $save);
		return true;
	}
    
}