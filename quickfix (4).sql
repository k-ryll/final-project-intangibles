-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 09:22 AM
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
-- Database: `quickfix`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `fixer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `details` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('pending','confirmed','declined') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `customer_id`, `fixer_id`, `customer_name`, `customer_email`, `date`, `time`, `details`, `created_at`, `updated_at`, `status`) VALUES
(1, 3, 7, 'Kharyll', 'client@gmail.com', '2024-12-20', '05:43:00', 'I need my ref fixed.', '2024-12-16 03:44:07', '2024-12-16 04:53:28', 'confirmed'),
(2, 3, 7, 'Jonna', 'admin@gmail.com', '2024-12-20', '10:10:00', 'I need my laptop fixed', '2024-12-16 05:08:01', '2024-12-16 05:08:01', 'pending'),
(3, 3, 7, 'Alliya', 'aj@gmail.com', '2024-12-19', '19:11:00', 'Need my house painted.', '2024-12-16 05:13:57', '2024-12-16 05:13:57', 'pending'),
(4, 3, 7, 'Alliya', 'admin@gmail.com', '2024-12-21', '19:14:00', 'I need my house painted', '2024-12-16 05:14:21', '2024-12-17 09:34:18', 'confirmed'),
(5, 3, 7, 'Alliya', 'admin@gmail.com', '2024-12-21', '19:14:00', 'I need my house painted', '2024-12-16 05:14:35', '2024-12-16 05:14:35', 'pending'),
(6, 3, 7, 'Talya', 'admin@gmail.com', '2024-12-25', '16:18:00', 'I need my fan cleaned', '2024-12-16 05:16:19', '2024-12-16 05:16:19', 'pending'),
(7, 3, 7, 'Talya', 'admin@gmail.com', '2024-12-25', '19:23:00', 'adasdsdf', '2024-12-16 05:38:10', '2024-12-16 05:38:10', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `certifications`
--

CREATE TABLE `certifications` (
  `id` int(11) NOT NULL,
  `fixer_id` int(11) NOT NULL,
  `certificate_img` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certifications`
--

INSERT INTO `certifications` (`id`, `fixer_id`, `certificate_img`, `created_at`) VALUES
(1, 7, './assets/certificates/1734322640-certificate_7.jpg', '2024-12-16 04:17:20'),
(5, 8, './assets/certificates/1734508481-certificate_8.jpg', '2024-12-18 07:54:41'),
(7, 8, './assets/certificates/1734508496-certificate_8.jpg', '2024-12-18 07:54:56');

-- --------------------------------------------------------

--
-- Table structure for table `fixers`
--

CREATE TABLE `fixers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT 0.0,
  `profile_img` varchar(255) DEFAULT '/assets/profile.jpg',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `skills` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`skills`)),
  `total_bookings` int(11) DEFAULT 0,
  `responded_bookings` int(11) DEFAULT 0,
  `answer_rate` decimal(5,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fixers`
--

INSERT INTO `fixers` (`id`, `name`, `email`, `password`, `phone`, `mobile`, `address`, `location`, `about`, `rating`, `profile_img`, `created_at`, `updated_at`, `skills`, `total_bookings`, `responded_bookings`, `answer_rate`) VALUES
(7, 'ella amoren', 'admin@a.b', '$2y$10$msHUmvmMxHrNIg7pzc5y..4keH1EneJyIqDuyS1les6uzyOzJr95y', 'Not provided', '09693438228', 'Paco manila', 'Cristobal', 'Very good at electrical works', 5.0, './assets/uploads/profile_7.jpeg', '2024-12-16 03:17:53', '2024-12-17 21:03:41', '[\"Electrical Services\",\"Door & Lock Installation\",\"Plumbing Services\",\"Painting Services\",\"Flooring Services\"]', 0, 0, 28.57),
(8, 'Charlene Dilig', 'admin@b.d', '$2y$10$tBi3PnuLV2bOuqRo5YroGOVaaFO5GeegvqR26uJspX94wrMZVcGgC', 'Not provided', '0924287534929', 'Pandacan', 'Pandacan', 'Very good with paint works', 0.0, './assets/uploads/profile_8.jpg', '2024-12-18 07:49:46', '2024-12-18 07:52:55', '[\"Painting Services\",\"Wall and Floor Designs\"]', 0, 0, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `ratings_comments`
--

CREATE TABLE `ratings_comments` (
  `id` int(11) NOT NULL,
  `fixer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings_comments`
--

INSERT INTO `ratings_comments` (`id`, `fixer_id`, `user_id`, `rating`, `comment`, `created_at`) VALUES
(1, 7, 3, 5, 'good', '2024-12-16 12:53:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `number` int(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` date NOT NULL,
  `userid` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `first_name`, `last_name`, `number`, `password`, `createdAt`, `userid`) VALUES
('s@gmail.com', 'ryujin', 'shin', 0, '$2y$10$cK59mseaHIQcIoOhapGFQOrLC6estFFuHj/keH/Jv810tNQGVJomi', '2024-12-09', 1),
('lia@y.c', 'kharyll', 'Andres', 2147483647, '$2y$10$3kgdkugRO2peXYi7Uw651ODakEgESRuTAruPaFm7DMecr2gdZMrDK', '2024-12-09', 2),
('admin@y.c', 'Kharyll', 'Andres', 2147483647, '$2y$10$yRgzuLMvVrLO1mUqSGs3ve6k7kXXtpF.cW0fo1f3zQi7sF31NS5XK', '2024-12-16', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fixer_id` (`fixer_id`);

--
-- Indexes for table `certifications`
--
ALTER TABLE `certifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fixer_id` (`fixer_id`);

--
-- Indexes for table `fixers`
--
ALTER TABLE `fixers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `ratings_comments`
--
ALTER TABLE `ratings_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fixer_id` (`fixer_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `certifications`
--
ALTER TABLE `certifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fixers`
--
ALTER TABLE `fixers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ratings_comments`
--
ALTER TABLE `ratings_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`fixer_id`) REFERENCES `fixers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `certifications`
--
ALTER TABLE `certifications`
  ADD CONSTRAINT `certifications_ibfk_1` FOREIGN KEY (`fixer_id`) REFERENCES `fixers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings_comments`
--
ALTER TABLE `ratings_comments`
  ADD CONSTRAINT `ratings_comments_ibfk_1` FOREIGN KEY (`fixer_id`) REFERENCES `fixers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`userid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
