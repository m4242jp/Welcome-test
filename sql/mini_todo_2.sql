-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017 年 8 朁E11 日 13:11
-- サーバのバージョン： 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mini_todo`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `account_join_project`
--

CREATE TABLE IF NOT EXISTS `account_join_project` (
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `join_authority_level` int(11) NOT NULL DEFAULT '5',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `project`
--

CREATE TABLE IF NOT EXISTS `project` (
`id` int(11) NOT NULL,
  `project_name` varchar(80) NOT NULL,
  `project_summary` text NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `removed` tinyint(1) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=1000015 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `project_task`
--

CREATE TABLE IF NOT EXISTS `project_task` (
`id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `task_name` varchar(80) NOT NULL,
  `task_summary` text NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `handle_user_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT '10',
  `priority_id` int(11) NOT NULL DEFAULT '10',
  `status_id` int(11) NOT NULL DEFAULT '10',
  `schedule` datetime DEFAULT NULL,
  `removed` tinyint(1) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2000049 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `project_task_thread`
--

CREATE TABLE IF NOT EXISTS `project_task_thread` (
`id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `thread_body` text NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_join_project`
--
ALTER TABLE `account_join_project`
 ADD PRIMARY KEY (`user_id`,`project_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
 ADD PRIMARY KEY (`id`), ADD KEY `index_updated_at_and_id` (`update_date`,`id`);

--
-- Indexes for table `project_task`
--
ALTER TABLE `project_task`
 ADD PRIMARY KEY (`id`), ADD KEY `index_status_id` (`status_id`), ADD KEY `index_handle_user_id` (`handle_user_id`), ADD KEY `index_project_id` (`project_id`);

--
-- Indexes for table `project_task_thread`
--
ALTER TABLE `project_task_thread`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1000015;
--
-- AUTO_INCREMENT for table `project_task`
--
ALTER TABLE `project_task`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2000049;
--
-- AUTO_INCREMENT for table `project_task_thread`
--
ALTER TABLE `project_task_thread`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=159;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
