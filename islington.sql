-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2026 at 12:06 PM
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
-- Database: `islington`
--

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `program_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'Bachelors',
  `category` varchar(255) NOT NULL DEFAULT 'IT Degree'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`program_id`, `name`, `type`, `category`) VALUES
(2, 'Bachelor in computing', 'Bachelors', 'IT degree'),
(3, 'Bachelor in computing', 'Bachelors', 'IT Degree'),
(4, 'Bachelor in computing', 'Bachelors', 'IT Degree'),
(5, 'Bachelor in Multimedia', 'Bachelors', 'IT Degree'),
(6, 'Bachelor in networking', 'Bachelors', 'IT Degree'),
(7, 'multimedia', 'Bachelors', 'IT Degree'),
(8, 'multimedia', 'Bachelors', 'IT Degree'),
(9, 'computing', 'Bachelors', 'IT Degree'),
(10, 'networking', 'Bachelors', 'IT Degree');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  `number` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `program_id` int(11) NOT NULL,
  `image` varbinary(1000) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `first_name`, `last_name`, `username`, `dob`, `gender`, `email`, `number`, `password`, `program_id`, `image`) VALUES
(36, 'Tashi ', 'Lama', 'Tashu', '2022-10-31', 'Male', 'Tashuchoro@gmail.com', '9807654321', '$2a$10$0ST2MghCoZUXmurDpMDRw.0i6BPd/FoQYsEyklgZq3/ft2B7O9Qdm', 5, NULL),
(37, 'rabina', 'lama', 'Rurur', '2026-02-26', 'Male', 'rabina@gmail.com', '9807654321', '$2a$10$pmsUCHGOeEASGnD5n/SL/uzNYiE0y5mkO9ZfuZ.7M2e.aLuLum/T.', 2, NULL),
(38, 's123', 's123', 's123', '1111-11-11', 'Male', 's123@gmail.com', '9876543210', '$2a$10$K1v0g7c3chtGsYBHFWO5Dew9E.k4TgdA2kbicOWeqhKZF6VbQW7Hy', 2, NULL),
(39, 'x', 'xx', 'x', '2026-04-08', 'Male', 'x@gmail.com', '11111111111', '$2a$10$QbJEBhWGpxeAK3x99ttHk.yKqqTUMxoXMNugEbvOdB9O8zdyf0HA6', 2, 0x75706c6f6164732f53637265656e73686f7420323032352d30372d3331203038333834322e706e67);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`program_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `program_student_id` (`program_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `program_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `program_student_id` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`);

--
-- Add status column for soft delete (if not already present)
-- Uncomment and run this if adding to an existing database:
-- ALTER TABLE `student` ADD COLUMN `status` varchar(20) DEFAULT 'active';

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
