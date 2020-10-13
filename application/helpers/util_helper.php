<?php 
defined('BASEPATH') OR exit('No direct script access allowed');


function debug_r($v){
    echo '<pre>';
    print_r($v);
    die;
}

//CONVERTE DATA PARA VERSÃO AMERICANA
function dateUSA($d) {
    $date = explode('/', $d);
    return $date[2].'-'.$date[1].'-'.$date[0];
    //return date('Y-m-d', strtotime($d));
}

//CONVERTE DATA PARA VERSÃO BRASILEIRA
function dateBR($d) {
    $date = explode('-', $d);
    return $date[2].'/'.$date[1].'/'.$date[0];
}

//CONVERTE PARA MOEDA AMERICANA
function moneyUSA($m) {
    $m = str_replace(".", "", $m ); // Primeiro tira os pontos
    return str_replace(",", ".", $m); // Substitui a virgula pelo ponto
}

//CONVERTE PARA MOEDA BRASILEIRA
function moneyBR($m) {
    $m = str_replace(",", "", $m ); // Primeiro tira a virgula
    return str_replace(".", ",", $m); // Substitui a ponto pela virgula
}

//OBTEM MÊS E ANO EM PORTUGUÊS
function mes_port($date) {
    $date = str_replace ( "/", "-", $date );
    $date_time = strtotime ( $date );
    if ($date_time) {
        switch (date ( "n", $date_time )) {
            case 1 :
                return "Janeiro de " . date ( "Y", $date_time );
                break;
            
            case 2 :
                return "Fevereiro de " . date ( "Y", $date_time );
                break;
            
            case 3 :
                return "Março de " . date ( "Y", $date_time );
                break;
            
            case 4 :
                return "Abril de " . date ( "Y", $date_time );
                break;
            
            case 5 :
                return "Maio de " . date ( "Y", $date_time );
                break;
            
            case 6 :
                return "Junho de " . date ( "Y", $date_time );
                break;
            
            case 7 :
                return "Julho de " . date ( "Y", $date_time );
                break;
            
            case 8 :
                return "Agosto de " . date ( "Y", $date_time );
                break;
            
            case 9 :
                return "Setembro de " . date ( "Y", $date_time );
                break;
            
            case 10 :
                return "Outubro de " . date ( "Y", $date_time );
                break;
            
            case 11 :
                return "Novembro de " . date ( "Y", $date_time );
                break;
            
            case 12 :
                return "Dezembro de " . date ( "Y", $date_time );
                break;
        }
    }
}


