<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Contas_model extends CI_Model {

	function __construct() {
		parent::__construct();
    }

	//TRÁS AS CONTAS A RECEBER DO MÊS E ANO CADASTRADAS NO BANCO
	public function getAccountMonthReceive($params) {
		$this->db->where('id_user_fk', $params['id_logado']);
		$this->db->where('tipo_conta', 'r');
		$this->db->where('data_vencimento BETWEEN "'.$params['firtDay'].'" AND "'.$params['lastDay'].'"');
		$this->db->order_by('data_vencimento');
		return $this->db->get('accounts')->result();
	}

	//TRÁS AS CONTAS A PAGAR DO MÊS E ANO CADASTRADAS NO BANCO
	public function getAccountMonthPay($params) {
		$this->db->where('id_user_fk', $params['id_logado']);
		$this->db->where('tipo_conta', 'p');
		$this->db->where('data_vencimento BETWEEN "'.$params['firtDay'].'" AND "'.$params['lastDay'].'"');
		return $this->db->get('accounts')->result();
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