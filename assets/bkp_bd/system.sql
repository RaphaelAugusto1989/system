-- phpMyAdmin SQL Dump
-- version 4.9.7deb1~bpo10+1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 06/11/2020 às 22:30
-- Versão do servidor: 10.3.23-MariaDB-0+deb10u1
-- Versão do PHP: 7.3.4-2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `system`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `accounts`
--

CREATE TABLE `accounts` (
  `id_account` int(11) NOT NULL,
  `id_user_fk` int(11) NOT NULL,
  `tipo_conta` varchar(1) DEFAULT NULL,
  `nome_conta` varchar(200) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `valor_conta` float DEFAULT NULL,
  `tipo_parcela` varchar(1) DEFAULT NULL,
  `parcelamento` int(11) DEFAULT NULL,
  `conta_fixa` varchar(1) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `date_insert` datetime NOT NULL,
  `date_update` datetime NOT NULL,
  `date_delete` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `accounts`
--

INSERT INTO `accounts` (`id_account`, `id_user_fk`, `tipo_conta`, `nome_conta`, `data_vencimento`, `valor_conta`, `tipo_parcela`, `parcelamento`, `conta_fixa`, `status`, `date_insert`, `date_update`, `date_delete`) VALUES
(1, 1, 'r', 'TESTE', '2020-11-12', 45.55, ' ', 0, 's', 's', '2020-11-06 17:29:06', '2020-11-06 17:31:31', '0000-00-00 00:00:00'),
(2, 1, 'r', 'TESTE', '2020-12-06', 45.55, ' ', 0, 's', 'n', '2020-11-06 17:29:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 'r', 'TESTE', '2021-01-06', 45.55, ' ', 0, 's', 'n', '2020-11-06 17:29:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, 'r', 'TESTE', '2021-02-06', 45.55, ' ', 0, 's', 'n', '2020-11-06 17:29:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 1, 'r', 'TESTE', '2021-03-06', 45.55, ' ', 0, 's', 'n', '2020-11-06 17:29:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 1, 'r', 'TESTE', '2021-04-06', 45.55, ' ', 0, 's', 'n', '2020-11-06 17:29:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 1, 'r', 'TESTE', '2021-05-06', 45.55, ' ', 0, 's', 'n', '2020-11-06 17:29:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 1, 'r', 'TESTE', '2021-06-06', 45.55, ' ', 0, 's', 'n', '2020-11-06 17:29:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 1, 'r', 'TESTE', '2021-07-06', 45.55, ' ', 0, 's', 'n', '2020-11-06 17:29:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 1, 'r', 'TESTE', '2021-08-06', 45.55, ' ', 0, 's', 'n', '2020-11-06 17:29:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 1, 'r', 'TESTE', '2021-09-06', 45.55, ' ', 0, 's', 'n', '2020-11-06 17:29:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 1, 'r', 'TESTE', '2021-10-06', 45.55, ' ', 0, 's', 'n', '2020-11-06 17:29:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 1, 'p', 'TESTE', '2020-11-20', 33.33, 'v', 0, ' ', 'n', '2020-11-06 17:30:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 1, 'p', 'TESTE 3X (1 de 3)', '2020-11-20', 44.5, 'p', 3, NULL, 's', '2020-11-06 17:31:02', '2020-11-06 17:31:49', '0000-00-00 00:00:00'),
(15, 1, 'p', 'TESTE 3X (2 de 3)', '2020-12-06', 44.5, 'p', 3, NULL, 'n', '2020-11-06 17:31:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 1, 'p', 'TESTE 3X (3 de 3)', '2021-01-06', 44.5, 'p', 3, NULL, 'n', '2020-11-06 17:31:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `logs`
--

CREATE TABLE `logs` (
  `id_log` int(11) NOT NULL,
  `id_user_fk` int(11) DEFAULT NULL,
  `id_module` int(11) DEFAULT NULL,
  `ip_user` varchar(15) DEFAULT NULL,
  `browser_user` varchar(300) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `page` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `date_insert` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `logs`
--

INSERT INTO `logs` (`id_log`, `id_user_fk`, `id_module`, `ip_user`, `browser_user`, `url`, `page`, `type`, `date_insert`) VALUES
(1, 1, NULL, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-05 17:09:05'),
(2, 1, NULL, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-05 17:11:40'),
(3, 1, NULL, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-05 17:15:17'),
(4, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-05 18:21:08'),
(5, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-05 18:31:17'),
(6, 1, 7, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-05 18:51:14'),
(7, 1, 8, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-05 18:51:14'),
(8, 1, 9, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-05 18:51:14'),
(9, 1, 10, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-05 18:58:06'),
(10, 1, 11, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-05 18:58:06'),
(11, 1, 12, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-05 18:58:06'),
(12, 1, 13, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-05 19:00:33'),
(13, 1, 14, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-05 19:00:33'),
(14, 1, 15, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-05 19:05:14'),
(15, 1, 16, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-05 19:06:04'),
(16, 1, 17, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-05 19:06:04'),
(17, 1, 18, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-05 19:06:04'),
(18, 1, 19, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-05 19:06:04'),
(19, 1, 20, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-05 19:06:04'),
(20, 1, 21, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-05 19:06:41'),
(21, 1, 22, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-05 19:06:41'),
(22, 1, 23, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-05 19:06:41'),
(23, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-06 10:46:01'),
(24, 1, 10, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2020-11-06 10:47:59'),
(25, 1, 24, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 10:52:07'),
(26, 1, 25, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 10:54:51'),
(27, 1, 26, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 10:56:13'),
(28, 1, 27, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 10:56:36'),
(29, 1, 1, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2020-11-06 10:56:47'),
(30, 1, 15, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2020-11-06 10:56:57'),
(31, 1, 27, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2020-11-06 10:57:10'),
(32, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-06 12:49:21'),
(33, 1, 1, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 16:52:54'),
(34, 1, 2, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 16:52:54'),
(35, 1, 3, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 16:52:54'),
(36, 1, 4, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 16:52:54'),
(37, 1, 5, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 16:52:54'),
(38, 1, 6, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 16:52:54'),
(39, 1, 7, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 16:52:54'),
(40, 1, 8, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 16:52:54'),
(41, 1, 9, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 16:52:54'),
(42, 1, 10, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 16:52:54'),
(43, 1, 11, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 16:52:54'),
(44, 1, 12, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 16:52:54'),
(45, 1, 13, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 16:52:54'),
(46, 1, 1, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:02:54'),
(47, 1, 2, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:02:54'),
(48, 1, 3, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:02:54'),
(49, 1, 4, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:02:54'),
(50, 1, 5, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:02:54'),
(51, 1, 6, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:02:54'),
(52, 1, 7, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:02:54'),
(53, 1, 8, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:02:54'),
(54, 1, 9, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:02:54'),
(55, 1, 10, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:02:54'),
(56, 1, 11, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:02:54'),
(57, 1, 12, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:02:54'),
(58, 1, 1, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:28:18'),
(59, 1, 2, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:28:18'),
(60, 1, 3, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:28:18'),
(61, 1, 4, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:28:19'),
(62, 1, 5, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:28:19'),
(63, 1, 6, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:28:19'),
(64, 1, 7, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:28:19'),
(65, 1, 8, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:28:19'),
(66, 1, 9, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:28:19'),
(67, 1, 10, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:28:19'),
(68, 1, 11, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:28:19'),
(69, 1, 12, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:28:19'),
(70, 1, 1, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:29:06'),
(71, 1, 2, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:29:06'),
(72, 1, 3, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:29:06'),
(73, 1, 4, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:29:06'),
(74, 1, 5, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:29:06'),
(75, 1, 6, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:29:06'),
(76, 1, 7, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:29:06'),
(77, 1, 8, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:29:06'),
(78, 1, 9, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:29:06'),
(79, 1, 10, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:29:06'),
(80, 1, 11, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:29:06'),
(81, 1, 12, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:29:06'),
(82, 1, 13, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:30:15'),
(83, 1, 14, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:31:02'),
(84, 1, 15, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:31:02'),
(85, 1, 16, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-06 17:31:02'),
(86, 1, 1, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2020-11-06 17:31:31'),
(87, 1, 14, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2020-11-06 17:31:49');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name_user` varchar(150) DEFAULT NULL,
  `cpf_user` varchar(14) DEFAULT NULL,
  `nascimento_user` date DEFAULT NULL,
  `email_user` varchar(100) DEFAULT NULL,
  `img_user` varchar(200) DEFAULT NULL,
  `login_user` varchar(20) DEFAULT NULL,
  `password_user` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id_user`, `name_user`, `cpf_user`, `nascimento_user`, `email_user`, `img_user`, `login_user`, `password_user`) VALUES
(1, 'ADMINISTRADOR DO SISTEMA', '999.999.999-99', '1989-06-08', 'raphael_krutch@hotmail.com', NULL, 'system', '18c6d818ae35a3e8279b5330eda01498');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id_account`);

--
-- Índices de tabela `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id_log`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `logs`
--
ALTER TABLE `logs`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
