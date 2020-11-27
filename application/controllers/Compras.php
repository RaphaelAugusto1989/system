<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Compras extends CI_Controller {

	function __construct() {
		parent::__construct(); 
		# $this->ValidaLogin->TimerExpired();
	}

	public function index() {
		//debug_r($_SERVER);
		$this->load->view('lista_de_compras');
	}

	public function insereProduto() {
	}

    public function alteraProduto () {
    }
    
	public function excluiProduto () {
	}
}
