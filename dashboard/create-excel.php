<?php

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

include '../helper/app_function.php'; // Termasuk file yang berisi fungsi-fungsi bantu

require __DIR__ . '/../assets/vendor/autoload.php';

// Inisialisasi koneksi ke database
$conn = new mysqli("localhost", "root", "", "prj_keluhan");

// Periksa koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
// Query untuk mengambil data keluhan
$sql = "SELECT * FROM keluhan";
$list_keluhan = get_data($cfg_db, $sql);

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

// Membuat objek Spreadsheet baru
$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

// Menambahkan header ke dalam file Excel
$sheet->setCellValue('A1', 'No');
$sheet->setCellValue('B1', 'Nama Customer');
$sheet->setCellValue('C1', 'No Tlp');
$sheet->setCellValue('D1', 'Tgl Pembelian');
$sheet->setCellValue('E1', 'Nama Resto');
$sheet->setCellValue('F1', 'Tipe Keluhan');
$sheet->setCellValue('G1', 'Menu');
$sheet->setCellValue('H1', 'Jumlah');
$sheet->setCellValue('I1', 'Status');

// Menyisipkan data ke dalam file Excel
$row = 2;
foreach ($list_keluhan as $key => $data) {
    $sheet->setCellValue('A' . $row, $key + 1);
    $sheet->setCellValue('B' . $row, $data['no_tiket']);
    $sheet->setCellValue('C' . $row, $data['no_wa']);
    $sheet->setCellValue('D' . $row, date('d-m-Y', strtotime($data['tgl_pembelian'])));
    $sheet->setCellValue('E' . $row, $data['outlet_pembelian']);
    $sheet->setCellValue('F' . $row, $data['tipe_keluhan']);
    $sheet->setCellValue('G' . $row, $data['menu_masalah']);
    $sheet->setCellValue('H' . $row, $data['jumlah']);
    $sheet->setCellValue('I' . $row, $data['status']);
    $row++;
}

// Menambahkan data dari chart ke dalam file Excel
$sheet->setCellValue('K1', 'Total Keluhan');
$sheet->setCellValue('K2', $totalKeluhan);
$sheet->setCellValue('L1', 'Done');
$sheet->setCellValue('L2', $jumlahDone);
$sheet->setCellValue('M1', 'Complaint');
$sheet->setCellValue('M2', $jumlahComplaint);

$row = 1; // Mulai dari baris ke-3 setelah data sebelumnya
foreach ($tipeKeluhanData['labels'] as $index => $label) {
    $sheet->setCellValue('N'.$row, $label);
    $column = 'O'; // Mulai dari kolom E
    $sheet->setCellValue($column.$row, $tipeKeluhanData['data'][$index]);
    $row++;
}

$row = 1; // Mulai dari baris ke-3 setelah data sebelumnya
foreach ($outletPembelianData['labels'] as $index => $label) {
    $sheet->setCellValue('P'.$row, $label); // Menambahkan nama resto ke kolom F
    $column = 'Q'; // Mulai dari kolom G
    $sheet->setCellValue($column.$row, $outletPembelianData['data'][$index]); // Menambahkan jumlah keluhan ke kolom sebelahnya (kolom G)
    $row++;
}

// Mengatur header untuk file Excel
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="semua_data_keluhan.xlsx"');
header('Cache-Control: max-age=0');

// Menyimpan file Excel
$writer = new Xlsx($spreadsheet);
$writer->save('php://output');

exit();
?>
