<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuarios extends CI_Controller {

	public function UserViews () {
		$data = array(
				'title' => 'Usuários Cadastrados'
				);

		$this->load->view('sHeader', $data);
		$this->load->view('sUsuariosCadastrados', $data);
		$this->load->view('sFooter');
    }
    
    public function InsertUser () {
		$data = array(
				'title' => 'Cadastrar Usuárioss'
				);

		$this->load->view('sHeader', $data);
		$this->load->view('sUsuariosForm', $data);
		$this->load->view('sFooter');
	}

	public function MyData () {
		$data = array(
				'title' => 'Meus Dados'
				);

		$this->load->view('sHeader', $data);
		$this->load->view('sMeusdadosForm', $data);
		$this->load->view('sFooter');
	}

	public function Logoff () {
		session_start();
		$_SESSION = array();
		session_unset();
		session_destroy();
		redirect(site_url());
	}
}
