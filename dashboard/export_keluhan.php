<?php
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

// Include file yang berisi fungsi-fungsi bantu
include '../helper/app_function.php';
require __DIR__ . '/../assets/vendor/autoload.php';

// Inisialisasi koneksi ke database
$conn = new mysqli("localhost", "root", "", "prj_keluhan");

// Periksa koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Setelah pemrosesan formulir
// Setelah pemrosesan formulir
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Ambil nilai dari formulir
    if (isset($_POST["submit"])) {

        // Query untuk mengambil data berdasarkan sortby
        if ($sortby == "tipe_keluhan") {
            $sql = "SELECT tipe_keluhan.tipe_keluhan AS label, COUNT(*) as jumlah 
                    FROM keluhan 
                    INNER JOIN tipe_keluhan ON keluhan.tipe_keluhan = tipe_keluhan.id 
                    WHERE tgl_pembelian BETWEEN '$tgl_awal' AND '$tgl_akhir' 
                    GROUP BY keluhan.tipe_keluhan";
        } elseif ($sortby == "outlet_pembelian") {
            $sql = "SELECT master_resto.resto AS label, COUNT(*) as jumlah 
                    FROM keluhan 
                    INNER JOIN master_resto ON keluhan.outlet_pembelian = master_resto.id 
                    WHERE tgl_pembelian BETWEEN '$tgl_awal' AND '$tgl_akhir' 
                    GROUP BY keluhan.outlet_pembelian";
        }

        // Lakukan query ke database
        $result = $conn->query($sql);

        // Membuat objek Spreadsheet baru
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Menambahkan header ke dalam file Excel
        $sheet->setCellValue('A1', 'Label');
        $sheet->setCellValue('B1', 'Jumlah');

        // Menyisipkan data ke dalam file Excel
        $row = 2;
        while ($row_data = $result->fetch_assoc()) {
            $sheet->setCellValue('A' . $row, $row_data['label']);
            $sheet->setCellValue('B' . $row, $row_data['jumlah']);
            $row++;
        }

        // Mengatur header untuk file Excel
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="chart_data.xlsx"');
        header('Cache-Control: max-age=0');

        // Menyimpan file Excel
        $writer = new Xlsx($spreadsheet);
        $writer->save('php://output');
        exit();
    } else {
        // Tampilkan pesan kesalahan jika elemen-elemen POST tidak diatur
        echo "Error: Formulir tidak lengkap.";
    }
}
?>