-- phpMyAdmin SQL Dump
-- version 4.5.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 22, 2016 at 11:06 AM
-- Server version: 5.7.10-log
-- PHP Version: 5.6.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatdb`
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
('1187458981264904', 1, '2016-04-15 14:56:37', '2016-04-22 09:57:51'),
('1386936317999356', 1, '2016-04-15 14:50:01', '2016-04-16 16:50:34'),
('1386936317999356', 2, '2016-04-15 14:54:55', '2016-04-15 15:42:15'),
('1386936317999356', 3, '2016-04-15 15:42:09', '2016-04-15 15:42:10'),
('592173317618319', 1, '2016-04-15 15:13:15', '2016-04-15 15:20:28'),
('592173317618319', 2, '2016-04-15 15:18:48', '2016-04-15 15:18:49'),
('592173317618319', 3, '2016-04-15 15:20:17', '2016-04-15 15:20:26'),
('592173317618319', 4, '2016-04-15 15:18:57', '2016-04-15 15:18:58'),
('811487702285003', 1, '2016-04-15 15:27:17', '0000-00-00 00:00:00');

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

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`fid`, `rid`, `msg`, `senttime`) VALUES
('1187458981264904', 1, 'โหลววว', '2016-04-15 14:56:59'),
('1187458981264904', 1, 'เทสๆ', '2016-04-15 14:57:03'),
('1187458981264904', 1, 'เยา', '2016-04-15 14:57:05'),
('1187458981264904', 1, 'เย่', '2016-04-15 14:57:31'),
('1187458981264904', 1, 'ขึ้นจ้า', '2016-04-15 14:57:36'),
('1187458981264904', 1, 'จ้า', '2016-04-15 14:57:43'),
('1187458981264904', 1, 'เดี๋ยวลอง leave ห้องอื่น', '2016-04-15 14:58:14'),
('1187458981264904', 1, 'อันนี้ห้องไหนหว่า', '2016-04-15 14:58:58'),
('1187458981264904', 1, 'เจอ', '2016-04-15 14:59:07'),
('1187458981264904', 1, 'ตอน leave ห้องแล้ว มันจะมา public ใช่มะ', '2016-04-15 14:59:22'),
('1187458981264904', 1, 'แต่ว่า มันจะไม่เห็นข้อความที่เคยคุยก่อนหน้า', '2016-04-15 14:59:39'),
('1187458981264904', 1, 'ต้องกดเข้าอีกรอบ', '2016-04-15 14:59:46'),
('1187458981264904', 1, 'รูปในแชทเฟสด้วย', '2016-04-15 15:00:33'),
('1187458981264904', 1, 'เลื่อนแล้วมันเลยหน้า', '2016-04-15 15:00:40'),
('1187458981264904', 1, 'ลองไปดู', '2016-04-15 15:00:49'),
('1187458981264904', 1, 'อ่อ', '2016-04-15 15:00:56'),
('1187458981264904', 1, 'ไม่ lock ให้มันอยู่ล่างตลอดอะ', '2016-04-15 15:01:23'),
('1187458981264904', 1, 'fafarf', '2016-04-15 15:06:35'),
('1187458981264904', 1, 'เย้นๆ', '2016-04-15 15:06:40'),
('1187458981264904', 1, 'ดหเห', '2016-04-15 15:06:42'),
('1187458981264904', 1, 'ใจเย็นนนนนนนนน', '2016-04-15 15:06:56'),
('1187458981264904', 1, '55555555555', '2016-04-15 15:07:00'),
('1187458981264904', 1, 'dsf', '2016-04-15 15:07:06'),
('1187458981264904', 1, 'fd', '2016-04-15 15:07:07'),
('1187458981264904', 1, 'd', '2016-04-15 15:07:08'),
('1187458981264904', 1, 'd', '2016-04-15 15:07:09'),
('1187458981264904', 1, 'ss', '2016-04-15 15:07:10'),
('1187458981264904', 1, 'g', '2016-04-15 15:07:11'),
('1187458981264904', 1, 'erfe', '2016-04-15 15:07:12'),
('1187458981264904', 1, 'dfsg', '2016-04-15 15:07:15'),
('1187458981264904', 1, 'มันจะบัคแบบไหนอะ', '2016-04-15 15:07:23'),
('1187458981264904', 1, 'พี่ไอซ์มาหรอ', '2016-04-15 15:18:58'),
('1187458981264904', 1, '*-*', '2016-04-15 15:19:03'),
('1187458981264904', 1, 'Hello', '2016-04-22 11:06:03'),
('1187458981264904', 2, 'testๆ', '2016-04-15 14:57:22'),
('1386936317999356', 1, 'เย้', '2016-04-15 14:55:58'),
('1386936317999356', 1, 'เย่', '2016-04-15 14:56:00'),
('1386936317999356', 1, 'โหลว', '2016-04-15 14:56:44'),
('1386936317999356', 1, 'เห็นไหม', '2016-04-15 14:56:48'),
('1386936317999356', 1, 'โหลๆ', '2016-04-15 14:56:59'),
('1386936317999356', 1, 'เย่', '2016-04-15 14:57:02'),
('1386936317999356', 1, 'ลองออกไปห้องอื่น', '2016-04-15 14:57:09'),
('1386936317999356', 1, 'เย้', '2016-04-15 14:57:17'),
('1386936317999356', 1, 'เย้ย', '2016-04-15 14:57:19'),
('1386936317999356', 1, 'ข้อความไม่ได้อ่าน', '2016-04-15 14:57:25'),
('1386936317999356', 1, 'ได้ป่ะ', '2016-04-15 14:57:34'),
('1386936317999356', 1, 'unread', '2016-04-15 14:57:39'),
('1386936317999356', 1, 'เย่', '2016-04-15 14:57:52'),
('1386936317999356', 1, 'เจอบัคไหม', '2016-04-15 14:59:00'),
('1386936317999356', 1, 'บัคไหนอ่ะ', '2016-04-15 14:59:24'),
('1386936317999356', 1, 'ใช่', '2016-04-15 14:59:27'),
('1386936317999356', 1, 'เดี๋ยวจะปิดห้องpublic ให้มันไม่แสดงใน list', '2016-04-15 14:59:55'),
('1386936317999356', 1, 'อ้อ', '2016-04-15 15:00:06'),
('1386936317999356', 1, 'เออ', '2016-04-15 15:00:08'),
('1386936317999356', 1, 'งั้นต้องแก้', '2016-04-15 15:00:12'),
('1386936317999356', 1, 'เออจริง', '2016-04-15 15:00:26'),
('1386936317999356', 1, 'ไม่ๆ', '2016-04-15 15:00:46'),
('1386936317999356', 1, 'เค้าตั้งใจล็อคไว้', '2016-04-15 15:00:53'),
('1386936317999356', 1, 'ไม่อยากให้ช่องแชทแคบ', '2016-04-15 15:01:04'),
('1386936317999356', 1, 'ตั้ง min-width ไว้', '2016-04-15 15:01:16'),
('1386936317999356', 1, 'ถ้าขายมันจะตาม', '2016-04-15 15:01:31'),
('1386936317999356', 1, 'ขยา*', '2016-04-15 15:01:36'),
('1386936317999356', 1, 'อันไหนอ่ะ', '2016-04-15 15:01:51'),
('1386936317999356', 1, 'ตอนเข้าห้องมาต้องให้มันเลื่อนไปที่ unread ล่าสุดด้วยนะเนี่ย', '2016-04-15 15:02:59'),
('1386936317999356', 1, 'โหล', '2016-04-15 15:04:57'),
('1386936317999356', 1, 'เฟินมา', '2016-04-15 15:05:00'),
('1386936317999356', 1, 'เห็นแชทไหม', '2016-04-15 15:05:09'),
('1386936317999356', 1, 'มันก็บัคเหมือนกันเวลาคนเยอะๆนะเนี่ย', '2016-04-15 15:05:43'),
('1386936317999356', 1, 'ฟหก', '2016-04-15 15:06:26'),
('1386936317999356', 1, 'ห', '2016-04-15 15:06:27'),
('1386936317999356', 1, 'ห', '2016-04-15 15:06:28'),
('1386936317999356', 1, 'ก', '2016-04-15 15:06:29'),
('1386936317999356', 1, 'ห', '2016-04-15 15:06:30'),
('1386936317999356', 1, 'กฟหก', '2016-04-15 15:06:31'),
('1386936317999356', 1, 'ผแ', '2016-04-15 15:06:32'),
('1386936317999356', 1, 'ผป', '2016-04-15 15:06:33'),
('1386936317999356', 1, 'ๆ', '2016-04-15 15:06:34'),
('1386936317999356', 1, 'กห', '2016-04-15 15:06:43'),
('1386936317999356', 1, 'ห', '2016-04-15 15:06:44'),
('1386936317999356', 1, 'ๆ', '2016-04-15 15:06:45'),
('1386936317999356', 1, 'ด', '2016-04-15 15:06:46'),
('1386936317999356', 1, 'ฟ', '2016-04-15 15:06:47'),
('1386936317999356', 1, 'แ', '2016-04-15 15:06:48'),
('1386936317999356', 1, 'ิ', '2016-04-15 15:06:49'),
('1386936317999356', 1, '', '2016-04-15 15:06:50'),
('1386936317999356', 1, 'ๆ', '2016-04-15 15:06:51'),
('1386936317999356', 1, 'ำ', '2016-04-15 15:06:52'),
('1386936317999356', 1, 'ฟ', '2016-04-15 15:06:53'),
('1386936317999356', 1, 'ห', '2016-04-15 15:06:54'),
('1386936317999356', 1, 'ป', '2016-04-15 15:06:55'),
('1386936317999356', 1, 'ห', '2016-04-15 15:06:56'),
('1386936317999356', 1, 'รัวๆเลย', '2016-04-15 15:07:04'),
('1386936317999356', 1, 'ห', '2016-04-15 15:07:07'),
('1386936317999356', 1, 'ฟ', '2016-04-15 15:07:08'),
('1386936317999356', 1, 'ห', '2016-04-15 15:07:09'),
('1386936317999356', 1, 'ด', '2016-04-15 15:07:10'),
('1386936317999356', 1, 'หก', '2016-04-15 15:07:11'),
('1386936317999356', 1, 'ห', '2016-04-15 15:07:12'),
('1386936317999356', 1, 'ฟ', '2016-04-15 15:07:13'),
('1386936317999356', 1, '', '2016-04-15 15:07:14'),
('1386936317999356', 1, 'ฟห', '2016-04-15 15:07:15'),
('1386936317999356', 1, 'ฟ', '2016-04-15 15:07:16'),
('1386936317999356', 1, 'ฟ', '2016-04-15 15:07:17'),
('1386936317999356', 1, 'ได้แฮะ', '2016-04-15 15:07:20'),
('1386936317999356', 1, 'ลองสามคน', '2016-04-15 15:07:54'),
('1386936317999356', 1, 'แกพิมอังกิด', '2016-04-15 15:08:15'),
('1386936317999356', 1, 'เค้าพิมไทย', '2016-04-15 15:08:21'),
('1386936317999356', 1, 'เฟินเลข', '2016-04-15 15:08:24'),
('1386936317999356', 1, 'ถ้าข้อความสลับกันคือพัง', '2016-04-15 15:08:32'),
('1386936317999356', 1, 'เอายัง', '2016-04-15 15:08:37'),
('1386936317999356', 1, 'ฟห', '2016-04-15 15:08:59'),
('1386936317999356', 1, 'ฟ', '2016-04-15 15:09:00'),
('1386936317999356', 1, 'ๆ', '2016-04-15 15:09:01'),
('1386936317999356', 1, '', '2016-04-15 15:09:02'),
('1386936317999356', 1, 'หก', '2016-04-15 15:09:03'),
('1386936317999356', 1, 'ๆ', '2016-04-15 15:09:04'),
('1386936317999356', 1, 'ฟ', '2016-04-15 15:09:05'),
('1386936317999356', 1, 'ฟ', '2016-04-15 15:09:06'),
('1386936317999356', 1, 'ก็ได้อยู่นะ', '2016-04-15 15:09:50'),
('1386936317999356', 1, 'ลอง join leave รัวๆ', '2016-04-15 15:09:57'),
('1386936317999356', 1, 'ขึ้นนะ', '2016-04-15 15:18:29'),
('1386936317999356', 1, 'เยส', '2016-04-15 15:19:36'),
('1386936317999356', 1, '555', '2016-04-15 15:19:40'),
('592173317618319', 1, 'hello~', '2016-04-15 15:08:09'),
('592173317618319', 1, 'เข้าผิดห้อง', '2016-04-15 15:08:42'),
('592173317618319', 1, '1', '2016-04-15 15:08:56'),
('592173317618319', 1, '2', '2016-04-15 15:08:57'),
('592173317618319', 1, '3', '2016-04-15 15:08:59'),
('592173317618319', 1, '4', '2016-04-15 15:09:00'),
('592173317618319', 1, '6', '2016-04-15 15:09:09'),
('592173317618319', 1, '5', '2016-04-15 15:09:11'),
('592173317618319', 1, '4', '2016-04-15 15:09:12'),
('592173317618319', 1, '4', '2016-04-15 15:09:13'),
('592173317618319', 1, '6', '2016-04-15 15:09:15'),
('592173317618319', 1, '3', '2016-04-15 15:09:18'),
('592173317618319', 1, '7', '2016-04-15 15:09:19'),
('592173317618319', 1, '6', '2016-04-15 15:09:23'),
('592173317618319', 1, '??', '2016-04-15 15:09:40'),
('592173317618319', 1, '11', '2016-04-15 15:10:52'),
('592173317618319', 1, 'helloๆ', '2016-04-15 15:13:24'),
('592173317618319', 1, 'หฟฟหฟฟก', '2016-04-15 15:13:50'),
('592173317618319', 1, 'helloooooooooooooooooooooooooooooooo', '2016-04-15 15:14:28'),
('592173317618319', 1, 'เอ๊อะ ขึ้นละ', '2016-04-15 15:19:06'),
('592173317618319', 1, 'หืม...', '2016-04-15 15:19:28'),
('592173317618319', 1, '=.=', '2016-04-15 15:19:58');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `rid` int(4) NOT NULL,
  `rname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`rid`, `rname`) VALUES
(1, 'public'),
(2, 'yeah'),
(3, 'wow'),
(4, 'test');

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
('10154164833969380', 'Pimjuta'),
('1034807556602456', 'โชเจ'),
('1146545855375951', 'Rungsikorn'),
('1187458981264904', 'RJ'),
('1386936317999356', 'Vachirakorn'),
('592173317618319', 'Fern'),
('811487702285003', 'Eve');

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
  MODIFY `rid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `joinroom`
--
ALTER TABLE `joinroom`
  ADD CONSTRAINT `joinroom_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `joinroom_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `user` (`fid`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `room` (`rid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`fid`) REFERENCES `user` (`fid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
