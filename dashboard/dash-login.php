<?php 
    include "../helper/app_function.php";

    if( isset($_POST) && count($_POST)>0 ){
        // menangkap data yang dikirim dari form login
        $username = $_POST['username'];
        $password = md5($_POST['password']);

        // menyeleksi data user dengan username dan password yang sesuai
        $sql    = "select pu.*, mresto.resto From ppa_user pu
                    left join master_resto mresto
                    on mresto.id = pu.id_resto
                    where pu.username = '".$username."' 
                    and pu.password = '".$password."'";
        $login  = get_data($cfg_db, $sql);
        // menghitung jumlah data yang ditemukan
        $cek = count($login);

        // cek apakah username dan password di temukan pada database
        if($cek > 0){

            // $data = mysqli_fetch_assoc($login);
            $data   = $login[0];

            //buat session login
            $_SESSION['nama']       = $login[0]['nama'];
            $_SESSION['username']   = $username;
            $_SESSION['level']      = $login[0]['level'];

            // cek jika user login sebagai admin
            if($data['level']=="marketing"){

                // alihkan ke halaman dashboard admin
                header("location:".$base_url."dashboard_marketing");

            // cek jika user login sebagai pegawai
            }else if($data['level']=="resto"){
                // buat session login dan username
                $_SESSION['resto']      = $login[0]['id_resto']; 
                $_SESSION['resto_nama'] = $login[0]['resto']; 
                // alihkan ke halaman dashboard pegawai
                header("location:".$base_url."dashboard_resto");

            // cek jika user login sebagai pengurus
            }else{

                // alihkan ke halaman login kembali
                header("location:".$base_url."dashboard?pesan=gagal");
            }

            
        }else{
            header("location:".$base_url."dashboard?pesan=gagal");
        }
        die;    
    }else{
        user_permission($base_url);
    }

    $assets_path = $base_url.'assets/';
?>

<?php include './layouts/login/session.php'; ?>
<?php include './layouts/login/main.php'; ?>

<head>
    <title>Customer Complain | Mie Gacoan</title>
    <?php include './layouts/login/title-meta.php'; ?>
    <?php include './layouts/login/head-css.php'; ?>
</head>


<body class="authentication-bg position-relative">

<?php include './layouts/login/background.php'; ?>

    <div class="account-pages pt-2 pt-sm-5 pb-4 pb-sm-5 position-relative">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xxl-4 col-lg-5">
                    <div class="card">

                        <!-- Logo -->
                        <div class="card-header py-4 text-center bg-primary">
                            <a href="index.php">
                                <span><img src="<?php echo $assets_path ?>images/logo.png" alt="logo" height="55"></span>
                            </a>
                        </div>

                        <div class="card-body p-4">

                            <div class="text-center w-75 m-auto">
                                <h4 class="text-dark-50 text-center pb-0 fw-bold">Sign In</h4>
                                <p class="text-muted mb-4">Enter your email address and password to access admin panel.</p>
                            </div>

                            <form method="post" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="POST">

                                <div class="mb-3">
                                    <label for="emailaddress" class="form-label">Email address</label>
									<input type="text" name="username" class="form-control" placeholder="Username .." required="required">
                                    
                                </div>

                                <div class="mb-3">
                                    <a href="auth-recoverpw.php" class="text-muted float-end fs-12">Forgot your password?</a>
                                    <label for="password" class="form-label">Password</label>
                                    <div class="input-group input-group-merge">
										<input type="password" name="password" class="form-control" placeholder="Password .." required="required">
                                        <div class="input-group-text" data-password="false">
                                            <span class="password-eye"></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-3 mb-3">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="checkbox-signin" checked>
                                        <label class="form-check-label" for="checkbox-signin">Remember me</label>
                                    </div>
                                </div>

                                <div class="mb-3 mb-0 text-center">
                                    <button class="btn btn-primary" type="submit"> Log In </button>
                                </div>

                            </form>
                        </div> <!-- end card-body -->
                    </div>
                    <!-- end card -->
                    <!-- end row -->

                </div> <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
    <!-- end page -->

    <footer class="footer footer-alt fw-medium">
        <span class="bg-body">
            <script>
                document.write(new Date().getFullYear())
            </script> © Pesta Pora Abadi - miegacoan.co.id
        </span>
    </footer>
    <?php include './layouts/login/footer-scripts.php'; ?>

    <!-- App js -->
    <script src="<?php echo $assets_path ?>js/app.min.js"></script>

</body>

</html>