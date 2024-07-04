CREATE TABLE `penjoki` (
  `id_penjoki` int PRIMARY KEY,
  `nama` varchar(255),
  `req_hero` varchar(255),
  `memproses_akun` varchar(255),
  `role_hero` varchar(255)
);

CREATE TABLE `pelanggan` (
  `id_pelangganPel` int,
  `nama` varchar(255),
  `nama_akun` varchar(255),
  `no_telp` int
);

CREATE TABLE `paket_joki` (
  `pen_id_penjokiJoki` int,
  `pel_id_pelangganJoki` int PRIMARY KEY,
  `harga` int,
  `req_penjoki` varchar(255),
  `req_hero` varchar(255),
  `req_rank` int,
  `paket_rank` varchar(255)
);

CREATE TABLE `sepakat` (
  `pen_id_penjoki_sepakat` int,
  `pel_id_pelanggan_sepakat` int
);

CREATE TABLE `order` (
  `paket_pen_id_penjokiOrder` int,
  `pel_id_pelangganOrder` int,
  `status_bayar` varchar(255),
  `admin` varchar(255),
  `metode_bayar` varchar(255),
  `tgl_order` datetime
);

CREATE TABLE `terlibat` (
  `pen_id_penjokiTerlibat` int PRIMARY KEY,
  `pel_id_pelangganTerlibat` int
);

ALTER TABLE `pelanggan` ADD FOREIGN KEY (`id_pelangganPel`) REFERENCES `paket_joki` (`pel_id_pelangganJoki`);

ALTER TABLE `paket_joki` ADD FOREIGN KEY (`pen_id_penjokiJoki`) REFERENCES `terlibat` (`pen_id_penjokiTerlibat`);

ALTER TABLE `sepakat` ADD FOREIGN KEY (`pen_id_penjoki_sepakat`) REFERENCES `penjoki` (`id_penjoki`);

ALTER TABLE `sepakat` ADD FOREIGN KEY (`pel_id_pelanggan_sepakat`) REFERENCES `pelanggan` (`id_pelangganPel`);

ALTER TABLE `order` ADD FOREIGN KEY (`paket_pen_id_penjokiOrder`) REFERENCES `paket_joki` (`pen_id_penjokiJoki`);

ALTER TABLE `order` ADD FOREIGN KEY (`pel_id_pelangganOrder`) REFERENCES `pelanggan` (`id_pelangganPel`);

ALTER TABLE `terlibat` ADD FOREIGN KEY (`pel_id_pelangganTerlibat`) REFERENCES `pelanggan` (`id_pelangganPel`);
