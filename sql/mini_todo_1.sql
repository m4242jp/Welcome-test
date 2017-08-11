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
-- テーブルの構造 `account`
--

CREATE TABLE IF NOT EXISTS `account` (
`id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `show_name` varchar(40) DEFAULT NULL,
  `authority_level` int(11) NOT NULL DEFAULT '1',
  `removed` tinyint(1) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `account`
--

INSERT INTO `account` (`id`, `user_name`, `password`, `show_name`, `authority_level`, `removed`, `create_date`, `update_date`) VALUES
(1, 'aaa', '$2y$10$yiKVGW26fwWDx.QIYQxiduNi8Loz5ORpQRdZiolpmXKkdrqoBjaf.', 'aaaA', 4, 0, '2017-06-23 12:20:09', '2017-07-16 19:31:59'),
(3, 'miwa', '$2y$10$xnTmNJoEUmG0AT5t3Taf/ebG7EO6swQyTCZWBpMcda1nIZ/7d26nG', '三輪英男', 1, 0, '2017-06-29 09:46:10', '2017-07-16 19:38:54'),
(22, 'miwa2', '$2y$10$3qMFoNpb4utBRPA/n3X1LuWAUiVfVXGFfPcWX/HAefWFRbx6ZCZzK', 'mi', 5, 0, '2017-07-05 01:27:37', '2017-07-16 19:33:37'),
(23, 'bbbb', '$2y$10$8FnwDJXQ5IAnWQz7Mnvnu.tqULU7wRR1kqpnxl6bUWD366DK2FyYK', 'bbbb', 4, 0, '2017-07-07 20:43:47', '2017-07-16 19:31:59'),
(25, 'cccc', '$2y$10$HpdSAI77D/lxgDtgq05BG.BbF.SEfJQ1cHbFHxUKcoA40l/7Mynui', 'cccc', 5, 0, '2017-07-07 21:51:23', '2017-07-16 19:31:59'),
(26, 'sass', '$2y$10$yqSOwIw/29z9.1yN50xiOeoseOUiqHgFu6hoEHoaDZttrNx15HUIe', 'daf', 5, 0, '2017-07-08 06:49:26', '2017-07-16 19:32:00'),
(27, 'rrrr', '$2y$10$nlFdxz8.dm6Gm84y3wGK4Oq.BGHqUM5tSr9Yo4XQewhqLvDvaGREy', 'eee', 5, 0, '2017-07-12 00:31:23', '2017-07-16 19:32:00'),
(28, 'eeee', '$2y$10$LnfNKqP3C5pF4Az32.k.oew/ih8VlLB/9abbgzUTpeRnTgF0zdAky', 'eeee', 5, 0, '2017-07-12 00:34:20', '2017-07-16 19:32:00'),
(29, 'zzzz', '$2y$10$6RyTb5FQpu57IA9yS1a.2eVPYXrNw1opl3a/YleHC1WmUbM7xsU/q', 'zzzz', 5, 0, '2017-07-12 00:34:47', '2017-07-16 19:32:00');

-- --------------------------------------------------------

--
-- テーブルの構造 `account_authority`
--

CREATE TABLE IF NOT EXISTS `account_authority` (
  `authority_level` int(11) NOT NULL,
  `authority_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `account_authority`
--

INSERT INTO `account_authority` (`authority_level`, `authority_name`) VALUES
(1, '管理者'),
(2, '開発'),
(4, 'マネージャー'),
(5, '一般');

-- --------------------------------------------------------

--
-- テーブルの構造 `account_join_authority`
--

CREATE TABLE IF NOT EXISTS `account_join_authority` (
  `authority_level` int(11) NOT NULL,
  `authority_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `account_join_authority`
--

INSERT INTO `account_join_authority` (`authority_level`, `authority_name`) VALUES
(1, '管理者'),
(5, 'メンバ');

-- --------------------------------------------------------

--
-- テーブルの構造 `project_task_category`
--

CREATE TABLE IF NOT EXISTS `project_task_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `project_task_category`
--

INSERT INTO `project_task_category` (`category_id`, `category_name`) VALUES
(1, '課題'),
(2, '問題'),
(3, '目標'),
(6, '質問'),
(10, 'その他');

-- --------------------------------------------------------

--
-- テーブルの構造 `project_task_priority`
--

CREATE TABLE IF NOT EXISTS `project_task_priority` (
  `priority_id` int(11) NOT NULL,
  `priority_name` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `project_task_priority`
--

INSERT INTO `project_task_priority` (`priority_id`, `priority_name`) VALUES
(1, '高'),
(5, '中'),
(10, '低');

-- --------------------------------------------------------

--
-- テーブルの構造 `project_task_status`
--

CREATE TABLE IF NOT EXISTS `project_task_status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(12) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='タスクのステイタス用';

--
-- テーブルのデータのダンプ `project_task_status`
--

INSERT INTO `project_task_status` (`status_id`, `status_name`, `create_date`, `update_date`) VALUES
(1, '完了', '2017-07-05 11:39:20', '2017-07-05 11:39:20'),
(2, '対応済', '2017-07-11 09:14:51', '2017-07-11 09:14:51'),
(5, '対応中', '2017-07-05 11:39:20', '2017-07-05 11:39:20'),
(6, '検討中', '2017-07-05 11:40:03', '2017-07-05 11:40:03'),
(10, '未対応', '2017-07-05 11:40:03', '2017-07-05 11:40:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_name_index` (`user_name`);

--
-- Indexes for table `account_authority`
--
ALTER TABLE `account_authority`
 ADD PRIMARY KEY (`authority_level`), ADD UNIQUE KEY `authority_level` (`authority_level`);

--
-- Indexes for table `account_join_authority`
--
ALTER TABLE `account_join_authority`
 ADD PRIMARY KEY (`authority_level`);

--
-- Indexes for table `project_task_category`
--
ALTER TABLE `project_task_category`
 ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `project_task_priority`
--
ALTER TABLE `project_task_priority`
 ADD PRIMARY KEY (`priority_id`);

--
-- Indexes for table `project_task_status`
--
ALTER TABLE `project_task_status`
 ADD PRIMARY KEY (`status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
