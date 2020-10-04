<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	function __construct() {
		parent::__construct(); 
		# $this->ValidaLogin->TimerExpired();
	}

	public function index() {
		$this->load->view('login');
	}

	public function SignIn () {
		$login = $this->input->post('login');
		$pass = md5($this->input->post('password'));

		$this->load->model('Usuario_model');
		$s = $this->Usuario_model->LoginUser($login, $pass);

		if (!empty($s)) {
			$this->session->set_userdata('timer', time() + (60 * 1)); //1 minuto
			$this->session->set_userdata('id_user', $s[0]->id_user);
			$this->session->set_userdata('nome_user', $s[0]->name_user);
			$this->session->set_userdata('img_user', $s[0]->img_user);

			$this->output
			->set_content_type('application/json')
			->set_output(json_encode(array('sucesso' => true, "p" => site_url('Home/homeSystem'))));
		} else {
			$this->output
			->set_content_type('application/json')
			->set_output(json_encode(array('foo' => false)));
		}
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
