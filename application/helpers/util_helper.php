<?php 
defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );


function debug_r($v){
    echo '<pre>';
    print_r($v);
    die;
}

function date_usa($d) {
    $d = explode( "/", $d);
    // print_r($d);exit;
    return $d[2].'-'.$d[1].'-'.$d[0];
}

function dateBR($d) {
    return date('d/m/Y', strtotime($d));
}

