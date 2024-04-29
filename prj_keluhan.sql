/*
 Navicat Premium Data Transfer

 Source Server         : LOCAL MySQL
 Source Server Type    : MySQL
 Source Server Version : 100119 (10.1.19-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : prj_keluhan

 Target Server Type    : MySQL
 Target Server Version : 100119 (10.1.19-MariaDB)
 File Encoding         : 65001

 Date: 04/04/2024 05:52:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for keluhan
-- ----------------------------
DROP TABLE IF EXISTS `keluhan`;
CREATE TABLE `keluhan`  (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `no_tiket` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `no_wa` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `alamat` text CHARACTER SET ascii COLLATE ascii_general_ci NULL,
  `tgl_lahir` date NULL DEFAULT NULL,
  `jen_kel` varchar(5) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `tgl_pembelian` date NULL DEFAULT NULL,
  `area_pembelian` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `outlet_pembelian` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `tipe_keluhan` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `menu_masalah` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `jumlah` varchar(5) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `rincian_keluhan` text CHARACTER SET ascii COLLATE ascii_general_ci NULL,
  `foto_struk` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `foto_menu` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `catatan_marketing` text CHARACTER SET ascii COLLATE ascii_general_ci NULL,
  `status` varchar(50) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `catatan_resro` text CHARACTER SET ascii COLLATE ascii_general_ci NULL,
  `tgl_kirim` datetime NULL DEFAULT NULL,
  `tgl_status_1` datetime NULL DEFAULT NULL,
  `tgl_status_2` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = ascii COLLATE = ascii_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of keluhan
-- ----------------------------
INSERT INTO `keluhan` VALUES (0000000001, 'CC2404040001', 'Ardi', '08533xxx', 'ardi@gmail.com', 'Klojen Malang', '2024-04-04', 'L', '2024-04-02', '9', '1337', '2', '14', '4', 'Sedikit amis', 'strukIMG_20220428_115929.jpg', 'menuIMG_20240329_102351.jpg', 'konfirmasi marketing', 'done', 'resto', NULL, '2024-04-04 05:50:11', '2024-04-04 05:50:38');

-- ----------------------------
-- Table structure for master_city
-- ----------------------------
DROP TABLE IF EXISTS `master_city`;
CREATE TABLE `master_city`  (
  `id` int NOT NULL,
  `city` varchar(50) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = ascii COLLATE = ascii_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of master_city
-- ----------------------------
INSERT INTO `master_city` VALUES (1, 'TULUNGAGUNG');
INSERT INTO `master_city` VALUES (2, 'MADIUN');
INSERT INTO `master_city` VALUES (3, 'MOJOKERTO');
INSERT INTO `master_city` VALUES (4, 'KEDIRI');
INSERT INTO `master_city` VALUES (5, 'SOLO');
INSERT INTO `master_city` VALUES (6, 'YOGYAKARTA');
INSERT INTO `master_city` VALUES (7, 'PONOROGO');
INSERT INTO `master_city` VALUES (8, 'BLITAR');
INSERT INTO `master_city` VALUES (9, 'MALANG');
INSERT INTO `master_city` VALUES (10, 'PASURUAN');
INSERT INTO `master_city` VALUES (11, 'JOMBANG');
INSERT INTO `master_city` VALUES (12, 'NGAWI');
INSERT INTO `master_city` VALUES (13, 'JEMBER');
INSERT INTO `master_city` VALUES (14, 'PROBOLINGGO');
INSERT INTO `master_city` VALUES (15, 'SEMARANG');
INSERT INTO `master_city` VALUES (16, 'SURABAYA');
INSERT INTO `master_city` VALUES (17, 'TUBAN');
INSERT INTO `master_city` VALUES (18, 'SIDOARJO');
INSERT INTO `master_city` VALUES (19, 'CIREBON');
INSERT INTO `master_city` VALUES (20, 'BANDUNG');
INSERT INTO `master_city` VALUES (21, 'GRESIK');
INSERT INTO `master_city` VALUES (22, 'MAGELANG');
INSERT INTO `master_city` VALUES (23, 'TEGAL');
INSERT INTO `master_city` VALUES (24, 'PURWOKERTO');
INSERT INTO `master_city` VALUES (25, 'KARAWANG');
INSERT INTO `master_city` VALUES (26, 'DEPOK');
INSERT INTO `master_city` VALUES (27, 'BOGOR');
INSERT INTO `master_city` VALUES (28, 'BEKASI');
INSERT INTO `master_city` VALUES (29, 'JAKARTA');
INSERT INTO `master_city` VALUES (30, 'CIKARANG');
INSERT INTO `master_city` VALUES (31, 'PURWAKARTA');
INSERT INTO `master_city` VALUES (32, 'TANGERANG');
INSERT INTO `master_city` VALUES (33, 'CILACAP');
INSERT INTO `master_city` VALUES (34, 'BOJONEGORO');
INSERT INTO `master_city` VALUES (35, 'CIKAMPEK');
INSERT INTO `master_city` VALUES (36, 'CIANJUR');
INSERT INTO `master_city` VALUES (37, 'KUDUS');
INSERT INTO `master_city` VALUES (38, 'MADURA');
INSERT INTO `master_city` VALUES (39, 'KLATEN');
INSERT INTO `master_city` VALUES (40, 'MAKASSAR');
INSERT INTO `master_city` VALUES (41, 'CIAMIS');
INSERT INTO `master_city` VALUES (42, 'TASIKMALAYA');
INSERT INTO `master_city` VALUES (43, 'LAMONGAN');
INSERT INTO `master_city` VALUES (44, 'PURBALINGGA');
INSERT INTO `master_city` VALUES (45, 'SUMEDANG');

-- ----------------------------
-- Table structure for master_menu
-- ----------------------------
DROP TABLE IF EXISTS `master_menu`;
CREATE TABLE `master_menu`  (
  `id` int NULL DEFAULT NULL,
  `menu` varchar(50) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = ascii COLLATE = ascii_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of master_menu
-- ----------------------------
INSERT INTO `master_menu` VALUES (1, 'MIE SUIT');
INSERT INTO `master_menu` VALUES (2, 'MIE GACOAN LV 1');
INSERT INTO `master_menu` VALUES (3, 'MIE GACOAN LV 2');
INSERT INTO `master_menu` VALUES (4, 'MIE GACOAN LV 3');
INSERT INTO `master_menu` VALUES (5, 'MIE GACOAN LV 4');
INSERT INTO `master_menu` VALUES (6, 'MIE GACOAN LV 6');
INSERT INTO `master_menu` VALUES (7, 'MIE GACOAN LV 8');
INSERT INTO `master_menu` VALUES (8, 'MIE HOMPIMPA LV 1');
INSERT INTO `master_menu` VALUES (9, 'MIE HOMPIMPA LV 2');
INSERT INTO `master_menu` VALUES (10, 'MIE HOMPIMPA LV 3');
INSERT INTO `master_menu` VALUES (11, 'MIE HOMPIMPA LV 4');
INSERT INTO `master_menu` VALUES (12, 'MIE HOMPIMPA LV 6');
INSERT INTO `master_menu` VALUES (13, 'MIE HOMPIMPA LV 8');
INSERT INTO `master_menu` VALUES (14, 'UDANG RAMBUTAN');
INSERT INTO `master_menu` VALUES (15, 'UDANG KEJU');
INSERT INTO `master_menu` VALUES (16, 'SIOMAY AYAM');
INSERT INTO `master_menu` VALUES (17, 'LUMPIA UDANG');
INSERT INTO `master_menu` VALUES (19, 'PANGSIT DIMSUM');
INSERT INTO `master_menu` VALUES (20, 'AIR MINERAL BOTOL');
INSERT INTO `master_menu` VALUES (21, 'LEMON TEA');
INSERT INTO `master_menu` VALUES (22, 'ORANGE');
INSERT INTO `master_menu` VALUES (23, 'TEH TARIK');
INSERT INTO `master_menu` VALUES (24, 'MILO');
INSERT INTO `master_menu` VALUES (25, 'VANILLA LATTE');
INSERT INTO `master_menu` VALUES (26, 'TEA');
INSERT INTO `master_menu` VALUES (27, 'ES COKLAT');
INSERT INTO `master_menu` VALUES (28, 'GREEN THAI TEA\r\n');
INSERT INTO `master_menu` VALUES (29, 'THAI TEA ORI');
INSERT INTO `master_menu` VALUES (30, 'ES GOBAK SODOR');
INSERT INTO `master_menu` VALUES (31, 'ES PETAK UMPET');
INSERT INTO `master_menu` VALUES (32, 'ES SLUKU BATHOK');
INSERT INTO `master_menu` VALUES (33, 'ES TEKLEK\r\n');

-- ----------------------------
-- Table structure for master_resto
-- ----------------------------
DROP TABLE IF EXISTS `master_resto`;
CREATE TABLE `master_resto`  (
  `id` int(1) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `kode_resto` varchar(50) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `resto` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `rm` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `kode_city` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `am` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `kom_resto` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1466 CHARACTER SET = ascii COLLATE = ascii_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of master_resto
-- ----------------------------
INSERT INTO `master_resto` VALUES (1303, 'TLGTEU', 'TULUNGAGUNG', 'JAWA TIMUR 1', 'TULUNGAGUNG', '1', 'RAHMAD', 'MIE GACOAN - TULUNGAGUNG', 'miegacoan.tulungagung@gmail.com');
INSERT INTO `master_resto` VALUES (1304, 'MADSAP', 'MADIUN', 'JAWA TIMUR 1', 'MADIUN', '2', 'RAHMAD', 'MIE GACOAN - MADIUN', 'miegacoan.madiun@gmail.com');
INSERT INTO `master_resto` VALUES (1305, 'MJKSUD', 'MOJOKERTO', 'JAWA TIMUR 1', 'MOJOKERTO', '3', 'AMANDHITA', 'MIE GACOAN - MOJOKERTO', 'miegacoan.mojokerto@gmail.com ');
INSERT INTO `master_resto` VALUES (1306, 'KDRJOY', 'KEDIRI JOYOBOYO', 'JAWA TIMUR 1', 'KEDIRI', '4', 'RAHMAD', 'MIE GACOAN - KEDIRI', 'miegacoan.kediri@gmail.com');
INSERT INTO `master_resto` VALUES (1307, 'SKTMAW', 'SOLO MAWAR', 'JAWA TENGAH', 'SOLO', '5', 'KLARA', 'MIE GACOAN - SOLO MAWAR', 'solomawarmiegacoan@gmail.com');
INSERT INTO `master_resto` VALUES (1308, 'SMNBAB', 'BABARSARI', 'JAWA TENGAH', 'YOGYAKARTA', '6', 'NABILA', 'MIE GACOAN - JOGJA BABARSARI', 'miegacoan.yogyakarta@gmail.com');
INSERT INTO `master_resto` VALUES (1309, 'PNGDIP', 'PONOROGO', 'JAWA TIMUR 1', 'PONOROGO', '7', 'RAHMAD', 'MIE GACOAN - PONOROGO', 'miegacoan.ponorogo@gmail.com');
INSERT INTO `master_resto` VALUES (1310, 'BLTKAL', 'BLITAR', 'JAWA TIMUR 1', 'BLITAR', '8', 'RAHMAD', 'MIE GACOAN - BLITAR', 'miegacoan.blitar@gmail.com');
INSERT INTO `master_resto` VALUES (1311, 'MLGKEN', 'MALANG KENDALSARI', 'JAWA TIMUR 1', 'MALANG', '9', 'MARHATUS', 'MIE GACOAN - MALANG KENDALSARI', 'Miegacoan.malang@gmail.com');
INSERT INTO `master_resto` VALUES (1312, 'PSNSOE', 'PASURUAN', 'JAWA TIMUR 1', 'PASURUAN', '10', 'AMANDHITA', 'MIE GACOAN - PASURUAN SUHAT', 'miegacoan.pasuruann2@gmail.com');
INSERT INTO `master_resto` VALUES (1313, 'JBGURI', 'JOMBANG', 'JAWA TIMUR 1', 'JOMBANG', '11', 'AMANDHITA', 'MIE GACOAN - JOMBANG', 'miegacoan.jombang@gmail.com');
INSERT INTO `master_resto` VALUES (1314, 'NGWDIP', 'NGAWI', 'JAWA TIMUR 1', 'NGAWI', '12', 'RAHMAD', 'MIE GACOAN - NGAWI', 'miegacoan.ngawi@gmail.com');
INSERT INTO `master_resto` VALUES (1315, 'JMRSUM', 'JEMBER', 'JAWA TIMUR 1', 'JEMBER', '13', 'AMANDHITA', 'MIE GACOAN - JEMBER', 'miegacoan.jember@gmail.com');
INSERT INTO `master_resto` VALUES (1316, 'SKHSOE', 'SOLO BARU', 'JAWA TENGAH', 'SOLO', '5', 'KLARA', 'MIE GACOAN - SOLO BARU', 'miegacoan.solobaru@gmail.com');
INSERT INTO `master_resto` VALUES (1317, 'MLGJAK', 'MALANG JAKARTA', 'JAWA TIMUR 1', 'MALANG', '9', 'MARHATUS', 'MIE GACOAN - MALANG JAKARTA', 'miegacoan.malang2@gmail.com');
INSERT INTO `master_resto` VALUES (1318, 'MLGCIL', 'MALANG CILIWUNG', 'JAWA TIMUR 1', 'MALANG', '9', 'MARHATUS', 'MIE GACOAN - MALANG CILIWUNG', 'miegacoan.malcil@gmail.com');
INSERT INTO `master_resto` VALUES (1319, 'YYKTAM', 'TAMANSISWA', 'JAWA TENGAH', 'YOGYAKARTA', '6', 'NABILA', 'MIE GACOAN - JOGJA TAMSIS', 'miegacoan.tamsis@gmail.com');
INSERT INTO `master_resto` VALUES (1320, 'PBLSUR', 'PROBOLINGGO', 'JAWA TIMUR 1', 'PROBOLINGGO', '18', 'AMANDHITA', 'MIE GACOAN - PROBOLINGGO', 'miegacoan.probolinggo@gmail.com');
INSERT INTO `master_resto` VALUES (1321, 'SMGMAK', 'MAKSUM', 'JAWA TENGAH', 'SEMARANG', '19', 'HENRY', 'MIE GACOAN - SEMARANG MAKSUM', 'miegacoan.semarang1@gmail.com');
INSERT INTO `master_resto` VALUES (1322, 'SBYAMB', 'SURABAYA AMBENGAN', 'JAWA TIMUR 2', 'SURABAYA', '20', 'ADIWARA', 'MIE GACOAN - SURABAYA AMBENGAN', 'miegacoan.surabaya@gmail.com');
INSERT INTO `master_resto` VALUES (1323, 'YYKKRA', 'KOTABARU', 'JAWA TENGAH', 'YOGYAKARTA', '6', 'NABILA', 'MIE GACOAN - JOGJA KOTA BARU', 'miegacoan.jogja4@gmail.com');
INSERT INTO `master_resto` VALUES (1324, 'SKTADI', 'SOLO COLOMADU', 'JAWA TENGAH', 'SOLO', '5', 'KLARA', 'MIE GACOAN - SOLO COLOMADU', 'miegacoan.solo3@gmail.com');
INSERT INTO `master_resto` VALUES (1325, 'SMNNGA', 'GODEAN', 'JAWA TENGAH', 'YOGYAKARTA', '6', 'NABILA', 'MIE GACOAN - JOGJA GODEAN', 'miegacoan.jogja5@gmail.com');
INSERT INTO `master_resto` VALUES (1326, 'TBNBAS', 'TUBAN', 'JAWA TIMUR 1', 'TUBAN', '24', 'AMANDHITA', 'MIE GACOAN - TUBAN', 'miegacoan.tuban@gmail.com');
INSERT INTO `master_resto` VALUES (1327, 'SDATEU', 'SIDOARJO TEUKU UMAR', 'JAWA TIMUR 2', 'SIDOARJO', '25', 'RIZYA', 'MIE GACOAN - SIDOARJO', 'miegacoan.sidoarjo@gmail.com');
INSERT INTO `master_resto` VALUES (1328, 'SMGSET', 'TEMBALANG', 'JAWA TENGAH', 'SEMARANG', '19', 'RISAL', 'MIE GACOAN - SEMARANG TEMBALANG', 'miegacoan.semarang2@gmail.com');
INSERT INTO `master_resto` VALUES (1329, 'SBYMEN', 'SURABAYA WIYUNG', 'JAWA TIMUR 2', 'SURABAYA', '20', 'ADIWARA', 'MIE GACOAN - SURABAYA WIYUNG', 'miegacoan.surabaya2@gmail.com');
INSERT INTO `master_resto` VALUES (1330, 'CBNTEN', 'CIREBON TENTARA', 'JAWA BARAT 1', 'CIREBON', '28', 'WIWIN', 'MIE GACOAN - CIREBON', 'miegacoan.cirebon@gmail.com');
INSERT INTO `master_resto` VALUES (1331, 'BDGSET', 'BANDUNG SETIABUDI', 'JAWA BARAT 1', 'BANDUNG', '29', 'ANISA', 'MIE GACOAN - BANDUNG SETIABUDI', 'miegacoan.bandung@gmail.com');
INSERT INTO `master_resto` VALUES (1332, 'GSKSUD', 'GRESIK PANGLIMA', 'JAWA TIMUR 2', 'GRESIK', '30', 'ADIWARA', 'MIE GACOAN - GRESIK', 'miegacoan.gresik@gmail.com');
INSERT INTO `master_resto` VALUES (1333, 'BTUSUP', 'BATU', 'JAWA TIMUR 1', 'MALANG', '9', 'RAHMAD', 'MIE GACOAN - BATU', 'miegacoan.batu@gmail.com');
INSERT INTO `master_resto` VALUES (1334, 'MGGTID', 'MAGELANG', 'JAWA TENGAH', 'MAGELANG', '32', 'KLARA', 'MIE GACOAN - MAGELANG', 'miegacoan.magelang@gmail.com');
INSERT INTO `master_resto` VALUES (1335, 'SMGHAM', 'NGALIYAN', 'JAWA TENGAH', 'SEMARANG', '19', 'HENRY', 'MIE GACOAN - SEMARANG NGALIYAN', 'miegacoan.smg3@gmail.com');
INSERT INTO `master_resto` VALUES (1336, 'TGLSUD', 'TEGAL', 'JAWA TENGAH', 'TEGAL', '34', 'HENRY', 'MIE GACOAN - TEGAL', 'miegacoan.tegal@gmail.com');
INSERT INTO `master_resto` VALUES (1337, 'MLGRON', 'MALANG STASIUN', 'JAWA TIMUR 1', 'MALANG', '9', 'MARHATUS', 'MIE GACOAN - MALANG STASIUN', 'miegacoan.malang4@gmail.com');
INSERT INTO `master_resto` VALUES (1338, 'SBYMAN', 'SURABAYA MANYAR', 'JAWA TIMUR 2', 'SURABAYA', '20', 'DESI', 'MIE GACOAN - SURABAYA MANYAR', 'miegacoan.surabaya3@gmail.com');
INSERT INTO `master_resto` VALUES (1339, 'SMGSUD', 'MAJAPAHIT', 'JAWA TENGAH', 'SEMARANG', '19', 'RISAL', 'MIE GACOAN - SEMARANG MAJAPAHIT', 'miegacoan.semarang4@gmail.com ');
INSERT INTO `master_resto` VALUES (1340, 'PWTSOE', 'PURWOKERTO', 'JAWA TENGAH', 'PURWOKERTO', '38', 'HENRY', 'MIE GACOAN - PURWOKERTO', 'miegacoan.purwokerto@gmail.com');
INSERT INTO `master_resto` VALUES (1341, 'SMGPAM', 'PAMULARSIH', 'JAWA TENGAH', 'SEMARANG', '19', 'HENRY', 'MIE GACOAN - SEMARANG PAMULARSIH', 'miegacoan.semarang5@gmail.com');
INSERT INTO `master_resto` VALUES (1342, 'BDGUKU', 'BANDUNG DIPATIUKUR', 'JAWA BARAT 1', 'BANDUNG', '29', 'ILYASHA', 'MIE GACOAN - BANDUNG DIPATIUKUR', 'miegacoan.bandung2@gmail.com');
INSERT INTO `master_resto` VALUES (1343, 'MLGSUP', 'MALANG SUKUN', 'JAWA TIMUR 1', 'MALANG', '9', 'MARHATUS', 'MIE GACOAN - MALANG SUKUN', 'miegacoan.malang5@gmail.com');
INSERT INTO `master_resto` VALUES (1344, 'SBYSOE', 'SURABAYA MERR', 'JAWA TIMUR 2', 'SURABAYA', '20', 'DESI', 'MIE GACOAN - SURABAYA MERR', 'miegacoan.surabaya4@gmail.com');
INSERT INTO `master_resto` VALUES (1345, 'BDGPAS', 'BANDUNG PASKAL', 'JAWA BARAT 1', 'BANDUNG', '29', 'ILYASHA', 'MIE GACOAN - BANDUNG PASKAL', 'miegacoan.bandung3@gmail.com');
INSERT INTO `master_resto` VALUES (1346, 'SBYMAR', 'SURABAYA MARGOREJO', 'JAWA TIMUR 2', 'SURABAYA', '20', 'DESI', 'MIE GACOAN - SURABAYA MARGOREJO', 'miegacoan.surabaya5@gmail.com');
INSERT INTO `master_resto` VALUES (1347, 'SMGSUK', 'BANYUMANIK', 'JAWA TENGAH', 'SEMARANG', '19', 'RISAL', 'MIE GACOAN - SEMARANG BANYUMANIK', 'miegacoan.semarang6@gmail.com');
INSERT INTO `master_resto` VALUES (1348, 'KWGGAL', 'KARAWANG', 'JAWA BARAT 2', 'KARAWANG', '46', 'AFIYAH', 'MIE GACOAN - KARAWANG', 'miegacoan.karawang88@gmail.com');
INSERT INTO `master_resto` VALUES (1349, 'SKTSLA', 'KARTASURA', 'JAWA TENGAH', 'SOLO', '5', 'KLARA', 'MIE GACOAN - KARTASURA', 'miegacoan.kartasura@gmail.com');
INSERT INTO `master_resto` VALUES (1350, 'DPKMAR', 'DEPOK MARGONDA', 'JAWA BARAT 2', 'DEPOK', '48', 'RATNA', 'MIE GACOAN - DEPOK MARGONDA', 'miegacoan.depokmargo@gmail.com');
INSERT INTO `master_resto` VALUES (1351, 'SKTURI', 'SOLO JEBRES', 'JAWA TENGAH', 'SOLO', '5', 'KLARA', 'MIE GACOAN - SOLO JEBRES', 'miegacoan.soloo4@gmail.com');
INSERT INTO `master_resto` VALUES (1352, 'MLGTLO', 'MALANG DINOYO', 'JAWA TIMUR 1', 'MALANG', '9', 'MARHATUS', 'MIE GACOAN - MALANG DINOYO', 'miegacoan.malang6@gmail.com');
INSERT INTO `master_resto` VALUES (1353, 'BGRPAD', 'BOGOR PAJAJARAN', 'JAWA BARAT 2', 'BOGOR', '51', 'WINDY', 'MIE GACOAN - BOGOR PADJAJARAN', 'miegacoan.bogor@gmail.com');
INSERT INTO `master_resto` VALUES (1354, 'SMGVET', 'VETERAN', 'JAWA TENGAH', 'SEMARANG', '19', 'HENRY', 'MIE GACOAN - SEMARANG VETERAN', 'Miegacoan.semarang7@gmail.com');
INSERT INTO `master_resto` VALUES (1355, 'SMNMAG', 'JOMBOR', 'JAWA TENGAH', 'YOGYAKARTA', '6', 'NABILA', 'MIE GACOAN - JOGJA JOMBOR', 'miegacoan.jogja6@gmail.com');
INSERT INTO `master_resto` VALUES (1356, 'SBYSUN', 'SURABAYA MAYJEND', 'JAWA TIMUR 2', 'SURABAYA', '20', 'ADIWARA', 'MIE GACOAN - MAYJEND', 'miegacoan.surabaya6@gmail.com');
INSERT INTO `master_resto` VALUES (1357, 'MLGMON', 'MALANG SINGOSARI', 'JAWA TIMUR 1', 'MALANG', '9', 'MARHATUS', 'MIE GACOAN - MALANG SINGOSARI', 'miegacoan.malang7@gmail.com');
INSERT INTO `master_resto` VALUES (1358, 'SMNAFF', 'GEJAYAN', 'JAWA TENGAH', 'YOGYAKARTA', '6', 'NABILA', 'MIE GACOAN - JOGJA GEJAYAN', 'miegacoan.jogja7@gmail.com');
INSERT INTO `master_resto` VALUES (1359, 'BKSJUA', 'BEKASI JUANDA', 'JAWA BARAT 2', 'BEKASI', '57', 'KHAFID', 'MIE GACOAN - BEKASI JUANDA', 'miegacoan.bekasi1@gmail.com');
INSERT INTO `master_resto` VALUES (1360, 'BDGDAG', 'BANDUNG DAGO', 'JAWA BARAT 1', 'BANDUNG', '29', 'SEPTI', 'MIE GACOAN - BANDUNG DAGO', 'Miegacoan.bdg4@gmail.com');
INSERT INTO `master_resto` VALUES (1361, 'SDAPAB', 'SIDOARJO TROPODO', 'JAWA TIMUR 2', 'SIDOARJO', '25', 'RIZYA', 'MIE GACOAN - SIDOARJO 2 TROPODO', 'miegacoan.sda2tropo@gmail.com');
INSERT INTO `master_resto` VALUES (1362, 'KYBTEB', 'JAKARTA TEBET', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'WASIL', 'MIE GACOAN - JAKARTA TEBET', 'miegacoan.jakteb1@gmail.com');
INSERT INTO `master_resto` VALUES (1363, 'SBYKEN', 'SURABAYA KENJERAN', 'JAWA TIMUR 2', 'SURABAYA', '20', 'DESI', 'MIE GACOAN - SURABAYA KENJERAN', 'miegacoan.sby7@gmail.com');
INSERT INTO `master_resto` VALUES (1364, 'CKRTHA', 'CIKARANG', 'JAWA BARAT 2', 'CIKARANG', '62', 'AFIYAH', 'MIE GACOAN - CIKARANG', 'miegacoan.cikarang1@gmail.com');
INSERT INTO `master_resto` VALUES (1365, 'BKSJAT', 'BEKASI JATIWARINGIN', 'JAWA BARAT 2', 'BEKASI', '57', 'KHAFID', 'MIE GACOAN - BEKASI JATIWARINGIN', 'miegacoan.bks2jatiwaringin@gmail.com');
INSERT INTO `master_resto` VALUES (1366, 'BDGGAT', 'BANDUNG GATSU', 'JAWA BARAT 1', 'BANDUNG', '29', 'SEPTI', 'MIE GACOAN - BANDUNG GATSU', 'miegacoan.bandung5@gmail.com');
INSERT INTO `master_resto` VALUES (1367, 'YYKSON', 'WIROBRAJAN', 'JAWA TENGAH', 'YOGYAKARTA', '6', 'NABILA', 'MIE GACOAN - JOGJA WIROBRAJAN', 'miegacoan.jogja8@gmail.com');
INSERT INTO `master_resto` VALUES (1368, 'SBYAHM', 'SURABAYA A YANI', 'JAWA TIMUR 2', 'SURABAYA', '20', 'DESI', 'MIE GACOAN - SURABAYA A. YANI', 'miegacoan.surabaya8@gmail.com');
INSERT INTO `master_resto` VALUES (1369, 'DPKJAS', 'DEPOK KELAPA DUA', 'JAWA BARAT 2', 'DEPOK', '48', 'RATNA', 'MIE GACOAN - DEPOK KELAPA DUA', 'miegacoan.depok2@gmail.com');
INSERT INTO `master_resto` VALUES (1370, 'BDGSUR', 'BANDUNG SUMANTRI', 'JAWA BARAT 1', 'BANDUNG', '29', 'ANISA', 'MIE GACOAN - BANDUNG SUMANTRI', 'miegacoan.bandung6@gmail.com');
INSERT INTO `master_resto` VALUES (1371, 'BGRTAJ', 'BOGOR TAJUR', 'JAWA BARAT 2', 'BOGOR', '51', 'WINDY', 'MIE GACOAN - BOGOR TAJUR', 'miegacoan.bgr2tajur@gmail.com');
INSERT INTO `master_resto` VALUES (1372, 'BDGBUA', 'BANDUNG BUBAT', 'JAWA BARAT 1', 'BANDUNG', '29', 'SEPTI', 'MIE GACOAN - BANDUNG BUBAT', 'miegacoan.bdg7bubat@gmail.com');
INSERT INTO `master_resto` VALUES (1373, 'GSKSUM', 'GRESIK GKB', 'JAWA TIMUR 2', 'GRESIK', '30', 'ADIWARA', 'MIE GACOAN - GRESIK GKB', 'miegacoan.gresik2@gmail.com');
INSERT INTO `master_resto` VALUES (1374, 'BKSBIN', 'BEKASI BINTARA', 'JAWA BARAT 2', 'BEKASI', '57', 'KHAFID', 'MIE GACOAN - BEKASI BINTARA', 'miegacoan.bks3bintara@gmail.com');
INSERT INTO `master_resto` VALUES (1375, 'PWKTAM', 'PURWAKARTA', 'JAWA BARAT 2', 'PURWAKARTA', '73', 'AFIYAH', 'MIE GACOAN - PURWAKARTA', 'miegacoan.purwakarta@gmail.com');
INSERT INTO `master_resto` VALUES (1376, 'KYBKES', 'JAKARTA BINTARO', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'NOVAN', 'MIE GACOAN - JAKARTA BINTARO', 'miegacoan.jkt2bintaro@gmail.com');
INSERT INTO `master_resto` VALUES (1377, 'BGRSAP', 'BOGOR YASMIN', 'JAWA BARAT 2', 'BOGOR', '51', 'WINDY', 'MIE GACOAN - BOGOR YASMIN', 'miegacoan.bgr3yasmin@gmail.com');
INSERT INTO `master_resto` VALUES (1378, 'SBYTAN', 'SURABAYA MANUKAN', 'JAWA TIMUR 2', 'SURABAYA', '20', 'ADIWARA', 'MIE GACOAN - SURABAYA MANUKAN', 'miegacoan.sby9manukan@gmail.com');
INSERT INTO `master_resto` VALUES (1379, 'BKSGOL', 'BEKASI GOLDEN CITY', 'JAWA BARAT 2', 'BEKASI', '57', 'KHAFID', 'MIE GACOAN - BEKASI GOLDEN CITY', 'miegacoan.bks4goldencity@gmail.com');
INSERT INTO `master_resto` VALUES (1380, 'MADSAL', 'MADIUN 2', 'JAWA TIMUR 1', 'MADIUN', '2', 'RAHMAD', 'MIE GACOAN - MADIUN 2', 'miegacoan.madiun2@gmail.com');
INSERT INTO `master_resto` VALUES (1381, 'BDGNAS', 'BANDUNG UJUNG BERUNG', 'JAWA BARAT 1', 'BANDUNG', '29', 'SEPTI', 'MIE GACOAN - BANDUNG CIBIRU', 'miegacoan.bdgujungberung@gmail.com');
INSERT INTO `master_resto` VALUES (1382, 'CPTPUS', 'TANGERANG PUSPITEK', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'YOSUA', 'MIE GACOAN - TANGERANG PUSPITEK', 'miegacoan.tangerangpuspitek@gmail.com');
INSERT INTO `master_resto` VALUES (1383, 'SDAPON', 'SIDOARJO PONTI', 'JAWA TIMUR 2', 'SIDOARJO', '25', 'RIZYA', 'MIE GACOAN - SIDOARJO PONTI', 'miegacoan.sdaponti@gmail.com');
INSERT INTO `master_resto` VALUES (1384, 'SORTAM', 'BANDUNG KOPO', 'JAWA BARAT 1', 'BANDUNG', '29', 'ILYASHA', 'MIE GACOAN - BANDUNG MARGAASIH', 'miegacoan.bdgkopo@gmail.com');
INSERT INTO `master_resto` VALUES (1385, 'CLPPAR', 'CILACAP', 'JAWA TENGAH', 'CILACAP', '83', 'KLARA', 'MIE GACOAN - CILACAP', 'miegacoan.cilacap1@gmail.com');
INSERT INTO `master_resto` VALUES (1386, 'SDAGEL', 'SIDOARJO CANDI', 'JAWA TIMUR 2', 'SIDOARJO', '25', 'RIZYA', 'MIE GACOAN - SIDOARJO CANDI', 'miegacoan.sdacandi@gmail.com');
INSERT INTO `master_resto` VALUES (1387, 'CBNPEM', 'CIREBON PEMUDA', 'JAWA BARAT 1', 'CIREBON', '28', 'WIWIN', 'MIE GACOAN - CIREBON PEMUDA', 'miegacoan.cirebon2pemuda@gmail.com');
INSERT INTO `master_resto` VALUES (1388, 'TNGHAS', 'TANGERANG CIPONDOH', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'LIZA', 'MIE GACOAN - TANGERANG CIPONDOH', 'miegacoan.tgr2cipondoh@gmail.com ');
INSERT INTO `master_resto` VALUES (1389, 'CKGBOU', 'JAKARTA CAKUNG', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'NOVAN', 'MIE GACOAN - JAKARTA CAKUNG GARDEN CITY', 'miegacoan.jkt3cakung@gmail.com');
INSERT INTO `master_resto` VALUES (1390, 'BJNTEU', 'BOJONEGORO', 'JAWA TIMUR 1', 'BOJONEGORO', '88', 'AMANDHITA', 'MIE GACOAN - BOJONEGORO', 'miegacoan.bojonegoro1teukuumar@gmail.com');
INSERT INTO `master_resto` VALUES (1391, 'SDATAM', 'SIDOARJO PURI SURYA', 'JAWA TIMUR 2', 'SIDOARJO', '25', 'RIZYA', 'MIE GACOAN - SIDOARJO PURI SURYA', 'miegacoan.sda5purisurya@gmail.com');
INSERT INTO `master_resto` VALUES (1392, 'BKSBAN', 'BEKASI MUSTIKA', 'JAWA BARAT 2', 'BEKASI', '57', 'KHAFID', 'MIE GACOAN - BEKASI MUSTIKA', 'miegacoan.bks5mustika@gmail.com');
INSERT INTO `master_resto` VALUES (1393, 'CMHAMI', 'BANDUNG CIMAHI', 'JAWA BARAT 1', 'BANDUNG', '29', 'ANISA', 'MIE GACOAN - BANDUNG CIMAHI', 'miegacoan.bdgcimahi@gmail.com');
INSERT INTO `master_resto` VALUES (1394, 'BGRABD', 'BOGOR GUNUNG BATU', 'JAWA BARAT 2', 'BOGOR', '51', 'WINDY', 'MIE GACOAN - BOGOR GUNUNG BATU', 'miegacoan.bgr4gunungbatu@gmail.com');
INSERT INTO `master_resto` VALUES (1395, 'KWGAHM', 'CIKAMPEK', 'JAWA BARAT 2', 'CIKAMPEK', '93', 'AFIYAH', 'MIE GACOAN - CIKAMPEK', 'miegacoan.cikampek@gmail.com');
INSERT INTO `master_resto` VALUES (1396, 'SDABAM', 'SIDOARJO KRIAN', 'JAWA TIMUR 2', 'SIDOARJO', '25', 'RIZYA', 'MIE GACOAN - SIDOARJO KRIAN', 'miegacoan.sda6krian@gmail.com');
INSERT INTO `master_resto` VALUES (1397, 'KDRURI', 'KEDIRI URIP SUMOHARJO', 'JAWA TIMUR 1', 'KEDIRI', '4', 'RAHMAD', 'MIE GACOAN - KEDIRI URIP SUMOHARJO', 'miegacoan.kdruripsumoharjo@gmail.com');
INSERT INTO `master_resto` VALUES (1398, 'SKTVET', 'SOLO VETERAN', 'JAWA TENGAH', 'SOLO', '5', 'KLARA', 'MIE GACOAN - SOLO VETERAN', 'miegacoan.soloveteran@gmail.com');
INSERT INTO `master_resto` VALUES (1399, 'CJRSUR', 'CIANJUR', 'JAWA BARAT 2', 'CIANJUR', '97', 'AFIYAH', 'MIE GACOAN - CIANJUR', 'miegacoan.cianjur@gmail.com');
INSERT INTO `master_resto` VALUES (1400, 'CPTCIA', 'TANGERANG CIATER RAYA', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'YOSUA', 'MIE GACOAN - TANGERANG CIATER', 'miegacoan.tgr3ciater@gmail.com');
INSERT INTO `master_resto` VALUES (1401, 'DPKBOJ', 'DEPOK BOJONGSARI', 'JAWA BARAT 2', 'DEPOK', '48', 'RATNA', 'MIE GACOAN - DEPOK BOJONGSARI', 'miegacoan.depokbojongsari@gmail.com');
INSERT INTO `master_resto` VALUES (1402, 'DPKSAW', 'DEPOK SAWANGAN', 'JAWA BARAT 2', 'DEPOK', '48', 'RATNA', 'MIE GACOAN - DEPOK SAWANGAN', 'miegacoan.depok3sawangan@gmail.com');
INSERT INTO `master_resto` VALUES (1403, 'BGRSHO', 'BOGOR SOLEH ISKANDAR', 'JAWA BARAT 2', 'BOGOR', '51', 'WINDY', 'MIE GACOAN - BOGOR SOLEH ISKANDAR', 'miegacoan.bgr5solehiskandar@gmail.com');
INSERT INTO `master_resto` VALUES (1404, 'KDRKED', 'KEDIRI PARE', 'JAWA TIMUR 1', 'KEDIRI', '4', 'RAHMAD', 'MIE GACOAN - KEDIRI PARE', 'miegacoan.pare@gmail.com');
INSERT INTO `master_resto` VALUES (1405, 'UNRDIP', 'UNGARAN', 'JAWA TENGAH', 'SEMARANG', '19', 'RISAL', 'MIE GACOAN - SEMARANG UNGARAN', 'miegacoan.semarangungaran@gmail.com');
INSERT INTO `master_resto` VALUES (1406, 'BDGSUM', 'BANDUNG BRAGA', 'JAWA BARAT 1', 'BANDUNG', '29', 'SEPTI', 'MIE GACOAN - BANDUNG BRAGA', 'miegacoan.bandungbraga@gmail.com');
INSERT INTO `master_resto` VALUES (1407, 'KDSSUB', 'KUDUS', 'JAWA TENGAH', 'KUDUS', '105', 'RISAL', 'MIE GACOAN - KUDUS', 'miegacoan.kudus@gmail.com');
INSERT INTO `master_resto` VALUES (1408, 'PMKJOK', 'MADURA PAMEKASAN', 'JAWA TIMUR 2', 'MADURA', '106', 'ADIWARA', 'MIE GACOAN - MADURA PAMEKASAN', 'miegacoan.madurapamekasan@gmail.com');
INSERT INTO `master_resto` VALUES (1409, 'BDGPET', 'BANDUNG PETA', 'JAWA BARAT 1', 'BANDUNG', '29', 'ILYASHA', 'MIE GACOAN - BANDUNG PETA', 'miegacoan.bandungpeta@gmail.com');
INSERT INTO `master_resto` VALUES (1410, 'BKSWIB', 'BEKASI JATIASIH', 'JAWA BARAT 2', 'BEKASI', '57', 'KHAFID', 'MIE GACOAN - BEKASI JATIASIH', 'miegacoan.bksjatiasih@gmail.com');
INSERT INTO `master_resto` VALUES (1411, 'MLGDIR', 'MALANG SAWOJAJAR', 'JAWA TIMUR 1', 'MALANG', '9', 'MARHATUS', 'MIE GACOAN - MALANG SAWOJAJAR', 'miegacoan.malangsawojajar@gmail.com');
INSERT INTO `master_resto` VALUES (1412, 'SBYRAN', 'SURABAYA TAMBAKSARI', 'JAWA TIMUR 2', 'SURABAYA', '20', 'DESI', 'MIE GACOAN - SURABAYA TAMBAKSARI', 'miegacoan.sbytambaksari@gmail.com');
INSERT INTO `master_resto` VALUES (1413, 'SMGIMA', 'IMAM BONJOL', 'JAWA TENGAH', 'SEMARANG', '19', 'HENRY', 'MIE GACOAN - SEMARANG IMAM BONJOL', 'miegacoan.smrgimambonjol@gmail.com');
INSERT INTO `master_resto` VALUES (1414, 'KLNKUS', 'KLATEN', 'JAWA TENGAH', 'KLATEN', '112', 'KLARA', 'MIE GACOAN - KLATEN', 'miegacoan.klaten@gmail.com');
INSERT INTO `master_resto` VALUES (1415, 'SMGSOE', 'SOEKARNO HATTA', 'JAWA TENGAH', 'SEMARANG', '19', 'RISAL', 'MIE GACOAN - SEMARANG SOETTA', 'miegacoan.smrgsoekarnohatta@gmail.com');
INSERT INTO `master_resto` VALUES (1416, 'CMHBAR', 'BANDUNG CIMAHI PADASUKA', 'JAWA BARAT 1', 'BANDUNG', '29', 'ANISA', 'MIE GACOAN - BANDUNG CIMAHI PADASUKA', 'miegacoan.cimahi2padasuka@gmail.com');
INSERT INTO `master_resto` VALUES (1417, 'SBYBUN', 'SURABAYA BUNG TOMO', 'JAWA TIMUR 2', 'SURABAYA', '20', 'DESI', 'MIE GACOAN - SURABAYA BUNG TOMO', 'miegacoan.sbybungtomo@gmail.com');
INSERT INTO `master_resto` VALUES (1418, 'CKRTAR', 'CIKARANG TARUM BARAT', 'JAWA BARAT 2', 'BEKASI', '57', 'AFIYAH', 'MIE GACOAN - BEKASI TARUM BARAT', 'miegacoan.bkstarumbarat@gmail.com');
INSERT INTO `master_resto` VALUES (1419, 'KWGTUP', 'KARAWANG BARAT', 'JAWA BARAT 2', 'KARAWANG', '46', 'AFIYAH', 'MIE GACOAN - KARAWANG BARAT', 'miegacoan.karawang2barat@gmail.com');
INSERT INTO `master_resto` VALUES (1420, 'SORKOP', 'BANDUNG KOPO SAYATI', 'JAWA BARAT 1', 'BANDUNG', '29', 'ILYASHA', 'MIE GACOAN - BANDUNG MARGAHAYU', 'miegacoan.bdgkoposayati@gmail.com');
INSERT INTO `master_resto` VALUES (1421, 'TJPDAN', 'JAKARTA SUNTER RAYA', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'NOVAN', 'MIE GACOAN - JAKARTA SUNTER UTARA', 'miegacoan.jktsunterutara@gmail.com');
INSERT INTO `master_resto` VALUES (1422, 'MKSTUN', 'MAKASSAR GOWA', 'JAWA TIMUR 1', 'MAKASSAR', '120', 'VACANT', 'MIE GACOAN - MAKASSAR GOWA', 'miegacoan.makassar1gowa@gmail.com');
INSERT INTO `master_resto` VALUES (1423, 'NPHLEM', 'BANDUNG LEMBANG', 'JAWA BARAT 1', 'BANDUNG', '29', 'ANISA', 'MIE GACOAN - BANDUNG LEMBANG', 'miegacoan.bdglembang@gmail.com');
INSERT INTO `master_resto` VALUES (1424, 'MKSAHM', 'MAKASSAR KAREBOSSI MALL', 'JAWA TIMUR 1', 'MAKASSAR', '120', 'VACANT', 'MIE GACOAN - MAKASSAR KAREBOSI', 'miegacoan.mks2karebosi@gmail.com');
INSERT INTO `master_resto` VALUES (1425, 'CBICIB', 'BOGOR DRAMAGA', 'JAWA BARAT 2', 'BOGOR', '51', 'WINDY', 'MIE GACOAN - BOGOR DRAMAGA', 'miegacoan.bgr6dramaga@gmail.com ');
INSERT INTO `master_resto` VALUES (1426, 'BKSALT', 'BEKASI ALTERNATIF CIBUBUR', 'JAWA BARAT 2', 'BEKASI', '57', 'RATNA', 'MIE GACOAN - BEKASI ALTERNATIF CIBUBUR', 'miegacoan.bks7cibubur@gmail.com');
INSERT INTO `master_resto` VALUES (1427, 'CKGPAH', 'JAKARTA PAHLAWAN REVOLUSI', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'WASIL', 'MIE GACOAN - JAKARTA PAHLAWAN REVOLUSI', 'miegacoan.jkt5pahlawanrevolusi@gmail.com');
INSERT INTO `master_resto` VALUES (1428, 'SDAIMA', 'SIDOARJO GELURAN', 'JAWA TIMUR 2', 'SIDOARJO', '25', 'RIZYA', 'MIE GACOAN - SIDOARJO GELURAN', 'miegacoan.sda7geluran@gmail.com ');
INSERT INTO `master_resto` VALUES (1429, 'TNGSAL', 'TANGERANG RADEN SALEH', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'LIZA', 'MIE GACOAN - TANGERANG RADEN SALEH', 'miegacoan.tgr4radensaleh@gmail.com');
INSERT INTO `master_resto` VALUES (1430, 'SDABRI', 'SIDOARJO CITRA HARMONI', 'JAWA TIMUR 2', 'SIDOARJO', '25', 'RIZYA', 'MIE GACOAN - SIDOARJO CITRA HARMONI', 'miegacoan.sda8citraharmoni@gmail.com');
INSERT INTO `master_resto` VALUES (1431, 'SBYMUL', 'SURABAYA MULYOREJO', 'JAWA TIMUR 2', 'SURABAYA', '20', 'DESI', 'MIE GACOAN - SURABAYA MERR 2', 'miegacoan.sby12mulyorejo@gmail.com');
INSERT INTO `master_resto` VALUES (1432, 'CMSAHM', 'CIAMIS', 'JAWA BARAT 1', 'CIAMIS', '130', 'WIWIN', 'MIE GACOAN - CIAMIS', 'miegacoan.ciamis@gmail.com');
INSERT INTO `master_resto` VALUES (1433, 'SPASIL', 'TASIKMALAYA SILIWANGI', 'JAWA BARAT 1', 'TASIKMALAYA', '131', 'WIWIN', 'MIE GACOAN - TASIKMALAYA', 'miegacoan.tasikmalaya1siliwangi@gmail.com');
INSERT INTO `master_resto` VALUES (1434, 'TNACEM', 'JAKARTA CEMPAKA PUTIH', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'NOVAN', 'MIE GACOAN - JAKARTA CEMPAKA PUTIH', 'miegacoan.jkt6cempakaputih@gmail.com');
INSERT INTO `master_resto` VALUES (1435, 'SMGWOL', 'GENUKAN', 'JAWA TENGAH', 'SEMARANG', '19', 'RISAL', 'MIE GACOAN - GENUKAN', 'miegacoan.smrg11genuk@gmail.com');
INSERT INTO `master_resto` VALUES (1436, 'GGPDAA', 'JAKARTA DAAN MOGOT', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'LIZA', 'MIE GACOAN - JAKARTA DAAN MOGOT', 'miegacoan.jkt6daanmogot@gmail.com');
INSERT INTO `master_resto` VALUES (1437, 'LMGSUD', 'LAMONGAN', 'JAWA TIMUR 1', 'LAMONGAN', '135', 'AMANDHITA', 'MIE GACOAN - LAMONGAN', 'miegacoan.lamongan1pangsud@gmail.com');
INSERT INTO `master_resto` VALUES (1438, 'CBIMAY', 'BOGOR MAYOR OKING', 'JAWA BARAT 2', 'BOGOR', '51', 'WINDY', 'MIE GACOAN - BOGOR MAYOR OKING', 'miegacoan.bgr8mayoroking@gmail.com');
INSERT INTO `master_resto` VALUES (1439, 'TNGCIL', 'TANGERANG CILEDUG RAYA', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'YOSUA', 'MIE GACOAN - TANGERANG CILEDUG', 'miegacoantgr4ciledugraya@gmail.com');
INSERT INTO `master_resto` VALUES (1440, 'KYBFAT', 'JAKARTA FATMAWATI', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'WASIL', 'MIE GACOAN - JAKARTA RAYA FATMAWATI', 'miegacoan.jkt8fatmawati@gmail.com');
INSERT INTO `master_resto` VALUES (1441, 'TNAMAN', 'JAKARTA MANGGA BESAR', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'WASIL', 'MIE GACOAN - JAKARTA MANGGA BESAR', 'miegacoan.jkt9manggabesar@gmail.com');
INSERT INTO `master_resto` VALUES (1442, 'CPTALA', 'TANGERANG ALAM SUTRA', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'YOSUA', 'MIE GACOAN - TANGERANG ALAM SUTRA', 'miegacoan.tgr5alamsutra@gmail.com');
INSERT INTO `master_resto` VALUES (1443, 'TGRHAR', 'TANGERANG CITRA RAYA', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'YOSUA', 'MIE GACOAN - TANGERANG CITRA RAYA', 'miegacoan.tgrcitraraya@gmail.com');
INSERT INTO `master_resto` VALUES (1444, 'PBGHAR', 'PURBALINGGA HARYONO', 'JAWA TENGAH', 'PURBALINGGA', '142', 'HENRY', 'MIE GACOAN - PURBALINGGA HARYONO', 'miegacoan.purbalingga@gmail.com');
INSERT INTO `master_resto` VALUES (1445, 'CPTCIP', 'TANGERANG JOMBANG CIPUTAT', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'YOSUA', 'MIE GACOAN - TANGERANG CIPUTAT', 'miegacoan.tgrciputatjombang@gmail.com');
INSERT INTO `master_resto` VALUES (1446, 'GGPPAN', 'JAKARTA PANJANG', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'LIZA', 'MIE GACOAN - JAKARTA PANJANG', 'miegacoan.jkt11panjang@gmail.com');
INSERT INTO `master_resto` VALUES (1447, 'MKSPER', 'MAKASSAR PERINTIS', 'JAWA TIMUR 1', 'MAKASSAR', '120', 'VACANT', 'MIE GACOAN - MAKASSAR PERINTIS', 'miegacoan.mks4perintis@gmail.com');
INSERT INTO `master_resto` VALUES (1448, 'MKSRAT', 'MAKASSAR SAM RATULANGI', 'JAWA TIMUR 1', 'MAKASSAR', '120', 'VACANT', 'MIE GACOAN - MAKASSAR SAM RATULANGI', 'miegacoan.mkssamratulangi@gmail.com');
INSERT INTO `master_resto` VALUES (1449, 'BDGTER', 'BANDUNG PASIRKOJA', 'JAWA BARAT 1', 'BANDUNG', '29', 'ILYASHA', 'MIE GACOAN - BANDUNG PASIR KOJA', 'miegacoan.bandungpasirkoja@gmail.com');
INSERT INTO `master_resto` VALUES (1450, 'CBITEG', 'BOGOR CIBINONG', 'JAWA BARAT 2', 'BOGOR', '51', 'WINDY', 'MIE GACOAN - BOGOR CIBINONG', 'miegacoan.bgr7cibinong@gmail.com');
INSERT INTO `master_resto` VALUES (1451, 'MKSPET', 'MAKASSAR PETTARANI', 'JAWA TIMUR 1', 'MAKASSAR', '120', 'VACANT', 'MIE GACOAN - MAKASSAR PETTARANI', 'miegacoan.mks3pettarani@gmail.com');
INSERT INTO `master_resto` VALUES (1452, 'CKGINT', 'JAKARTA RADEN INTAN', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'NOVAN', 'MIE GACOAN - JAKARTA RADEN INTAN', 'miegacoan.jkt9radeninten@gmail.com');
INSERT INTO `master_resto` VALUES (1453, 'DPKPAR', 'DEPOK PARUNG', 'JAWA BARAT 2', 'DEPOK', '48', 'RATNA', 'MIE GACOAN - DEPOK PARUNG', 'miegacoan.depokparung@gmail.com');
INSERT INTO `master_resto` VALUES (1454, 'SPAYUD', 'TASIKMALAYA YUDHANEGARA', 'JAWA BARAT 1', 'TASIKMALAYA', '131', 'WIWIN', 'MIE GACOAN - TASIKMALAYA YUDHANEGARA', 'miegacoan.tasik2yudanegara@gmail.com');
INSERT INTO `master_resto` VALUES (1455, 'NPHCIB', 'BANDUNG PADALARANG', 'JAWA BARAT 1', 'BANDUNG', '29', 'ANISA', 'MIE GACOAN - BANDUNG PADALARANG', 'miegacoan.bandungpadalarang@gmail.com');
INSERT INTO `master_resto` VALUES (1456, 'TGRKUT', 'TANGERANG KUTABUMI', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'LIZA', 'MIE GACOAN - TANGERANG KUTABUMI', 'miegacoan.tangerangkutabumi@gmail.com');
INSERT INTO `master_resto` VALUES (1457, 'SORLAS', 'BANDUNG MAJALAYA', 'JAWA BARAT 1', 'BANDUNG', '29', 'SEPTI', 'MIE GACOAN - BANDUNG MAJALAYA', 'miegacoan.bandungmajalaya@gmail.com');
INSERT INTO `master_resto` VALUES (1458, 'KYBKEM', 'JAKARTA KEMANG RAYA', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'WASIL', 'MIE GACOAN - JAKARTA KEMANG RAYA', 'miegacoan.jkt10kemangraya@gmail.com');
INSERT INTO `master_resto` VALUES (1459, 'KYBCIL', 'JAKARTA CILANDAK', 'JAKARTA TANGERANG', 'JAKARTA', '60', NULL, 'MIE GACOAN - JAKARTA CILANDAK', 'miegacoan.jakselcilandak@gmail.com');
INSERT INTO `master_resto` VALUES (1460, 'MKSPOR', 'MAKASSAR POROS MAROS', 'JAWA TIMUR 1', 'MAKASSAR', '120', 'VACANT', 'MIE GACOAN - MAKASSAR POROS MAROS', 'miegacoan.mksporosmaros@gmail.com');
INSERT INTO `master_resto` VALUES (1461, 'KYBAMP', 'JAKARTA AMPERA RAYA', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'WASIL', 'MIE GACOAN - JAKARTA AMPERA RAYA', 'miegacoan.jktamperaraya@gmail.com');
INSERT INTO `master_resto` VALUES (1462, 'SMDJAT', 'SUMEDANG JATINANGOR', 'JAWA BARAT 1', 'SUMEDANG', '160', NULL, 'MIE GACOAN - SUMEDANG JATINANGOR', 'miegacoan.sumedangjatinangor@gmail.com');
INSERT INTO `master_resto` VALUES (1463, 'TNGMER', 'TANGERANG PANTURA', 'JAKARTA TANGERANG', 'TANGERANG', '80', NULL, 'MIE GACOAN - TANGERANG PANTURA', 'miegacoan.tangerangrayapantura@gmail.com');
INSERT INTO `master_resto` VALUES (1464, 'CKGBIN', 'JAKARTA BINA MARGA', 'JAKARTA TANGERANG', 'JAKARTA', '60', 'NOVAN', 'MIE GACOAN - JAKARTA BINA MARGA', NULL);
INSERT INTO `master_resto` VALUES (1465, 'CPTJUA', 'TANGERANG JUANDA CIPUTAT', 'JAKARTA TANGERANG', 'TANGERANG', '80', 'YOSUA', 'MIE GACOAN - TANGERANG JUANDA CIPUTAT', 'miegacoan.tangseljuandaciputat@gmail.com');

-- ----------------------------
-- Table structure for ppa_user
-- ----------------------------
DROP TABLE IF EXISTS `ppa_user`;
CREATE TABLE `ppa_user`  (
  `id` int NOT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `level` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_resto` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ppa_user
-- ----------------------------
INSERT INTO `ppa_user` VALUES (1, 'Malas Ngoding', 'malasngoding', '28b662d883b6d76fd96e4ddc5e9ba780', 'marketing', NULL);
INSERT INTO `ppa_user` VALUES (2, 'Diki Alfarabi Hadi', 'dwi', '28b662d883b6d76fd96e4ddc5e9ba780', 'resto', 1337);
INSERT INTO `ppa_user` VALUES (3, 'Jamaludin', 'jamaludin', '28b662d883b6d76fd96e4ddc5e9ba780', 'pengurus', NULL);

-- ----------------------------
-- Table structure for tipe_keluhan
-- ----------------------------
DROP TABLE IF EXISTS `tipe_keluhan`;
CREATE TABLE `tipe_keluhan`  (
  `id` int NULL DEFAULT NULL,
  `tipe_keluhan` varchar(50) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = ascii COLLATE = ascii_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tipe_keluhan
-- ----------------------------
INSERT INTO `tipe_keluhan` VALUES (1, 'Rasa');
INSERT INTO `tipe_keluhan` VALUES (2, 'Bau');
INSERT INTO `tipe_keluhan` VALUES (3, 'Benda Asing');

SET FOREIGN_KEY_CHECKS = 1;
