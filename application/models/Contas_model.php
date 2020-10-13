<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Contas_model extends CI_Model {

	function __construct() {
		parent::__construct();
    }


	//TRÁS AS CONTAS DO MÊS E ANO CADASTRADAS NO BANCO
	public function getUser() {
		$this->db->where('cpf_user', $cpf);
		return $this->db->get('users')->result();
	}
	
	//CADASTRA  DADOS DO USUÁRIO NO BANCO
	public function insertAccount($save) {
		$this->db->insert('accounts', $save);
		return true;
	}

	//MOSTRA USUARIO SELECIONADO
	public function userData($id_user) {
		$this->db->where('id_user', $id_user);
		return $this->db->get('users')->result();
	}

	//ALTERA SENHA DO USUÁRIO
	public function UpdatePass($id_user, $alter) {
		$this->db->where('id_user', $id_user);
		$this->db->update('users', $alter);
		return TRUE;
	}
    
}