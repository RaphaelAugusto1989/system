<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	public function index() {
		$this->load->view('login');
	}

	public function homeSystem () {
		$data = array(
				'title' => 'Sistema'
				);

		$this->load->view('sHeader', $data);
		$this->load->view('sHome', $data);
		$this->load->view('sFooter');
	}
}
