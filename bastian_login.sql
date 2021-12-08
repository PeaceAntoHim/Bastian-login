-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2021 at 09:03 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bastian_login`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(10, 'Frans Sebastian Lecardo', 'franssebastian@gmail.com', 'undraw_profile.svg', '$2y$10$p8BxL/HJXoc0GOXm9DeXAe2ZOYaND7ermXjxbNVjxrWVxBlvgyjwC', 1, 1, 1638721243),
(11, 'Banu Mulyanto', 'mulyanto@gmail.com', 'undraw_profile.svg', '$2y$10$Owqce7fnI5SyT5VjOael8eyhNTwPKFNiEThJBGglTNkkJUi1Kdi9K', 2, 0, 1638772399),
(28, 'franssebastian15@gmail.com', 'franssebastian15@gmail.com', 'undraw_profile.svg', '$2y$10$NR7dpu.ifKvDExjn9OJ73.Se9Zys1asF2DBZMdX7WakyCIjLr6pu2', 1, 1, 1638934111),
(29, 'stefanusfrans@gmail.com', 'stefanusfrans@gmail.com', 'undraw_profile.svg', '$2y$10$ArgFvZjAa8uCwKNTOlpyTO7Gl9WQSnVHtQhjJJgN4mQq3Y8InP7yS', 2, 0, 1638934247),
(33, 'stefanusfranssebastian@gmail.com', 'stefanusfranssebastian@gmail.com', 'undraw_profile.svg', '$2y$10$W6gU5ptqj1nZfveX0cJYne/.Jf8iQXQvARqlBbtANgiL9fEUbUrFW', 1, 1, 1638941765);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(12, 2, 3),
(13, 2, 2),
(38, 1, 2),
(45, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Menu'),
(24, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Member');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'My Profile', 'user', 'fas fa-fw fa-user', 1),
(3, 2, 'Edit Profile', 'user/edit', 'fas fa-fw fa-user-edit', 1),
(4, 3, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(5, 3, 'Submenu Management', 'menu/submenu', 'fas fa-fw fa-folder-open', 1),
(6, 1, 'coba', 'coba/coba', 'fab fa-fw fa-youtube ', 1),
(7, 1, 'Role', 'admin/role', 'fas fa-fw fa-user-tie', 1),
(9, 2, 'Change Password', 'user/changepassword', 'fas fa-fw fa-key', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`id`, `email`, `token`, `date_created`) VALUES
(21, 'franssebastian15@gmail.com', 'IbDTt1QthiMSGUoVd8MAGYhPeC5ZgkOqW0PmoqCbNuM=', 1638945561),
(22, 'franssebastian15@gmail.com', 'oEJyG1DnaChL5E5Jz+cglU/0dw47Yx1U/uvvr2P9w4Y=', 1638945568),
(23, 'franssebastian15@gmail.com', 'yKWbV4b3vLs0YBJk4fvxE4GXJ4qZHaUSG5fAQD7CWUQ=', 1638945603),
(24, 'franssebastian15@gmail.com', 'b2jsfZVp0AwnhN5Z4Ui3wZWOoHSW83knq3neeCQ/lmY=', 1638945706),
(25, 'franssebastian15@gmail.com', 'R0yhRwfb1woOb0aHoTSimPrLrR7tcvbDlHhh+5vhgig=', 1638945731),
(26, 'franssebastian15@gmail.com', 'yPCUASPtiMEkbteOHkzumLr9IxgEPjMfiDDDkObCMTU=', 1638945742),
(27, 'franssebastian15@gmail.com', 'bmjWvCfL+UNtLDbk1lWvcfAmvBfx4btJkXu3xH8RNfA=', 1638945828),
(28, 'franssebastian15@gmail.com', 'soIqIJWMf1eJ5DrycwNWN48XuNZQ7TmihQZChaDbupg=', 1638945889),
(29, 'franssebastian15@gmail.com', 'vtvZheN3LixPxX53uatdlUQvoKFW57JcJOfloJo9iWc=', 1638945912),
(30, 'franssebastian15@gmail.com', 'XINl1w2KMLcG+b08iJAnbo3Bf0WW93c7vJ+hDpScGxU=', 1638946196),
(31, 'franssebastian15@gmail.com', 'V/CK2KObtibxUAnhwPI6wqLSNmIkcV8e396cm0QDySc=', 1638947407),
(32, 'franssebastian15@gmail.com', 'tK/SCp0DZS3TXj6yI08Cq7tjxBqD9JsBSWhGEzrYy4Q=', 1638947517),
(33, 'franssebastian15@gmail.com', '1EFCGSePpidxU62YvE3WOMMYZPW3gB+WxQQJKwaKYDI=', 1638949795),
(34, 'franssebastian15@gmail.com', 'pPwQ6pnTYWByWbfTjPxK0S2EPH7TIIMQrg6NwViAVfA=', 1638949819),
(35, 'franssebastian15@gmail.com', '8ZtZFJbDHZNp5lPicRzlygxmEL5YbgEbDH9+qevQKPk=', 1638949967),
(36, 'franssebastian15@gmail.com', 'AY7cXPc7fopgg4CllLs+Q4K5LaUcZgQI0DZwFgOCtPk=', 1638950140),
(37, 'franssebastian15@gmail.com', 'ozudPMGBWXU59Kgmn5Cw/gpdxqcXJz2x8zxwBzKfJ7Y=', 1638950145);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
