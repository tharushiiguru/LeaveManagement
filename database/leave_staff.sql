-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2022 at 04:27 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

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

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2020-11-03 05:55:30');

-- --------------------------------------------------------

--
-- Table structure for table `leavetype`
--

CREATE TABLE `leavetype` (
  `leavetype_no` int(20) NOT NULL,
  `leave_type` varchar(100) NOT NULL,
  `days` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `leavetype_tblemployees` (
  `id` int(20) NOT NULL,
  `leavetype_no` int(20) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `assignee_id` int(20) DEFAULT NULL,
  `description` text NOT NULL,
  `no_of_days` int(100) DEFAULT NULL,
  `leave_date` date DEFAULT NULL,
  `leave_end_date` date NOT NULL,
  `assignee_status` varchar(255) NOT NULL,
  `hod_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartments`
--

CREATE TABLE `tbldepartments` (
  `id` int(11) NOT NULL,
  `DepartmentName` varchar(150) DEFAULT NULL,
  `DepartmentShortName` varchar(100) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldepartments`
--

INSERT INTO `tbldepartments` (`id`, `DepartmentName`, `DepartmentShortName`, `CreationDate`) VALUES
(2, 'Information Technologies', 'ICT', '2017-11-01 07:19:37');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployees`
--

CREATE TABLE `tblemployees` (
  `emp_id` int(11) NOT NULL,
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
  `Status` int(1) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `appointment_date` date DEFAULT NULL,
  `epf_no` varchar(255) NOT NULL,
  `role` varchar(30) NOT NULL,
  `location` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblemployees`
--

INSERT INTO `tblemployees` (`emp_id`, `FirstName`, `LastName`, `EmailId`, `Password`, `Gender`, `Dob`, `Department`, `Address`, `Av_leave`, `Phonenumber`, `Status`, `RegDate`, `appointment_date`, `epf_no`, `role`, `location`) VALUES
(2, 'Admin', 'FOC', 'admin@gmail.com', 'b4cc344d25a2efe540adbf2678e2304c', 'Male', '3 February, 1990', 'ICT', '65G,Colombo', '30', '8587944255', 1, '2017-11-10 13:40:02', NULL, '', 'Admin', 'logo.png'),
(5, 'HOD', 'FOC', 'head@gmail.com', 'b4cc344d25a2efe540adbf2678e2304c', 'Male', '3 February, 1990', 'ICT', 'Galle', '30', '077235689', 1, '2017-11-10 13:40:02', NULL, '', 'HOD', 'R-M-M-Pradeep.jpg'),
(18, 'Dinoo', 'Gunasekara', 'dinoo@gmail.com', '0fdde18f0ddcc20b89ecff2e2ce4f02e', 'female', '01 November 2022', 'ICT', 'colombo', '30', '0123456789', 1, '2022-11-04 14:41:35', '2022-11-01', '369', 'Staff', 'NO-IMAGE-AVAILABLE.jpg'),
(19, 'WMSRB', 'Wijayarathna', 'wmsrb@gmail.com', '56b93ed76c60d754b05d347fe19f96f6', 'male', '01 November 2022', 'ICT', 'kandy', '30', '147852369', 1, '2022-11-04 15:09:11', '2022-11-01', '123', 'Staff', 'NO-IMAGE-AVAILABLE.jpg'),
(20, 'RPS', 'Kathriarachchi', 'rps@gmail.com', '651cb023e8a7c22b217106f3145522d3', 'male', '03 November 2022', 'ICT', 'colombo', '30', '0369852147', 1, '2022-11-04 15:11:02', '2022-11-02', '125', 'Staff', 'NO-IMAGE-AVAILABLE.jpg'),
(21, 'WAAM', 'Wanniarachchi', 'waam@gmail.com', 'e36f9846e997e4491c58aa65d9c9f4e6', 'male', '05 November 2022', 'ICT', 'Polonnaruwa', '30', '7894561230', 1, '2022-11-04 15:12:26', '2022-11-05', '126', 'Staff', 'NO-IMAGE-AVAILABLE.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblleaves`
--

CREATE TABLE `tblleaves` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(110) NOT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` date NOT NULL,
  `AdminRemark` mediumtext DEFAULT NULL,
  `registra_remarks` mediumtext NOT NULL,
  `AdminRemarkDate` varchar(120) DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `admin_status` int(11) NOT NULL DEFAULT 0,
  `IsRead` int(1) NOT NULL,
  `empid` int(11) DEFAULT NULL,
  `num_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblleaves`
--

INSERT INTO `tblleaves` (`id`, `LeaveType`, `ToDate`, `FromDate`, `Description`, `PostingDate`, `AdminRemark`, `registra_remarks`, `AdminRemarkDate`, `Status`, `admin_status`, `IsRead`, `empid`, `num_days`) VALUES
(26, '2', '04-10-2022', '07-10-2022', 'asdasd', '2022-10-31', NULL, '', NULL, 0, 0, 1, 16, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tblleavetype`
--

CREATE TABLE `tblleavetype` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(200) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `date_from` varchar(200) NOT NULL,
  `date_to` varchar(200) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblleavetype`
--

INSERT INTO `tblleavetype` (`id`, `LeaveType`, `Description`, `date_from`, `date_to`, `CreationDate`) VALUES
(5, 'Casual Leave', 'Casual Leave', '2021-05-23', '2021-06-20', '2021-05-19 14:32:03'),
(6, 'Medical Leave', 'Medical Leave', '2021-05-05', '2021-05-28', '2021-05-19 15:29:05'),
(8, 'Other', 'Leave all staff', '31-05-2021', '04-06-2021', '2021-05-20 17:17:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leavetype`
--
ALTER TABLE `leavetype`
  ADD PRIMARY KEY (`leavetype_no`);

--
-- Indexes for table `leavetype_tblemployees`
--
ALTER TABLE `leavetype_tblemployees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leavetype_no` (`leavetype_no`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `assignee_id` (`assignee_id`);

--
-- Indexes for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblemployees`
--
ALTER TABLE `tblemployees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `tblleaves`
--
ALTER TABLE `tblleaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserEmail` (`empid`);

--
-- Indexes for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leavetype_tblemployees`
--
ALTER TABLE `leavetype_tblemployees`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblemployees`
--
ALTER TABLE `tblemployees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblleaves`
--
ALTER TABLE `tblleaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
