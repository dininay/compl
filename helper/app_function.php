<?php
    session_start();

    error_reporting(E_ALL & ~E_NOTICE);
    include 'app_config.php';
    date_default_timezone_set("Asia/Jakarta");


    //build config Database
    $cfg_db = [
        'host'  => $host,
        'user'  => $user,
        'pass'  => $password,
        'db'    => $db
    ];
    //end build config Database
   


    //Global Funtion
    function user_permission($base_url, $mandatory = false){
        $open_url = $_SERVER['PHP_SELF'];
        
        $href = 'dashboard_marketing';
        if( isset($_SESSION['nama']) && trim($_SESSION['nama']) != '' ){
            switch( $_SESSION['level'] ){
                case 'marketing':
                    $href = 'dashboard_marketing';
                break;
                case 'resto':
                    $href = 'dashboard_resto';
                break;
            }

            if( $mandatory || strpos($open_url, 'login') ){
                if( !strpos($open_url, $_SESSION['level']) )
                    header('location:'.$base_url.$href);
            }

        }else{
            if( !strpos($open_url, 'login') )
                header('location:'.$base_url.'dashboard_login');
        } 
    }


    function query_exec($cfg, $sql){
        $resp   = false;
        $conn 	= new mysqli($cfg['host'], $cfg['user'], $cfg['pass'], $cfg['db']);
        $exec	= true;
        if ($conn->connect_error) {
            $exec = false;
        }

        if($exec){
            if( $conn->query($sql) ){
                $resp = true;
            }
            $conn->close();
        }
        return $resp;
    }


    function get_data($cfg, $sql){
        $result     = [];
        $conn 	    = new mysqli($cfg['host'], $cfg['user'], $cfg['pass'], $cfg['db']);
        $get        = $conn->query($sql);
        if ($get->num_rows > 0) {
            while($row = $get->fetch_assoc()) {
                array_push($result, $row);
            }
        }
        return $result;
    }


    function insert($cfg, $tbl, $data) {
        $column = [];
        $value = [];
        foreach ($data as $key => $d) {
            if (is_array($d)) {
                // Jika nilai adalah array (dari checkbox)
                // Gabungkan nilai menjadi satu string dipisahkan dengan koma
                $d = implode(', ', $d);
            }
            array_push($column, $key);
            array_push($value, $d);
        }
    
        $query = "INSERT INTO " . $tbl . " (" . implode(', ', $column) . ")
                  VALUES ('" . implode('\', \'', $value) . "')";
        $resp = query_exec($cfg, $query);
    
        return $resp;
    }
    


    function update( $cfg, $tbl, $data, $param ){
        $update_data   = [];
        foreach( $data as $key=>$d ){
            array_push($update_data, $key.' = \''.$d.'\'');
        }

        $param_data   = [];
        foreach( $param as $key=>$d ){
            array_push($param_data, $key.' = \''.$d.'\'');
        }

        $query    = "update ".$tbl." set ".implode(', ', $update_data)."
                    where ".implode('\' and \'', $param_data);

        $resp   = query_exec($cfg, $query);

        return $resp;
    }


    function getMax($cfg, $table, $column){
        $result     = '';
        $conn 	    = new mysqli($cfg['host'], $cfg['user'], $cfg['pass'], $cfg['db']);
        $query_get  = "select MAX(".$column.") as last_id from ".$table;
        $get        = $conn->query($query_get);
        if ($get->num_rows > 0) {
            while($row = $get->fetch_assoc()) {
            $result = $row['last_id'];
            }
        }

        return $result;
    }


    function getMin($cfg, $table, $column){
        $result     = '';
        $conn 	    = new mysqli($cfg['host'], $cfg['user'], $cfg['pass'], $cfg['db']);
        $query_get  = "select MIN(".$column.") as last_id from ".$table;
        $get        = $conn->query($query_get);
        if ($get->num_rows > 0) {
            while($row = $get->fetch_assoc()) {
            $result = $row['last_id'];
            }
        }

        return $result;
    }


    function readCookie(){
        $result = [];
        foreach ($_COOKIE as $name=>$val) {
            $result[$name] = $val;
        }
        return $result;
    }


    function destroyCookie(){
        foreach ($_COOKIE as $name=>$val) {
            setCookie($name, $name, 1);    
        }
    }


    function uploadFile($var_input, $name, $path = ''){
        if( !file_exists('assets/upload') ){
			mkdir('assets/upload');
		}
        

        $file_path = $path != '' ? "assets/upload/".$path."/" : "assets/upload/";
        if( $path != '' && !file_exists('assets/upload/'.$path) ){
			mkdir($file_path);
		}

        define("UPLOAD_DIR", $file_path);
		if (!empty($_FILES[$var_input])) {
			$media	= $_FILES[$var_input];
			$ext	= pathinfo($_FILES[$var_input]["name"], PATHINFO_EXTENSION);
			$size	= $_FILES[$var_input]["size"];
		
			if ($media["error"] !== UPLOAD_ERR_OK) {
				echo '<div class="alert alert-warning">Gagal upload file.</div>';
				die;
			}
		
			$file_name = $name.'.'.$ext;
            return move_uploaded_file($media["tmp_name"], UPLOAD_DIR . $file_name);
		}
    }



    function uploadCompressFile($var_input, $name, $path = ''){
        if( !file_exists('assets/upload') ){
			mkdir('assets/upload');
		}
        

        $file_path = $path != '' ? "assets/upload/".$path."/" : "assets/upload/";
        if( $path != '' && !file_exists('assets/upload/'.$path) ){
			mkdir($file_path);
		}

        $ext	= pathinfo($_FILES[$var_input]["name"], PATHINFO_EXTENSION);
		$size	= $_FILES[$var_input]["size"];
        if( $size>0 ){

            $tmp_file   = $_FILES[$var_input]['tmp_name'];
            $info       = getimagesize($tmp_file);
            $width	    = $info[0];
		    $height	    = $info[1];

            if ($info['mime'] == 'image/jpeg') 
                $image = imagecreatefromjpeg($tmp_file);
            elseif ($info['mime'] == 'image/gif') 
                $image = imagecreatefromgif($tmp_file);
            elseif ($info['mime'] == 'image/png') 
                $image = imagecreatefrompng($tmp_file);

                
            $max_size	= 1500;
            if($width > $$max_size || $height > $max_size){
                if( $width>=$height ){
                    //landscape
                    $percent  = $max_size / $width * 100;
                }else{
                    //portrait
                    $percent  = $max_size / $height * 100;
                }

                // $percent	= $max_w / $width * 100;
                $percent	= number_format($percent/100, 2);
                $newwidth	= $width * $percent;
                $newheight	= $height * $percent; 
                    
                $thumb = imagecreatetruecolor($newwidth, $newheight);
                imagecopyresized($thumb, $image, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
            }else{
                $thumb = imagecreatetruecolor($width, $height);
            }
            
            imagejpeg($thumb, $file_path.$name.'.'.$ext, 80);
            return true;
        }else{
            return false;
        }
    }



    function uploadBlob($var_input, $name, $path = ''){
        if (isset($_POST[$var_input]) && !empty($_POST[$var_input])) {
            if (!file_exists('assets/upload')) {
                mkdir('assets/upload');
            }
    
            $file_path = $path != '' ? "assets/upload/".$path."/" : "assets/upload/";
            if ($path != '' && !file_exists('assets/upload/'.$path)) {
                mkdir($file_path);
            }
            
            $data = file_get_contents($_POST[$var_input]);
            $fp = fopen($file_path.$name, "wb");
            fwrite($fp, $data);
            fclose($fp);
            return true;
        }
        return false;
    }
    



    function no_tiket_keluhan( $cfg ){
        $param_kode     = 'CC'.date('ymd');
        $sql            =  "SELECT coalesce( (max(replace(no_tiket, '".$param_kode."', ''))+1), 1) last_num
                            FROM `keluhan`
                            where no_tiket like '".$param_kode."%'";
        $get            = get_data($cfg, $sql);
        $nomor_keluhan  = $param_kode.sprintf('%04d', $get[0]['last_num']);        
        return $nomor_keluhan;
    }


    function sendWA(){
        // $curl = curl_init();
	    // curl_setopt_array($curl, array(
        // CURLOPT_URL => "https://api.fonnte.com/send",
        // CURLOPT_RETURNTRANSFER => true,
        // CURLOPT_ENCODING => "",
        // CURLOPT_MAXREDIRS => 10,
        // CURLOPT_TIMEOUT => 0,
        // CURLOPT_FOLLOWLOCATION => true,
        // CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        // CURLOPT_CUSTOMREQUEST => "POST",
        // CURLOPT_POSTFIELDS => array(
        //         'target' => '085336269994',
        //         'message' => 'tes Fonnte',
        //         // 'url' => $data['url'],
        //         // 'filename' => $data['filename'],
        //     ),
        // CURLOPT_HTTPHEADER => array(
        //     "Authorization: h2E2!96PbUf3!HRy3dC4"
        // ),
        // ));

        // $response = curl_exec($curl);

        // curl_close($curl);

        // echo $response;

        // $data = [
        //     'target' => '081331143694',
        //     'message' => "tes 123"
        // ];
        // $curl = curl_init();
        // curl_setopt(
        //     $curl,
        //     CURLOPT_HTTPHEADER,
        //     array(
        //         "Authorization: h2E2!96PbUf3!HRy3dC4",
        //     )
        // );
        // curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "POST");
        // curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        // curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($data));
        // curl_setopt($curl, CURLOPT_URL, "https://api.fonnte.com/send");
        // curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
        // curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        // $result = curl_exec($curl);
        // curl_close($curl);

        // echo '<br><br>'.$result;


        $curl = curl_init();

        curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://api.fonnte.com/send',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => array(
            'target' => '081331143694',
            'message' => 'Pesan terkirim 123',
            'schedule' => '0',
            'typing' => false,
            'delay' => '2',
        ),
            CURLOPT_HTTPHEADER => array(
                'Authorization: w_zVfYES9D1JoyRG92Ys'
            ),
        ));

        $response = curl_exec($curl);
        if (curl_errno($curl)) {
        $error_msg = curl_error($curl);
        }
        curl_close($curl);

        if (isset($error_msg)) {
        echo $error_msg;
        }
        echo $response;
    }
    //end Global Funtion


?>