<?php
  include '../helper/app_function.php';
  $assets_path    = $base_url.'assets/';

  user_permission($base_url, true);

  $sql            = "SELECT * from (
                      select 
                      k.*
                      , mresto.resto nama_resto
                      , mmenu.menu nama_menu
                      , tk.tipe_keluhan nama_keluhan
                      , case when k.`status` = 'complain'
                          then 0 else 1
                        end sort_prioritas
                    FROM keluhan k
                    join master_resto mresto
                    on mresto.id = k.outlet_pembelian
                    join master_menu mmenu
                    on mmenu.id = k.menu_masalah
                    join tipe_keluhan tk
                    on tk.id = k.tipe_keluhan
                  ) d
                  order by sort_prioritas asc, no_tiket desc";
  $list_keluhan   = get_data($cfg_db, $sql);
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
    <title>Customer Complain | Mie Gacoan</title>
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
                  <h5>DataTables Customer Complain</h5>
                </div>
                <div class="col-sm-6">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">                                       <i data-feather="home"></i></a></li>
                    <li class="breadcrumb-item">Data Tables</li>
                    <li class="breadcrumb-item active">Customer Complain</li>
                  </ol>
                </div>
              </div>
            </div>
          </div>
          <!-- Container-fluid starts-->
          <div class="container-fluid">
            <div class="row">
              <!-- Zero Configuration  Starts--><!-- Zero Configuration  Ends-->
              <!-- Complex headers (rowspan and colspan) Starts-->
              <div class="col-sm-12">
                <div class="card">
                  <div class="card-header pb-0">
                    <div class="row">
                      <div class="col-sm-6 float-left">
                        <h5 class="float-left">Customer Complain</h5>
                      </div>
                      <div class="col-sm-6 d-flex justify-content-end">
                        <button class="btn btn-success mx-2" onclick="exportAllToExcel()">Export Excel</button>
                      </div>
                    </div>
                  </div>
                

                  <div class="card-body">
                    <div class="table-responsive">

                      <table class="display" id="basic-6">
                        <thead>
                          <tr>
							              <th>No</th>
                            <th>Nama Customer</th>
                            <th>No Tlp</th>
                            <th>Tgl Pembelian</th>
                            <th>Nama Resto</th>
                            <th>Tipe Keluhan</th>
                            <th>Menu</th>
                            <th>Jumlah</th>
                            <th>Foto Struk</th>
                            <th>Foto Makanan</th>
                            <th>Status</th>
                            <th>Action</th>
                          </tr>
                        </thead>
                        <tbody>
                          <?php foreach($list_keluhan as $key=>$d){ ?>
                            <?php 
                              $class_status = '';
                              if( strpos(strtolower($d['status']), 'one') ){
                                $class_status = 'st_done';
                              }elseif( strpos(strtolower($d['status']), 'progress') ){
                                $class_status = 'st_progress';
                              }elseif( strpos(strtolower($d['status']), 'plain') ){
                                $class_status = 'st_complain';
                              }
                            ?>

                            <tr id="<?php echo $d['id'] ?>">
                              <td><?php echo $key+1 ?></td>
                              <td><?php echo $d['no_tiket'] ?></td>
                              <td><?php echo $d['no_wa'] ?></td>
                              <td><?php echo date('d-m-Y', strtotime($d['tgl_pembelian'])) ?></td>
                              <td><?php echo $d['nama_resto'] ?></td>
                              <td><?php echo $d['nama_keluhan'] ?></td>
                              <td><?php echo $d['nama_menu'] ?></td>
                              <td><?php echo $d['jumlah'] ?></td>
                              <td class=""><a class="pdf" href="<?php echo $base_url.'preview/'.base64_encode( $base_url.'assets/upload/'.$d['no_tiket'].'_files/'.$d['foto_struk'] ) ?>" target="_blank"><i class="icofont icofont-file-pdf"></i></a></td>
                              <td class=""><a class="pdf" href="<?php echo $base_url.'preview/'.base64_encode( $base_url.'assets/upload/'.$d['no_tiket'].'_files/'.$d['foto_menu'] ) ?>" target="_blank"><i class="icofont icofont-file-pdf"></i></a></td>
                              <td><b class="st_ico <?php echo $class_status ?>"><?php echo $d['status'] ?></b></td>
                              <td>
                                <a href="javascript:void(0)" onClick="showFormEdit(this);"><i class="icofont icofont-edit"></i></a>
                                <a style="margin-left:20px;" href="<?php echo $base_url.'dashboard_detail/'.base64_encode( $d['id'] ) ?>"><i class="icofont icofont-file-pdf"></i></a>
                              </td>
                            </tr>
                          <?php } ?>


                          <!-- <tr>
                            <td>1</td>
                            <td>CC0001</td>
                            <td>0812345678</td>
                            <td>18-03-2024</td>
                            <td>MieGacoan - Bogor Pajajaran</td>
                            <td>Rasa</td>
                            <td>Mie Gacoan Level 1</td>
                            <td>1</td>
                            <td class=""><a class="pdf" href="sample.pdf" target="_blank"><i class="icofont icofont-file-pdf"></i></a></td>
                            <td class=""><a class="pdf" href="sample.pdf" target="_blank"><i class="icofont icofont-file-pdf"></i></a></td>
                            <td> <span class="badge rounded-pill badge-success">Done</span></td>
                            <td> 
                              <ul class="action"> 
                                <li class="edit"> <a href="#"><i class="icon-pencil-alt"></i></a></li>
								                <li class="edit"> <a class="pdf" href="sample.pdf" target="_blank"><i class="icofont icofont-file-pdf"></i></a></li>
                              </ul>
                            </td>
                          </tr> -->
                        </tbody>
                        <tfoot>
                          <tr>
                            <th>No</th>
                            <th>Nama Customer</th>
                            <th>No Tlp</th>
                            <th>Tgl Pembelian</th>
                            <th>Nama Resto</th>
                            <th>Tipe Keluhan</th>
                            <th>Menu</th>
                            <th>Jumlah</th>
                            <th>Foto Struk</th>
                            <th>Foto Makanan</th>
                            <th>Status</th>
                            <th>Action</th>
                          </tr>
                        </tfoot>
                      </table>

                    </div>
                  </div>
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


<script>
    var id_keluhan = '';

    function showFormEdit(elm){
      id_keluhan = $(elm).parents('tr').attr('id');

      Swal.fire({
        // title: "<strong>HTML <u>example</u></strong>",
        // icon: "edit",
        html: '<textarea id="ket_value" class="form-control" rows="10"></textarea>',
        showCloseButton: false,
        showCancelButton: true,
        cancelButtonText: `Batal`,
        showConfirmButton: true,
        confirmButtonText: `Konfirmasi`,
      }).then((result) => {
        if (result.isConfirmed) {
          $.ajax({
            type : "POST",
            data : {
            action    : 'upd_mkt',
              id		  : id_keluhan,
              value   : $('#ket_value').val(),
            },
            url : '<?php echo $base_url ?>dashboard_api',
            dataType: "json",
              success : function(resp){
                window.location.reload();
              },
            });
        }
      });
    }

</script>

<script>
function exportAllToExcel() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'dashboard/export_keluhan.php', true);
    xhr.responseType = 'blob';

    xhr.onload = function() {
        if (this.status === 200) {
            var blob = new Blob([this.response], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
            var link = document.createElement('a');
            link.href = window.URL.createObjectURL(blob);
            link.download = 'semua_data_keluhan.xlsx';
            link.click();
        }
    };

    xhr.send();
}
</script>
