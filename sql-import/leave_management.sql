-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2024 at 07:50 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leave_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(50) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `emp_phone` varchar(50) NOT NULL,
  `emp_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_name`, `emp_phone`, `emp_email`) VALUES
(1, 'Kittu', '9090909090', 'kittu@gmail.com'),
(2, 'Pittu', '7070707070', 'pittu@gmail.com'),
(3, 'Sittu', '8989898989', 'sittu@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `leave_apply`
--

CREATE TABLE `leave_apply` (
  `sl_no` int(12) NOT NULL,
  `emp_id` int(50) NOT NULL,
  `date_of_leave` date NOT NULL,
  `leave_id` int(50) NOT NULL,
  `num_of_leave` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave_apply`
--

INSERT INTO `leave_apply` (`sl_no`, `emp_id`, `date_of_leave`, `leave_id`, `num_of_leave`) VALUES
(1, 2, '2023-12-29', 2, 1),
(2, 1, '2023-12-29', 1, 1),
(3, 1, '2023-12-29', 1, 1),
(4, 2, '2023-12-29', 1, 1),
(5, 1, '2024-01-31', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `leave_emp_assign`
--

CREATE TABLE `leave_emp_assign` (
  `sl_no` int(12) NOT NULL,
  `emp_id` int(50) NOT NULL,
  `leave_id` int(50) NOT NULL,
  `no_of_leave` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave_emp_assign`
--

INSERT INTO `leave_emp_assign` (`sl_no`, `emp_id`, `leave_id`, `no_of_leave`) VALUES
(1, 1, 1, 3),
(2, 1, 2, 2),
(3, 1, 3, 2),
(4, 1, 4, 4),
(5, 2, 1, 1),
(6, 2, 2, 3),
(7, 2, 3, 4),
(8, 2, 4, 5),
(9, 3, 1, 4),
(10, 3, 2, 4),
(11, 3, 3, 2),
(12, 3, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `leave_master`
--

CREATE TABLE `leave_master` (
  `leave_id` int(12) NOT NULL,
  `leave_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave_master`
--

INSERT INTO `leave_master` (`leave_id`, `leave_name`) VALUES
(1, 'CL'),
(2, 'ML'),
(3, 'PL'),
(4, 'EL');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `leave_apply`
--
ALTER TABLE `leave_apply`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `leave_emp_assign`
--
ALTER TABLE `leave_emp_assign`
  ADD PRIMARY KEY (`sl_no`);

--
-- Indexes for table `leave_master`
--
ALTER TABLE `leave_master`
  ADD PRIMARY KEY (`leave_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `leave_apply`
--
ALTER TABLE `leave_apply`
  MODIFY `sl_no` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `leave_emp_assign`
--
ALTER TABLE `leave_emp_assign`
  MODIFY `sl_no` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `leave_master`
--
ALTER TABLE `leave_master`
  MODIFY `leave_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
