-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2024 at 07:05 PM
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
-- Database: `hrs`
--
CREATE DATABASE IF NOT EXISTS `hrs` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hrs`;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `ID` bigint(10) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` text NOT NULL,
  `Message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_booking`
--

CREATE TABLE `event_booking` (
  `BookingId` bigint(10) NOT NULL,
  `EventId` bigint(10) NOT NULL,
  `User_id` bigint(10) DEFAULT NULL,
  `Date` date NOT NULL,
  `Modified_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Event_date` date NOT NULL,
  `NoOfGuest` varchar(50) NOT NULL,
  `EventTime` time NOT NULL,
  `Package` bigint(10) NOT NULL,
  `Amount` double NOT NULL,
  `Email` text NOT NULL,
  `Phone_number` bigint(10) NOT NULL,
  `Status` enum('Rejected','Cancelled','Paid','Booked','CheckedOut') NOT NULL DEFAULT 'Booked',
  `ref_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_list`
--

CREATE TABLE `event_list` (
  `EventId` bigint(10) NOT NULL,
  `EventTypeId` bigint(10) NOT NULL,
  `HallNumber` bigint(10) NOT NULL,
  `Status` enum('active','in-active') NOT NULL,
  `Booking_status` enum('Booked','Available') NOT NULL DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_list`
--

INSERT INTO `event_list` (`EventId`, `EventTypeId`, `HallNumber`, `Status`, `Booking_status`) VALUES
(27, 12, 123, 'active', 'Available'),
(28, 12, 145, 'active', 'Available'),
(29, 13, 223, 'active', 'Available'),
(30, 13, 245, 'active', 'Available'),
(31, 11, 323, 'active', 'Available'),
(32, 11, 345, 'active', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `event_payment`
--

CREATE TABLE `event_payment` (
  `PaymentId` bigint(10) NOT NULL,
  `BookingId` bigint(10) NOT NULL,
  `PaymentType` enum('Cash','Credit Card','Debit Card') NOT NULL,
  `PaymentDate` date NOT NULL DEFAULT current_timestamp(),
  `Amount` int(50) NOT NULL,
  `Status` enum('Paid') NOT NULL DEFAULT 'Paid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

CREATE TABLE `event_type` (
  `EventTypeId` bigint(10) NOT NULL,
  `EventType` varchar(15) NOT NULL,
  `Description` text NOT NULL,
  `Cost` double NOT NULL,
  `Status` enum('active','in-active') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`EventTypeId`, `EventType`, `Description`, `Cost`, `Status`) VALUES
(11, 'Wedding Hall', 'A luxurious and enchanting wedding hall nestled within the elegant confines of our hotel, offering the perfect blend of opulence and romance for your special day.', 500, 'active'),
(12, 'Meeting Hall', 'The Meeting Hall in the hotel provides a versatile and well-equipped space for gatherings, conferences, and events, ensuring a professional and accommodating environment for guests.', 200, 'active'),
(13, 'Conference Hall', 'The conference hall in the hotel offers state-of-the-art facilities and elegant design, providing the perfect setting for productive meetings, conferences, and events of all sizes.', 350, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `ID` bigint(10) NOT NULL,
  `Name` text NOT NULL,
  `Address_line1` text NOT NULL,
  `Address_line2` text NOT NULL,
  `City` varchar(10) NOT NULL,
  `State` varchar(10) NOT NULL,
  `Country` varchar(10) NOT NULL,
  `Zip_code` varchar(6) NOT NULL,
  `Email` text NOT NULL,
  `Phone_number` bigint(10) NOT NULL,
  `Telephone_number` varchar(10) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`ID`, `Name`, `Address_line1`, `Address_line2`, `City`, `State`, `Country`, `Zip_code`, `Email`, `Phone_number`, `Telephone_number`, `Description`) VALUES
(1, 'Tejas Hotel', '11 Dayton Dr', '', 'Edison', 'New Jersey', 'USA', '08820', 'patelt18@montclair.edu', 9082931782, '', 'Book Hotel NJ Delight for different purposes. We have various rooms and conference halls for professional meetings.');

-- --------------------------------------------------------

--
-- Table structure for table `room_booking`
--

CREATE TABLE `room_booking` (
  `BookingId` bigint(10) NOT NULL,
  `RoomId` bigint(10) NOT NULL,
  `User_id` bigint(10) DEFAULT NULL,
  `Date` date NOT NULL,
  `Modified_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `CheckIn` date NOT NULL,
  `CheckOut` date NOT NULL,
  `NoOfGuest` varchar(50) NOT NULL,
  `Amount` double NOT NULL,
  `Email` text NOT NULL,
  `Phone_number` bigint(10) NOT NULL,
  `Status` enum('Rejected','Cancelled','Paid','Booked','CheckedOut') NOT NULL DEFAULT 'Booked',
  `ref_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room_list`
--

CREATE TABLE `room_list` (
  `RoomId` bigint(10) NOT NULL,
  `RoomTypeId` bigint(10) NOT NULL,
  `RoomNumber` bigint(10) NOT NULL,
  `Status` enum('active','in-active') NOT NULL,
  `Booking_status` enum('Booked','Available') NOT NULL DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_list`
--

INSERT INTO `room_list` (`RoomId`, `RoomTypeId`, `RoomNumber`, `Status`, `Booking_status`) VALUES
(33, 11, 11, 'active', 'Available'),
(34, 11, 12, 'active', 'Available'),
(35, 15, 21, 'active', 'Available'),
(36, 15, 22, 'active', 'Available'),
(37, 16, 31, 'active', 'Available'),
(38, 16, 32, 'active', 'Available'),
(39, 17, 41, 'active', 'Available'),
(40, 17, 42, 'active', 'Available'),
(41, 18, 51, 'active', 'Available'),
(42, 18, 52, 'active', 'Available'),
(43, 13, 61, 'active', 'Available'),
(44, 13, 62, 'active', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `room_payment`
--

CREATE TABLE `room_payment` (
  `PaymentId` bigint(10) NOT NULL,
  `BookingId` bigint(10) NOT NULL,
  `PaymentType` enum('Cash','Net Banking','Credit Card','Debit Card') NOT NULL,
  `PaymentDate` date NOT NULL DEFAULT current_timestamp(),
  `Amount` int(50) NOT NULL,
  `Status` enum('Paid') NOT NULL DEFAULT 'Paid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `RoomTypeId` bigint(10) NOT NULL,
  `RoomType` varchar(30) NOT NULL,
  `Description` text NOT NULL,
  `Cost` double NOT NULL,
  `Status` enum('active','in-active') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_type`
--

INSERT INTO `room_type` (`RoomTypeId`, `RoomType`, `Description`, `Cost`, `Status`) VALUES
(11, 'Family Room', 'The family room in our hotel offers a spacious and cozy environment perfect for accommodating families with ample amenities and comfortable furnishings.', 500, 'active'),
(13, 'Presidential Suites', 'Experience unparalleled luxury and opulence in our presidential suites, where every detail is meticulously crafted to exceed the expectations of the most discerning guests.', 1250, 'active'),
(15, 'Club Room ', 'The club room in the hotel offers an exclusive and luxurious retreat, complete with personalized services, upscale amenities, and a sophisticated ambiance for discerning guests.', 125, 'active'),
(16, 'Deluxe Room', 'The deluxe room at our hotel offers spacious accommodations and luxurious amenities for an indulgent stay.', 250, 'active'),
(17, 'Super Deluxe ', 'Indulge in luxury and comfort with our Super Deluxe room, featuring spacious accommodations, modern amenities, and elegant design for an unforgettable stay.', 1500, 'active'),
(18, 'Luxury', 'Indulge in opulent comfort and lavish amenities within our luxury room, where every detail is meticulously crafted to ensure an unforgettable stay.', 750, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `users_details`
--

CREATE TABLE `users_details` (
  `UserId` bigint(10) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` text NOT NULL,
  `Password` varchar(64) NOT NULL,
  `ContactNo` varchar(50) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `Status` enum('active','in-active') NOT NULL DEFAULT 'active',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_details`
--

INSERT INTO `users_details` (`UserId`, `FirstName`, `LastName`, `Email`, `Password`, `ContactNo`, `Gender`, `Status`, `is_admin`) VALUES
(2, 'admin', 'Patel', 'admin@yopmail.com', '$2y$10$UUXIEX/N5GoaGrYPQIIfz.OOC1jE4V.p6VxWxcoGa91/xpY/fqDOC', '9082931781', 'male', 'active', 1),
(16, 'Tejas1', 'Patel', 'pateltejas1@yopmail.com', '$2y$10$8CrbBiP.rB3iE8n2qT50Reh1bnWsJ.eoyKNLiZTjEKaYRlNDWkiia', '9082931782', 'male', 'active', 0),
(17, 'Tejas2', 'Patel', 'pateltejas2@yopmail.com', '$2y$10$JJH5yQzRblIThX79FRbvmeoC7p2TX2pYdc3v6t6ZuhUE2nbEbt1Wm', '9082931783', 'male', 'active', 0),
(18, 'Tejas3', 'Patel', 'pateltejas3@yopmail.com', '$2y$10$e/U27aTFN6pVARpM2lQMeeEe1zvYidV4GH6YabtG3.N7n703qTC72', '9082931784', 'male', 'active', 0),
(19, 'Tejas4', 'Patel', 'pateltejas4@yopmail.com', '$2y$10$hA2qyChGZ.9c9zqCS/z9q.BxyqMRm6T86MMphKPQ794tO4zOq4SUK', '9082931785', 'male', 'active', 0),
(20, 'Tejas6', 'Patel', 'pateltejas6@yopmail.com', '$2y$10$1QlB.JSHRev3USrBLZeq3OzVoekt6BUFMu3NkcezVG9y5gxU3u0aa', '9082931786', 'male', 'active', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `event_booking`
--
ALTER TABLE `event_booking`
  ADD PRIMARY KEY (`BookingId`),
  ADD KEY `FK_RoomBooking` (`EventId`);

--
-- Indexes for table `event_list`
--
ALTER TABLE `event_list`
  ADD PRIMARY KEY (`EventId`),
  ADD KEY `FK_EventType` (`EventTypeId`);

--
-- Indexes for table `event_payment`
--
ALTER TABLE `event_payment`
  ADD PRIMARY KEY (`PaymentId`),
  ADD KEY `Fk_Booking` (`BookingId`);

--
-- Indexes for table `event_type`
--
ALTER TABLE `event_type`
  ADD PRIMARY KEY (`EventTypeId`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `room_booking`
--
ALTER TABLE `room_booking`
  ADD PRIMARY KEY (`BookingId`),
  ADD KEY `FK_RoomBooking` (`RoomId`);

--
-- Indexes for table `room_list`
--
ALTER TABLE `room_list`
  ADD PRIMARY KEY (`RoomId`),
  ADD KEY `FK_RoomType` (`RoomTypeId`);

--
-- Indexes for table `room_payment`
--
ALTER TABLE `room_payment`
  ADD PRIMARY KEY (`PaymentId`),
  ADD KEY `Fk_Booking` (`BookingId`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`RoomTypeId`);

--
-- Indexes for table `users_details`
--
ALTER TABLE `users_details`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `event_booking`
--
ALTER TABLE `event_booking`
  MODIFY `BookingId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `event_list`
--
ALTER TABLE `event_list`
  MODIFY `EventId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `event_payment`
--
ALTER TABLE `event_payment`
  MODIFY `PaymentId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `event_type`
--
ALTER TABLE `event_type`
  MODIFY `EventTypeId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `room_booking`
--
ALTER TABLE `room_booking`
  MODIFY `BookingId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `room_list`
--
ALTER TABLE `room_list`
  MODIFY `RoomId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `room_payment`
--
ALTER TABLE `room_payment`
  MODIFY `PaymentId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `room_type`
--
ALTER TABLE `room_type`
  MODIFY `RoomTypeId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users_details`
--
ALTER TABLE `users_details`
  MODIFY `UserId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event_booking`
--
ALTER TABLE `event_booking`
  ADD CONSTRAINT `FK_EventBooking` FOREIGN KEY (`EventId`) REFERENCES `event_list` (`EventId`) ON UPDATE CASCADE;

--
-- Constraints for table `event_list`
--
ALTER TABLE `event_list`
  ADD CONSTRAINT `FK_EventType` FOREIGN KEY (`EventTypeId`) REFERENCES `event_type` (`EventTypeId`) ON UPDATE CASCADE;

--
-- Constraints for table `event_payment`
--
ALTER TABLE `event_payment`
  ADD CONSTRAINT `FK_EventPayment` FOREIGN KEY (`BookingId`) REFERENCES `event_booking` (`BookingId`) ON UPDATE CASCADE;

--
-- Constraints for table `room_booking`
--
ALTER TABLE `room_booking`
  ADD CONSTRAINT `FK_RoomBooking` FOREIGN KEY (`RoomId`) REFERENCES `room_list` (`RoomId`) ON UPDATE CASCADE;

--
-- Constraints for table `room_list`
--
ALTER TABLE `room_list`
  ADD CONSTRAINT `FK_RoomType` FOREIGN KEY (`RoomTypeId`) REFERENCES `room_type` (`RoomTypeId`) ON UPDATE CASCADE;

--
-- Constraints for table `room_payment`
--
ALTER TABLE `room_payment`
  ADD CONSTRAINT `Fk_Booking` FOREIGN KEY (`BookingId`) REFERENCES `room_booking` (`BookingId`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
