-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Apr 12, 2016 at 07:00 AM
-- Server version: 5.5.42
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `chatdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `joinchat`
--

CREATE TABLE `joinchat` (
  `fid` varchar(20) NOT NULL,
  `rid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `joinchat`
--

INSERT INTO `joinchat` (`fid`, `rid`) VALUES
('1386936317999356', 1),
('1386936317999356', 2),
('1386936317999356', 14),
('1386936317999356', 15);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `sender` varchar(25) NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `sender`, `message`, `date`) VALUES
(1, 'Winnie', 'Australia', '2016-04-10 20:16:57'),
(2, 'dd', 'test', '2016-04-10 20:23:52'),
(3, 'chi', 'test', '2016-04-10 20:27:42'),
(4, 'chi', 'work', '2016-04-10 20:29:04'),
(5, 'chi', 'work', '2016-04-10 20:29:08'),
(6, 'chi', 'so happy', '2016-04-10 20:29:14'),
(7, 'chi', 'room2', '2016-04-10 20:31:06'),
(8, 'chi', 'eiei', '2016-04-11 13:25:24'),
(9, 'chi', 'ajajaja', '2016-04-11 13:39:31'),
(10, 'Vachirakorn Rungsikawanic', 'dd', '2016-04-11 14:04:36'),
(11, 'Vachirakorn Rungsikawanic', 'sss', '2016-04-11 14:04:42'),
(12, '', 'sss', '2016-04-11 14:05:05'),
(13, '', 'ss', '2016-04-11 14:05:33'),
(14, 'Vachirakorn', 'ss', '2016-04-11 14:06:12'),
(15, 'Vachirakorn', 'yeah', '2016-04-11 14:50:04'),
(16, 'Vachirakorn', 'eiei', '2016-04-11 16:41:23'),
(17, 'Vachirakorn', 'yeah', '2016-04-11 16:41:26'),
(18, 'Vachirakorn', 'we did it', '2016-04-11 16:48:27'),
(19, 'Vachirakorn', 'test', '2016-04-11 19:40:24'),
(20, 'Vachirakorn', 'j', '2016-04-11 20:04:39'),
(21, 'Vachirakorn', 'yo', '2016-04-11 21:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `rid` int(11) NOT NULL,
  `rname` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`rid`, `rname`) VALUES
(1, 'test1'),
(2, 'test2'),
(3, 'hi'),
(4, 'hi2'),
(5, 'jo'),
(6, 'hiii'),
(7, 'jojo'),
(8, 'koko'),
(9, 'joja'),
(10, 'kola'),
(11, 'ji'),
(12, 'kl'),
(13, 'ml'),
(14, 'kop'),
(15, 'yeah');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `fid` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`fid`, `fname`) VALUES
('1386936317999356', 'Vachirakorn');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `joinchat`
--
ALTER TABLE `joinchat`
  ADD PRIMARY KEY (`fid`,`rid`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
