<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Contas extends CI_Controller {

	function __construct() {
		parent::__construct(); 
		TimerExpired();
	}

	public function ContasDoMes() {
        $mes = mes_port(date('d/m/Y'));
        $params = array (
                        'id_logado'  => $this->session->userdata('id_user'),
                        'firtDay' => date('Y-m-01'),
                        'lastDay' => date('Y-m-t'),
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

        $saldoAtual = $totalRecebido - $totalPago;

        $data = array(
                    'title' => 'Contas de '.$mes,
                    'receber' => $receive,
                    'total_receber' => $totalReceber,
                    'total_recebido' => $totalRecebido,
                    'pagar' => $pay,
                    'total_pagar' => $totalPagar,
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

        if ($u['contaFixa']== 's') {
            $vencimento = dateUSA($u['vencimento']);
            $p = 1;
            for ($v=0; $v < 12 ; $v++) {

                $save = array (
                    'id_user_fk' => $u['id_logado'],
                    'tipo_conta' => $u['tipoConta'],
                    'nome_conta' => $u['nome'], 
                    'data_vencimento' => $vencimento,
                    'valor_conta' => moneyUSA($u['valor']),
                    'tipo_parcela' => $u['tipoParcela'],
                    'parcelamento' => $u['parcelamento'],
                    'conta_fixa' => $u['contaFixa'],
                    'status' => 'n',
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
            
        } else if ($u['tipoParcela'] == 'p' && !empty($u['parcelamento'])) {
            $vencimento = dateUSA($u['vencimento']);
            $p = 1;
            for ($v=0; $v < $u['parcelamento']; $v++) {

                $save = array (
                    'id_user_fk' => $u['id_logado'],
                    'tipo_conta' => $u['tipoConta'],
                    'nome_conta' => $u['nome'].' ('.$p.' de '.$u['parcelamento'].')', 
                    'data_vencimento' => $vencimento,
                    'valor_conta' => moneyUSA($u['valor']),
                    'tipo_parcela' => $u['tipoParcela'],
                    'parcelamento' => $u['parcelamento'],
                    'status' => 'n',
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
        } else {
            $save = array (
                'id_user_fk' => $u['id_logado'],
                'tipo_conta' => $u['tipoConta'],
                'nome_conta' => $u['nome'], 
                'data_vencimento' => dateUSA($u['vencimento']),
                'valor_conta' => moneyUSA($u['valor']),
                'tipo_parcela' => $u['tipoParcela'],
                'parcelamento' => $u['parcelamento'],
                'conta_fixa' => $u['contaFixa'],
                'status' => 'n',
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
            }
        }

        echo json_encode(array ("suc" => $i, "p" => site_url('Contas/ContasDoMes')));
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
    
    public function RegisterLog($data) {
		if ($_SERVER['HTTP_HOST'] == 'localhost') {
			$ipUser = '000.000.000.000';
		} else {
			$ipUser = $_SERVER['REMOTE_HOST'];
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
