<?php

    function logout(){
        include 'app_function.php';

        session_destroy();
        header('Location:'.$base_url);
    }



    //action
    switch( $_GET['action'] ){
        case 'logout':
            logout();
        break;
    }
    //end action

?>