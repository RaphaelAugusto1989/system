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

		$modo = $u['modo_alteracao'];
		$id_conta = $u['id_conta'];
		$sub_id = $u['sub_id'];

		// -----------------------------------------------------------------
		// BLINDAGEM DA DATA: Garante formato Y-m-d mesmo se a função dateUSA falhar
		// -----------------------------------------------------------------
		$data_original = !empty($u['vencimento_original']) ? dateUSA($u['vencimento_original']) : null;
		$data_nova     = !empty($u['vencimento']) ? dateUSA($u['vencimento']) : null;

		if (!$data_original && !empty($u['vencimento_original'])) {
			$data_original = DateTime::createFromFormat('d/m/Y', $u['vencimento_original'])->format('Y-m-d');
		}
		if (!$data_nova && !empty($u['vencimento'])) {
			$data_nova = DateTime::createFromFormat('d/m/Y', $u['vencimento'])->format('Y-m-d');
		}

		// 1. EXTRAÇÃO DO NOME E PARCELAMENTO
		$n = explode('(', $u['nome']);
		$novoNomeBase = trim($n[0]);
		$novoTotalParcelas = (int)$u['parcelamento'];

		// O 'status' não fica aqui para evitar que altere em lote as contas passadas/futuras
		$save_base = array (
			'tipo_conta'    => $u['tipoConta'],
			'valor_conta'   => moneyUSA($u['valor']),
			'tipo_parcela'  => $u['tipoParcela'],
			'parcelamento'  => $novoTotalParcelas,
			'conta_fixa'    => $u['contaFixa'],
			'date_update'   => date('Y-m-d H:i:s')
		);

		// BUSCA: Traz as contas do grupo para atualizar
		$contas_do_grupo = $this->Contas_model->updateThisAndAfterAccounts($id_conta, $sub_id, $modo, $data_original);

		// SEGUNDA BLINDAGEM: Se a data calculada sumiu, pegamos a do banco como estepe
		if (empty($data_nova) && !empty($contas_do_grupo)) {
			$data_nova = $contas_do_grupo[0]->data_vencimento;
		}
		if (empty($data_original) && !empty($contas_do_grupo)) {
			$data_original = $contas_do_grupo[0]->data_vencimento;
		}

		// Dados para a detecção do ano/dia
		$ano_original = date('Y', strtotime($data_original));
		$ano_novo     = date('Y', strtotime($data_nova));
		$dia_novo     = date('d', strtotime($data_nova));

		$alterou_ano = ($ano_original !== $ano_novo);

		$i = false;
		$meses_a_somar = 0;
		$ultimo_numero_parcela = 0;
		$ultima_data_vencimento = $data_nova;

		// -----------------------------------------------------------------
		// CORREÇÃO DE ESCOPO: Variáveis declaradas antes de entrar no loop
		// -----------------------------------------------------------------
		$date_base = new DateTime($data_nova);
		$dia_desejado = (int)$dia_novo;

		// Array estratégico que guardará os IDs das contas que passaram do limite reduzido
		$ids_para_deletar = array();

		// ---------------------------------------------------------
		// PASSO 1: ATUALIZAR AS CONTAS EXISTENTES
		// ---------------------------------------------------------
		foreach ($contas_do_grupo as $conta) {
			$nomeBancoOriginal = $conta->nome_conta;

			// Descobre o número atual desta parcela extraindo do nome do banco
			if (preg_match('/\((\d+)\s+de\s+(\d+)\)/', $nomeBancoOriginal, $matches)) {
				$numeroParcelaAtual = (int)$matches[1];
				$ultimo_numero_parcela = $numeroParcelaAtual;
			} else {
				$ultimo_numero_parcela++;
				$numeroParcelaAtual = $ultimo_numero_parcela;
			}

			// SEGUNDA BLINDAGEM: Se o total diminuiu E esta parcela atual for maior que o novo limite,
			// nós NÃO atualizamos ela. Guardamos o ID dela para deletar de vez no Passo 3.
			if ($novoTotalParcelas < $numeroParcelaAtual) {
				$ids_para_deletar[] = $conta->id_account;
				continue; // Pula esta conta e avança para a próxima do loop
			}

			$save = $save_base;

			// AJUSTE DO STATUS E HISTÓRICO DE PAGAMENTO (Mantém as outras intactas)
			if ($conta->id_account == $id_conta) {
				$save['status'] = $u['status'];
				if ($u['status'] === 's' && ($conta->data_hora_pgto == '0000-00-00 00:00:00' || empty($conta->data_hora_pgto))) {
					$save['data_hora_pgto'] = date('Y-m-d H:i:s');
				} elseif ($u['status'] === 'n') {
					$save['data_hora_pgto'] = '0000-00-00 00:00:00';
				}
			} else {
				$save['status'] = $conta->status;
				$save['data_hora_pgto'] = $conta->data_hora_pgto;
			}

			// Regra dos parênteses atualizada
			$novoParenteses = '(' . $numeroParcelaAtual . ' de ' . $novoTotalParcelas . ')';
			$save['nome_conta'] = $novoNomeBase . ' ' . $novoParenteses;

			// CÁLCULO DE VENCIMENTO SEGURO (Mês a Mês / Fevereiro)
			if ($alterou_ano) {
				$date_target = clone $date_base;
				$date_target->modify("+$meses_a_somar months");

				$total_dias_mes = (int)$date_target->format('t');

				if ($dia_desejado > $total_dias_mes) {
					$date_target->setDate((int)$date_target->format('Y'), (int)$date_target->format('m'), $total_dias_mes);
				} else {
					$date_target->setDate((int)$date_target->format('Y'), (int)$date_target->format('m'), $dia_desejado);
				}

				$data_calculada = $date_target->format('Y-m-d');
			} else {
				$ano_parcela_banco = date('Y', strtotime($conta->data_vencimento));
				$mes_parcela_banco = date('m', strtotime($conta->data_vencimento));

				$date_temp = new DateTime("$ano_parcela_banco-$mes_parcela_banco-01");
				$total_dias_mes = (int)$date_temp->format('t');

				$dia_final = ($dia_desejado > $total_dias_mes) ? $total_dias_mes : $dia_desejado;

				$data_calculada = $ano_parcela_banco . '-' . $mes_parcela_banco . '-' . sprintf('%02d', $dia_final);
			}

			$save['data_vencimento'] = $data_calculada;
			$ultima_data_vencimento = $data_calculada;

			$i = $this->Contas_model->updateAccount($conta->id_account, $save);
			$meses_a_somar++;
		}

		// ---------------------------------------------------------
		// PASSO 2: GERAR AS PARCELAS EXTRAS (SE O TOTAL AUMENTOU)
		// ---------------------------------------------------------
		if ($novoTotalParcelas > $ultimo_numero_parcela) {
			$parcelas_restantes = $novoTotalParcelas - $ultimo_numero_parcela;
			$date_extra_base = new DateTime($ultima_data_vencimento);

			for ($p = 1; $p <= $parcelas_restantes; $p++) {
				$proximo_numero_parcela = $ultimo_numero_parcela + $p;

				$date_extra = clone $date_extra_base;
				$date_extra->modify("+$p months");

				$total_dias_mes = (int)$date_extra->format('t');

				if ($dia_desejado > $total_dias_mes) {
					$date_extra->setDate((int)$date_extra->format('Y'), (int)$date_extra->format('m'), $total_dias_mes);
				} else {
					$date_extra->setDate((int)$date_extra->format('Y'), (int)$date_extra->format('m'), $dia_desejado);
				}

				$novo_vencimento = $date_extra->format('Y-m-d');

				$nova_conta = array(
					'id_account_one'  => $sub_id,
					'tipo_conta'      => $u['tipoConta'],
					'nome_conta'      => $novoNomeBase . ' (' . $proximo_numero_parcela . ' de ' . $novoTotalParcelas . ')',
					'data_vencimento' => $novo_vencimento,
					'valor_conta'     => moneyUSA($u['valor']),
					'tipo_parcela'    => $u['tipoParcela'],
					'parcelamento'    => $novoTotalParcelas,
					'conta_fixa'      => $u['contaFixa'],
					'status'          => 'n',
					'date_update'     => date('Y-m-d H:i:s'),
					'date_insert'     => date('Y-m-d H:i:s')
				);

				$i = $this->Contas_model->insertAccount($nova_conta);
			}
		}

		// ---------------------------------------------------------
		// PASSO 3: REMOVER PARCELAS EXCEDENTES POR IDS MAPEADOS
		// ---------------------------------------------------------
		if (!empty($ids_para_deletar)) {
			$this->Contas_model->excluiParcelasPorId($ids_para_deletar);
			$i = true;
		}

		if ($i) {
			$data = array (
				'id_logado' => $this->input->post('id_logado'),
				'id_module' => $u['id_conta'],
				'tipoRegistro' => 1,
				'page' => 'updateAccount',
			);
			$this->RegisterLog($data);
		}

		$msg = "Alterações realizadas com sucesso!";
		echo json_encode(array ("suc" => $i, "msg" => $msg, "p" => site_url('Contas/ContasDoMes')));
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
    

}
