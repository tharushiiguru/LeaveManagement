-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 08, 2022 at 04:16 PM
-- Server version: 8.0.26
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leave_staff`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2020-11-03 05:55:30');

-- --------------------------------------------------------

--
-- Table structure for table `leavetype`
--

DROP TABLE IF EXISTS `leavetype`;
CREATE TABLE IF NOT EXISTS `leavetype` (
  `leavetype_no` int NOT NULL,
  `leave_type` varchar(100) NOT NULL,
  `days` int NOT NULL,
  PRIMARY KEY (`leavetype_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `leavetype`
--

INSERT INTO `leavetype` (`leavetype_no`, `leave_type`, `days`) VALUES
(1, 'Casual Leave', 21),
(2, 'Vacation Leave', 24),
(3, 'Duty Leave', 7),
(4, 'Lieu leave', 7),
(5, 'Block Leave', 7);

-- --------------------------------------------------------

--
-- Table structure for table `leavetype_tblemployees`
--

DROP TABLE IF EXISTS `leavetype_tblemployees`;
CREATE TABLE IF NOT EXISTS `leavetype_tblemployees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `leavetype_no` int DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  `assignee_id` int DEFAULT NULL,
  `description` text NOT NULL,
  `no_of_days` int DEFAULT NULL,
  `leave_date` date DEFAULT NULL,
  `leave_end_date` date NOT NULL,
  `assignee_status` varchar(255) NOT NULL,
  `hod_status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `leavetype_no` (`leavetype_no`),
  KEY `emp_id` (`emp_id`),
  KEY `assignee_id` (`assignee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `leavetype_tblemployees`
--

INSERT INTO `leavetype_tblemployees` (`id`, `leavetype_no`, `emp_id`, `assignee_id`, `description`, `no_of_days`, `leave_date`, `leave_end_date`, `assignee_status`, `hod_status`) VALUES
(17, 1, 18, 21, 'wedding', 2, '2022-11-01', '2022-11-03', 'APPROVED', 'APPROVED');

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

DROP TABLE IF EXISTS `otp`;
CREATE TABLE IF NOT EXISTS `otp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `EmailId` varchar(30) NOT NULL,
  `otp` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`id`, `EmailId`, `otp`) VALUES
(2, 'senulidiwanya@gmail.com', 2401),
(3, 'umandaisini@gmail.com', 3621),
(4, 'thrushilakshani11@gmail.com', 9345),
(5, 'tharushilakshani11@gmail.com', 2550),
(6, 'sms.prathibha@gmail.com', 9540),
(7, '38-bit-0008@kdu.ac.lk', 2008),
(8, 'hettikr@gmail.com', 3803);

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartments`
--

DROP TABLE IF EXISTS `tbldepartments`;
CREATE TABLE IF NOT EXISTS `tbldepartments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(150) DEFAULT NULL,
  `DepartmentShortName` varchar(100) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldepartments`
--

INSERT INTO `tbldepartments` (`id`, `DepartmentName`, `DepartmentShortName`, `CreationDate`) VALUES
(2, 'Information Technology', 'IT', '2017-11-01 07:19:37');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployees`
--

DROP TABLE IF EXISTS `tblemployees`;
CREATE TABLE IF NOT EXISTS `tblemployees` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `Password` varchar(180) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` varchar(100) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Av_leave` varchar(150) NOT NULL,
  `Phonenumber` char(11) NOT NULL,
  `Status` int NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `appointment_date` date DEFAULT NULL,
  `epf_no` varchar(255) NOT NULL,
  `role` varchar(30) NOT NULL,
  `location` varchar(200) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblemployees`
--

INSERT INTO `tblemployees` (`emp_id`, `FirstName`, `LastName`, `EmailId`, `Password`, `Gender`, `Dob`, `Department`, `Address`, `Av_leave`, `Phonenumber`, `Status`, `RegDate`, `appointment_date`, `epf_no`, `role`, `location`) VALUES
(2, 'Admin', 'FOC', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Male', '3 February, 1992', 'IT', '65G,Colombo', '30', '8587944255', 1, '2017-11-10 13:40:02', NULL, '', 'Admin', 'logo1.png'),
(5, 'HOD', 'FOC', 'head@gmail.com', 'b4cc344d25a2efe540adbf2678e2304c', 'Male', '3 February, 1990', 'IT', 'Galle', '30', '077235689', 1, '2017-11-10 13:40:02', NULL, '', 'HOD', 'R-M-M-Pradeep.jpg'),
(18, 'Dinoo', 'Gunasekara', 'dinoo@gmail.com', '0fdde18f0ddcc20b89ecff2e2ce4f02e', 'female', '01 November 2022', 'IT', 'colombo', '30', '0123456789', 1, '2022-11-04 14:41:35', '2022-11-01', '369', 'Staff', 'NO-IMAGE-AVAILABLE.jpg'),
(19, 'WMSRB', 'Wijayarathna', 'wmsrb@gmail.com', '56b93ed76c60d754b05d347fe19f96f6', 'male', '01 November 2022', 'IT', 'kandy', '30', '147852369', 1, '2022-11-04 15:09:11', '2022-11-01', '123', 'Staff', 'NO-IMAGE-AVAILABLE.jpg'),
(20, 'RPS', 'Kathriarachchi', 'rps@gmail.com', '651cb023e8a7c22b217106f3145522d3', 'male', '03 November 2022', 'IT', 'colombo', '30', '0369852147', 1, '2022-11-04 15:11:02', '2022-11-02', '125', 'Staff', 'NO-IMAGE-AVAILABLE.jpg'),
(21, 'WAAM', 'Wanniarachchi', 'waam@gmail.com', 'e36f9846e997e4491c58aa65d9c9f4e6', 'male', '05 November 2022', 'IT', 'Polonnaruwa', '30', '7894561230', 1, '2022-11-04 15:12:26', '2022-11-05', '126', 'Staff', 'NO-IMAGE-AVAILABLE.jpg'),
(22, 'sajani', 'prathibha', 'sms.prathibha@gmail.com', '4068029dfe6ed92498a63db17ecb7023', 'female', '03 December 1999', 'IT', 'gintota,galle', '30', '0779595299', 1, '2022-11-08 07:55:30', '2022-10-05', '110', 'Staff', 'NO-IMAGE-AVAILABLE.jpg'),
(23, 'Tharushi', 'Guruge', 'tharushilakshani11@gmail.com', '554b23810065f110ca8a156b6e47d345', 'female', '08 December 2000', 'IT', 'baddegama, galle', '30', '0771525855', 1, '2022-11-08 08:12:43', '2021-02-05', '751', 'HOD', 'NO-IMAGE-AVAILABLE.jpg'),
(25, 'Laknara', 'de Silva', 'laknara20@gmail.com', '5b7fd1166060c09a5249f3644dd89e8f', 'female', '20 August 2000', 'IT', 'Panadura', '30', '0705720186', 1, '2022-11-08 12:42:43', '2020-01-01', '159', 'Staff', 'NO-IMAGE-AVAILABLE.jpg'),
(26, 'SMM', 'Lakmali', 'lakmali@gmail.com', '2bf20d16a2853774e82ca89fafeb60c2', 'female', '08 February 1990', 'IT', 'Ratmalana', '30', '0714569328', 1, '2022-11-08 12:46:47', '2022-11-03', '126', 'Staff', 'NO-IMAGE-AVAILABLE.jpg');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `leavetype_tblemployees`
--
ALTER TABLE `leavetype_tblemployees`
  ADD CONSTRAINT `leavetype_tblemployees_ibfk_1` FOREIGN KEY (`leavetype_no`) REFERENCES `leavetype` (`leavetype_no`),
  ADD CONSTRAINT `leavetype_tblemployees_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `tblemployees` (`emp_id`),
  ADD CONSTRAINT `leavetype_tblemployees_ibfk_3` FOREIGN KEY (`assignee_id`) REFERENCES `tblemployees` (`emp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
