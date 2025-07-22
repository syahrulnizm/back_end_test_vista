-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2025 at 12:48 PM
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
-- Database: `vista-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `registrationNumber` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `registrationNumber`) VALUES
(1, 'Tech Solutions Inc', 'CMP10001'),
(2, 'Green Energy Ltd', 'CMP10002'),
(3, 'Global Consulting', 'CMP10003'),
(4, 'Prime Healthcare', 'CMP10004'),
(5, 'City Builders Co', 'CMP10005'),
(6, 'Innovate Inc.', 'AB123456'),
(7, 'Google Sdn Bhd', 'G123');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `companyId`, `name`, `description`, `price`) VALUES
(1, 1, 'Website Development', 'Custom website design and development', 2500.00),
(2, 1, 'Mobile App Development', 'iOS and Android app creation', 5000.00),
(3, 1, 'IT Consulting', 'Technology strategy and implementation', 150.00),
(4, 2, 'Solar Panel Installation', 'Residential solar power systems', 8000.00),
(5, 2, 'Energy Audit', 'Home energy efficiency assessment', 300.00),
(6, 2, 'Wind Turbine Maintenance', 'Annual maintenance package', 1200.00),
(7, 3, 'Market Research', 'Comprehensive industry analysis', 2500.00),
(8, 3, 'Business Strategy', 'Growth planning session', 800.00),
(9, 3, 'HR Consulting', 'Employee handbook development', 600.00),
(10, 4, 'Annual Physical', 'Comprehensive health checkup', 200.00),
(11, 4, 'Dental Cleaning', 'Routine teeth cleaning', 120.00),
(12, 4, 'Vision Exam', 'Complete eye examination', 85.00),
(13, 5, 'Home Renovation', 'Kitchen and bathroom remodeling', 15000.00),
(14, 5, 'New Construction', 'Custom home building', 250000.00),
(15, 5, 'Roof Repair', 'Shingle replacement and repair', 3500.00),
(18, 6, 'Cloud Consulting', 'Expert advice on cloud infrastructure.', 2500.00),
(20, 7, 'Hosting Service', 'Use Firebase', 100.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companyId` (`companyId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `company` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
