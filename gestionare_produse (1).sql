-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 06, 2026 at 09:31 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestionare_produse`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`) VALUES
(1, 'Smartwatch', 499.99, 'Smartwatch cu monitorizare cardiaca si rezistenta la apa'),
(3, 'Camera Foto', 1299.00, 'Camera DSLR profesionala cu obiectiv 18-55mm'),
(4, 'Boxe Bluetooth', 199.50, 'Boxe portabile cu bass puternic si autonomie 12 oren'),
(5, 'Tastatura Mecanica', 349.00, 'Tastatura mecanica RGB cu switch-uri Blue'),
(6, 'Monitor 24inch', 899.00, 'Monitor LED 24 inch Full HD cu port HDMI'),
(7, 'Telefon Samsung', 1500.00, 'Telefon Samsung Galaxy A16 cu camera triple 50MP');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'mara', '$2b$10$iDHNxgxBBGMeyTYg0E8GJuJA0UUlwosgXKZK8bz.tu43.zUDHpIGi'),
(5, 'Ionel', '$2b$10$87u1r7mjMkcyHp/cyVGDK.s2aCZVm7ox33jS4N9QslGop1zngf8Yy'),
(4, 'ioana', '$2b$10$qcdNtCsF2gF94y9z.cslDutzRZ35r.ZDlATS2yzeo3a5t84XUyi.e');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
