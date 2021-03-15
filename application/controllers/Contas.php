<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Contas extends CI_Controller {

	function __construct() {
		parent::__construct(); 
		TimerExpired();
	}

	public function ContasDoMes() {
        $data = $this->input->get('search');
        
        if ($this->input->get('search')) {
            //echo $data; die;
            $d = '01/'.$this->input->get('search');
            $mes = mes_port($d); // vem como JANEIRO DE 2020 essa é uma função pra mostrar o nome em portuga!
            $firtDay = substr($this->input->get('search'),3,4).'-'.substr($this->input->get('search'),0,2).'-01';
            $lastDay = date('Y-m-t', strtotime($firtDay));
            
        } else {
            $mes = mes_port(date('d/m/Y'));
            $firtDay = date('Y-m-01');
            $lastDay = date('Y-m-t');
        }

        $params = array (
                        'id_logado'  => $this->session->userdata('id_user'),
                        'firtDay' => $firtDay,
                        'lastDay' =>  $lastDay
                );
        
        $this->load->model('Contas_model');
        $receive = $this->Contas_model->getAccountMonthReceive($params);

        $totalReceber = 0;
        foreach ($receive as $i => $c) {
            $totalReceber += $c->valor_conta;
            if (empty($totalReceber)) { $totalReceber = '0';}
        }
        
        $pay = $this->Contas_model->getAccountMonthPay($params);
        $totalPagar = 0;
        foreach ($pay as $i => $c) {
            $totalPagar += $c->valor_conta;
            if (empty($totalPagar)) { $totalPagar = '0';}
        }

        $totalRecebido = 0;
        $jaRecebido  = $this->Contas_model->getAccountMonthReceiveYes($params);
        if ($jaRecebido) {
            foreach ($jaRecebido as $i => $c) {
                $totalRecebido += $c->valor_conta; 
            }
        } else { $totalRecebido = '0';}

        $totalPago = 0;
        $jaPago  = $this->Contas_model->getAccountMonthPayYes($params);
        if ($jaPago) { 
            foreach ($jaPago as $i => $c) {
                $totalPago += $c->valor_conta;
            }
        } else { $totalPago = '0'; }

        $falta_pagar = $totalPagar - $totalPago;

        $saldoAtual = $totalRecebido - $totalPago;

        $data = array(
                    'title' => 'Contas de '.$mes,
                    'receber' => $receive,
                    'total_receber' => $totalReceber,
                    'total_recebido' => $totalRecebido,
                    'pagar' => $pay,
                    'total_pagar' => $totalPagar,
                    'falta_pagar' => $falta_pagar,
                    'total_pago' => $totalPago,
                    'saldo_atual' => $saldoAtual
                );

        $this->load->view('sHeader', $data);
        $this->load->view('sContasCadastradas', $data);
        $this->load->view('sFooter');
    }
    
    public function AccountForm() {
        $id_conta = $this->uri->segment(3);

        if ($id_conta == '') {
			$data = array(
				'title' => 'Nova Conta',
				'conta' => null
				);
		} else {
			$this->load->model('Contas_model');
			$i = $this->Contas_model->accountData($id_conta);

			$data = array(
				'title' => 'Alterar Conta',
				'conta' => $i
				);
		}

        $this->load->view('sHeader', $data);
        $this->load->view('sContasForm', $data);
        $this->load->view('sFooter');

    }
    
    public function RegisterAccount() {
        $u = $this->input->post();
        $this->load->model('Contas_model');

        $p = 1;
        $idAccountOne = date('his');

        if ($u['id_conta'] == null) {
            if ($u['contaFixa'] == 's') {
                $vencimento = dateUSA($u['vencimento']);
                
                for ($v=0; $v < 12; $v++) {

                    $save = array (
                        'id_user_fk' => $u['id_logado'],
                        'tipo_conta' => $u['tipoConta'],
                        'id_account_one' => $idAccountOne,
                        'nome_conta' => $u['nome'], 
                        'data_vencimento' => $vencimento,
                        'valor_conta' => moneyUSA($u['valor']),
                        'tipo_parcela' => $u['tipoParcela'],
                        'parcelamento' => $u['parcelamento'],
                        'conta_fixa' => $u['contaFixa'],
                        'status' => $u['status'],
                        'date_insert' => date('Y-m-d H:i:s')
                    );

                    $mes = somar_datas($p, 'm'); //SOMA O MESES NA DATA DE VENCIMENTO
                    $vencimento = date('Y-m-d', strtotime($mes));

                    $i = $this->Contas_model->insertAccount($save);
                    if (!empty($i)) {
                        $data = array (
                            'id_logado' => $this->input->post('id_logado'),
                            'id_module' => $i ,
                            'tipoRegistro' => 1,
                            'page' => 'RegisterAccount',
                        );
            
                        $this->RegisterLog($data);
                    }

                    $p++;
                }

                $msg = "Conta cadastrada com sucesso!"; 
                
            } else if ($u['tipoParcela'] == 'p' && !empty($u['parcelamento'])) {
                $parcelas = $u['parcelamento'];
                $venc = dateUSA($u['vencimento']);
                $vencimento = strtotime(dateUSA($u['vencimento']));
                $ultimoMes = strtotime("+$parcelas month", $vencimento);

                //$p = 1;
                while ($vencimento < $ultimoMes) {
                    $venc = date("Y-m-d", $vencimento); 
                    $vencimento = strtotime("+1 month", $vencimento); 

                    $save = array (
                        'id_user_fk' => $u['id_logado'],
                        'tipo_conta' => $u['tipoConta'],
                        'id_account_one' => $idAccountOne,
                        'nome_conta' => $u['nome'].' ('.$p.' de '.$u['parcelamento'].')', 
                        'data_vencimento' => $venc,
                        'valor_conta' => moneyUSA($u['valor']),
                        'tipo_parcela' => $u['tipoParcela'],
                        'parcelamento' => $u['parcelamento'],
                        'conta_fixa' => $u['contaFixa'],
                        'status' => $u['status'],
                        'date_insert' => date('Y-m-d H:i:s')
                    );

                    $i = $this->Contas_model->insertAccount($save);
                    if (!empty($i)) {
                        $data = array (
                            'id_logado' => $this->input->post('id_logado'),
                            'id_module' => $i ,
                            'tipoRegistro' => 1,
                            'page' => 'RegisterAccount',
                        );
            
                        $this->RegisterLog($data);
                    }

                    $p++;
                }

                $msg = "Conta cadastrada com sucesso!";
            } else {
                $save = array (
                    'id_user_fk' => $u['id_logado'],
                    'tipo_conta' => $u['tipoConta'],
                    'id_account_one' => $idAccountOne,
                    'nome_conta' => $u['nome'], 
                    'data_vencimento' => dateUSA($u['vencimento']),
                    'valor_conta' => moneyUSA($u['valor']),
                    'tipo_parcela' => $u['tipoParcela'],
                    'parcelamento' => $u['parcelamento'],
                    'conta_fixa' => $u['contaFixa'],
                    'status' => $u['status'],
                    'date_insert' => date('Y-m-d H:i:s')
                );

                $i = $this->Contas_model->insertAccount($save);
                if (!empty($i)) {
                    $data = array (
                        'id_logado' => $this->input->post('id_logado'),
                        'id_module' => $i,
                        'tipoRegistro' => 1,
                        'page' => 'RegisterAccount',
                    );
        
                    $this->RegisterLog($data);

                    $msg = "Conta cadastrada com sucesso!";
                }
            }
        } else {
            //ALTERA DADOS DA CONTA
            $save = array (
                'tipo_conta' => $u['tipoConta'],
                'nome_conta' => $u['nome'], 
                'data_vencimento' => dateUSA($u['vencimento']),
                'valor_conta' => moneyUSA($u['valor']),
                'tipo_parcela' => $u['tipoParcela'],
                'parcelamento' => $u['parcelamento'],
                'conta_fixa' => $u['contaFixa'],
                'status' => $u['status'],
                'date_update' => date('Y-m-d H:i:s')
            );

            $i = $this->Contas_model->updateAccount($u['id_conta'], $save);

            if (!empty($i)) {
                $data = array (
                    'id_logado' => $this->input->post('id_logado'),
                    'id_module' => $u['id_conta'],
                    'tipoRegistro' => 2,
                    'page' => 'updateAccount',
                );
    
                $this->RegisterLog($data);

                $msg = "Conta Alterada com Sucesso!";
            }
        }

        echo json_encode(array ("suc" => $i, "msg" => $msg, "p" => site_url('Contas/ContasDoMes')));
    }

    public function AlterStatus() {
        $id_conta = $this->input->post('id_conta');

        $alter = array (
            'status' => $this->input->post('status'),
            'date_update' => date('Y-m-d H:i:s')
        );

        $this->load->model('Contas_model');
		$i = $this->Contas_model->alterAccountStatus($id_conta, $alter);

		if (!empty($i)) {
            $data = array (
                'id_logado' => $this->input->post('id_logado'),
                'id_module' => $id_conta,
                'tipoRegistro' => 2,
                'page' => 'AlterStatus'
            );

			$this->RegisterLog($data);
		}
             
        echo json_encode(array ('suc' => $i, "p" => site_url('Contas/ContasDoMes')));
    }

    public function deleteAccount() {
        $ids = $this->input->post();

        $this->load->model('Contas_model');
		$i = $this->Contas_model->excluiAccount($ids['id_conta'], $ids['id_logado']);

		if (!empty($i)) {
            $data = array (
                'id_logado' => $this->input->post('id_logado'),
                'id_module' => 0,
                'tipoRegistro' => 3,
                'page' => 'deleteAccount'
            );

			$this->RegisterLog($data);
		}
             
        echo json_encode(array ('suc' => $i, "p" => site_url('Contas/ContasDoMes')));
    }

    public function deleteAllAccount() {
        $ids = $this->input->post();

        $this->load->model('Contas_model');
		$i = $this->Contas_model->excluiAllAccount($ids['sub_id_conta'], $ids['id_logado']);

		if (!empty($i)) {
            $data = array (
                'id_logado' => $this->input->post('id_logado'),
                'id_module' => 0,
                'tipoRegistro' => 3,
                'page' => 'deleteAccount'
            );

			$this->RegisterLog($data);
		}
             
        echo json_encode(array ('suc' => $i, "p" => site_url('Contas/ContasDoMes')));
    }
    
    public function RegisterLog($data) {
		if ($_SERVER['HTTP_HOST'] == 'localhost') {
			$ipUser = '000.000.000.000';
		} else {
			$ipUser = $_SERVER['REMOTE_ADDR'];
		}

		$log = array (
			'id_user_fk' => $data['id_logado'],
			'id_module' => $data['id_module'],
			'ip_user' => $ipUser,
			'browser_user' => $_SERVER['HTTP_USER_AGENT'],
			'url' => $_SERVER['REQUEST_URI'],
			'page' => $data['page'],
			'type' => $data['tipoRegistro'],
			'date_insert' => date('Y-m-d H:i:s')
		);

		$this->load->model('Log_model');
		$this->Log_model->insertLog($log);
    }
    

}
