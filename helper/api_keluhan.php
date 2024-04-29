<?php 
    
    function get_list_resto(){
        require_once('app_function.php');

        $result['valid']= false;
        $get_resto      = get_data($cfg_db, "select * From master_resto where kode_city = '".$_POST['value']."'"); 
        if( count($get_resto)>0 && isset($_POST['value']) && trim($_POST['value']) != '' ){
            $result['valid']= true;
            $result['list'] = $get_resto; 
        }

        echo json_encode( $result );
    }

    function get_list_keluhan(){
        require_once('app_function.php');
    
        $result['valid'] = false;
        $get_keluhan = get_data($cfg_db, "SELECT * FROM keluhan"); 
        if (count($get_keluhan) > 0) {
            $result['valid'] = true;
            $result['list'] = $get_keluhan; 
        }
    
        echo json_encode($result);
    }


    switch( $_POST['action'] ){
        case 'get_resto':
            get_list_resto();
        break;
        case 'get_keluhan': // Tambahkan pemanggilan fungsi get_list_keluhan di sini
            get_list_keluhan();
            break;
    }

?>