-- phpMyAdmin SQL Dump
-- version 4.5.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 12, 2016 at 03:34 AM
-- Server version: 5.7.10-log
-- PHP Version: 5.6.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mini_line`
--

-- --------------------------------------------------------

--
-- Table structure for table `joinroom`
--

CREATE TABLE `joinroom` (
  `rid` int(11) DEFAULT NULL,
  `fbID` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `rid` int(3) DEFAULT NULL,
  `fbID` varchar(128) DEFAULT NULL,
  `senttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `msg` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `rid` int(3) NOT NULL,
  `rname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `fbID` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `joinroom`
--
ALTER TABLE `joinroom`
  ADD KEY `rid` (`rid`),
  ADD KEY `fbID` (`fbID`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD KEY `rid` (`rid`),
  ADD KEY `fbID` (`fbID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`fbID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `joinroom`
--
ALTER TABLE `joinroom`
  ADD CONSTRAINT `joinroom_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`),
  ADD CONSTRAINT `joinroom_ibfk_2` FOREIGN KEY (`fbID`) REFERENCES `user` (`fbID`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`fbID`) REFERENCES `user` (`fbID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
