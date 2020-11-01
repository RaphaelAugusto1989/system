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

	//TRÁS VALOR DAS CONTAS DE STATUS RECEBIDO
	public function getAccountMonthReceiveYes($params) {
		$this->db->where('id_user_fk', $params['id_logado']);
		$this->db->where('tipo_conta', 'r');
		$this->db->where('status', 's');
		$this->db->where('data_vencimento BETWEEN "'.$params['firtDay'].'" AND "'.$params['lastDay'].'"');
		return $this->db->get('accounts')->result();
	}

	//TRÁS AS CONTAS A PAGAR DO MÊS E ANO CADASTRADAS NO BANCO
	public function getAccountMonthPay($params) {
		$this->db->where('id_user_fk', $params['id_logado']);
		$this->db->where('tipo_conta', 'p');
		$this->db->where('data_vencimento BETWEEN "'.$params['firtDay'].'" AND "'.$params['lastDay'].'"');
		return $this->db->get('accounts')->result();
	}

	//TRÁS VALOR DAS CONTAS DE STATUS PAGO
	public function getAccountMonthPayYes($params) {
		$this->db->where('id_user_fk', $params['id_logado']);
		$this->db->where('tipo_conta', 'p');
		$this->db->where('status', 's');
		$this->db->where('data_vencimento BETWEEN "'.$params['firtDay'].'" AND "'.$params['lastDay'].'"');
		return $this->db->get('accounts')->result();
	}
	
	//CADASTRA  DADOS DA CONTA NO BANCO
	public function insertAccount($save) {
		$this->db->insert('accounts', $save);
		return true;
	}

	//TRÁS VALOR DA CONTA SELECIONADA
	public function accountData($id_conta) {
		$this->db->where('id_account', $id_conta);
		return $this->db->get('accounts')->result();
	}

	//ALTERA STATUS DA CONTA
	public function alterAccountStatus($id_conta, $alter) {
		$this->db->where('id_account', $id_conta);
		$this->db->update('accounts', $alter);
		return TRUE;
	}
    
}