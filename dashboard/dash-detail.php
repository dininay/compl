<?php
  include '../helper/app_function.php';
  $assets_path    = $base_url.'assets/';

  user_permission($base_url);

  $data_ok = false;
  if( isset($_GET['id']) && trim($_GET['id'])!='' ){
    $sql        = "select 
                      k.*
                      , mc.city
                      , mr.resto
                      , mm.menu
                      , tk.tipe_keluhan nama_keluhan
                    From keluhan k
                    join master_city mc
                    on mc.id = k.area_pembelian
                    join master_resto mr
                    on mr.id = k.outlet_pembelian
                    join master_menu mm
                    on mm.id = k.menu_masalah
                    join tipe_keluhan tk
                    on tk.id = k.tipe_keluhan
                    where k.id = '".base64_decode($_GET['id'])."'";

    $get_detail = get_data($cfg_db, $sql);
    if(count($get_detail)>0){
      $data_ok= true;
      $detail = $get_detail[0];
    }
  }


  if( !$data_ok ){
    header('location:'.$base_url.'dashboard');
    die;
  }
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Enzo admin is super flexible, powerful, clean &amp; modern responsive bootstrap 5 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, Enzo admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="pixelstrap">
    <link rel="icon" href="<?php echo $assets_path ?>images/favicon/favicon.png" type="image/x-icon">
    <link rel="shortcut icon" href="<?php echo $assets_path ?>images/favicon/favicon.png" type="image/x-icon">
    <title>Detail Customer Complain | Mie Gacoan</title>
    <!-- Google font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<?php echo $assets_path ?>vendors/font-awesome/font-awesome.css">
    <!-- ico-font-->
    <link rel="stylesheet" type="text/css" href="<?php echo $assets_path ?>css/vendors/icofont.css">
    <!-- Themify icon-->
    <link rel="stylesheet" type="text/css" href="<?php echo $assets_path ?>css/vendors/themify.css">
    <!-- Flag icon-->
    <link rel="stylesheet" type="text/css" href="<?php echo $assets_path ?>css/vendors/flag-icon.css">
    <!-- Feather icon-->
    <link rel="stylesheet" type="text/css" href="<?php echo $assets_path ?>css/vendors/feather-icon.css">
    <!-- Plugins css start-->
    <link rel="stylesheet" type="text/css" href="<?php echo $assets_path ?>vendors/scrollbar/scrollbar.css">
    <link rel="stylesheet" type="text/css" href="<?php echo $assets_path ?>vendors/datatable/datatables/datatables.css">
    <!-- Plugins css Ends-->
    <!-- Bootstrap css-->
    <link rel="stylesheet" type="text/css" href="<?php echo $assets_path ?>vendors/bootstrap/bootstrap.css">
    <!-- App css-->
    <link rel="stylesheet" type="text/css" href="<?php echo $assets_path ?>css/style.css">
    <link id="color" rel="stylesheet" href="<?php echo $assets_path ?>css/color-1.css" media="screen">
    <!-- Responsive css-->
    <link rel="stylesheet" type="text/css" href="<?php echo $assets_path ?>css/responsive.css">
    <!-- SweetAlert css-->
    <link rel="stylesheet" type="text/css" href="<?php echo $assets_path ?>vendors/sweetalert/sweetalert2.min.css">

    <link rel="stylesheet" type="text/css" href="<?php echo $assets_path ?>css/custom.css">
  </head>
  <body>
    <!-- tap on top starts-->
    <div class="tap-top"><i data-feather="chevrons-up"></i></div>
    <!-- tap on tap ends-->
    <!-- Loader starts-->
    <div class="loader-wrapper">
      <div class="loader"></div>
    </div>
    <!-- Loader ends-->
    <!-- page-wrapper Start-->
    <div class="page-wrapper compact-wrapper" id="pageWrapper">
      <!-- Page Header Start-->
	<?php 
		  	include './layouts/dashboard/top-sidebar.php';
		  ?>
      <!-- Page Header Ends                              -->
      <!-- Page Body Start-->
      <div class="page-body-wrapper">
        <!-- Page Sidebar Start-->
		  <?php 
		  	include './layouts/dashboard/right-sidebar-admin.php';
		  ?>
		  <!-- Page Sidebar Ends-->
        <div class="page-body">
          <div class="container-fluid">
            <div class="page-title">
              <div class="row">
                <div class="col-sm-6">
                  <h5>Detail Customer Complain</h5>
                </div>
                <div class="col-sm-6">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">                                       <i data-feather="home"></i></a></li>
                    <li class="breadcrumb-item">Detail</li>
                    <li class="breadcrumb-item active">Laporan Customer Complain</li>
                  </ol>
                </div>
              </div>
            </div>
          </div>
          <!-- Container-fluid starts-->
          <div class="container-fluid">
            <?php 
              $class_status['status'] = '';
              if( strpos(strtolower($detail['status']), 'one') ){
                $class_status = 'st_done';
              }elseif( strpos(strtolower($detail['status']), 'progress') ){
                $class_status = 'st_progress';
              }elseif( strpos(strtolower($detail['status']), 'plain') ){
                $class_status = 'st_complain';
              }
            ?>

            <div class="row">
              <!-- Zero Configuration  Starts--><!-- Zero Configuration  Ends-->
              <!-- Complex headers (rowspan and colspan) Starts-->
              <div class="col-sm-12">
                <div class="card">
                  <div class="card-header pb-0">
                    <h5>Nomor Tiket <?php echo $detail['no_tiket'] ?> <b class="st_ico <?php echo $class_status ?>"><?php echo $detail['status'] ?></b></h5>
                  </div>
                  <!-- Card Body -->
                  <div class="card-body">
                  
                  
                    <!-- Informasi Pelanggan -->
                    <div class="row">
                        <div class="col-12">
                              <div class="card">
                                <div class="card-body">

                                    <h4 class="header-title">INFORMASI PELANGGAN</h4>

                                    <div class="row">
                                        <div class="col-lg-6">
                                          <div class="mb-3">
                                            <label for="simpleinput" class="form-label">Nama</label>
                                            <div class="form-control"><?php echo $detail['nama'] ?></div>
                                          </div>

                                          <div class="mb-3">
                                            <label for="example-password" class="form-label">No. Handphone / WhatsApp Aktif </label>
                                            <div class="form-control"><?php echo $detail['no_wa'] ?></div>
                                          </div>
												
												                  <div class="mb-3">
                                            <label for="example-password" class="form-label">Alamat Email</label>
                                            <div class="form-control"><?php echo $detail['email'] ?></div>
                                          </div>
                                              
                                          <div class="mb-3">
                                            <label for="example-email" class="form-label">Area Tempat Tinggal</label>
                                            <div class="form-control"><?php echo nl2br($detail['alamat']) ?></div>
                                          </div>
												
											                    <div class="mb-3">
                                            <label for="example-date" class="form-label">Tanggal Lahir</label>
                                            <div class="form-control"><?php echo date('d/m/Y', strtotime($detail['tgl_lahir'])) ?></div>
                                          </div>

                                          <h6 class="fs-15 mt-3">Jenis Kelamin</h6>
                                          <div class="mt-2">
                                            <div class="form-check form-check-inline">
                                              <input type="radio" id="customRadio3" name="jenis_kelamin" class="form-check-input" value="L" <?php echo $detail['jen_kel'] == 'L' ? 'checked' : '' ?> disabled>
                                              <label class="form-check-label" for="customRadio3">Laki-Laki</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                              <input type="radio" id="customRadio4" name="jenis_kelamin" class="form-check-input" value="P" <?php echo $detail['jen_kel'] == 'P' ? 'checked' : '' ?> disabled>
                                              <label class="form-check-label" for="customRadio4">Perempuan</label>
                                            </div>
                                          </div>
                                           
                                        </div> <!-- end col -->

                                        <div class="col-lg-6">

                                          <style>
                                            .card-note{
                                              background:#FFF7D1;
                                              border-radius:6px;
                                              padding:10px;
                                            }
                                          </style>
                                          <?php if( trim($detail['catatan_marketing']) != '' ){ ?>
                                            <div class="row">
                                              <div class="col-lg-12 card-note">
                                                <div><b>Catatan Marketing</b> <i>(<?php echo date('d/m/Y', strtotime($detail['tgl_status_1'])) ?>)</i></div>
                                                <p><?php echo nl2br($detail['catatan_marketing']) ?></p>
                                              </div>
                                            </div>
                                          <?php } ?>
                                          
                                          <?php if( trim($detail['catatan_resro']) != '' ){ ?>
                                            <br>
                                            <div class="row">
                                              <div class="col-lg-12 card-note">
                                                <div><b>Catatan Resto</b> <i>(<?php echo date('d/m/Y', strtotime($detail['tgl_status_2'])) ?>)</i></div>
                                                <p><?php echo nl2br($detail['catatan_resro']) ?></p>
                                              </div>
                                            </div>
                                          <?php } ?>

                                        </div> <!-- end col -->
                                    </div>
                                    <!-- end row-->
                                </div> <!-- end card-body -->
                              </div> <!-- end card -->
                        </div><!-- end col -->
                    </div><!-- end row -->
                    <!-- end Informasi Pelanggan -->


                    <!-- Informasi Keluhan -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                              <div class="card-body">

                                  <h4 class="header-title">INFORMASI PEMBELIAN DAN KELUHAN</h4>
                                  
                                  <div class="row">
                                    <div class="col-lg-6">
                                      <div class="mb-3">
                                        <label for="example-date" class="form-label">Tanggal Pembelian</label>
                                        <div class="form-control"><?php echo date('d/m/Y', strtotime($detail['tgl_pembelian'])) ?></div>
                                      </div>
                                                
                                      <div class="mb-3">
                                        <label for="example-select" class="form-label">Kota Pembelian</label>
                                        <div class="form-control"><?php echo $detail['city'] ?></div>
                                      </div>
											
												              <div class="mb-3">
                                        <label for="example-select" class="form-label">Nama Resto</label>
                                        <div class="form-control"><?php echo $detail['resto'] ?></div>
                                      </div>
											
												              <div class="mb-3">
                                        <label for="example-select" class="form-label">Tipe Keluhan</label>
                                        <div class="form-control"><?php echo $detail['nama_keluhan'] ?></div>
                                      </div>
												
                                      <div class="mb-3">
                                        <label for="example-select" class="form-label">Menu yang Dikeluhkan</label>
                                        <div class="form-control"><?php echo $detail['menu'] ?></div>
                                      </div>

                                      <div class="mb-3">
                                        <label for="example-password" class="form-label">Jumlah</label>
                                        <div class="form-control"><?php echo $detail['jumlah'] ?></div>
                                      </div>
												
												              <div class="mb-3">
                                        <label for="example-password" class="form-label">Rincian Keluhan</label>
                                        <div class="form-control"><?php echo nl2br($detail['rincian_keluhan']) ?></div>
                                      </div>
												
												
												              <div class="mb-3">
                                        <label for="example-fileinput" class="form-label">Foto Struk Pembelian</label>
                                        <br>
                                        <a class="btn btn-primary" href="<?php echo $base_url.'preview/'.base64_encode( $base_url.'assets/upload/'.$detail['no_tiket'].'_files/'.$detail['foto_struk'] ) ?>" target="_blank"><i class="icofont icofont-file-pdf"></i> Lihat Foto Struk Pembelian</a>
                                      </div>
												
										                  <div class="mb-3">
                                        <label for="example-fileinput" class="form-label">Foto Menu Bermasalah</label>
                                        <br>
                                        <a class="btn btn-primary" href="<?php echo $base_url.'preview/'.base64_encode( $base_url.'assets/upload/'.$detail['no_tiket'].'_files/'.$detail['foto_menu'] ) ?>" target="_blank"><i class="icofont icofont-file-pdf"></i> Lihat Foto Menu Bermasalah</a>
                                      </div>
                                    </div> <!-- end col -->

                                    <div class="col-lg-6"></div> <!-- end col -->
                                  </div>
                                  <!-- end row-->

                                  <br><hr>
                                  <div class="row">
                                    <div class="col-lg-12 text-center">
                                      <a class="btn btn-primary" href="<?php echo $base_url ?>dashboard" style="border-radius:10px;">Kembali ke Dashboard</a>
                                    </div>
                                  </div>

                              </div> <!-- end card-body -->
                            </div> <!-- end card -->
                        </div><!-- end col -->
                    </div><!-- end row -->
                    <!-- Informasi Keluhan -->


                  </div>
                  <!-- end Card Body -->
                </div>
              </div>
              <!-- Complex headers (rowspan and colspan) Ends-->
              <!-- State saving Starts--><!-- State saving Ends-->
              <!-- Scroll - vertical dynamic Starts--><!-- Scroll - vertical dynamic Ends-->
            </div>
          </div>
          <!-- Container-fluid Ends-->
        </div>
        <!-- footer start-->
        <footer class="footer">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-6 p-0 footer-left">
                <p class="mb-0">Copyright © 2023 Enzo. All rights reserved.</p>
              </div>
              <div class="col-md-6 p-0 footer-right">
                <ul class="color-varient">
                  <li></li>
                  <li></li>
                  <li></li>
                  <li></li>
                </ul>
                <p class="mb-0 ms-3">Hand-crafted & made with <i class="fa fa-heart font-danger"></i></p>
              </div>
            </div>
          </div>
        </footer>
      </div>
    </div>
    <!-- latest jquery-->
    <script src="<?php echo $assets_path ?>vendors/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap js-->
    <script src="<?php echo $assets_path ?>vendors/bootstrap/bootstrap.bundle.min.js"></script>
    <!-- feather icon js-->
    <script src="<?php echo $assets_path ?>vendors/icons/feather-icon/feather.min.js"></script>
    <script src="<?php echo $assets_path ?>vendors/icons/feather-icon/feather-icon.js"></script>
    <!-- scrollbar js-->
    <script src="<?php echo $assets_path ?>vendors/scrollbar/simplebar.js"></script>
    <script src="<?php echo $assets_path ?>vendors/scrollbar/custom.js"></script>
    <!-- Sidebar jquery-->
    <script src="<?php echo $assets_path ?>js/config_dashboard.js"></script>
    <!-- Plugins JS start-->
    <script src="<?php echo $assets_path ?>js/sidebar-menu.js"></script>
    <script src="<?php echo $assets_path ?>vendors/datatable/datatables/jquery.dataTables.min.js"></script>
    <script src="<?php echo $assets_path ?>vendors/datatable/datatables/datatable.custom.js"></script>
    <!-- Plugins JS Ends-->
    <!-- Theme js-->
    <script src="<?php echo $assets_path ?>js/script.js"></script>
    <script src="<?php echo $assets_path ?>vendors/theme-customizer/customizer.js"></script>
    <!-- login js-->
    <!-- Plugin used-->

    <!-- Sweet Alert js-->
    <script src="<?php echo $assets_path ?>vendors/sweetalert/sweetalert2.min.js"></script>
  </body>
</html>