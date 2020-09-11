<?php 
defined('BASEPATH') OR exit('No direct script access allowed');


function debug_r($v){
    echo '<pre>';
    print_r($v);
    die;
}

function date_usa($d) {
    return date('Y-m-d', strtotime($d));
}

function dateBR($d) {
    return date('d/m/Y', strtotime($d));
}

