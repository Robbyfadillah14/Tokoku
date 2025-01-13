-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2025 at 08:39 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokoku`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detail_pembelian`
--

CREATE TABLE `tbl_detail_pembelian` (
  `id_detail_pembelian` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `kode_produk` char(3) NOT NULL,
  `jml_beli` mediumint(9) NOT NULL,
  `keterangan` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_detail_pembelian`
--

INSERT INTO `tbl_detail_pembelian` (`id_detail_pembelian`, `id_pembelian`, `kode_produk`, `jml_beli`, `keterangan`) VALUES
(1, 1, 'P05', 2, 'Hitam + Biru'),
(2, 2, 'P05', 1, '-'),
(3, 3, 'P05', 2, '-'),
(4, 3, 'p03', 1, '-'),
(5, 4, 'P04', 1, 'jalan pejambon'),
(6, 4, 'P05', 1, 'kkk'),
(7, 5, 'P05', 2, 'hitam'),
(8, 6, 'P05', 2, 'hitam'),
(9, 7, 'P05', 1, 'hitam');

--
-- Triggers `tbl_detail_pembelian`
--
DELIMITER $$
CREATE TRIGGER `kurangi_stok` AFTER INSERT ON `tbl_detail_pembelian` FOR EACH ROW BEGIN
	UPDATE tbl_produk SET tbl_produk.jml_beli=tbl_produk.jml_beli-new.jml_beli WHERE tbl_produk.kode_produk=new.kode_produk;	
    end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inbox`
--

CREATE TABLE `tbl_inbox` (
  `id_inbox` int(11) NOT NULL,
  `nama_pengirim` varchar(100) NOT NULL,
  `email_pengirim` varchar(150) NOT NULL,
  `waktu_kirim` datetime NOT NULL,
  `isi_pesan` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_inbox`
--

INSERT INTO `tbl_inbox` (`id_inbox`, `nama_pengirim`, `email_pengirim`, `waktu_kirim`, `isi_pesan`) VALUES
(1, 'Jamilah', 'fadillah@gmail.com', '2025-01-13 08:04:21', 'Saya  sudah order 1 pcs, mohon kiranya segera di kirim'),
(2, 'Jamilah', 'fadillah@gmail.com', '2025-01-13 08:04:27', 'Saya  sudah order 1 pcs, mohon kiranya segera di kirim'),
(3, 'Jamilah', 'fadillah@gmail.com', '2025-01-13 08:04:30', 'Saya  sudah order 1 pcs, mohon kiranya segera di kirim'),
(4, 'Jamilah', 'fadillah@gmail.com', '2025-01-13 08:04:32', 'Saya  sudah order 1 pcs, mohon kiranya segera di kirim'),
(5, 'Jamilah', 'fadillah@gmail.com', '2025-01-13 08:04:33', 'Saya  sudah order 1 pcs, mohon kiranya segera di kirim'),
(6, 'Jamilah', 'fadillah@gmail.com', '2025-01-13 08:04:33', 'Saya  sudah order 1 pcs, mohon kiranya segera di kirim'),
(7, 'Jamilah', 'fadillah@gmail.com', '2025-01-13 08:04:34', 'Saya  sudah order 1 pcs, mohon kiranya segera di kirim'),
(8, 'Jamilah', 'fadillah@gmail.com', '2025-01-13 08:04:34', 'Saya  sudah order 1 pcs, mohon kiranya segera di kirim'),
(9, 'Jamilah', 'fadillah@gmail.com', '2025-01-13 08:04:35', 'Saya  sudah order 1 pcs, mohon kiranya segera di kirim'),
(10, 'Jamilah', 'fadillah@gmail.com', '2025-01-13 08:04:37', 'Saya  sudah order 1 pcs, mohon kiranya segera di kirim'),
(11, 'Jamilah', 'fadillah@gmail.com', '2025-01-13 08:04:39', 'Saya  sudah order 1 pcs, mohon kiranya segera di kirim');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_konfirmasi`
--

CREATE TABLE `tbl_konfirmasi` (
  `id_pembelian` int(11) NOT NULL,
  `waktu_konfirmasi` datetime NOT NULL,
  `bukti_pembayaran` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_konfirmasi`
--

INSERT INTO `tbl_konfirmasi` (`id_pembelian`, `waktu_konfirmasi`, `bukti_pembayaran`) VALUES
(1, '2019-02-12 12:58:02', '1-bukti_transfer.jpeg'),
(2, '2019-03-05 02:04:15', '2-bukti-transfer-ranto-jasa-skripsi-5-WA0011.jpg'),
(4, '2022-02-19 12:56:46', '4-1.png'),
(7, '2025-01-13 07:57:42', '7-bukti_tf_mandiri.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pembelian`
--

CREATE TABLE `tbl_pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `tanggal_pembelian` datetime NOT NULL,
  `email` varchar(200) NOT NULL,
  `status_pembelian` enum('selesai','pending') NOT NULL DEFAULT 'pending',
  `rek_tujuan` tinyint(4) NOT NULL,
  `jasa_kurir` tinyint(4) NOT NULL,
  `alamat_tujuan` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pembelian`
--

INSERT INTO `tbl_pembelian` (`id_pembelian`, `tanggal_pembelian`, `email`, `status_pembelian`, `rek_tujuan`, `jasa_kurir`, `alamat_tujuan`) VALUES
(1, '2019-02-12 12:55:34', 'iqbal@yahoo.com', 'selesai', 1, 1, 'Kadugede'),
(2, '2019-03-04 07:55:11', 'galih@yahoo.com', 'selesai', 1, 1, 'Kuningan'),
(3, '2019-03-05 02:02:34', 'galih@yahoo.com', 'selesai', 1, 1, 'Kuningan'),
(4, '2022-02-19 12:52:28', 'aa@gmail.com', 'selesai', 1, 1, 'jalan pejambon'),
(5, '2022-02-19 14:58:40', 'vinaalzania@gmail.com', 'pending', 0, 0, ''),
(6, '2022-02-19 15:15:02', 'vinaalzania@gmail.com', 'pending', 0, 0, ''),
(7, '2025-01-13 07:47:56', 'fadillah@gmail.com', 'selesai', 1, 3, 'Jatimulya Bekasi');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_produk`
--

CREATE TABLE `tbl_produk` (
  `kode_produk` char(3) NOT NULL,
  `nama_produk` varchar(150) NOT NULL,
  `merk` varchar(100) NOT NULL,
  `tgl_beli` date NOT NULL,
  `harga_beli` mediumint(9) NOT NULL,
  `harga_jual` mediumint(9) NOT NULL,
  `jml_beli` mediumint(9) NOT NULL,
  `photo_produk` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_produk`
--

INSERT INTO `tbl_produk` (`kode_produk`, `nama_produk`, `merk`, `tgl_beli`, `harga_beli`, `harga_jual`, `jml_beli`, `photo_produk`) VALUES
('p01', 'Tas Backpaker Anti Air', 'Eiger', '2019-01-02', 400000, 475000, 15, 'p01.jpg'),
('P02', 'Tas Gendong', 'Eiger', '2019-01-05', 250000, 300000, 10, 'p02.jpg'),
('p03', 'Celana Gunung', 'Eiger', '2019-01-10', 175000, 210000, 23, 'p03.jpg'),
('P04', 'Sepatu', 'Adidas', '2019-06-02', 100000, 150000, 9, 'P04.jpg'),
('P05', 'Topi', 'Cresida', '2019-07-02', 50000, 75000, -1, 'P05.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `email` varchar(200) NOT NULL,
  `nama_lengkap` varchar(150) NOT NULL,
  `password` char(32) NOT NULL,
  `alamat` mediumtext NOT NULL,
  `handphone` varchar(20) NOT NULL,
  `waktu_daftar` datetime NOT NULL,
  `level` enum('administrator','member') NOT NULL DEFAULT 'member'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`email`, `nama_lengkap`, `password`, `alamat`, `handphone`, `waktu_daftar`, `level`) VALUES
('fadillah@gmail.com', 'Jamilah', '202cb962ac59075b964b07152d234b70', 'Jatimulya Bekasi', '', '2025-01-13 07:46:53', 'member'),
('robyfadillah09@gmail.com', 'Robby Fadillah', '202cb962ac59075b964b07152d234b70', 'Cibarusah', '', '2025-01-13 05:10:35', 'administrator'),
('vinaalzania@gmail.com', 'vina', '6ff677974ea9dc48faa5dae6003ae502', 'tambun', '', '2025-01-13 14:27:37', 'member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_detail_pembelian`
--
ALTER TABLE `tbl_detail_pembelian`
  ADD PRIMARY KEY (`id_detail_pembelian`);

--
-- Indexes for table `tbl_inbox`
--
ALTER TABLE `tbl_inbox`
  ADD PRIMARY KEY (`id_inbox`);

--
-- Indexes for table `tbl_konfirmasi`
--
ALTER TABLE `tbl_konfirmasi`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `tbl_pembelian`
--
ALTER TABLE `tbl_pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD PRIMARY KEY (`kode_produk`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_detail_pembelian`
--
ALTER TABLE `tbl_detail_pembelian`
  MODIFY `id_detail_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_inbox`
--
ALTER TABLE `tbl_inbox`
  MODIFY `id_inbox` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_pembelian`
--
ALTER TABLE `tbl_pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
