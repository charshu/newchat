-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Apr 15, 2016 at 05:33 PM
-- Server version: 5.5.42
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `chatdb2`
--

-- --------------------------------------------------------

--
-- Table structure for table `joinroom`
--

CREATE TABLE `joinroom` (
  `fid` varchar(128) NOT NULL,
  `rid` int(4) NOT NULL,
  `jointime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `leavetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `joinroom`
--

INSERT INTO `joinroom` (`fid`, `rid`, `jointime`, `leavetime`) VALUES
('1034807556602456', 1, '2016-04-13 15:31:00', '2016-04-15 09:17:04'),
('1034807556602456', 2, '2016-04-13 18:45:21', '2016-04-14 07:22:35'),
('1034807556602456', 3, '2016-04-13 15:39:46', '2016-04-15 05:29:58'),
('1034807556602456', 4, '2016-04-13 15:44:04', '2016-04-15 08:57:13'),
('1034807556602456', 5, '2016-04-13 16:07:04', '2016-04-15 09:01:38'),
('1034807556602456', 6, '2016-04-15 08:57:09', '2016-04-15 08:57:10'),
('1034807556602456', 7, '2016-04-13 17:00:27', '2016-04-15 08:57:09'),
('1034807556602456', 8, '2016-04-13 15:42:03', '2016-04-15 08:57:11'),
('1034807556602456', 18, '2016-04-15 08:57:11', '2016-04-15 08:57:11'),
('1034807556602456', 22, '2016-04-15 08:57:08', '2016-04-15 08:57:09'),
('1034807556602456', 23, '2016-04-15 09:01:39', '0000-00-00 00:00:00'),
('1034807556602456', 24, '2016-04-15 08:12:55', '2016-04-15 08:12:57'),
('1034807556602456', 25, '2016-04-15 09:17:04', '2016-04-15 09:17:07'),
('1034807556602456', 27, '2016-04-15 09:17:07', '2016-04-15 09:17:11'),
('1034807556602456', 29, '2016-04-15 09:17:11', '2016-04-15 09:17:13'),
('1034807556602456', 31, '2016-04-15 09:17:13', '0000-00-00 00:00:00'),
('1386936317999356', 1, '2016-04-14 07:21:38', '2016-04-15 15:32:32'),
('1386936317999356', 4, '2016-04-15 15:32:33', '2016-04-15 15:32:34'),
('1386936317999356', 5, '2016-04-15 14:21:24', '2016-04-15 15:32:33'),
('1386936317999356', 6, '2016-04-15 14:21:25', '2016-04-15 14:21:25'),
('1386936317999356', 7, '2016-04-15 14:21:25', '2016-04-15 15:32:34'),
('1386936317999356', 8, '2016-04-14 23:04:31', '2016-04-15 14:21:26'),
('1386936317999356', 18, '2016-04-14 22:52:09', '2016-04-15 13:59:49'),
('1386936317999356', 19, '2016-04-14 23:03:14', '2016-04-15 13:59:19'),
('1386936317999356', 21, '2016-04-14 18:46:57', '2016-04-15 13:35:09'),
('1386936317999356', 23, '2016-04-14 23:01:22', '2016-04-15 13:35:10'),
('1386936317999356', 24, '2016-04-14 20:26:06', '2016-04-15 13:35:11'),
('1386936317999356', 25, '2016-04-14 20:26:08', '2016-04-15 13:35:11'),
('1386936317999356', 26, '2016-04-14 20:26:10', '2016-04-15 13:35:12'),
('1386936317999356', 27, '2016-04-14 20:26:12', '2016-04-14 23:01:25'),
('1386936317999356', 28, '2016-04-14 22:03:21', '2016-04-14 22:04:54'),
('1386936317999356', 29, '2016-04-14 22:03:56', '2016-04-14 22:03:57'),
('1386936317999356', 30, '2016-04-14 22:04:58', '2016-04-14 22:29:52'),
('1386936317999356', 31, '2016-04-14 22:29:52', '2016-04-14 22:29:52');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `fid` varchar(128) NOT NULL,
  `rid` int(4) NOT NULL DEFAULT '0',
  `msg` text,
  `senttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `rid` int(4) NOT NULL,
  `rname` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`rid`, `rname`) VALUES
(1, 'public'),
(2, 'yeah'),
(3, 'wow'),
(4, 'test'),
(5, 'dd'),
(6, 'xx'),
(7, 'eee'),
(8, 'ss'),
(18, 'zz'),
(19, 'ice'),
(21, 'testroom'),
(22, 'test2'),
(23, 'test3'),
(24, 'testtest'),
(25, 'ttt'),
(26, 'aaa'),
(27, 'test4'),
(28, 'sss'),
(29, 'testnew'),
(30, 'bye'),
(31, 'newen'),
(32, 'addd'),
(33, 'ee');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `fid` varchar(128) NOT NULL,
  `fname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`fid`, `fname`) VALUES
('1034807556602456', 'โชเจ'),
('1386936317999356', 'Vachirakorn');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `joinroom`
--
ALTER TABLE `joinroom`
  ADD PRIMARY KEY (`fid`,`rid`),
  ADD KEY `rid` (`rid`),
  ADD KEY `fid` (`fid`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`fid`,`rid`,`senttime`),
  ADD KEY `fid` (`fid`),
  ADD KEY `message_ibfk_1` (`rid`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`fid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `rid` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `joinroom`
--
ALTER TABLE `joinroom`
  ADD CONSTRAINT `joinroom_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`),
  ADD CONSTRAINT `joinroom_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `user` (`fid`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `user` (`fid`);
