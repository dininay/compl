
<?php
/*
Our php.ini contains the following settings:

display_errors = On
register_globals = Off
post_max_size = 8M
*/

echo 'display_errors = ' . ini_get('display_errors') . "<br>";
echo 'register_globals = ' . ini_get('register_globals') . "<br>";
echo 'post_max_size = ' . ini_get('post_max_size') . "<br>";
echo 'post_max_size+1 = ' . (ini_get('post_max_size')+1) . "<br>";
echo 'post_max_size in bytes = ' . return_bytes(ini_get('post_max_size'));

// At start of script
$time_start = microtime(true); 
// Anywhere else in the script
echo '<br><br>Total execution time in seconds: ' . (microtime(true) - $time_start);

function return_bytes($val) {
    $val = trim($val);
    $last = strtolower($val[strlen($val)-1]);
    switch($last) {
        // The 'G' modifier is available
        case 'g':
            $val *= 1024;
        case 'm':
            $val *= 1024;
        case 'k':
            $val *= 1024;
    }

    return $val;
}

?>
