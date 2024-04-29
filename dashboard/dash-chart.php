<?php
  include '../helper/app_function.php';
  $assets_path    = $base_url.'assets/';

  user_permission($base_url);

  // Koneksi ke database
  $conn = new mysqli("localhost", "root", "", "prj_keluhan");

  // Periksa koneksi
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  }

  // Ambil data dari tabel tipe_keluhan untuk dropdown "Nama Keluhan"
$sql_tipe_keluhan = "SELECT DISTINCT tipe_keluhan.id, tipe_keluhan.tipe_keluhan 
FROM keluhan 
INNER JOIN tipe_keluhan ON keluhan.tipe_keluhan = tipe_keluhan.id";
$result_tipe_keluhan = $conn->query($sql_tipe_keluhan);

// Buat opsi untuk pilihan nama keluhan
$tipe_keluhan_options = "";
if ($result_tipe_keluhan->num_rows > 0) {
    while ($row = $result_tipe_keluhan->fetch_assoc()) {
        $tipe_keluhan_options .= "<option value='".$row['id']."'>".$row['tipe_keluhan']."</option>";
    }
}

// Ambil data dari tabel keluhan untuk dropdown "Restoran Pembelian"
$sql_keluhan = "SELECT DISTINCT master_resto.id, master_resto.resto 
                FROM keluhan 
                INNER JOIN master_resto ON keluhan.outlet_pembelian = master_resto.id";
$result_keluhan = $conn->query($sql_keluhan);

// Buat opsi untuk pilihan restoran pembelian
$keluhan_options = "";
if ($result_keluhan->num_rows > 0) {
    while ($row = $result_keluhan->fetch_assoc()) {
        $keluhan_options .= "<option value='".$row['id']."'>".$row['resto']."</option>";
    }
}

  // Query untuk mengambil total data keluhan
  $sqlTotalKeluhan = "SELECT COUNT(*) AS total_keluhan FROM keluhan";
  $resultTotalKeluhan = $conn->query($sqlTotalKeluhan);
  $rowTotalKeluhan = $resultTotalKeluhan->fetch_assoc();
  $totalKeluhan = $rowTotalKeluhan['total_keluhan'];

  // Query untuk mengambil jumlah data dengan status "Done" dan "Complaint"
  $sqlStatusKeluhan = "SELECT
                          SUM(CASE WHEN LOWER(status) LIKE '%done%' THEN 1 ELSE 0 END) AS jumlah_done,
                          SUM(CASE WHEN LOWER(status) LIKE '%complaint%' THEN 1 ELSE 0 END) AS jumlah_complaint
                        FROM keluhan";
  $resultStatusKeluhan = $conn->query($sqlStatusKeluhan);
  $rowStatusKeluhan = $resultStatusKeluhan->fetch_assoc();
  $jumlahDone = $rowStatusKeluhan['jumlah_done'];
  $jumlahComplaint = $rowStatusKeluhan['jumlah_complaint'];

  $sqlTipeKeluhan = "SELECT tipe_keluhan.tipe_keluhan AS nama_tipe_keluhan, COUNT(*) as jumlah
                    FROM keluhan 
                    INNER JOIN tipe_keluhan ON keluhan.tipe_keluhan = tipe_keluhan.id 
                    GROUP BY keluhan.tipe_keluhan";

$resultTipeKeluhan = $conn->query($sqlTipeKeluhan);

// Format data untuk digunakan dalam Chart.js
$tipeKeluhanData = [];
while ($row = $resultTipeKeluhan->fetch_assoc()) {
    $tipeKeluhanData['labels'][] = $row['nama_tipe_keluhan']; // Menggunakan nama tipe keluhan dari tabel tipe_keluhan
    $tipeKeluhanData['data'][] = $row['jumlah'];
}
// Query untuk mengambil data outlet pembelian dari tabel keluhan dan mengonversi ID ke nama resto
$sqlOutletPembelian = "SELECT master_resto.resto AS resto, COUNT(*) as jumlah 
                       FROM keluhan 
                       INNER JOIN master_resto ON keluhan.outlet_pembelian = master_resto.id 
                       GROUP BY keluhan.outlet_pembelian";
$resultOutletPembelian = $conn->query($sqlOutletPembelian);

// Format data untuk digunakan dalam Chart.js
$outletPembelianData = [];
while ($row = $resultOutletPembelian->fetch_assoc()) {
    $outletPembelianData['labels'][] = $row['resto']; // Menggunakan nama resto sebagai label
    $outletPembelianData['data'][] = $row['jumlah'];
}

  // Simpan hasil query ke dalam array $list_keluhan
  $list_keluhan = [];

  // Ambil data dari tabel tipe_keluhan untuk dropdown "Nama Keluhan"
  $sql_tipe_keluhan = "SELECT DISTINCT tipe_keluhan.id, tipe_keluhan.tipe_keluhan 
  FROM keluhan 
  INNER JOIN tipe_keluhan ON keluhan.tipe_keluhan = tipe_keluhan.id";
  $result_tipe_keluhan = $conn->query($sql_tipe_keluhan);

  // Buat opsi untuk pilihan nama keluhan
  $tipe_keluhan_options = "";
  if ($result_tipe_keluhan->num_rows > 0) {
      while ($row = $result_tipe_keluhan->fetch_assoc()) {
          $tipe_keluhan_options .= "<option value='".$row['id']."'>".$row['tipe_keluhan']."</option>";
      }
  }

  // Ambil data dari tabel keluhan untuk dropdown "Restoran Pembelian"
  $sql_keluhan = "SELECT DISTINCT master_resto.id, master_resto.resto 
                  FROM keluhan 
                  INNER JOIN master_resto ON keluhan.outlet_pembelian = master_resto.id";
  $result_keluhan = $conn->query($sql_keluhan);

  // Buat opsi untuk pilihan restoran pembelian
  $keluhan_options = "";
  if ($result_keluhan->num_rows > 0) {
      while ($row = $result_keluhan->fetch_assoc()) {
          $keluhan_options .= "<option value='".$row['id']."'>".$row['resto']."</option>";
      }
  }

  // Simpan hasil query ke dalam array $list_keluhan
$list_keluhan = [];

// Setelah pemrosesan formulir
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Ambil nilai dari formulir
    $tgl_awal = $_POST['tgl_awal'];
    $tgl_akhir = $_POST['tgl_akhir'];
    $sortby = $_POST['sortby'];

    if ($sortby == "tipe_keluhan") {
      // Query untuk mengambil data tipe keluhan dari tabel keluhan
      $sql = "SELECT tipe_keluhan.tipe_keluhan AS tipe_keluhan, COUNT(*) as jumlah 
              FROM keluhan 
              INNER JOIN tipe_keluhan ON keluhan.tipe_keluhan = tipe_keluhan.id 
              WHERE tgl_pembelian BETWEEN '$tgl_awal' AND '$tgl_akhir' 
              GROUP BY keluhan.tipe_keluhan";
  } elseif ($sortby == "outlet_pembelian") {
      // Query untuk mengambil data outlet pembelian dari tabel keluhan
      $sql = "SELECT master_resto.resto AS resto, COUNT(*) as jumlah 
              FROM keluhan 
              INNER JOIN master_resto ON keluhan.outlet_pembelian = master_resto.id 
              WHERE tgl_pembelian BETWEEN '$tgl_awal' AND '$tgl_akhir' 
              GROUP BY keluhan.outlet_pembelian";
  }

  // Lakukan query ke database
  $result = $conn->query($sql);

  // Format data untuk digunakan dalam Chart.js
  $chartData = [];
  while ($row = $result->fetch_assoc()) {
      // Menggunakan nama tipe keluhan atau nama resto sebagai label
      $chartData['labels'][] = $row['tipe_keluhan'] ?? $row['resto'];
      $chartData['data'][] = $row['jumlah'];
  }

  // Panggil fungsi JavaScript untuk menampilkan chart setelah pengiriman formulir
  echo "<script>showChart();</script>";
}


// Tutup koneksi database
$conn->close();

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
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.6.5/css/buttons.dataTables.min.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
  <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

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
                    <li class="breadcrumb-item active">Customer Complain</li>
                  </ol>
                </div>
              </div>
            </div>
          </div>
          <!-- Container-fluid starts-->
          <div class="container-fluid">
            
            <div class="container">
              <div class="row">
                <div class="col-lg-12">
                  <div class="card">
                    <div class="card-body">
                      <h5 class="card-title">Search Complain</h5>
                      <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <form method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <input type="date" name="tgl_awal" id="tgl_awal" class="form-control" required>
                                                </div>
                                                <div class="col-md-4">
                                                    <input type="date" name="tgl_akhir" id="tgl_akhir" class="form-control" required>
                                                </div>
                                                <div class="col-md-4">
                                                    <select name="sortby" id="sortby" class="form-select">
                                                        <option value="" disabled selected>Pilih Berdasarkan</option>
                                                        <option value="tipe_keluhan">Tipe Keluhan</option>
                                                        <option value="outlet_pembelian">Resto</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                            <button type="button" class="btn btn-warning" onclick="window.history.back();">Batal</button>
                                            <button class="btn btn-success" onclick="saveToExcel('Keluhan')">Export All Data Excel</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                      </div>
                    </div>
                  </div> 
                </div>
              </div>
            </div>
            
            <div class="container mt-4 d-flex justify-content-center" id="searchResults">
                <div class="col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Search Results</h5>
                        <div id="searchResultsContent">
                        <canvas id="chart" width="200" height="200" style="display: none;"></canvas>
                            <div class="mt-3 d-flex justify-content-center">
                                <button class="btn btn-success mx-2" onclick="printChartToExcel('chart')">Print Excel</button>
                                <button class="btn btn-primary mx-2" onclick="printChartToPNG('chart')">Print PNG</button>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>

          <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body">
                            <canvas id="chartTotalKeluhan" width="200" height="200"></canvas>
                            <div class="mt-3 d-flex justify-content-center">
                                <button class="btn btn-primary mx-2" onclick="printChartToPNG('chartTotalKeluhan')">Print PNG</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body">
                            <canvas id="chartStatusKeluhan" width="200" height="200"></canvas>
                            <div class="mt-3 d-flex justify-content-center">
                                <button class="btn btn-primary mx-2" onclick="printChartToPNG('chartStatusKeluhan')">Print PNG</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body">
                            <canvas id="chartTipeKeluhan" width="200" height="200"></canvas>
                            <div class="mt-3 d-flex justify-content-center">
                                <button class="btn btn-primary mx-2" onclick="printChartToPNG('chartTipeKeluhan')">Print PNG</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body">
                            <canvas id="chartOutletPembelian" width="200" height="200"></canvas>
                            <div class="mt-3 d-flex justify-content-center">
                                <button class="btn btn-primary mx-2" onclick="printChartToPNG('chartOutletPembelian')">Print PNG</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          </div>

          <div class="container">
            <div class="row d-flex justify-content-center">
            </div>
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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
      // Mengambil data dari PHP untuk chart utama
      var chartData = <?php echo json_encode($chartData); ?>;

      // Fungsi untuk menampilkan chart setelah formulir dikirim
      function showChart() {
          // Mendapatkan elemen canvas untuk chart
          var chartCanvas = document.getElementById('chart');

          // Menampilkan elemen canvas
          chartCanvas.style.display = 'block';
      }

      // Panggil fungsi showChart di sini
      showChart();

      // Pastikan data chart tidak kosong sebelum membuat chart
      if (chartData && chartData.labels && chartData.labels.length > 0) {
          // Mendapatkan canvas untuk grafik
          var ctxChart = document.getElementById('chart').getContext('2d');

          // Membuat grafik dengan Chart.js
          var chart = new Chart(ctxChart, {
              type: 'bar',
              data: {
                  labels: chartData.labels,
                  datasets: [{
                      label: 'Total Keluhan',
                      data: chartData.data,
                      backgroundColor: 'rgba(54, 162, 235, 0.2)',
                      borderColor: 'rgba(54, 162, 235, 1)',
                      borderWidth: 1
                  }]
              },
              options: {
                  scales: {
                      yAxes: [{
                          ticks: {
                              beginAtZero: true
                          }
                      }]
                  }
              }
          });
      }
    </script>

    <script>
      document.getElementById("sortby").addEventListener("change", toggleDropdown);

      function toggleDropdown() {
          var berdasarkan = document.getElementById("sortby").value;
          if (berdasarkan == "tipe_keluhan") {
              document.getElementById("select_tipe_keluhan").style.display = "block";
              document.getElementById("select_resto").style.display = "none";
          } else if (berdasarkan == "resto") {
              document.getElementById("select_tipe_keluhan").style.display = "none";
              document.getElementById("select_resto").style.display = "block";
          }
      }
    </script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/exceljs/4.4.0/exceljs.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <!-- JS Chart Utama -->
  <script>
    var totalKeluhan = <?php echo $totalKeluhan; ?>;
    var jumlahDone = <?php echo $jumlahDone; ?>;
    var jumlahComplaint = <?php echo $jumlahComplaint; ?>;

    var ctxTotalKeluhan = document.getElementById('chartTotalKeluhan').getContext('2d');
    var chartTotalKeluhan = new Chart(ctxTotalKeluhan, {
      type: 'bar',
      data: {
        labels: ['Total Keluhan'],
        datasets: [{
          label: 'Total Keluhan',
          backgroundColor: 'rgba(54, 162, 235, 0.2)',
          borderColor: 'rgba(54, 162, 235, 1)',
          borderWidth: 1,
          data: [<?php echo $totalKeluhan; ?>]
        }]
      },
      options: {
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            }
          }]
        }
      }
    });

    var ctxStatusKeluhan = document.getElementById('chartStatusKeluhan').getContext('2d');
    var chartStatusKeluhan = new Chart(ctxStatusKeluhan, {
      type: 'pie',
      data: {
        labels: ['Done', 'Complaint'],
        datasets: [{
          label: 'Status Keluhan',
          backgroundColor: ['#36A2EB', '#FF6384'],
          borderColor: 'rgba(255, 255, 255, 0.1)',
          borderWidth: 1,
          data: [<?php echo $jumlahDone; ?>, <?php echo $jumlahComplaint; ?>]
        }]
      },
      options: {
        responsive: true,
        legend: {
          position: 'top',
        },
        title: {
          display: true,
          text: 'Data Status Keluhan'
        },
        animation: {
          animateScale: true,
          animateRotate: true
        }
      }
    });
  </script>

  <!-- Chart Tipe JS -->
  <script>
      // Mengambil data tipe keluhan dari PHP
      var tipeKeluhanData = <?php echo json_encode($tipeKeluhanData); ?>;

      // Mendapatkan canvas untuk grafik
      var ctxTipeKeluhan = document.getElementById('chartTipeKeluhan').getContext('2d');

      // Membuat grafik dengan Chart.js
      var chartTipeKeluhan = new Chart(ctxTipeKeluhan, {
          type: 'bar',
          data: {
              labels: tipeKeluhanData.labels,
              datasets: [{
                  label: 'Total Keluhan berdasarkan Tipe Keluhan',
                  data: tipeKeluhanData.data,
                  backgroundColor: 'rgba(54, 162, 235, 0.2)',
                  borderColor: 'rgba(54, 162, 235, 1)',
                  borderWidth: 1
              }]
          },
          options: {
              scales: {
                  yAxes: [{
                      ticks: {
                          beginAtZero: true
                      }
                  }]
              }
          }
      });
  </script>

  <!-- Chart Outlet JS -->
  <script>
      // Mengambil data outlet pembelian dari PHP
      var outletPembelianData = <?php echo json_encode($outletPembelianData); ?>;

      // Mendapatkan canvas untuk grafik
      var ctxOutletPembelian = document.getElementById('chartOutletPembelian').getContext('2d');

      // Membuat grafik dengan Chart.js
      var chartOutletPembelian = new Chart(ctxOutletPembelian, {
          type: 'bar',
          data: {
              labels: outletPembelianData.labels,
              datasets: [{
                  label: 'Total Keluhan berdasarkan Outlet Pembelian',
                  data: outletPembelianData.data,
                  backgroundColor: 'rgba(255, 99, 132, 0.2)',
                  borderColor: 'rgba(255, 99, 132, 1)',
                  borderWidth: 1
              }]
          },
          options: {
              scales: {
                  yAxes: [{
                      ticks: {
                          beginAtZero: true
                      }
                  }]
              }
          }
      });
  </script>

  <!-- JS Print -->
  <script>

    function printChartToPNG(chartId) {
        // Mendapatkan canvas dari ID chart
        var canvas = document.getElementById(chartId);
        
        // Mengonversi canvas menjadi gambar PNG
        var imgData = canvas.toDataURL("image/png");

        // Membuat sebuah link yang merujuk ke gambar PNG
        var link = document.createElement('a');
        link.download = chartId + '.png';
        link.href = imgData;
        
        // Mengklik link untuk mengunduh gambar PNG
        link.click();

        // Dummy log untuk keperluan contoh
        console.log("Printing chart to PNG...");
    }
  </script>

<script>
    // Validasi formulir sebelum pengiriman
    document.querySelector('form').addEventListener('submit', function(event) {
        var tgl_awal = document.getElementById('tgl_awal').value;
        var tgl_akhir = document.getElementById('tgl_akhir').value;
        var sortby = document.getElementById('sortby').value;

        if (!tgl_awal || !tgl_akhir || !sortby) {
            event.preventDefault(); // Hentikan pengiriman formulir jika salah satu input kosong
            alert('Tanggal awal, tanggal akhir, dan jenis pengurutan harus diisi.');
        }
    });
</script>

<script>
    function printChartToExcel(chartId) {

        // Kirim data chart ke server untuk diubah menjadi file Excel
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'export_keluhan.php', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.responseType = 'blob';
        xhr.onload = function() {
            var blob = new Blob([this.response], {type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'});
            var link = document.createElement('a');
            link.href = window.URL.createObjectURL(blob);
            link.download = 'Data_Search_Keluhan.xlsx';
            link.click();
        };
        xhr.send();
    }

    function printChartToPNG(chartId) {
        // Ambil canvas chart
        var canvas = document.getElementById(chartId);
        var chartData = canvas.toDataURL('image/png');

        // Buka gambar chart di jendela baru untuk kemudian diunduh
        var windowContent = '<img src="' + chartData + '">';
        var printWindow = window.open('', '_blank');
        printWindow.document.write(windowContent);
        printWindow.document.close();
        printWindow.focus();
        printWindow.print();
    }
</script>


  <script>
    function saveToExcel(chartType) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', 'dashboard/create-excel.php?type=' + chartType, true);
        xhr.responseType = 'blob';

        xhr.onload = function() {
            if (this.status === 200) {
                var blob = new Blob([this.response], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
                var link = document.createElement('a');
                link.href = window.URL.createObjectURL(blob);
                link.download = 'Data_' + chartType + '.xlsx';
                link.click();
            }
        };

        xhr.send();
    }
  </script>


  </body>
</html>