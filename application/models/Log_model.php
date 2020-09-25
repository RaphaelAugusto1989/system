<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Log_model extends CI_Model {

	function __construct() {
		parent::__construct();
    }

    //INSERE DADOS DE LOGS
	public function insertLog($log) {
		$this->db->insert('logs', $log);
	}
    
}