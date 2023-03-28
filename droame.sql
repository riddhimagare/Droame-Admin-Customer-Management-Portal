-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2023 at 07:47 AM
-- Server version: 5.5.39
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `droame`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE IF NOT EXISTS `booking` (
`booking_id` int(50) NOT NULL,
  `customer_name` varchar(256) NOT NULL,
  `customer_email` varchar(256) NOT NULL,
  `customer_mo` bigint(100) NOT NULL,
  `location_id` int(50) NOT NULL,
  `drone_shot_id` int(50) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `booking_date` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `customer_name`, `customer_email`, `customer_mo`, `location_id`, `drone_shot_id`, `created_time`, `booking_date`) VALUES
(2, 'Harshu', 'harshu@gmail.com', 6789563498, 34, 55, '2023-03-27 13:00:04', '2023-04-07'),
(4, 'Riddhi ', 'riddhimagare@gmail.com', 8976544323, 6, 7, '2023-03-28 04:58:58', '2023-04-01'),
(6, 'Samruddhi', 'saam@gmail.com', 86756435767, 9, 9, '2023-03-28 05:02:54', '2023-03-23'),
(9, 'Ronak', 'ronak@gmail.com', 9563490234, 65, 7, '2023-03-28 05:09:14', '2023-03-14');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
`customer_id` int(11) NOT NULL,
  `customer_name` varchar(256) NOT NULL,
  `customer_email` varchar(256) NOT NULL,
  `customer_gender` varchar(256) NOT NULL,
  `customer_mo` bigint(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_email`, `customer_gender`, `customer_mo`) VALUES
(1, 'Riddhi ', 'riddhimagare@gmail.com', 'Female', 8976544323),
(2, 'Harshu', 'harshu@gmail.com', 'Male', 6789563498),
(3, 'Gauri', 'gauri@gmail.com', 'Female', 1244563226),
(4, 'Samruddhi', 'saam@gmail.com', 'Female', 86756435767),
(5, 'Raj', 'raj@gmail.com', 'Male', 8786743209),
(6, 'Ronak', 'ronak@gmail.com', 'Male', 9563490234),
(7, 'sapana', 'sapana@gmail.com', 'Female', 5647830430);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
 ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
 ADD PRIMARY KEY (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
MODIFY `booking_id` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
