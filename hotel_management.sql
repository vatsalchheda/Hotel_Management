-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 31, 2020 at 09:57 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `Bill_id` int(11) NOT NULL,
  `Amount` int(11) DEFAULT NULL,
  `Payment_type` varchar(20) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`Bill_id`, `Amount`, `Payment_type`, `cust_id`) VALUES
(1, 123, NULL, 1),
(2, 456, NULL, 2),
(304027, 30000, 'Card', 4);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `Booking_id` int(11) NOT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`Booking_id`, `cust_id`, `room_id`, `branch_id`) VALUES
(1, 1, 1, 1),
(2, 2, 3, 1),
(36941, 4, 4, 1),
(86423, 3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `f_name` varchar(20) NOT NULL,
  `l_name` varchar(20) NOT NULL,
  `cust_email` varchar(32) NOT NULL,
  `cust_phone` varchar(10) NOT NULL,
  `passport_no` int(11) NOT NULL,
  `dob` date NOT NULL,
  `country` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `f_name`, `l_name`, `cust_email`, `cust_phone`, `passport_no`, `dob`, `country`) VALUES
(1, 'John', 'Doe', 'cust1@example.com', '987654321', 987654321, '2020-10-22', 'India'),
(2, 'Jane', 'Doe', 'cust2@example.com', '123456789', 1234567899, '2020-10-07', 'Germany'),
(3, 'Simr(a)n', 'Gupta', 'abc@xyz.com', '1234509876', 123456, '2020-10-01', 'India'),
(4, 'munna ', 'tripathi', 'munna@king.com', '9898989898', 6569, '2020-10-02', 'india');

-- --------------------------------------------------------

--
-- Table structure for table `deluxe`
--

CREATE TABLE `deluxe` (
  `wifi` varchar(10) NOT NULL,
  `room_id` int(11) NOT NULL,
  `balcony` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deluxe`
--

INSERT INTO `deluxe` (`wifi`, `room_id`, `balcony`) VALUES
('', 3, 0),
('', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dependents`
--

CREATE TABLE `dependents` (
  `dep_id` int(11) NOT NULL,
  `dep_name` varchar(20) NOT NULL,
  `passport_no` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dependents`
--

INSERT INTO `dependents` (`dep_id`, `dep_name`, `passport_no`, `cust_id`) VALUES
(17, 'a b', 489, 1),
(18, 'b c', 945, 3),
(19, 'lodu lalit', 77, 4);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `l_name` varchar(20) DEFAULT NULL,
  `f_name` varchar(20) DEFAULT NULL,
  `emp_email` varchar(32) DEFAULT NULL,
  `emp_phone` varchar(20) DEFAULT NULL,
  `emp_dob` date DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `l_name`, `f_name`, `emp_email`, `emp_phone`, `emp_dob`, `branch_id`) VALUES
(5, '1', 'Emp', 'emp1@example.com', '123456789', '2020-10-01', 1),
(6, '2', 'Emp', 'emp2@example.com', '987654321', '2020-10-22', 2),
(7, '3', 'Emp', 'emp3@example.com', '1234564321', '2020-10-08', 1),
(8, '4', 'Emp', 'emp4@example.com', '3213213225', '0000-00-00', 1),
(9, '5', 'Emp', 'emp5@example.com', '5454354312', '0000-00-00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `forr`
--

CREATE TABLE `forr` (
  `Booking_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `check_in_date` date DEFAULT NULL,
  `check_out_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `forr`
--

INSERT INTO `forr` (`Booking_id`, `room_id`, `check_in_date`, `check_out_date`) VALUES
(1, 1, '2020-10-14', '2020-10-22'),
(2, 3, '2020-10-23', '2020-10-29'),
(86423, 3, '2020-11-01', '2020-11-07'),
(36941, 4, '2020-10-31', '2020-11-03');

-- --------------------------------------------------------

--
-- Table structure for table `generates`
--

CREATE TABLE `generates` (
  `Booking_id` int(11) DEFAULT NULL,
  `Bill_id` int(11) DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `generates`
--

INSERT INTO `generates` (`Booking_id`, `Bill_id`, `booking_date`) VALUES
(1, 1, '2020-10-01 00:00:00'),
(2, 2, '2020-10-09 00:00:00'),
(36941, 304027, '2020-10-31 09:27:19');

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(20) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `branch_phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`branch_id`, `branch_name`, `location`, `branch_phone`) VALUES
(1, 'Mumbai', 'Mumbai', NULL),
(2, 'Bangalore', 'Bangalore', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kitchen_staff`
--

CREATE TABLE `kitchen_staff` (
  `salary` int(11) NOT NULL,
  `expertise` varchar(10) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kitchen_staff`
--

INSERT INTO `kitchen_staff` (`salary`, `expertise`, `emp_id`) VALUES
(1234, 'abcd', 5),
(456, 'cde', 7);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `user_firstname` varchar(20) NOT NULL,
  `user_lastname` varchar(20) NOT NULL,
  `user_email` varchar(20) NOT NULL,
  `user_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`) VALUES
(1, 'Admin', '1234', 'Admin', '1', 'a@b.c', '0_Screen-Shot-2020-09-02-at-190424.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `dept_name` varchar(10) NOT NULL,
  `salary` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`dept_name`, `salary`, `emp_id`) VALUES
('a', 789, 6),
('b', 654, 8);

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` (
  `salary` int(11) NOT NULL,
  `counter_no` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receptionist`
--

INSERT INTO `receptionist` (`salary`, `counter_no`, `emp_id`) VALUES
(456, 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `Booking_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `cust_id`, `branch_id`, `Booking_id`) VALUES
(1, NULL, 1, NULL),
(2, NULL, 2, NULL),
(3, NULL, 1, NULL),
(4, NULL, 1, NULL),
(5, NULL, 2, NULL),
(6, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room_service`
--

CREATE TABLE `room_service` (
  `salary` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `simple`
--

CREATE TABLE `simple` (
  `room_id` int(11) NOT NULL,
  `wifi` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `simple`
--

INSERT INTO `simple` (`room_id`, `wifi`) VALUES
(1, ''),
(2, '');

-- --------------------------------------------------------

--
-- Table structure for table `suite`
--

CREATE TABLE `suite` (
  `wifi` varchar(10) NOT NULL,
  `room_id` int(11) NOT NULL,
  `jacuzzi` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `suite`
--

INSERT INTO `suite` (`wifi`, `room_id`, `jacuzzi`) VALUES
('', 5, 0),
('', 6, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`Bill_id`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`Booking_id`),
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`),
  ADD UNIQUE KEY `email_unique` (`cust_email`),
  ADD UNIQUE KEY `custphone_uni` (`cust_phone`),
  ADD UNIQUE KEY `custpass` (`passport_no`);

--
-- Indexes for table `deluxe`
--
ALTER TABLE `deluxe`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `dependents`
--
ALTER TABLE `dependents`
  ADD PRIMARY KEY (`dep_id`),
  ADD UNIQUE KEY `passdep` (`passport_no`),
  ADD UNIQUE KEY `custid` (`cust_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD UNIQUE KEY `emp_email` (`emp_email`),
  ADD UNIQUE KEY `emp_phone` (`emp_phone`),
  ADD KEY `branchid` (`branch_id`);

--
-- Indexes for table `forr`
--
ALTER TABLE `forr`
  ADD KEY `Booking_id` (`Booking_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `generates`
--
ALTER TABLE `generates`
  ADD KEY `Booking_id` (`Booking_id`),
  ADD KEY `Bill_id` (`Bill_id`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`branch_id`),
  ADD UNIQUE KEY `branch_phone` (`branch_phone`),
  ADD UNIQUE KEY `branch_name` (`branch_name`);

--
-- Indexes for table `kitchen_staff`
--
ALTER TABLE `kitchen_staff`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD UNIQUE KEY `empid` (`emp_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `Bookingid` (`Booking_id`);

--
-- Indexes for table `room_service`
--
ALTER TABLE `room_service`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `simple`
--
ALTER TABLE `simple`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `suite`
--
ALTER TABLE `suite`
  ADD PRIMARY KEY (`room_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dependents`
--
ALTER TABLE `dependents`
  MODIFY `dep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`branch_id`) REFERENCES `hotel` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deluxe`
--
ALTER TABLE `deluxe`
  ADD CONSTRAINT `deluxe_fk` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dependents`
--
ALTER TABLE `dependents`
  ADD CONSTRAINT `custid` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `branchid` FOREIGN KEY (`branch_id`) REFERENCES `hotel` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `forr`
--
ALTER TABLE `forr`
  ADD CONSTRAINT `forr_ibfk_1` FOREIGN KEY (`Booking_id`) REFERENCES `booking` (`Booking_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `forr_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `generates`
--
ALTER TABLE `generates`
  ADD CONSTRAINT `generates_ibfk_1` FOREIGN KEY (`Booking_id`) REFERENCES `booking` (`Booking_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `generates_ibfk_2` FOREIGN KEY (`Bill_id`) REFERENCES `bill` (`Bill_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kitchen_staff`
--
ALTER TABLE `kitchen_staff`
  ADD CONSTRAINT `ksid_fk` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manid_fk` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD CONSTRAINT `empid_fk` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `Bookingid` FOREIGN KEY (`Booking_id`) REFERENCES `booking` (`Booking_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rooms_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `hotel` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room_service`
--
ALTER TABLE `room_service`
  ADD CONSTRAINT `rsid_fk` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `simple`
--
ALTER TABLE `simple`
  ADD CONSTRAINT `simple_fk` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `suite`
--
ALTER TABLE `suite`
  ADD CONSTRAINT `suite_fk` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
