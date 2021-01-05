<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Compras extends CI_Controller {

	function __construct() {
		parent::__construct(); 
		# $this->ValidaLogin->TimerExpired();
	}

	public function index() {
		$this->load->model('Compras_model');
		$l = $this->Compras_model->getProduct();

		$totalItens = 0;
		$totalProd = 0;
		foreach ($l as $i => $li) {
			$totalProd += $li->total_price;
			$totalItens += $li->amount;
		}
		
		$data = array (
				'list' => $l,
				'total' => moneyBR($totalProd),
				'totalItens' => $totalItens
		);
		
		$this->load->view('lista_de_compras', $data );
	}

	public function insereProduto() {
		$p = $this->input->post();

		if ($p['price'] == '' && $p['amount'] == '') {
			$totalPrice = 0;
		} else {
			$totalPrice = moneyUSA($p['price']) * $p['amount'];
		}

		$save = array (
			'product' => $p['product'],
			'price' => moneyUSA($p['price']),
			'amount' => $p['amount'],
			'total_price' => $totalPrice
		);

		$this->load->model('Compras_model');
		$list = $this->Compras_model->insertProduct($save);

		echo json_encode(array ("suc" => $list));

	}

    public function alteraProduto() {
		$p = $this->input->post();
		//debug_r($p);
		if (!empty($p['valor'])) {
			$save = array (
				'price' => moneyUSA($p['valor'])
			);
		}
		if (!empty($p['qtd'])) {
			$total = $p['valor'] * $p['qtd'];
			$save = array (
				'amount' => $p['qtd'],
				'total_price' => $total
			);
		}
		
		//debug_r($save);
		$this->load->model('Compras_model');
		$i = $this->Compras_model->updateProduct($p['id'], $save);

		echo json_encode(array("suc" => $i));
    }
    
	public function excluiProduto () {
		$id = $this->input->post('id_produto');

		$this->load->model('Compras_model');
		$i = $this->Compras_model->deleteProduct($id);

		echo json_encode(array("suc" => $i));
	}

	public function excluiTdsProdutos () {

		$this->load->model('Compras_model');
		$i = $this->Compras_model->deletAllProduct();

		echo json_encode(array("suc" => $i));
	}
}
