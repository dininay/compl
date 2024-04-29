<?php 
    
    function update_marketing(){
        require_once('../helper/app_function.php');

        $data   = [
            'catatan_marketing' => $_POST['value'],
            'status'            => 'on progress',
            'tgl_status_1'      => date('Y-m-d H:i:s'),
        ];

        $param  = [
            'id'    => $_POST['id']
        ];
        update($cfg_db, 'keluhan', $data, $param);

        echo json_encode( ['valid'=>true] );
    }


    function update_resto(){
        require_once('../helper/app_function.php');

        $data   = [
            'catatan_resro'     => $_POST['value'],
            'status'            => 'done',
            'tgl_status_2'      => date('Y-m-d H:i:s'),
        ];

        $param  = [
            'id'    => $_POST['id']
        ];
        update($cfg_db, 'keluhan', $data, $param);

        echo json_encode( ['valid'=>true] );
    }




    switch( $_POST['action'] ){
        case 'upd_mkt':
            update_marketing();
        break;
        case 'upd_resto':
            update_resto();
        break;
    }

?>