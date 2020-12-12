<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Compras_model extends CI_Model {

	function __construct() {
		parent::__construct();
	}
	
	//TRAS DADOS DO PRODUTO
	public function getProduct() {
		return $this->db->get('compras')->result();
	}

    //INSERE DADOS DO PRODUTO
	public function insertProduct($save) {
		$this->db->trans_start();
		$this->db->insert('compras', $save);
		$this->db->trans_complete();
	}
	
	//ALTERA DADOS DO PRODUTO
	public function updateProduct($id, $save) {
		$this->db->trans_start();
		$this->db->where('id_product', $id);
		$true = $this->db->update('compras', $save);
		$this->db->trans_complete();
		return $true;
	}
	//DELETA DADOS DO PRODUTO
	public function deleteProduct($id) {
		$this->db->where('id_product', $id);
		$this->db->delete('compras');
		return true;
	}
    
}