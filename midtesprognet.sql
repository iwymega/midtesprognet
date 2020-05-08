/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 10.1.38-MariaDB : Database - midtesprognet
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`midtesprognet` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `midtesprognet`;

/*Table structure for table `dosens` */

DROP TABLE IF EXISTS `dosens`;

CREATE TABLE `dosens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_prodi` int(10) unsigned NOT NULL,
  `nip_dosen` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_dosen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dosens_id_prodi_foreign` (`id_prodi`),
  CONSTRAINT `dosens_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `prodis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `dosens` */

insert  into `dosens`(`id`,`id_prodi`,`nip_dosen`,`nama_dosen`,`alamat`) values 
(1,2,'180299','pakwayangede','Tampakiring, Gianyar'),
(2,2,'180299','pakwayan','Tampakiring, Gianyar');

/*Table structure for table `krstudis` */

DROP TABLE IF EXISTS `krstudis`;

CREATE TABLE `krstudis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_mahasiswa` int(10) unsigned NOT NULL,
  `id_penawaran_mk` int(10) unsigned NOT NULL,
  `nilai_huruf` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `krstudis_id_mahasiswa_foreign` (`id_mahasiswa`),
  KEY `krstudis_id_penawaran_mk_foreign` (`id_penawaran_mk`),
  CONSTRAINT `krstudis_id_mahasiswa_foreign` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswas` (`id`),
  CONSTRAINT `krstudis_id_penawaran_mk_foreign` FOREIGN KEY (`id_penawaran_mk`) REFERENCES `penawaran_mks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `krstudis` */

insert  into `krstudis`(`id`,`id_mahasiswa`,`id_penawaran_mk`,`nilai_huruf`) values 
(1,1,2,'1');

/*Table structure for table `kurikulums` */

DROP TABLE IF EXISTS `kurikulums`;

CREATE TABLE `kurikulums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_prodi` int(10) unsigned NOT NULL,
  `nama_kurikulum` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kurikulums_id_prodi_foreign` (`id_prodi`),
  CONSTRAINT `kurikulums_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `prodis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `kurikulums` */

insert  into `kurikulums`(`id`,`id_prodi`,`nama_kurikulum`,`tahun`) values 
(1,2,'Kurikulum 2013','2020-05-07'),
(2,2,'Kurikulum 2013','2020-05-04'),
(3,4,'Kurikulum 2013','2020-05-07');

/*Table structure for table `mahasiswas` */

DROP TABLE IF EXISTS `mahasiswas`;

CREATE TABLE `mahasiswas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_prodi` int(10) unsigned NOT NULL,
  `nim` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `id_pa` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mahasiswas_id_prodi_foreign` (`id_prodi`),
  KEY `mahasiswas_id_pa_foreign` (`id_pa`),
  CONSTRAINT `mahasiswas_id_pa_foreign` FOREIGN KEY (`id_pa`) REFERENCES `dosens` (`id`),
  CONSTRAINT `mahasiswas_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `prodis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mahasiswas` */

insert  into `mahasiswas`(`id`,`id_prodi`,`nim`,`nama`,`alamat`,`email`,`tempat_lahir`,`tanggal_lahir`,`id_pa`) values 
(1,2,'1805551013','I Wayan Megantara','Tampakiring, Gianyar','iwymega@gmail.com','Gianyar','2020-05-08',1),
(2,4,'1805551013','I WAYAN ARI ARTHA','Tampakiring, Gianyar','wayan@gmail.com','Gianyar','2020-05-07',2);

/*Table structure for table `matakuliahs` */

DROP TABLE IF EXISTS `matakuliahs`;

CREATE TABLE `matakuliahs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode_matakuliah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_matakuliah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sks` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `id_kurikulum` int(10) unsigned NOT NULL,
  `id_dosen` int(10) unsigned NOT NULL,
  `id_prodi` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `matakuliahs_id_kurikulum_foreign` (`id_kurikulum`),
  KEY `matakuliahs_id_dosen_foreign` (`id_dosen`),
  KEY `matakuliahs_id_prodi_foreign` (`id_prodi`),
  CONSTRAINT `matakuliahs_id_dosen_foreign` FOREIGN KEY (`id_dosen`) REFERENCES `dosens` (`id`),
  CONSTRAINT `matakuliahs_id_kurikulum_foreign` FOREIGN KEY (`id_kurikulum`) REFERENCES `kurikulums` (`id`),
  CONSTRAINT `matakuliahs_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `prodis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `matakuliahs` */

insert  into `matakuliahs`(`id`,`kode_matakuliah`,`nama_matakuliah`,`sks`,`semester`,`id_kurikulum`,`id_dosen`,`id_prodi`) values 
(1,'TI001','Menggambar Teknik',2,3,1,1,2),
(2,'TS001','Menggambar Teknik',2,2,1,1,4),
(3,'TI002','Praktikum Prognet',1,4,3,2,2);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2019_11_30_112908_create_prodis_table',1),
(2,'2019_11_30_112939_create_kurikulums_table',1),
(3,'2019_11_30_113028_create_dosens_table',1),
(4,'2019_11_30_113108_create_matakuliahs_table',1),
(5,'2019_11_30_113128_create_mahasiswas_table',1),
(6,'2019_12_07_103430_create_penawaran_mks_table',1),
(7,'2019_12_07_103516_create_pengampus_table',1),
(8,'2019_12_07_103541_create_krstudis_table',1);

/*Table structure for table `penawaran_mks` */

DROP TABLE IF EXISTS `penawaran_mks`;

CREATE TABLE `penawaran_mks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahun_ajaran` year(4) NOT NULL,
  `semester` int(11) NOT NULL,
  `id_prodi` int(10) unsigned NOT NULL,
  `id_matakuliah` int(10) unsigned NOT NULL,
  `kelas` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `penawaran_mks_id_prodi_foreign` (`id_prodi`),
  KEY `penawaran_mks_id_matakuliah_foreign` (`id_matakuliah`),
  CONSTRAINT `penawaran_mks_id_matakuliah_foreign` FOREIGN KEY (`id_matakuliah`) REFERENCES `matakuliahs` (`id`),
  CONSTRAINT `penawaran_mks_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `prodis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `penawaran_mks` */

insert  into `penawaran_mks`(`id`,`tahun_ajaran`,`semester`,`id_prodi`,`id_matakuliah`,`kelas`) values 
(1,2020,4,2,1,'a'),
(2,2020,4,2,3,'a');

/*Table structure for table `pengampus` */

DROP TABLE IF EXISTS `pengampus`;

CREATE TABLE `pengampus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_penawaran_mk` int(10) unsigned NOT NULL,
  `id_dosen` int(10) unsigned NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pengampus_id_penawaran_mk_foreign` (`id_penawaran_mk`),
  KEY `pengampus_id_dosen_foreign` (`id_dosen`),
  CONSTRAINT `pengampus_id_dosen_foreign` FOREIGN KEY (`id_dosen`) REFERENCES `dosens` (`id`),
  CONSTRAINT `pengampus_id_penawaran_mk_foreign` FOREIGN KEY (`id_penawaran_mk`) REFERENCES `penawaran_mks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pengampus` */

insert  into `pengampus`(`id`,`id_penawaran_mk`,`id_dosen`,`order`) values 
(3,1,1,1);

/*Table structure for table `prodis` */

DROP TABLE IF EXISTS `prodis`;

CREATE TABLE `prodis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_prodi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `prodis` */

insert  into `prodis`(`id`,`nama_prodi`) values 
(2,'Teknologi Informasi'),
(4,'Teknik Sipil');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
