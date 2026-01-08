-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2024 at 02:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vehiclelocator`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminadd`
--

CREATE TABLE `adminadd` (
  `name` varchar(15) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `phone` bigint(15) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminadd`
--

INSERT INTO `adminadd` (`name`, `username`, `password`, `phone`, `address`) VALUES
('desingh', 'admin', '123', 1234567890, 'eraiyur');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `bikeName` varchar(255) NOT NULL,
  `problem` text NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `booking_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `name`, `mobile`, `bikeName`, `problem`, `latitude`, `longitude`, `booking_time`) VALUES
(1, 'mariya', '1234567890', 'pulsor', 'chain cut, engin problem', 13.012173, 77.581517, '2024-11-09 10:17:26'),
(2, 'desi9ngh', '1234567890', 'ktm', 'punger, head light not working', 13.012173, 77.581517, '2024-11-09 10:18:40'),
(3, 'diwan', '4563728365', 'honda', 'chain cut,punger', 13.012173, 77.581517, '2024-11-09 10:23:06'),
(4, 'arul', '9629163914', 'ktm', 'puncher', 13.012173, 77.581517, '2024-11-09 10:27:03'),
(5, 'diwan', '3456543232', 'pulser', 'chain cutting', 12.992707, 77.593117, '2024-11-11 17:25:52');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `mechanicname` varchar(20) NOT NULL,
  `complaints` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `mechanicname`, `complaints`) VALUES
(1, 'anish', 'bad expirience'),
(2, 'desingh', 'worst bigaivior');

-- --------------------------------------------------------

--
-- Table structure for table `mechlogin`
--

CREATE TABLE `mechlogin` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `cpassword` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `shop` varchar(100) DEFAULT NULL,
  `start` varchar(15) DEFAULT NULL,
  `end` varchar(15) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mechlogin`
--

INSERT INTO `mechlogin` (`id`, `email`, `name`, `username`, `password`, `cpassword`, `phone`, `address`, `vehicle`, `shop`, `start`, `end`, `city`) VALUES
(5, 'desinghmariya@gmail.com', 'desingh', 'md', '123', '123', '0987654321', 'Vasanth Nagar', 'Both of Them', 'md\'s shop', '11:00 AM', '11:00 PM', 'Vasanth Nagar');

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `email` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `cpassword` varchar(25) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL,
  `vehile` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`email`, `name`, `username`, `password`, `cpassword`, `phone`, `address`, `vehile`) VALUES
('ahariharan390@gmail.com', 'HARIHARAN A', 'hari', '123', '123', '9524273363', 'Bangalore', 'Two Wheeler'),
('atamizha1@gmail.com', 'Tamizharasan', 'tamil', '1234', '1234', '9874563210', 'Tirupattur.', 'Two Wheeler');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminadd`
--
ALTER TABLE `adminadd`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mechlogin`
--
ALTER TABLE `mechlogin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mechlogin`
--
ALTER TABLE `mechlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
