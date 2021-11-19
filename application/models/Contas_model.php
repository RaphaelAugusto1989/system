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
		#ECHO $this->db->get_compiled_select();EXIT;
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

	//TRÁS QUANTIDADE DAS CONTAS PARCELADAS
	public function getAccountPortion($params) {
		$this->db->where('id_user_fk', $params['id_logado']);
		$this->db->where('id_account_one', $params['sub_id']);
		$this->db->where('tipo_conta', 'p');
		//$this->db->where('status', 's');
		//$this->db->where('data_vencimento BETWEEN "'.$params['firtDay'].'" AND "'.$params['lastDay'].'"');
		return $this->db->get('accounts')->result();
	}

	//TRÁS AS CONTAS A PAGAR DO MÊS E ANO CADASTRADAS NO BANCO
	public function getAccountMonthPay($params) {
		$this->db->where('id_user_fk', $params['id_logado']);
		$this->db->where('tipo_conta', 'p');
		$this->db->where('data_vencimento BETWEEN "'.$params['firtDay'].'" AND "'.$params['lastDay'].'"');
		$this->db->order_by('data_vencimento');
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
		$this->db->trans_start();
		$this->db->insert('accounts', $save);
		$id = $this->db->insert_id();
		$this->db->trans_complete();
		return $id;
	}

	//ALTERA DADOS DA CONTA SELECIONADA NO BANCO
	public function updateAccount($id_conta, $save) {
		$this->db->trans_start();
		$this->db->where('id_account', $id_conta);
		$true = $this->db->update('accounts', $save);
		$this->db->trans_complete();
		return $true;
	}

	//ALTERA DADOS DE TODAS AS CONTA PARCELADAS
	public function updateAllAccount($sub_id, $save) {
		$this->db->trans_start();
		$this->db->where('id_account_one', $sub_id);
		$true = $this->db->update('accounts', $save);
		$this->db->trans_complete();
		return $true;
	}

	//TRÁS VALOR DA CONTA SELECIONADA
	public function accountData($id_conta) {
		$this->db->trans_start();
		$this->db->where('id_account', $id_conta);
		$true = $this->db->get('accounts')->result();
		$this->db->trans_complete();
		return $true;
	}

	//TRÁS TODAS AS CONTAS PARCELADAS DA CONTA SELECIONADA
	public function allAccountData($id_conta_one) {
		$this->db->trans_start();
		$this->db->where('id_account_one', $id_conta_one);
		$true = $this->db->get('accounts')->result();
		$this->db->trans_complete();
		return $true;
	}

	//ALTERA STATUS DA CONTA
	public function alterAccountStatus($id_conta, $alter) {
		$this->db->trans_start();
		$this->db->where('id_account', $id_conta);
		$this->db->update('accounts', $alter);
		$this->db->trans_complete();
		return TRUE;
	}

	//EXCLUÍ CONTA
	public function excluiAccount($id_conta, $id_logado) {
		$this->db->where('id_account', $id_conta);
		$this->db->where('id_user_fk', $id_logado);
		$this->db->delete('accounts');
		return TRUE;
	}
    
	//EXCLUÍ TODAS CONTAS FIXAS OU PARCELADAS
	public function excluiAllAccount($subIdAccount, $id_logado) {
		//$this->db->where('id_account', $id_conta);
		$this->db->where('id_account_one', $subIdAccount);
		$this->db->where('id_user_fk', $id_logado);
		$this->db->delete('accounts');
		return TRUE;
	}

	//EXCLUÍ CONTA QUANDO USUÁRIO FOR EXCLUÍDO
	public function excluiAccountUser($id) {
		$this->db->where('id_user_fk', $id);
		$this->db->delete('accounts');
		return TRUE;
	}
}
