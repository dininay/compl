-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2024 at 06:12 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prj_keluhan`
--

-- --------------------------------------------------------

--
-- Table structure for table `keluhan`
--

CREATE TABLE `keluhan` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `no_tiket` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `no_wa` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jen_kel` varchar(5) DEFAULT NULL,
  `tgl_pembelian` date DEFAULT NULL,
  `area_pembelian` varchar(255) DEFAULT NULL,
  `outlet_pembelian` varchar(255) DEFAULT NULL,
  `tipe_keluhan` varchar(255) DEFAULT NULL,
  `menu_masalah` varchar(255) DEFAULT NULL,
  `jumlah` varchar(5) DEFAULT NULL,
  `rincian_keluhan` text DEFAULT NULL,
  `foto_struk` varchar(255) DEFAULT NULL,
  `foto_menu` varchar(255) DEFAULT NULL,
  `catatan_marketing` text DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `catatan_resro` text DEFAULT NULL,
  `tgl_kirim` datetime DEFAULT NULL,
  `tgl_status_1` datetime DEFAULT NULL,
  `tgl_status_2` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `keluhan`
--

INSERT INTO `keluhan` (`id`, `no_tiket`, `nama`, `no_wa`, `email`, `alamat`, `tgl_lahir`, `jen_kel`, `tgl_pembelian`, `area_pembelian`, `outlet_pembelian`, `tipe_keluhan`, `menu_masalah`, `jumlah`, `rincian_keluhan`, `foto_struk`, `foto_menu`, `catatan_marketing`, `status`, `catatan_resro`, `tgl_kirim`, `tgl_status_1`, `tgl_status_2`) VALUES
(0000000001, 'CC2404060001', 'Ardi tes', '08533xxx', 'ardi@gmail.com', 'SURABAYA', '1994-03-30', 'L', '2024-04-03', '9', '1318', '3', '1', NULL, 'kemasan kurang rapi', 'strukIMG_20240329_102351.jpg', 'menu526057.jpg', 'sudah info ke resto', 'on progress', NULL, NULL, '2024-04-06 06:50:35', NULL),
(0000000002, 'CC2404070001', 'Dwi Fitriyanto', '087667567567', 'mydwifitriyanto@gmail.com', 'TULUNGAGUNG', '2024-04-08', 'L', '2024-04-08', '1', '1303', '1', '1', NULL, 'mie nya bau', 'strukWhatsApp Image 2024-03-25 at 11.06.59_68d0813a.jpg', 'menuWhatsApp Image 2024-03-14 at 16.07.57_cd288a92.jpg', NULL, 'Complaint', NULL, NULL, NULL, NULL),
(0000000003, 'CC2404240001', 'Dwi Fitriyanto', '087667567567', 'mydwifitriyanto@gmail.com', 'BANDUNG', '2024-04-24', 'L', '2024-04-24', '20', '1457', '1', '1', NULL, 'test', 'strukWhatsApp Image 2024-03-14 at 16.07.57_cd288a92.jpg', 'menuWhatsApp Image 2024-03-14 at 16.07.57_cd288a92.jpg', 'Catatan Keterangan: jfjdfhjsdhjfsdfjkhsdhfjhdshfjdhsfhdshfhdhfjkhsdhfkjshdfjkhsdkj', 'on progress', NULL, NULL, '2024-04-25 10:08:58', NULL),
(0000000004, 'CC2404250001', 'Dwi Fitriyanto', '08111181841', 'mydwifitriyanto@gmail.com', 'YOGYAKARTA', '1986-06-06', 'L', '2024-04-25', '6', '1319', '1', '2', NULL, 'test', 'strukWhatsApp Image 2024-03-14 at 16.07.57_cd288a92.jpg', 'menuWhatsApp Image 2024-03-14 at 16.05.25_e93940df.jpg', 'tolong di teruskan ke customer', 'done', 'Dimsum sudah di antar kembali ke customer', NULL, '2024-04-25 09:21:28', '2024-04-25 09:34:27'),
(0000000005, 'CC2404260001', 'Dwi Fitriyanto', '087667567567', 'project-it@miegacoan.co.id', 'BANDUNG', '2024-04-26', 'L', '2024-04-26', '20', '1409', '1', '1', NULL, 'tre', 'strukWhatsApp Image 2024-03-14 at 16.07.57_cd288a92.jpg', 'menuWhatsApp Image 2024-03-25 at 11.06.59_68d0813a.jpg', NULL, 'Complaint', NULL, NULL, NULL, NULL),
(0000000006, 'CC2404290001', 'p', 'p', 'p', 'p', '2024-04-29', 'L', '2024-04-29', '9', '1318', '3', 'Array', '2', 'p', 'strukUts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg', 'menuUts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg', NULL, 'Complaint', NULL, NULL, NULL, NULL),
(0000000007, 'CC2404290002', 'm', 'm', 'm', 'mm', '2024-04-28', 'P', '2024-04-28', '9', '1311', '2', '3', '7', 'm', 'strukUts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg', 'menuUts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg', NULL, 'Complaint', NULL, NULL, NULL, NULL),
(0000000008, 'CC2404290003', 'l', 'l', 'l', 'l', '2024-04-27', 'P', '2024-04-27', '9', '1343', '2', '1', '3', 'l', 'strukUts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg', 'menuUts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg', NULL, 'Complaint', NULL, NULL, NULL, NULL),
(0000000009, 'CC2404290004', 'o', 'o', 'o', 'o', '2024-04-29', 'P', '2024-04-29', '8', '1310', '5', '2', '3', 'o', 'strukUts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg', 'menu', NULL, 'Complaint', NULL, NULL, NULL, NULL),
(0000000010, 'CC2405060001', 'l', 'l', 'l', 'LAMONGAN', '2024-05-06', 'P', '2024-05-06', '9', '1318', '2', 'undefined', NULL, 'l', 'strukUts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg', 'menuUts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg', NULL, 'Complaint', NULL, NULL, NULL, NULL),
(0000000011, 'CC2405060002', 'h', 'h', 'h', 'MALANG', '2024-05-06', 'L', '2024-05-06', '9', '1337', '3', '1', NULL, 'h', 'strukUts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg', 'menuUts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg', NULL, 'Complaint', NULL, NULL, NULL, NULL),
(0000000012, 'CC2405060003', 'o', 'o', 'o', 'MOJOKERTO', '2024-05-06', 'P', '2024-05-06', '9', '1352', '1', '', NULL, 'o', 'strukUts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg', 'menu', NULL, 'Complaint', NULL, NULL, NULL, NULL),
(0000000013, 'CC2405060004', 'y', 'y', 'y', 'MALANG', '2024-05-06', 'P', '2024-05-06', '9', '1352', '2', '', NULL, 'y', 'strukUts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg', 'menu', NULL, 'Complaint', NULL, NULL, NULL, NULL),
(0000000014, 'CC2405060005', 'b', 'b', 'b', 'b', '2024-05-06', 'P', '2024-05-06', '9', '1352', '2', '1, 2', '1', 'b', 'strukUts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg', 'menuUts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg', NULL, 'Complaint', NULL, NULL, NULL, NULL),
(0000000015, 'CC2405060006', 'ko', 'ko', 'ko', 'ko', '2024-05-06', 'P', '2024-05-06', '9', '1352', '2', '1,2', '4', 'ko', 'strukUts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg', 'menuUts Bisdig_Dini Naylul Izzah_20083000059_4B.jpg', NULL, 'Complaint', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_city`
--

CREATE TABLE `master_city` (
  `id` int(11) NOT NULL,
  `city` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `master_city`
--

INSERT INTO `master_city` (`id`, `city`) VALUES
(1, 'TULUNGAGUNG'),
(2, 'MADIUN'),
(3, 'MOJOKERTO'),
(4, 'KEDIRI'),
(5, 'SOLO'),
(6, 'YOGYAKARTA'),
(7, 'PONOROGO'),
(8, 'BLITAR'),
(9, 'MALANG'),
(10, 'PASURUAN'),
(11, 'JOMBANG'),
(12, 'NGAWI'),
(13, 'JEMBER'),
(14, 'PROBOLINGGO'),
(15, 'SEMARANG'),
(16, 'SURABAYA'),
(17, 'TUBAN'),
(18, 'SIDOARJO'),
(19, 'CIREBON'),
(20, 'BANDUNG'),
(21, 'GRESIK'),
(22, 'MAGELANG'),
(23, 'TEGAL'),
(24, 'PURWOKERTO'),
(25, 'KARAWANG'),
(26, 'DEPOK'),
(27, 'BOGOR'),
(28, 'BEKASI'),
(29, 'JAKARTA'),
(30, 'CIKARANG'),
(31, 'PURWAKARTA'),
(32, 'TANGERANG'),
(33, 'CILACAP'),
(34, 'BOJONEGORO'),
(35, 'CIKAMPEK'),
(36, 'CIANJUR'),
(37, 'KUDUS'),
(38, 'MADURA'),
(39, 'KLATEN'),
(40, 'MAKASSAR'),
(41, 'CIAMIS'),
(42, 'TASIKMALAYA'),
(43, 'LAMONGAN'),
(44, 'PURBALINGGA'),
(45, 'SUMEDANG');

-- --------------------------------------------------------

--
-- Table structure for table `master_menu`
--

CREATE TABLE `master_menu` (
  `id` int(11) DEFAULT NULL,
  `menu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `master_menu`
--

INSERT INTO `master_menu` (`id`, `menu`) VALUES
(1, 'Mie'),
(2, 'Dimsum'),
(3, 'Minuman');

-- --------------------------------------------------------

--
-- Table structure for table `master_resto`
--

CREATE TABLE `master_resto` (
  `id` int(1) UNSIGNED ZEROFILL NOT NULL,
  `kode_resto` varchar(50) DEFAULT NULL,
  `resto` varchar(255) DEFAULT NULL,
  `rm` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `kode_city` varchar(255) DEFAULT NULL,
  `am` varchar(255) DEFAULT NULL,
  `kom_resto` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `master_resto`
--

INSERT INTO `master_resto` (`id`, `kode_resto`, `resto`, `rm`, `city`, `kode_city`, `am`, `kom_resto`, `email`) VALUES
(1303, 'TLGTEU', 'TULUNGAGUNG', 'JAWA TIMUR 1', 'TULUNGAGUNG', '1', 'RAHMAD', 'MIE GACOAN - TULUNGAGUNG', 'miegacoan.tulungagung@gmail.com'),
(1304, 'MADSAP', 'MADIUN', 'JAWA TIMUR 1', 'MADIUN', '2', 'RAHMAD', 'MIE GACOAN - MADIUN', 'miegacoan.madiun@gmail.com'),
(1305, 'MJKSUD', 'MOJOKERTO', 'JAWA TIMUR 1', 'MOJOKERTO', '3', 'AMANDHITA', 'MIE GACOAN - MOJOKERTO', 'miegacoan.mojokerto@gmail.com '),
(1306, 'KDRJOY', 'KEDIRI JOYOBOYO', 'JAWA TIMUR 1', 'KEDIRI', '4', 'RAHMAD', 'MIE GACOAN - KEDIRI', 'miegacoan.kediri@gmail.com'),
(1307, 'SKTMAW', 'SOLO MAWAR', 'JAWA TENGAH', 'SOLO', '5', 'KLARA', 'MIE GACOAN - SOLO MAWAR', 'solomawarmiegacoan@gmail.com'),
(1308, 'SMNBAB', 'BABARSARI', 'JAWA TENGAH', 'YOGYAKARTA', '6', 'NABILA', 'MIE GACOAN - JOGJA BABARSARI', 'miegacoan.yogyakarta@gmail.com'),
(1309, 'PNGDIP', 'PONOROGO', 'JAWA TIMUR 1', 'PONOROGO', '7', 'RAHMAD', 'MIE GACOAN - PONOROGO', 'miegacoan.ponorogo@gmail.com'),
(1310, 'BLTKAL', 'BLITAR', 'JAWA TIMUR 1', 'BLITAR', '8', 'RAHMAD', 'MIE GACOAN - BLITAR', 'miegacoan.blitar@gmail.com'),
(1311, 'MLGKEN', 'MALANG KENDALSARI', 'JAWA TIMUR 1', 'MALANG', '9', 'MARHATUS', 'MIE GACOAN - MALANG KENDALSARI', 'Miegacoan.malang@gmail.com'),
(1312, 'PSNSOE', 'PASURUAN', 'JAWA TIMUR 1', 'PASURUAN', '10', 'AMANDHITA', 'MIE GACOAN - PASURUAN SUHAT', 'miegacoan.pasuruann2@gmail.com'),
(1313, 'JBGURI', 'JOMBANG', 'JAWA TIMUR 1', 'JOMBANG', '11', 'AMANDHITA', 'MIE GACOAN - JOMBANG', 'miegacoan.jombang@gmail.com'),
(1314, 'NGWDIP', 'NGAWI', 'JAWA TIMUR 1', 'NGAWI', '12', 'RAHMAD', 'MIE GACOAN - NGAWI', 'miegacoan.ngawi@gmail.com'),
(1315, 'JMRSUM', 'JEMBER', 'JAWA TIMUR 1', 'JEMBER', '13', 'AMANDHITA', 'MIE GACOAN - JEMBER', 'miegacoan.jember@gmail.com'),
(1316, 'SKHSOE', 'SOLO BARU', 'JAWA TENGAH', 'SOLO', '5', 'KLARA', 'MIE GACOAN - SOLO BARU', 'miegacoan.solobaru@gmail.com'),
(1317, 'MLGJAK', 'MALANG JAKARTA', 'JAWA TIMUR 1', 'MALANG', '9', 'MARHATUS', 'MIE GACOAN - MALANG JAKARTA', 'miegacoan.malang2@gmail.com'),
(1318, 'MLGCIL', 'MALANG CILIWUNG', 'JAWA TIMUR 1', 'MALANG', '9', 'MARHATUS', 'MIE GACOAN - MALANG CILIWUNG', 'miegacoan.malcil@gmail.com'),
(1319, 'YYKTAM', 'TAMANSISWA', 'JAWA TENGAH', 'YOGYAKARTA', '6', 'NABILA', 'MIE GACOAN - JOGJA TAMSIS', 'miegacoan.tamsis@gmail.com'),
(1320, 'PBLSUR', 'PROBOLINGGO', 'JAWA TIMUR 1', 'PROBOLINGGO', '18', 'AMANDHITA', 'MIE GACOAN - PROBOLINGGO', 'miegacoan.probolinggo@gmail.com'),
(1321, 'SMGMAK', 'MAKSUM', 'JAWA TENGAH', 'SEMARANG', '19', 'HENRY', 'MIE GACOAN - SEMARANG MAKSUM', 'miegacoan.semarang1@gmail.com'),
(1322, 'SBYAMB', 'SURABAYA AMBENGAN', 'JAWA TIMUR 2', 'SURABAYA', '20', 'ADIWARA', 'MIE GACOAN - SURABAYA AMBENGAN', 'miegacoan.surabaya@gmail.com'),
(1323, 'YYKKRA', 'KOTABARU', 'JAWA TENGAH', 'YOGYAKARTA', '6', 'NABILA', 'MIE GACOAN - JOGJA KOTA BARU', 'miegacoan.jogja4@gmail.com'),
(1324, 'SKTADI', 'SOLO COLOMADU', 'JAWA TENGAH', 'SOLO', '5', 'KLARA', 'MIE GACOAN - SOLO COLOMADU', 'miegacoan.solo3@gmail.com'),
(1325, 'SMNNGA', 'GODEAN', 'JAWA TENGAH', 'YOGYAKARTA', '6', 'NABILA', 'MIE GACOAN - JOGJA GODEAN', 'miegacoan.jogja5@gmail.com'),
(1326, 'TBNBAS', 'TUBAN', 'JAWA TIMUR 1', 'TUBAN', '24', 'AMANDHITA', 'MIE GACOAN - TUBAN', 'miegacoan.tuban@gmail.com'),
(1327, 'SDATEU', 'SIDOARJO TEUKU UMAR', 'JAWA TIMUR 2', 'SIDOARJO', '25', 'RIZYA', 'MIE GACOAN - SIDOARJO', 'miegacoan.sidoarjo@gmail.com'),
(1328, 'SMGSET', 'TEMBALANG', 'JAWA TENGAH', 'SEMARANG', '19', 'RISAL', 'MIE GACOAN - SEMARANG TEMBALANG', 'miegacoan.semarang2@gmail.com'),
(1329, 'SBYMEN', 'SURABAYA WIYUNG', 'JAWA TIMUR 2', 'SURABAYA', '20', 'ADIWARA', 'MIE GACOAN - SURABAYA WIYUNG', 'miegacoan.surabaya2@gmail.com'),
(1330, 'CBNTEN', 'CIREBON TENTARA', 'JAWA BARAT 1', 'CIREBON', '28', 'WIWIN', 'MIE GACOAN - CIREBON', 'miegacoan.cirebon@gmail.com'),
(1331, 'BDGSET', 'BANDUNG SETIABUDI', 'JAWA BARAT 1', 'BANDUNG', '29', 'ANISA', 'MIE GACOAN - BANDUNG SETIABUDI', 'miegacoan.bandung@gmail.com'),
(1332, 'GSKSUD', 'GRESIK PANGLIMA', 'JAWA TIMUR 2', 'GRESIK', '30', 'ADIWARA', 'MIE GACOAN - GRESIK', 'miegacoan.gresik@gmail.com'),
(1333, 'BTUSUP', 'BATU', 'JAWA TIMUR 1', 'MALANG', '9', 'RAHMAD', 'MIE GACOAN - BATU', 'miegacoan.batu@gmail.com'),
(1334, 'MGGTID', 'MAGELANG', 'JAWA TENGAH', 'MAGELANG', '32', 'KLARA', 'MIE GACOAN - MAGELANG', 'miegacoan.magelang@gmail.com'),
(1335, 'SMGHAM', 'NGALIYAN', 'JAWA TENGAH', 'SEMARANG', '19', 'HENRY', 'MIE GACOAN - SEMARANG NGALIYAN', 'miegacoan.smg3@gmail.com'),
(1336, 'TGLSUD', 'TEGAL', 'JAWA TENGAH', 'TEGAL', '34', 'HENRY', 'MIE GACOAN - TEGAL', 'miegacoan.tegal@gmail.com'),
(1337, 'MLGRON', 'MALANG STASIUN', 'JAWA TIMUR 1', 'MALANG', '9', 'MARHATUS', 'MIE GACOAN - MALANG STASIUN', 'miegacoan.malang4@gmail.com'),
(1338, 'SBYMAN', 'SURABAYA MANYAR', 'JAWA TIMUR 2', 'SURABAYA', '20', 'DESI', 'MIE GACOAN - SURABAYA MANYAR', 'miegacoan.surabaya3@gmail.com'),
(1339, 'SMGSUD', 'MAJAPAHIT', 'JAWA TENGAH', 'SEMARANG', '19', 'RISAL', 'MIE GACOAN - SEMARANG MAJAPAHIT', 'miegacoan.semarang4@gmail.com '),
(1340, 'PWTSOE', 'PURWOKERTO', 'JAWA TENGAH', 'PURWOKERTO', '38', 'HENRY', 'MIE GACOAN - PURWOKERTO', 'miegacoan.purwokerto@gmail.com'),
(1341, 'SMGPAM', 'PAMULARSIH', 'JAWA TENGAH', 'SEMARANG', '19', 'HENRY', 'MIE GACOAN - SEMARANG PAMULARSIH', 'miegacoan.semarang5@gmail.com'),
(1342, 'BDGUKU', 'BANDUNG DIPATIUKUR', 'JAWA BARAT 1', 'BANDUNG', '29', 'ILYASHA', 'MIE GACOAN - BANDUNG DIPATIUKUR', 'miegacoan.bandung2@gmail.com'),
(1343, 'MLGSUP', 'MALANG SUKUN', 'JAWA TIMUR 1', 'MALANG', '9', 'MARHATUS', 'MIE GACOAN - MALANG SUKUN', 'miegacoan.malang5@gmail.com'),
(1344, 'SBYSOE', 'SURABAYA MERR', 'JAWA TIMUR 2', 'SURABAYA', '20', 'DESI', 'MIE GACOAN - SURABAYA MERR', 'miegacoan.surabaya4@gmail.com'),
(1345, 'BDGPAS', 'BANDUNG PASKAL', 'JAWA BARAT 1', 'BANDUNG', '29', 'ILYASHA', 'MIE GACOAN - BANDUNG PASKAL', 'miegacoan.bandung3@gmail.com'),
(1346, 'SBYMAR', 'SURABAYA MARGOREJO', 'JAWA TIMUR 2', 'SURABAYA', '20', 'DESI', 'MIE GACOAN - SURABAYA MARGOREJO', 'miegacoan.surabaya5@gmail.com'),
(1347, 'SMGSUK', 'BANYUMANIK', 'JAWA TENGAH', 'SEMARANG', '19', 'RISAL', 'MIE GACOAN - SEMARANG BANYUMANIK', 'miegacoan.semarang6@gmail.com'),
(1348, 'KWGGAL', 'KARAWANG', 'JAWA BARAT 2', 'KARAWANG', '46', 'AFIYAH', 'MIE GACOAN - KARAWANG', 'miegacoan.karawang88@gmail.com'),
(1349, 'SKTSLA', 'KARTASURA', 'JAWA TENGAH', 'SOLO', '5', 'KLARA', 'MIE GACOAN - KARTASURA', 'miegacoan.kartasura@gmail.com'),
(1350, 'DPKMAR', 'DEPOK MARGONDA', 'JAWA BARAT 2', 'DEPOK', '48', 'RATNA', 'MIE GACOAN - DEPOK MARGONDA', 'miegacoan.depokmargo@gmail.com'),
(1351, 'SKTURI', 'SOLO JEBRES', 'JAWA TENGAH', 'SOLO', '5', 'KLARA', 'MIE GACOAN - SOLO JEBRES', 'miegacoan.soloo4@gmail.com'),
(1352, 'MLGTLO', 'MALANG DINOYO', 'JAWA TIMUR 1', 'MALANG', '9', 'MARHATUS', 'MIE GACOAN - MALANG DINOYO', 'miegacoan.malang6@gmail.com'),
(1353, 'BGRPAD', 'BOGOR PAJAJARAN', 'JAWA BARAT 2', 'BOGOR', '51', 'WINDY', 'MIE GACOAN - BOGOR PADJAJARAN', 'miegacoan.bogor@gmail.com'),
(1354, 'SMGVET', 'VETERAN', 'JAWA TENGAH', 'SEMARANG', '19', 'HENRY', 'MIE GACOAN - SEMARANG VETERAN', 'Miegacoan.semarang7@gmail.com'),
(1355, 'SMNMAG', 'JOMBOR', 'JAWA TENGAH', 'YOGYAKARTA', '6', 'NABILA', 'MIE GACOAN - JOGJA JOMBOR', 'miegacoan.jogja6@gmail.com'),
(1356, 'SBYSUN', 'SURABAYA MAYJEND', 'JAWA TIMUR 2', 'SURABAYA', '20', 'ADIWARA', 'MIE GACOAN - MAYJEND', 'miegacoan.surabaya6@gmail.com'),
(1357, 'MLGMON', 'MALANG SINGOSARI', 'JAWA TIMUR 1', 'MALANG', '9', 'MARHATUS', 'MIE GACOAN - MALANG SINGOSARI', 'miegacoan.malang7@gmail.com'),
(1358, 'SMNAFF', 'GEJAYAN', 'JAWA TENGAH', 'YOGYAKARTA', '6', 'NABILA', 'MIE GACOAN - JOGJA GEJAYAN', 'miegacoan.jogja7@gmail.com'),
(1359, 'BKSJUA', 'BEKASI JUANDA', 'JAWA BARAT 2', 'BEKASI', '57', 'KHAFID', 'MIE GACOAN - BEKASI JUANDA', 'miegacoan.bekasi1@gmail.com'),
(1360, 'BDGDAG', 'BANDUNG DAGO', 'JAWA BARAT 1', 'BANDUNG', '29', 'SEPTI', 'MIE GACOAN - BANDUNG DAGO', 'Miegacoan.bdg4@gmail.com'),
(1361, 'SDAPAB', 'SIDOARJO TROPODO', 'JAWA TIMUR 2', 'SIDOARJO', '25', 'RIZYA', 'MIE GACOAN - SIDOARJO 2 TROPODO', 'miegacoan.sda2tropo@gmail.com'),
(1362, 'KYBTEB', 'JAKARTA TEBET', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'WASIL', 'MIE GACOAN - JAKARTA TEBET', 'miegacoan.jakteb1@gmail.com'),
(1363, 'SBYKEN', 'SURABAYA KENJERAN', 'JAWA TIMUR 2', 'SURABAYA', '20', 'DESI', 'MIE GACOAN - SURABAYA KENJERAN', 'miegacoan.sby7@gmail.com'),
(1364, 'CKRTHA', 'CIKARANG', 'JAWA BARAT 2', 'CIKARANG', '62', 'AFIYAH', 'MIE GACOAN - CIKARANG', 'miegacoan.cikarang1@gmail.com'),
(1365, 'BKSJAT', 'BEKASI JATIWARINGIN', 'JAWA BARAT 2', 'BEKASI', '57', 'KHAFID', 'MIE GACOAN - BEKASI JATIWARINGIN', 'miegacoan.bks2jatiwaringin@gmail.com'),
(1366, 'BDGGAT', 'BANDUNG GATSU', 'JAWA BARAT 1', 'BANDUNG', '29', 'SEPTI', 'MIE GACOAN - BANDUNG GATSU', 'miegacoan.bandung5@gmail.com'),
(1367, 'YYKSON', 'WIROBRAJAN', 'JAWA TENGAH', 'YOGYAKARTA', '6', 'NABILA', 'MIE GACOAN - JOGJA WIROBRAJAN', 'miegacoan.jogja8@gmail.com'),
(1368, 'SBYAHM', 'SURABAYA A YANI', 'JAWA TIMUR 2', 'SURABAYA', '20', 'DESI', 'MIE GACOAN - SURABAYA A. YANI', 'miegacoan.surabaya8@gmail.com'),
(1369, 'DPKJAS', 'DEPOK KELAPA DUA', 'JAWA BARAT 2', 'DEPOK', '48', 'RATNA', 'MIE GACOAN - DEPOK KELAPA DUA', 'miegacoan.depok2@gmail.com'),
(1370, 'BDGSUR', 'BANDUNG SUMANTRI', 'JAWA BARAT 1', 'BANDUNG', '29', 'ANISA', 'MIE GACOAN - BANDUNG SUMANTRI', 'miegacoan.bandung6@gmail.com'),
(1371, 'BGRTAJ', 'BOGOR TAJUR', 'JAWA BARAT 2', 'BOGOR', '51', 'WINDY', 'MIE GACOAN - BOGOR TAJUR', 'miegacoan.bgr2tajur@gmail.com'),
(1372, 'BDGBUA', 'BANDUNG BUBAT', 'JAWA BARAT 1', 'BANDUNG', '29', 'SEPTI', 'MIE GACOAN - BANDUNG BUBAT', 'miegacoan.bdg7bubat@gmail.com'),
(1373, 'GSKSUM', 'GRESIK GKB', 'JAWA TIMUR 2', 'GRESIK', '30', 'ADIWARA', 'MIE GACOAN - GRESIK GKB', 'miegacoan.gresik2@gmail.com'),
(1374, 'BKSBIN', 'BEKASI BINTARA', 'JAWA BARAT 2', 'BEKASI', '57', 'KHAFID', 'MIE GACOAN - BEKASI BINTARA', 'miegacoan.bks3bintara@gmail.com'),
(1375, 'PWKTAM', 'PURWAKARTA', 'JAWA BARAT 2', 'PURWAKARTA', '73', 'AFIYAH', 'MIE GACOAN - PURWAKARTA', 'miegacoan.purwakarta@gmail.com'),
(1376, 'KYBKES', 'JAKARTA BINTARO', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'NOVAN', 'MIE GACOAN - JAKARTA BINTARO', 'miegacoan.jkt2bintaro@gmail.com'),
(1377, 'BGRSAP', 'BOGOR YASMIN', 'JAWA BARAT 2', 'BOGOR', '51', 'WINDY', 'MIE GACOAN - BOGOR YASMIN', 'miegacoan.bgr3yasmin@gmail.com'),
(1378, 'SBYTAN', 'SURABAYA MANUKAN', 'JAWA TIMUR 2', 'SURABAYA', '20', 'ADIWARA', 'MIE GACOAN - SURABAYA MANUKAN', 'miegacoan.sby9manukan@gmail.com'),
(1379, 'BKSGOL', 'BEKASI GOLDEN CITY', 'JAWA BARAT 2', 'BEKASI', '57', 'KHAFID', 'MIE GACOAN - BEKASI GOLDEN CITY', 'miegacoan.bks4goldencity@gmail.com'),
(1380, 'MADSAL', 'MADIUN 2', 'JAWA TIMUR 1', 'MADIUN', '2', 'RAHMAD', 'MIE GACOAN - MADIUN 2', 'miegacoan.madiun2@gmail.com'),
(1381, 'BDGNAS', 'BANDUNG UJUNG BERUNG', 'JAWA BARAT 1', 'BANDUNG', '29', 'SEPTI', 'MIE GACOAN - BANDUNG CIBIRU', 'miegacoan.bdgujungberung@gmail.com'),
(1382, 'CPTPUS', 'TANGERANG PUSPITEK', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'YOSUA', 'MIE GACOAN - TANGERANG PUSPITEK', 'miegacoan.tangerangpuspitek@gmail.com'),
(1383, 'SDAPON', 'SIDOARJO PONTI', 'JAWA TIMUR 2', 'SIDOARJO', '25', 'RIZYA', 'MIE GACOAN - SIDOARJO PONTI', 'miegacoan.sdaponti@gmail.com'),
(1384, 'SORTAM', 'BANDUNG KOPO', 'JAWA BARAT 1', 'BANDUNG', '29', 'ILYASHA', 'MIE GACOAN - BANDUNG MARGAASIH', 'miegacoan.bdgkopo@gmail.com'),
(1385, 'CLPPAR', 'CILACAP', 'JAWA TENGAH', 'CILACAP', '83', 'KLARA', 'MIE GACOAN - CILACAP', 'miegacoan.cilacap1@gmail.com'),
(1386, 'SDAGEL', 'SIDOARJO CANDI', 'JAWA TIMUR 2', 'SIDOARJO', '25', 'RIZYA', 'MIE GACOAN - SIDOARJO CANDI', 'miegacoan.sdacandi@gmail.com'),
(1387, 'CBNPEM', 'CIREBON PEMUDA', 'JAWA BARAT 1', 'CIREBON', '28', 'WIWIN', 'MIE GACOAN - CIREBON PEMUDA', 'miegacoan.cirebon2pemuda@gmail.com'),
(1388, 'TNGHAS', 'TANGERANG CIPONDOH', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'LIZA', 'MIE GACOAN - TANGERANG CIPONDOH', 'miegacoan.tgr2cipondoh@gmail.com '),
(1389, 'CKGBOU', 'JAKARTA CAKUNG', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'NOVAN', 'MIE GACOAN - JAKARTA CAKUNG GARDEN CITY', 'miegacoan.jkt3cakung@gmail.com'),
(1390, 'BJNTEU', 'BOJONEGORO', 'JAWA TIMUR 1', 'BOJONEGORO', '88', 'AMANDHITA', 'MIE GACOAN - BOJONEGORO', 'miegacoan.bojonegoro1teukuumar@gmail.com'),
(1391, 'SDATAM', 'SIDOARJO PURI SURYA', 'JAWA TIMUR 2', 'SIDOARJO', '25', 'RIZYA', 'MIE GACOAN - SIDOARJO PURI SURYA', 'miegacoan.sda5purisurya@gmail.com'),
(1392, 'BKSBAN', 'BEKASI MUSTIKA', 'JAWA BARAT 2', 'BEKASI', '57', 'KHAFID', 'MIE GACOAN - BEKASI MUSTIKA', 'miegacoan.bks5mustika@gmail.com'),
(1393, 'CMHAMI', 'BANDUNG CIMAHI', 'JAWA BARAT 1', 'BANDUNG', '29', 'ANISA', 'MIE GACOAN - BANDUNG CIMAHI', 'miegacoan.bdgcimahi@gmail.com'),
(1394, 'BGRABD', 'BOGOR GUNUNG BATU', 'JAWA BARAT 2', 'BOGOR', '51', 'WINDY', 'MIE GACOAN - BOGOR GUNUNG BATU', 'miegacoan.bgr4gunungbatu@gmail.com'),
(1395, 'KWGAHM', 'CIKAMPEK', 'JAWA BARAT 2', 'CIKAMPEK', '93', 'AFIYAH', 'MIE GACOAN - CIKAMPEK', 'miegacoan.cikampek@gmail.com'),
(1396, 'SDABAM', 'SIDOARJO KRIAN', 'JAWA TIMUR 2', 'SIDOARJO', '25', 'RIZYA', 'MIE GACOAN - SIDOARJO KRIAN', 'miegacoan.sda6krian@gmail.com'),
(1397, 'KDRURI', 'KEDIRI URIP SUMOHARJO', 'JAWA TIMUR 1', 'KEDIRI', '4', 'RAHMAD', 'MIE GACOAN - KEDIRI URIP SUMOHARJO', 'miegacoan.kdruripsumoharjo@gmail.com'),
(1398, 'SKTVET', 'SOLO VETERAN', 'JAWA TENGAH', 'SOLO', '5', 'KLARA', 'MIE GACOAN - SOLO VETERAN', 'miegacoan.soloveteran@gmail.com'),
(1399, 'CJRSUR', 'CIANJUR', 'JAWA BARAT 2', 'CIANJUR', '97', 'AFIYAH', 'MIE GACOAN - CIANJUR', 'miegacoan.cianjur@gmail.com'),
(1400, 'CPTCIA', 'TANGERANG CIATER RAYA', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'YOSUA', 'MIE GACOAN - TANGERANG CIATER', 'miegacoan.tgr3ciater@gmail.com'),
(1401, 'DPKBOJ', 'DEPOK BOJONGSARI', 'JAWA BARAT 2', 'DEPOK', '48', 'RATNA', 'MIE GACOAN - DEPOK BOJONGSARI', 'miegacoan.depokbojongsari@gmail.com'),
(1402, 'DPKSAW', 'DEPOK SAWANGAN', 'JAWA BARAT 2', 'DEPOK', '48', 'RATNA', 'MIE GACOAN - DEPOK SAWANGAN', 'miegacoan.depok3sawangan@gmail.com'),
(1403, 'BGRSHO', 'BOGOR SOLEH ISKANDAR', 'JAWA BARAT 2', 'BOGOR', '51', 'WINDY', 'MIE GACOAN - BOGOR SOLEH ISKANDAR', 'miegacoan.bgr5solehiskandar@gmail.com'),
(1404, 'KDRKED', 'KEDIRI PARE', 'JAWA TIMUR 1', 'KEDIRI', '4', 'RAHMAD', 'MIE GACOAN - KEDIRI PARE', 'miegacoan.pare@gmail.com'),
(1405, 'UNRDIP', 'UNGARAN', 'JAWA TENGAH', 'SEMARANG', '19', 'RISAL', 'MIE GACOAN - SEMARANG UNGARAN', 'miegacoan.semarangungaran@gmail.com'),
(1406, 'BDGSUM', 'BANDUNG BRAGA', 'JAWA BARAT 1', 'BANDUNG', '29', 'SEPTI', 'MIE GACOAN - BANDUNG BRAGA', 'miegacoan.bandungbraga@gmail.com'),
(1407, 'KDSSUB', 'KUDUS', 'JAWA TENGAH', 'KUDUS', '105', 'RISAL', 'MIE GACOAN - KUDUS', 'miegacoan.kudus@gmail.com'),
(1408, 'PMKJOK', 'MADURA PAMEKASAN', 'JAWA TIMUR 2', 'MADURA', '106', 'ADIWARA', 'MIE GACOAN - MADURA PAMEKASAN', 'miegacoan.madurapamekasan@gmail.com'),
(1409, 'BDGPET', 'BANDUNG PETA', 'JAWA BARAT 1', 'BANDUNG', '29', 'ILYASHA', 'MIE GACOAN - BANDUNG PETA', 'miegacoan.bandungpeta@gmail.com'),
(1410, 'BKSWIB', 'BEKASI JATIASIH', 'JAWA BARAT 2', 'BEKASI', '57', 'KHAFID', 'MIE GACOAN - BEKASI JATIASIH', 'miegacoan.bksjatiasih@gmail.com'),
(1411, 'MLGDIR', 'MALANG SAWOJAJAR', 'JAWA TIMUR 1', 'MALANG', '9', 'MARHATUS', 'MIE GACOAN - MALANG SAWOJAJAR', 'miegacoan.malangsawojajar@gmail.com'),
(1412, 'SBYRAN', 'SURABAYA TAMBAKSARI', 'JAWA TIMUR 2', 'SURABAYA', '20', 'DESI', 'MIE GACOAN - SURABAYA TAMBAKSARI', 'miegacoan.sbytambaksari@gmail.com'),
(1413, 'SMGIMA', 'IMAM BONJOL', 'JAWA TENGAH', 'SEMARANG', '19', 'HENRY', 'MIE GACOAN - SEMARANG IMAM BONJOL', 'miegacoan.smrgimambonjol@gmail.com'),
(1414, 'KLNKUS', 'KLATEN', 'JAWA TENGAH', 'KLATEN', '112', 'KLARA', 'MIE GACOAN - KLATEN', 'miegacoan.klaten@gmail.com'),
(1415, 'SMGSOE', 'SOEKARNO HATTA', 'JAWA TENGAH', 'SEMARANG', '19', 'RISAL', 'MIE GACOAN - SEMARANG SOETTA', 'miegacoan.smrgsoekarnohatta@gmail.com'),
(1416, 'CMHBAR', 'BANDUNG CIMAHI PADASUKA', 'JAWA BARAT 1', 'BANDUNG', '29', 'ANISA', 'MIE GACOAN - BANDUNG CIMAHI PADASUKA', 'miegacoan.cimahi2padasuka@gmail.com'),
(1417, 'SBYBUN', 'SURABAYA BUNG TOMO', 'JAWA TIMUR 2', 'SURABAYA', '20', 'DESI', 'MIE GACOAN - SURABAYA BUNG TOMO', 'miegacoan.sbybungtomo@gmail.com'),
(1418, 'CKRTAR', 'CIKARANG TARUM BARAT', 'JAWA BARAT 2', 'BEKASI', '57', 'AFIYAH', 'MIE GACOAN - BEKASI TARUM BARAT', 'miegacoan.bkstarumbarat@gmail.com'),
(1419, 'KWGTUP', 'KARAWANG BARAT', 'JAWA BARAT 2', 'KARAWANG', '46', 'AFIYAH', 'MIE GACOAN - KARAWANG BARAT', 'miegacoan.karawang2barat@gmail.com'),
(1420, 'SORKOP', 'BANDUNG KOPO SAYATI', 'JAWA BARAT 1', 'BANDUNG', '29', 'ILYASHA', 'MIE GACOAN - BANDUNG MARGAHAYU', 'miegacoan.bdgkoposayati@gmail.com'),
(1421, 'TJPDAN', 'JAKARTA SUNTER RAYA', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'NOVAN', 'MIE GACOAN - JAKARTA SUNTER UTARA', 'miegacoan.jktsunterutara@gmail.com'),
(1422, 'MKSTUN', 'MAKASSAR GOWA', 'JAWA TIMUR 1', 'MAKASSAR', '120', 'VACANT', 'MIE GACOAN - MAKASSAR GOWA', 'miegacoan.makassar1gowa@gmail.com'),
(1423, 'NPHLEM', 'BANDUNG LEMBANG', 'JAWA BARAT 1', 'BANDUNG', '29', 'ANISA', 'MIE GACOAN - BANDUNG LEMBANG', 'miegacoan.bdglembang@gmail.com'),
(1424, 'MKSAHM', 'MAKASSAR KAREBOSSI MALL', 'JAWA TIMUR 1', 'MAKASSAR', '120', 'VACANT', 'MIE GACOAN - MAKASSAR KAREBOSI', 'miegacoan.mks2karebosi@gmail.com'),
(1425, 'CBICIB', 'BOGOR DRAMAGA', 'JAWA BARAT 2', 'BOGOR', '51', 'WINDY', 'MIE GACOAN - BOGOR DRAMAGA', 'miegacoan.bgr6dramaga@gmail.com '),
(1426, 'BKSALT', 'BEKASI ALTERNATIF CIBUBUR', 'JAWA BARAT 2', 'BEKASI', '57', 'RATNA', 'MIE GACOAN - BEKASI ALTERNATIF CIBUBUR', 'miegacoan.bks7cibubur@gmail.com'),
(1427, 'CKGPAH', 'JAKARTA PAHLAWAN REVOLUSI', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'WASIL', 'MIE GACOAN - JAKARTA PAHLAWAN REVOLUSI', 'miegacoan.jkt5pahlawanrevolusi@gmail.com'),
(1428, 'SDAIMA', 'SIDOARJO GELURAN', 'JAWA TIMUR 2', 'SIDOARJO', '25', 'RIZYA', 'MIE GACOAN - SIDOARJO GELURAN', 'miegacoan.sda7geluran@gmail.com '),
(1429, 'TNGSAL', 'TANGERANG RADEN SALEH', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'LIZA', 'MIE GACOAN - TANGERANG RADEN SALEH', 'miegacoan.tgr4radensaleh@gmail.com'),
(1430, 'SDABRI', 'SIDOARJO CITRA HARMONI', 'JAWA TIMUR 2', 'SIDOARJO', '25', 'RIZYA', 'MIE GACOAN - SIDOARJO CITRA HARMONI', 'miegacoan.sda8citraharmoni@gmail.com'),
(1431, 'SBYMUL', 'SURABAYA MULYOREJO', 'JAWA TIMUR 2', 'SURABAYA', '20', 'DESI', 'MIE GACOAN - SURABAYA MERR 2', 'miegacoan.sby12mulyorejo@gmail.com'),
(1432, 'CMSAHM', 'CIAMIS', 'JAWA BARAT 1', 'CIAMIS', '130', 'WIWIN', 'MIE GACOAN - CIAMIS', 'miegacoan.ciamis@gmail.com'),
(1433, 'SPASIL', 'TASIKMALAYA SILIWANGI', 'JAWA BARAT 1', 'TASIKMALAYA', '131', 'WIWIN', 'MIE GACOAN - TASIKMALAYA', 'miegacoan.tasikmalaya1siliwangi@gmail.com'),
(1434, 'TNACEM', 'JAKARTA CEMPAKA PUTIH', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'NOVAN', 'MIE GACOAN - JAKARTA CEMPAKA PUTIH', 'miegacoan.jkt6cempakaputih@gmail.com'),
(1435, 'SMGWOL', 'GENUKAN', 'JAWA TENGAH', 'SEMARANG', '19', 'RISAL', 'MIE GACOAN - GENUKAN', 'miegacoan.smrg11genuk@gmail.com'),
(1436, 'GGPDAA', 'JAKARTA DAAN MOGOT', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'LIZA', 'MIE GACOAN - JAKARTA DAAN MOGOT', 'miegacoan.jkt6daanmogot@gmail.com'),
(1437, 'LMGSUD', 'LAMONGAN', 'JAWA TIMUR 1', 'LAMONGAN', '135', 'AMANDHITA', 'MIE GACOAN - LAMONGAN', 'miegacoan.lamongan1pangsud@gmail.com'),
(1438, 'CBIMAY', 'BOGOR MAYOR OKING', 'JAWA BARAT 2', 'BOGOR', '51', 'WINDY', 'MIE GACOAN - BOGOR MAYOR OKING', 'miegacoan.bgr8mayoroking@gmail.com'),
(1439, 'TNGCIL', 'TANGERANG CILEDUG RAYA', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'YOSUA', 'MIE GACOAN - TANGERANG CILEDUG', 'miegacoantgr4ciledugraya@gmail.com'),
(1440, 'KYBFAT', 'JAKARTA FATMAWATI', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'WASIL', 'MIE GACOAN - JAKARTA RAYA FATMAWATI', 'miegacoan.jkt8fatmawati@gmail.com'),
(1441, 'TNAMAN', 'JAKARTA MANGGA BESAR', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'WASIL', 'MIE GACOAN - JAKARTA MANGGA BESAR', 'miegacoan.jkt9manggabesar@gmail.com'),
(1442, 'CPTALA', 'TANGERANG ALAM SUTRA', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'YOSUA', 'MIE GACOAN - TANGERANG ALAM SUTRA', 'miegacoan.tgr5alamsutra@gmail.com'),
(1443, 'TGRHAR', 'TANGERANG CITRA RAYA', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'YOSUA', 'MIE GACOAN - TANGERANG CITRA RAYA', 'miegacoan.tgrcitraraya@gmail.com'),
(1444, 'PBGHAR', 'PURBALINGGA HARYONO', 'JAWA TENGAH', 'PURBALINGGA', '142', 'HENRY', 'MIE GACOAN - PURBALINGGA HARYONO', 'miegacoan.purbalingga@gmail.com'),
(1445, 'CPTCIP', 'TANGERANG JOMBANG CIPUTAT', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'YOSUA', 'MIE GACOAN - TANGERANG CIPUTAT', 'miegacoan.tgrciputatjombang@gmail.com'),
(1446, 'GGPPAN', 'JAKARTA PANJANG', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'LIZA', 'MIE GACOAN - JAKARTA PANJANG', 'miegacoan.jkt11panjang@gmail.com'),
(1447, 'MKSPER', 'MAKASSAR PERINTIS', 'JAWA TIMUR 1', 'MAKASSAR', '120', 'VACANT', 'MIE GACOAN - MAKASSAR PERINTIS', 'miegacoan.mks4perintis@gmail.com'),
(1448, 'MKSRAT', 'MAKASSAR SAM RATULANGI', 'JAWA TIMUR 1', 'MAKASSAR', '120', 'VACANT', 'MIE GACOAN - MAKASSAR SAM RATULANGI', 'miegacoan.mkssamratulangi@gmail.com'),
(1449, 'BDGTER', 'BANDUNG PASIRKOJA', 'JAWA BARAT 1', 'BANDUNG', '29', 'ILYASHA', 'MIE GACOAN - BANDUNG PASIR KOJA', 'miegacoan.bandungpasirkoja@gmail.com'),
(1450, 'CBITEG', 'BOGOR CIBINONG', 'JAWA BARAT 2', 'BOGOR', '51', 'WINDY', 'MIE GACOAN - BOGOR CIBINONG', 'miegacoan.bgr7cibinong@gmail.com'),
(1451, 'MKSPET', 'MAKASSAR PETTARANI', 'JAWA TIMUR 1', 'MAKASSAR', '120', 'VACANT', 'MIE GACOAN - MAKASSAR PETTARANI', 'miegacoan.mks3pettarani@gmail.com'),
(1452, 'CKGINT', 'JAKARTA RADEN INTAN', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'NOVAN', 'MIE GACOAN - JAKARTA RADEN INTAN', 'miegacoan.jkt9radeninten@gmail.com'),
(1453, 'DPKPAR', 'DEPOK PARUNG', 'JAWA BARAT 2', 'DEPOK', '48', 'RATNA', 'MIE GACOAN - DEPOK PARUNG', 'miegacoan.depokparung@gmail.com'),
(1454, 'SPAYUD', 'TASIKMALAYA YUDHANEGARA', 'JAWA BARAT 1', 'TASIKMALAYA', '131', 'WIWIN', 'MIE GACOAN - TASIKMALAYA YUDHANEGARA', 'miegacoan.tasik2yudanegara@gmail.com'),
(1455, 'NPHCIB', 'BANDUNG PADALARANG', 'JAWA BARAT 1', 'BANDUNG', '29', 'ANISA', 'MIE GACOAN - BANDUNG PADALARANG', 'miegacoan.bandungpadalarang@gmail.com'),
(1456, 'TGRKUT', 'TANGERANG KUTABUMI', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'LIZA', 'MIE GACOAN - TANGERANG KUTABUMI', 'miegacoan.tangerangkutabumi@gmail.com'),
(1457, 'SORLAS', 'BANDUNG MAJALAYA', 'JAWA BARAT 1', 'BANDUNG', '29', 'SEPTI', 'MIE GACOAN - BANDUNG MAJALAYA', 'miegacoan.bandungmajalaya@gmail.com'),
(1458, 'KYBKEM', 'JAKARTA KEMANG RAYA', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'WASIL', 'MIE GACOAN - JAKARTA KEMANG RAYA', 'miegacoan.jkt10kemangraya@gmail.com'),
(1459, 'KYBCIL', 'JAKARTA CILANDAK', 'JAKARTA TANGERANG', 'JAKARTA', '60', NULL, 'MIE GACOAN - JAKARTA CILANDAK', 'miegacoan.jakselcilandak@gmail.com'),
(1460, 'MKSPOR', 'MAKASSAR POROS MAROS', 'JAWA TIMUR 1', 'MAKASSAR', '120', 'VACANT', 'MIE GACOAN - MAKASSAR POROS MAROS', 'miegacoan.mksporosmaros@gmail.com'),
(1461, 'KYBAMP', 'JAKARTA AMPERA RAYA', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'WASIL', 'MIE GACOAN - JAKARTA AMPERA RAYA', 'miegacoan.jktamperaraya@gmail.com'),
(1462, 'SMDJAT', 'SUMEDANG JATINANGOR', 'JAWA BARAT 1', 'SUMEDANG', '160', NULL, 'MIE GACOAN - SUMEDANG JATINANGOR', 'miegacoan.sumedangjatinangor@gmail.com'),
(1463, 'TNGMER', 'TANGERANG PANTURA', 'JAKARTA TANGERANG', 'TANGERANG', '80', NULL, 'MIE GACOAN - TANGERANG PANTURA', 'miegacoan.tangerangrayapantura@gmail.com'),
(1464, 'CKGBIN', 'JAKARTA BINA MARGA', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'NOVAN', 'MIE GACOAN - JAKARTA BINA MARGA', NULL),
(1465, 'CPTJUA', 'TANGERANG JUANDA CIPUTAT', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'YOSUA', 'MIE GACOAN - TANGERANG JUANDA CIPUTAT', 'miegacoan.tangseljuandaciputat@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `ppa_user`
--

CREATE TABLE `ppa_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(20) NOT NULL,
  `id_resto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `ppa_user`
--

INSERT INTO `ppa_user` (`id`, `nama`, `username`, `password`, `level`, `id_resto`) VALUES
(1, 'Malas Ngoding', 'malasngoding', '28b662d883b6d76fd96e4ddc5e9ba780', 'marketing', NULL),
(2, 'Diki Alfarabi Hadi', 'dwi', '28b662d883b6d76fd96e4ddc5e9ba780', 'resto', 1337),
(3, 'Jamaludin', 'jamaludin', '28b662d883b6d76fd96e4ddc5e9ba780', 'pengurus', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tipe_keluhan`
--

CREATE TABLE `tipe_keluhan` (
  `id` int(11) DEFAULT NULL,
  `tipe_keluhan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tipe_keluhan`
--

INSERT INTO `tipe_keluhan` (`id`, `tipe_keluhan`) VALUES
(1, 'Benda asing dalam makanan/minuman'),
(2, 'Rasa atau kualitas makanan/minuman'),
(3, 'Kebersihan kemasan atau wadah makanan/minuman'),
(4, 'Jumlah pesanan tidak sesuai'),
(5, 'Fasilitas / Pelayanan'),
(6, 'Barang hilang/tertinggal (non-product)'),
(7, 'Lainnya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keluhan`
--
ALTER TABLE `keluhan`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `master_city`
--
ALTER TABLE `master_city`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `master_resto`
--
ALTER TABLE `master_resto`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keluhan`
--
ALTER TABLE `keluhan`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `master_resto`
--
ALTER TABLE `master_resto`
  MODIFY `id` int(1) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1466;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
