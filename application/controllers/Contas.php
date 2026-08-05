<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Contas extends CI_Controller {

	function __construct() {
		parent::__construct(); 
		TimerExpired();
	}

	public function ContasDoMes() {
		$dataSearch = date('m/Y');
        
        if ($this->input->get('search')) {
			$dataSearch = $this->input->get('search');
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
                    'dateSearch' => $dataSearch,
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
			
            foreach ($i as $v => $d) {
                $id_conta_one = $d->id_account_one;
            }
 		
            $p = $this->Contas_model->allAccountData($id_conta_one);

			$data = array(
				'title' => 'Alterar Conta',
				'conta' => $i,
                'parcelas' => $p
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

			// Captura a data inicial do formulário
			$data_inicial_raw = dateUSA($u['vencimento']);

			// Extrai o ano, mês e o dia exato que o usuário digitou (ex: 31)
			$ano_inicial = (int)date('Y', strtotime($data_inicial_raw));
			$mes_inicial = (int)date('m', strtotime($data_inicial_raw));
			$dia_desejado = (int)date('d', strtotime($data_inicial_raw));

			// ---------------------------------------------------------
			// FLUXO 1: CONTA FIXA (Gera 12 meses)
			// ---------------------------------------------------------
			if ($u['contaFixa'] == 's') {

				for ($v = 0; $v < 12; $v++) {
					// Criamos a data base sempre no DIA 01 para o PHP nunca pular meses no modify
					$date_target = new DateTime("$ano_inicial-$mes_inicial-01");
					$date_target->modify("+$v months");

					// Agora que estamos no mês correto, verificamos o limite de dias dele
					$total_dias_mes = (int)$date_target->format('t');

					// Se o dia desejado (31) for maior que o total do mês (ex: 30 ou 28), vira o último dia
					$dia_final = ($dia_desejado > $total_dias_mes) ? $total_dias_mes : $dia_desejado;

					// Forçamos o dia correto no objeto
					$date_target->setDate((int)$date_target->format('Y'), (int)$date_target->format('m'), $dia_final);
					$venc = $date_target->format('Y-m-d');

					$save = array (
						'id_user_fk' => $u['id_logado'],
						'tipo_conta' => $u['tipoConta'],
						'id_account_one' => $idAccountOne,
						'nome_conta' => $u['nome'],
						'data_vencimento' => $venc,
						'valor_conta' => moneyUSA($u['valor']),
						'tipo_parcela' => $u['tipoParcela'],
						'parcelamento' => $u['parcelamento'],
						'conta_fixa' => $u['contaFixa'],
						'status' => $u['status'],
						'observacao' => $u['observacao'],
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

				// ---------------------------------------------------------
				// FLUXO 2: CONTA PARCELADA (Quantidade exata de parcelas)
				// ---------------------------------------------------------
			} else if ($u['tipoParcela'] == 'p' && !empty($u['parcelamento'])) {
				$parcelas = (int)$u['parcelamento'];

				for ($v = 0; $v < $parcelas; $v++) {
					// Criamos a data base sempre no DIA 01 para o PHP nunca pular meses no modify
					$date_target = new DateTime("$ano_inicial-$mes_inicial-01");
					$date_target->modify("+$v months");

					// Verificamos o limite de dias do mês alvo
					$total_dias_mes = (int)$date_target->format('t');

					// Se o dia desejado (31) for maior que o total do mês, vira o último dia
					$dia_final = ($dia_desejado > $total_dias_mes) ? $total_dias_mes : $dia_desejado;

					$date_target->setDate((int)$date_target->format('Y'), (int)$date_target->format('m'), $dia_final);
					$venc = $date_target->format('Y-m-d');

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
						'observacao' => $u['observacao'],
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

				// ---------------------------------------------------------
				// FLUXO 3: CONTA ÚNICA / VISTA
				// ---------------------------------------------------------
			} else {
				$save = array (
					'id_user_fk' => $u['id_logado'],
					'tipo_conta' => $u['tipoConta'],
					'id_account_one' => $idAccountOne,
					'nome_conta' => $u['nome'],
					'data_vencimento' => $data_inicial_raw,
					'valor_conta' => moneyUSA($u['valor']),
					'tipo_parcela' => $u['tipoParcela'],
					'parcelamento' => $u['parcelamento'],
					'conta_fixa' => $u['contaFixa'],
					'status' => $u['status'],
					'observacao' => $u['observacao'],
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
			// [FLUXO 4: ALTERAÇÃO INDIVIDUAL - permanece igual...]
			$status = $this->input->post('status');
			if($status === 's') { $dataHoraPgto = date('Y-m-d H:i:s'); } else { $dataHoraPgto = '0000-00-00 00:00:00'; }

			$save = array (
				'tipo_conta' => $u['tipoConta'],
				'nome_conta' => $u['nome'],
				'data_vencimento' => dateUSA($u['vencimento']),
				'data_hora_pgto' => $dataHoraPgto,
				'valor_conta' => moneyUSA($u['valor']),
				'tipo_parcela' => $u['tipoParcela'],
				'parcelamento' => $u['parcelamento'],
				'conta_fixa' => $u['contaFixa'],
				'status' => $u['status'],
				'observacao' => $u['observacao'],
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

	public function AlterAccountSmart() {
		$u = $this->input->post();
		$this->load->model('Contas_model');

		$id_conta = $u['id_conta'];
		$sub_id   = $u['sub_id'];
		$modo     = $u['modo_alteracao'];

		// 1. Trata e blindar datas de entrada
		list($data_original, $data_nova) = $this->tratarDatasVencimento(
			$u['vencimento_original'] ?? null,
			$u['vencimento'] ?? null
		);

		// 2. Extração do nome base e novo limite de parcelas
		$n = explode('(', $u['nome']);
		$novoNomeBase = trim($n[0]);
		$novoTotalParcelas = (int)$u['parcelamento'];

		// 3. Busca o grupo de contas para atualizar
		$contas_do_grupo = $this->Contas_model->updateThisAndAfterAccounts($id_conta, $sub_id, $modo, $data_original);

		// Estepe para datas caso o retorno do banco seja necessário
		if (!empty($contas_do_grupo)) {
			$data_nova     = $data_nova     ?: $contas_do_grupo[0]->data_vencimento;
			$data_original = $data_original ?: $contas_do_grupo[0]->data_vencimento;
		}

		$dia_desejado  = (int)date('d', strtotime($data_nova));
		$alterou_ano   = (date('Y', strtotime($data_original)) !== date('Y', strtotime($data_nova)));

		$sucesso = false;
		$meses_a_somar = 0;
		$ultimo_numero_parcela = 0;
		$ultima_data_vencimento = $data_nova;
		$ids_para_deletar = array();

		// ---------------------------------------------------------
		// PASSO 1: ATUALIZAR AS CONTAS EXISTENTES
		// ---------------------------------------------------------
		foreach ($contas_do_grupo as $conta) {
			$ultimo_numero_parcela = $this->extrairNumeroParcela($conta->nome_conta, $ultimo_numero_parcela);

			// Se o parcelamento diminuiu e a parcela ultrapassa o novo total, marca para exclusão
			if ($novoTotalParcelas < $ultimo_numero_parcela) {
				$ids_para_deletar[] = $conta->id_account;
				continue;
			}

			// Calcula a nova data de vencimento
			$data_calculada = $this->calcularNovaDataVencimento(
				$conta->data_vencimento,
				$data_nova,
				$dia_desejado,
				$meses_a_somar,
				$alterou_ano
			);
			$ultima_data_vencimento = $data_calculada;

			// Monta o payload individual garantindo a preservação do valor das demais parcelas
			$save = $this->montarDadosSalvamento($u, $conta, $novoNomeBase, $ultimo_numero_parcela, $novoTotalParcelas, $data_calculada);

			$sucesso = $this->Contas_model->updateAccount($conta->id_account, $save);
			$meses_a_somar++;
		}

		// ---------------------------------------------------------
		// PASSO 2: GERAR PARCELAS EXTRAS (SE O TOTAL AUMENTOU)
		// ---------------------------------------------------------
		if ($novoTotalParcelas > $ultimo_numero_parcela) {
			$sucesso = $this->criarParcelasExtras($u, $novoNomeBase, $sub_id, $ultimo_numero_parcela, $novoTotalParcelas, $ultima_data_vencimento, $dia_desejado);
		}

		// ---------------------------------------------------------
		// PASSO 3: REMOVER PARCELAS EXCEDENTES
		// ---------------------------------------------------------
		if (!empty($ids_para_deletar)) {
			$this->Contas_model->excluiParcelasPorId($ids_para_deletar);
			$sucesso = true;
		}

		if ($sucesso) {
			$this->RegisterLog(array(
				'id_logado'    => $this->input->post('id_logado'),
				'id_module'    => $id_conta,
				'tipoRegistro' => 1,
				'page'         => 'updateAccount',
			));
		}

		echo json_encode(array(
			"suc" => $sucesso,
			"msg" => "Alterações realizadas com sucesso!",
			"p"   => site_url('Contas/ContasDoMes')
		));
	}

	public function AlterStatus() {
		$id_conta = $this->input->post('id_conta');
		$status = $this->input->post('status');

		if ($status === 's') {
			$dataHoraPgto = date('Y-m-d H:i:s');
		} else {
			$dataHoraPgto = '0000-00-00 00:00:00';
		}

		$alter = array (
			'data_hora_pgto' => $dataHoraPgto,
			'status' => $status,
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

	public function deleteAccountSmart() {
		$ids = $this->input->post();
		$this->load->model('Contas_model');

		$id_conta = $ids['id_conta'];
		$sub_id   = $ids['sub_id_conta'];
		$modo     = $ids['modo_exclusao']; // Recebe 'todos' ou 'after'
		$id_user  = $ids['id_logado'];

		$i = $this->Contas_model->excluiAccountSmart($id_conta, $sub_id, $modo, $id_user);

		if (!empty($i)) {
			$data = array (
				'id_logado' => $id_user,
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

// =========================================================================
// MÉTODOS AUXILIARES DE SUPORTE
// =========================================================================

	private function tratarDatasVencimento($vencimento_original, $vencimento) {
		$data_original = !empty($vencimento_original) ? dateUSA($vencimento_original) : null;
		$data_nova     = !empty($vencimento) ? dateUSA($vencimento) : null;

		if (!$data_original && !empty($vencimento_original)) {
			$dt = DateTime::createFromFormat('d/m/Y', $vencimento_original);
			if ($dt) $data_original = $dt->format('Y-m-d');
		}
		if (!$data_nova && !empty($vencimento)) {
			$dt = DateTime::createFromFormat('d/m/Y', $vencimento);
			if ($dt) $data_nova = $dt->format('Y-m-d');
		}

		return array($data_original, $data_nova);
	}

	private function extrairNumeroParcela($nome_conta_banco, $ultimo_numero) {
		if (preg_match('/\((\d+)\s+de\s+(\d+)\)/', $nome_conta_banco, $matches)) {
			return (int)$matches[1];
		}
		return $ultimo_numero + 1;
	}

	private function montarDadosSalvamento($post, $conta_banco, $novoNomeBase, $numeroParcela, $novoTotalParcelas, $data_calculada) {
		$is_conta_atual = ($conta_banco->id_account == $post['id_conta']);

		// CORREÇÃO DO BUG: Mantém o valor original do banco caso não seja a parcela em edição direta
		$valor_conta = $is_conta_atual ? moneyUSA($post['valor']) : $conta_banco->valor_conta;

		// Lógica de Status e Data de Pagamento
		$status = $is_conta_atual ? $post['status'] : $conta_banco->status;
		$data_pgto = $conta_banco->data_hora_pgto;

		if ($is_conta_atual) {
			if ($post['status'] === 's' && (empty($conta_banco->data_hora_pgto) || $conta_banco->data_hora_pgto == '0000-00-00 00:00:00')) {
				$data_pgto = date('Y-m-d H:i:s');
			} elseif ($post['status'] === 'n') {
				$data_pgto = '0000-00-00 00:00:00';
			}
		}

		return array(
			'tipo_conta'     => $post['tipoConta'],
			'nome_conta'     => $novoNomeBase . ' (' . $numeroParcela . ' de ' . $novoTotalParcelas . ')',
			'valor_conta'    => $valor_conta,
			'tipo_parcela'   => $post['tipoParcela'],
			'parcelamento'   => $novoTotalParcelas,
			'conta_fixa'     => $post['contaFixa'],
			'status'         => $status,
			'data_hora_pgto' => $data_pgto,
			'data_vencimento'=> $data_calculada,
			'date_update'    => date('Y-m-d H:i:s')
		);
	}

	private function calcularNovaDataVencimento($data_vencimento_banco, $data_nova, $dia_desejado, $meses_a_somar, $alterou_ano) {
		if ($alterou_ano) {
			$date_target = new DateTime($data_nova);
			$date_target->modify("+$meses_a_somar months");
			$total_dias_mes = (int)$date_target->format('t');
			$dia_final = min($dia_desejado, $total_dias_mes);

			$date_target->setDate((int)$date_target->format('Y'), (int)$date_target->format('m'), $dia_final);
			return $date_target->format('Y-m-d');
		}

		$ano_parcela = date('Y', strtotime($data_vencimento_banco));
		$mes_parcela = date('m', strtotime($data_vencimento_banco));
		$date_temp   = new DateTime("$ano_parcela-$mes_parcela-01");

		$total_dias_mes = (int)$date_temp->format('t');
		$dia_final = min($dia_desejado, $total_dias_mes);

		return $ano_parcela . '-' . $mes_parcela . '-' . sprintf('%02d', $dia_final);
	}

	private function criarParcelasExtras($post, $novoNomeBase, $sub_id, $ultimo_numero, $novoTotal, $ultima_data_vencimento, $dia_desejado) {
		$parcelas_restantes = $novoTotal - $ultimo_numero;
		$date_extra_base = new DateTime($ultima_data_vencimento);
		$status_retorno = false;

		for ($p = 1; $p <= $parcelas_restantes; $p++) {
			$proximo_numero = $ultimo_numero + $p;

			$date_extra = clone $date_extra_base;
			$date_extra->modify("+$p months");
			$total_dias_mes = (int)$date_extra->format('t');
			$dia_final = min($dia_desejado, $total_dias_mes);

			$date_extra->setDate((int)$date_extra->format('Y'), (int)$date_extra->format('m'), $dia_final);

			$nova_conta = array(
				'id_account_one'  => $sub_id,
				'tipo_conta'      => $post['tipoConta'],
				'nome_conta'      => $novoNomeBase . ' (' . $proximo_numero . ' de ' . $novoTotal . ')',
				'data_vencimento' => $date_extra->format('Y-m-d'),
				'valor_conta'     => moneyUSA($post['valor']),
				'tipo_parcela'    => $post['tipoParcela'],
				'parcelamento'    => $novoTotal,
				'conta_fixa'      => $post['contaFixa'],
				'status'          => 'n',
				'date_update'     => date('Y-m-d H:i:s'),
				'date_insert'     => date('Y-m-d H:i:s')
			);

			$status_retorno = $this->Contas_model->insertAccount($nova_conta);
		}

		return $status_retorno;
	}
}
