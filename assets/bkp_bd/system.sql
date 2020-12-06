-- phpMyAdmin SQL Dump
-- version 4.9.7deb1~bpo10+1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 05/12/2020 às 21:38
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
  `id_account_one` int(11) NOT NULL,
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

INSERT INTO `accounts` (`id_account`, `id_account_one`, `id_user_fk`, `tipo_conta`, `nome_conta`, `data_vencimento`, `valor_conta`, `tipo_parcela`, `parcelamento`, `conta_fixa`, `status`, `date_insert`, `date_update`, `date_delete`) VALUES
(1, 0, 1, 'p', 'TESTE (1 de 12)', '2020-11-06', 45.55, 'p', 12, 'n', 'n', '2020-11-10 15:31:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 0, 1, 'p', 'TESTE (2 de 12)', '2020-12-10', 45.55, 'p', 12, 'n', 'n', '2020-11-10 15:31:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 0, 1, 'p', 'TESTE (3 de 12)', '2021-01-10', 45.55, 'p', 12, 'n', 'n', '2020-11-10 15:31:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 0, 1, 'p', 'TESTE (4 de 12)', '2021-02-10', 45.55, 'p', 12, 'n', 'n', '2020-11-10 15:31:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 0, 1, 'p', 'TESTE (5 de 12)', '2021-03-10', 45.55, 'p', 12, 'n', 'n', '2020-11-10 15:31:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 0, 1, 'p', 'TESTE (6 de 12)', '2021-04-10', 45.55, 'p', 12, 'n', 'n', '2020-11-10 15:31:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 0, 1, 'p', 'TESTE (7 de 12)', '2021-05-10', 45.55, 'p', 12, 'n', 'n', '2020-11-10 15:31:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 0, 1, 'p', 'TESTE (8 de 12)', '2021-06-10', 45.55, 'p', 12, 'n', 'n', '2020-11-10 15:31:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 0, 1, 'p', 'TESTE (9 de 12)', '2021-07-10', 45.55, 'p', 12, 'n', 'n', '2020-11-10 15:31:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 0, 1, 'p', 'TESTE (10 de 12)', '2021-08-10', 45.55, 'p', 12, 'n', 'n', '2020-11-10 15:31:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 0, 1, 'p', 'TESTE (11 de 12)', '2021-09-10', 45.55, 'p', 12, 'n', 'n', '2020-11-10 15:31:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 0, 1, 'p', 'TESTE (12 de 12)', '2021-10-10', 45.55, 'p', 12, 'n', 'n', '2020-11-10 15:31:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 0, 1, 'p', 'TESTE3 (1 de 5)', '2020-11-13', 32.22, 'p', 5, 'n', 'n', '2020-11-10 16:41:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 0, 1, 'p', 'TESTE3 (2 de 5)', '2020-12-10', 32.22, 'p', 5, 'n', 'n', '2020-11-10 16:41:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 0, 1, 'p', 'TESTE3 (3 de 5)', '2021-01-10', 32.22, 'p', 5, 'n', 'n', '2020-11-10 16:41:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 0, 1, 'p', 'TESTE3 (4 de 5)', '2021-02-10', 32.22, 'p', 5, 'n', 'n', '2020-11-10 16:41:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 0, 1, 'p', 'TESTE3 (5 de 5)', '2021-03-10', 32.22, 'p', 5, 'n', 'n', '2020-11-10 16:41:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 0, 1, 'r', 'TESTE 4', '2020-12-11', 343.42, ' ', 0, 'n', 'n', '2020-11-10 16:42:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 0, 1, 'r', 'TESTE 5', '2020-11-20', 45.53, ' ', 0, 's', 'n', '2020-11-10 16:42:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 0, 1, 'r', 'TESTE 5', '2020-12-10', 45.53, ' ', 0, 's', 'n', '2020-11-10 16:42:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 0, 1, 'r', 'TESTE 5', '2021-01-10', 45.53, ' ', 0, 's', 'n', '2020-11-10 16:42:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 0, 1, 'r', 'TESTE 5', '2021-02-10', 45.53, ' ', 0, 's', 'n', '2020-11-10 16:42:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 0, 1, 'r', 'TESTE 5', '2021-03-10', 45.53, ' ', 0, 's', 'n', '2020-11-10 16:42:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 0, 1, 'r', 'TESTE 5', '2021-04-10', 45.53, ' ', 0, 's', 'n', '2020-11-10 16:42:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 0, 1, 'r', 'TESTE 5', '2021-05-10', 45.53, ' ', 0, 's', 'n', '2020-11-10 16:42:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 0, 1, 'r', 'TESTE 5', '2021-06-10', 45.53, ' ', 0, 's', 'n', '2020-11-10 16:42:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 0, 1, 'r', 'TESTE 5', '2021-07-10', 45.53, ' ', 0, 's', 'n', '2020-11-10 16:42:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 0, 1, 'r', 'TESTE 5', '2021-08-10', 45.53, ' ', 0, 's', 'n', '2020-11-10 16:42:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 0, 1, 'r', 'TESTE 5', '2021-09-10', 45.53, ' ', 0, 's', 'n', '2020-11-10 16:42:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 0, 1, 'r', 'TESTE 5', '2021-10-10', 45.53, ' ', 0, 's', 'n', '2020-11-10 16:42:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 0, 1, 'p', 'TESTE FIXO', '2020-12-17', 49.99, 'v', 0, 's', 'n', '2020-11-17 18:15:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 0, 1, 'p', 'TESTE FIXO', '2021-01-17', 49.99, 'v', 0, 's', 'n', '2020-11-17 18:15:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 0, 1, 'p', 'TESTE FIXO', '2021-02-17', 49.99, 'v', 0, 's', 'n', '2020-11-17 18:15:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 0, 1, 'p', 'TESTE FIXO', '2021-03-17', 49.99, 'v', 0, 's', 'n', '2020-11-17 18:15:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 0, 1, 'p', 'TESTE FIXO', '2021-04-17', 49.99, 'v', 0, 's', 'n', '2020-11-17 18:15:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 0, 1, 'p', 'TESTE FIXO', '2021-05-17', 49.99, 'v', 0, 's', 'n', '2020-11-17 18:15:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 0, 1, 'p', 'TESTE FIXO', '2021-06-17', 49.99, 'v', 0, 's', 'n', '2020-11-17 18:15:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 0, 1, 'p', 'TESTE FIXO', '2021-07-17', 49.99, 'v', 0, 's', 'n', '2020-11-17 18:15:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 0, 1, 'p', 'TESTE FIXO', '2021-08-17', 49.99, 'v', 0, 's', 'n', '2020-11-17 18:15:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 0, 1, 'p', 'TESTE FIXO', '2021-09-17', 49.99, 'v', 0, 's', 'n', '2020-11-17 18:15:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 0, 1, 'p', 'TESTE FIXO', '2021-10-17', 49.99, 'v', 0, 's', 'n', '2020-11-17 18:15:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 0, 1, 'p', 'CONTA FIXA 2', '2020-12-17', 33.33, 'v', 0, 's', 'n', '2020-11-17 18:17:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 0, 1, 'p', 'CONTA FIXA 2', '2021-01-17', 33.33, 'v', 0, 's', 'n', '2020-11-17 18:17:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 0, 1, 'p', 'CONTA FIXA 2', '2021-02-17', 33.33, 'v', 0, 's', 'n', '2020-11-17 18:17:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 0, 1, 'p', 'CONTA FIXA 2', '2021-03-17', 33.33, 'v', 0, 's', 'n', '2020-11-17 18:17:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 0, 1, 'p', 'CONTA FIXA 2', '2021-04-17', 33.33, 'v', 0, 's', 'n', '2020-11-17 18:17:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 0, 1, 'p', 'CONTA FIXA 2', '2021-05-17', 33.33, 'v', 0, 's', 'n', '2020-11-17 18:17:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 0, 1, 'p', 'CONTA FIXA 2', '2021-06-17', 33.33, 'v', 0, 's', 'n', '2020-11-17 18:17:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 0, 1, 'p', 'CONTA FIXA 2', '2021-07-17', 33.33, 'v', 0, 's', 'n', '2020-11-17 18:17:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 0, 1, 'p', 'CONTA FIXA 2', '2021-08-17', 33.33, 'v', 0, 's', 'n', '2020-11-17 18:17:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 0, 1, 'p', 'CONTA FIXA 2', '2021-09-17', 33.33, 'v', 0, 's', 'n', '2020-11-17 18:17:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 0, 1, 'p', 'CONTA FIXA 2', '2021-10-17', 33.33, 'v', 0, 's', 'n', '2020-11-17 18:17:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 0, 1, 'p', 'CONTA PARCELADA (1 de 3)', '2020-11-19', 44.44, 'p', 3, NULL, 'n', '2020-11-17 18:18:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 0, 1, 'p', 'CONTA PARCELADA (2 de 3)', '2020-12-17', 44.44, 'p', 3, NULL, 'n', '2020-11-17 18:18:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 0, 1, 'p', 'CONTA PARCELADA (3 de 3)', '2021-01-17', 44.44, 'p', 3, NULL, 'n', '2020-11-17 18:18:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 0, 1, 'r', 'A RECEBER', '2020-11-11', 60, ' ', 0, 'n', 'n', '2020-11-17 18:19:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 0, 1, 'p', 'TESTE FIXO', '2021-01-23', 49.99, 'v', 0, 's', 'n', '2020-11-23 11:45:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 0, 1, 'p', 'TESTE FIXO', '2021-02-23', 49.99, 'v', 0, 's', 'n', '2020-11-23 11:45:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 0, 1, 'p', 'TESTE FIXO', '2021-03-23', 49.99, 'v', 0, 's', 'n', '2020-11-23 11:45:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 0, 1, 'p', 'TESTE FIXO', '2021-04-23', 49.99, 'v', 0, 's', 'n', '2020-11-23 11:45:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 0, 1, 'p', 'TESTE FIXO', '2021-05-23', 49.99, 'v', 0, 's', 'n', '2020-11-23 11:45:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 0, 1, 'p', 'TESTE FIXO', '2021-06-23', 49.99, 'v', 0, 's', 'n', '2020-11-23 11:45:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 0, 1, 'p', 'TESTE FIXO', '2021-07-23', 49.99, 'v', 0, 's', 'n', '2020-11-23 11:45:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 0, 1, 'p', 'TESTE FIXO', '2021-08-23', 49.99, 'v', 0, 's', 'n', '2020-11-23 11:45:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 0, 1, 'p', 'TESTE FIXO', '2021-09-23', 49.99, 'v', 0, 's', 'n', '2020-11-23 11:45:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 0, 1, 'p', 'TESTE FIXO', '2021-10-23', 49.99, 'v', 0, 's', 'n', '2020-11-23 11:45:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 0, 1, 'r', 'TESTE 5 ALTERADO', '2020-12-23', 52, 'v', 0, 's', 'n', '2020-11-23 15:32:08', '2020-11-23 16:56:37', '0000-00-00 00:00:00'),
(75, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-01-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-02-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-03-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-04-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-05-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-06-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-07-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-08-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-09-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-10-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 0, 1, 'r', 'TESTE 5 ALTERADO', '2020-12-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-01-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-02-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-03-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-04-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-05-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-06-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-07-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-08-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-09-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-10-23', 46, 'v', 0, 's', 'n', '2020-11-23 15:32:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 0, 1, 'r', 'TESTE 5 ALTERADO', '2020-12-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:04:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-01-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:04:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-02-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:04:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-03-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:04:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-04-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:04:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-05-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:04:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-06-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:04:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-07-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:04:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-08-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:04:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-09-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:04:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-10-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:04:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 0, 1, 'r', 'TESTE 5 ALTERADO', '2020-12-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:06:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-01-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:06:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-02-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:06:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-03-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:06:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-04-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:06:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-05-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:06:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-06-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:06:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-07-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:06:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-08-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:06:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-09-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:06:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 0, 1, 'r', 'TESTE 5 ALTERADO', '2021-10-23', 46, 'v', 0, 's', 'n', '2020-11-23 16:06:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 0, 9, 'p', 'TESTE', '2020-11-26', 33.33, 'v', 0, 'n', 'n', '2020-11-25 17:05:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `compras`
--

CREATE TABLE `compras` (
  `id_product` int(11) NOT NULL,
  `product` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `amount` int(11) NOT NULL,
  `total_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `compras`
--

INSERT INTO `compras` (`id_product`, `product`, `price`, `amount`, `total_price`) VALUES
(15, 'arroz', 9.21, 1, 9.21),
(16, 'desodorante', 8.79, 2, 17.58);

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
(1, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-09 18:54:16'),
(2, 1, 1, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-09 18:55:25'),
(3, 1, 2, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-09 18:55:25'),
(4, 1, 3, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-09 18:55:25'),
(5, 1, 4, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-09 18:55:25'),
(6, 1, 5, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-09 18:55:26'),
(7, 1, 6, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-09 18:55:26'),
(8, 1, 7, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-09 18:55:26'),
(9, 1, 8, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-09 18:55:26'),
(10, 1, 9, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-09 18:55:26'),
(11, 1, 10, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-09 18:55:26'),
(12, 1, 11, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-09 18:55:26'),
(13, 1, 12, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-09 18:55:26'),
(14, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-10 12:15:52'),
(15, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-10 14:34:56'),
(16, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/Logoff', 'Logoff', 5, '2020-11-10 14:51:25'),
(17, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-10 14:55:20'),
(18, 1, 1, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 15:31:56'),
(19, 1, 2, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 15:31:56'),
(20, 1, 3, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 15:31:56'),
(21, 1, 4, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 15:31:56'),
(22, 1, 5, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 15:31:56'),
(23, 1, 6, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 15:31:56'),
(24, 1, 7, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 15:31:56'),
(25, 1, 8, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 15:31:56'),
(26, 1, 9, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 15:31:56'),
(27, 1, 10, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 15:31:56'),
(28, 1, 11, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 15:31:56'),
(29, 1, 12, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 15:31:56'),
(30, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-10 16:40:48'),
(31, 1, 13, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:41:37'),
(32, 1, 14, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:41:37'),
(33, 1, 15, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:41:37'),
(34, 1, 16, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:41:37'),
(35, 1, 17, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:41:37'),
(36, 1, 18, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:42:03'),
(37, 1, 19, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:42:29'),
(38, 1, 20, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:42:29'),
(39, 1, 21, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:42:29'),
(40, 1, 22, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:42:29'),
(41, 1, 23, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:42:29'),
(42, 1, 24, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:42:29'),
(43, 1, 25, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:42:29'),
(44, 1, 26, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:42:29'),
(45, 1, 27, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:42:29'),
(46, 1, 28, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:42:29'),
(47, 1, 29, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:42:29'),
(48, 1, 30, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-10 16:42:29'),
(49, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-10 18:17:08'),
(50, 1, 0, '000.000.000.000', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Mobile Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-11 15:33:35'),
(51, 1, 0, '000.000.000.000', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Mobile Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-11 15:36:06'),
(52, 1, 0, '000.000.000.000', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Mobile Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-11 16:34:53'),
(53, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-12 11:53:30'),
(54, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-16 18:41:26'),
(55, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/Logoff', 'Logoff', 5, '2020-11-16 19:10:01'),
(56, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-17 18:12:48'),
(57, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-17 18:12:50'),
(58, 1, 31, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:15:22'),
(59, 1, 32, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:15:22'),
(60, 1, 33, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:15:22'),
(61, 1, 34, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:15:22'),
(62, 1, 35, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:15:22'),
(63, 1, 36, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:15:22'),
(64, 1, 37, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:15:22'),
(65, 1, 38, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:15:22'),
(66, 1, 39, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:15:22'),
(67, 1, 40, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:15:22'),
(68, 1, 41, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:15:22'),
(69, 1, 42, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:15:22'),
(70, 1, 43, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:17:13'),
(71, 1, 44, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:17:13'),
(72, 1, 45, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:17:13'),
(73, 1, 46, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:17:13'),
(74, 1, 47, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:17:13'),
(75, 1, 48, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:17:13'),
(76, 1, 49, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:17:13'),
(77, 1, 50, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:17:13'),
(78, 1, 51, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:17:13'),
(79, 1, 52, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:17:13'),
(80, 1, 53, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:17:13'),
(81, 1, 54, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:17:13'),
(82, 1, 55, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:18:10'),
(83, 1, 56, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:18:10'),
(84, 1, 57, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:18:10'),
(85, 1, 58, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:19:46'),
(86, 1, 59, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:20:17'),
(87, 1, 60, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-17 18:22:07'),
(88, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-17 19:08:09'),
(89, 1, 0, '000.000.000.000', 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Mobile Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-18 11:02:56'),
(90, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-18 12:17:01'),
(91, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-18 12:56:14'),
(92, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-18 14:39:50'),
(93, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-18 15:09:13'),
(94, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-18 16:20:37'),
(95, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-18 17:14:26'),
(96, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-18 18:30:35'),
(97, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-20 17:03:05'),
(98, NULL, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/AlterPass', 'AlterPass', 2, '2020-11-20 17:14:54'),
(99, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/Logoff', 'Logoff', 5, '2020-11-20 17:15:08'),
(100, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-20 17:15:16'),
(101, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-20 17:15:16'),
(102, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-20 17:54:30'),
(103, NULL, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/RegisterUser', 'AlterUser', 2, '2020-11-20 18:16:28'),
(104, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-23 09:41:16'),
(105, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/Logoff', 'Logoff', 5, '2020-11-23 09:43:59'),
(106, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-23 09:48:35'),
(107, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/Logoff', 'Logoff', 5, '2020-11-23 09:48:39'),
(108, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-23 09:49:32'),
(109, NULL, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/AlterPass', 'AlterPass', 2, '2020-11-23 09:49:49'),
(110, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-23 10:57:39'),
(111, 1, 61, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 11:45:58'),
(112, 1, 62, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 11:45:58'),
(113, 1, 63, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 11:45:58'),
(114, 1, 64, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 11:45:58'),
(115, 1, 65, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 11:45:58'),
(116, 1, 66, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 11:45:58'),
(117, 1, 67, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 11:45:58'),
(118, 1, 68, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 11:45:58'),
(119, 1, 69, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 11:45:58'),
(120, 1, 70, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 11:45:58'),
(121, 1, 71, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 11:45:58'),
(122, 1, 72, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 11:45:58'),
(123, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-23 12:09:36'),
(124, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-23 12:55:52'),
(125, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-23 14:22:23'),
(126, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-23 15:31:08'),
(127, 1, 73, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:08'),
(128, 1, 74, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:08'),
(129, 1, 75, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:08'),
(130, 1, 76, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:08'),
(131, 1, 77, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:08'),
(132, 1, 78, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:08'),
(133, 1, 79, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:08'),
(134, 1, 80, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:08'),
(135, 1, 81, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:08'),
(136, 1, 82, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:08'),
(137, 1, 83, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:08'),
(138, 1, 84, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:08'),
(139, 1, 85, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:20'),
(140, 1, 86, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:20'),
(141, 1, 87, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:20'),
(142, 1, 88, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:20'),
(143, 1, 89, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:20'),
(144, 1, 90, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:20'),
(145, 1, 91, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:20'),
(146, 1, 92, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:20'),
(147, 1, 93, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:20'),
(148, 1, 94, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:20'),
(149, 1, 95, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:20'),
(150, 1, 96, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 15:32:20'),
(151, 1, 97, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:04:03'),
(152, 1, 98, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:04:03'),
(153, 1, 99, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:04:03'),
(154, 1, 100, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:04:03'),
(155, 1, 101, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:04:03'),
(156, 1, 102, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:04:03'),
(157, 1, 103, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:04:03'),
(158, 1, 104, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:04:03'),
(159, 1, 105, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:04:03'),
(160, 1, 106, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:04:03'),
(161, 1, 107, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:04:03'),
(162, 1, 108, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:04:03'),
(163, 1, 109, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:06:26'),
(164, 1, 110, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:06:26'),
(165, 1, 111, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:06:26'),
(166, 1, 112, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:06:26'),
(167, 1, 113, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:06:26'),
(168, 1, 114, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:06:26'),
(169, 1, 115, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:06:26'),
(170, 1, 116, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:06:26'),
(171, 1, 117, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:06:26'),
(172, 1, 118, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:06:26'),
(173, 1, 119, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:06:26'),
(174, 1, 120, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-23 16:06:26'),
(175, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-23 16:13:16'),
(176, 1, 60, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2020-11-23 16:18:19'),
(177, 1, 60, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2020-11-23 16:22:59'),
(178, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-23 16:50:12'),
(179, 1, 74, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2020-11-23 16:56:37'),
(180, 1, 73, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2020-11-23 16:57:20'),
(181, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-24 11:44:26'),
(182, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/deleteAccount', 'deleteAccount', 3, '2020-11-24 12:49:21'),
(183, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-24 12:49:38'),
(184, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/deleteAccount', 'deleteAccount', 3, '2020-11-24 12:49:58'),
(185, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/deleteAccount', 'deleteAccount', 3, '2020-11-24 12:52:19'),
(186, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/deleteAccount', 'deleteAccount', 3, '2020-11-24 12:53:26'),
(187, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/deleteAccount', 'deleteAccount', 3, '2020-11-24 12:55:14'),
(188, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/deleteAccount', 'deleteAccount', 3, '2020-11-24 12:55:57'),
(189, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/deleteAccount', 'deleteAccount', 3, '2020-11-24 12:56:23'),
(190, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/deleteAccount', 'deleteAccount', 3, '2020-11-24 12:57:06'),
(191, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-24 14:56:13'),
(192, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-24 15:05:27'),
(193, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-24 15:07:20'),
(194, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/deleteAccount', 'deleteAccount', 3, '2020-11-24 15:07:35'),
(195, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/deleteAccount', 'deleteAccount', 3, '2020-11-24 15:07:48'),
(196, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-24 15:53:08'),
(197, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-24 17:05:53'),
(198, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-24 18:08:10'),
(199, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-11-24 18:31:21'),
(200, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-11-24 18:31:24'),
(201, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-11-24 18:31:25'),
(202, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-11-24 18:31:25'),
(203, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-11-24 18:31:34'),
(204, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-11-24 18:34:27'),
(205, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-11-24 18:42:11'),
(206, NULL, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/deleteUser', 'deleteUser', 3, '2020-11-24 19:02:50'),
(207, NULL, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/deleteUser', 'deleteUser', 3, '2020-11-24 19:02:56'),
(208, NULL, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/deleteUser', 'deleteUser', 3, '2020-11-24 19:03:01'),
(209, NULL, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/deleteUser', 'deleteUser', 3, '2020-11-24 19:03:06'),
(210, NULL, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/deleteUser', 'deleteUser', 3, '2020-11-24 19:03:13'),
(211, 1, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-11-24 19:03:52'),
(212, NULL, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/deleteUser', 'deleteUser', 3, '2020-11-24 19:04:02'),
(213, NULL, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/deleteUser', 'deleteUser', 3, '2020-11-24 19:04:13'),
(214, NULL, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/deleteUser', 'deleteUser', 3, '2020-11-24 19:04:20'),
(215, 9, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-11-25 16:47:40'),
(216, 9, 121, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-11-25 17:05:50'),
(217, 9, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2020-12-04 10:39:45'),
(218, 9, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-12-04 10:40:11'),
(219, 9, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-12-04 10:40:43'),
(220, NULL, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/deleteUser', 'deleteUser', 3, '2020-12-04 10:41:00'),
(221, 9, 0, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-12-04 10:42:25');

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
(10, 'TESTE2', '222.222.222-22', '2020-12-09', 'teste@teste.com.br', NULL, 'teste', '87911694684a088ab00e56b89bed2459'),
(11, 'TESTE3', '444.444.444-44', '1211-11-23', 'teste3@teste.com', NULL, 'teste3', '0bc31e4982f3145cad9e077532f2dbbe'),
(12, 'RAPHAEL AUGUSTO ALMEIDA PEREIRA', '023.486.491-52', '1989-06-08', 'raphael.a.a.p@gmail.com', NULL, 'system', '18c6d818ae35a3e8279b5330eda01498');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id_account`);

--
-- Índices de tabela `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_product`);

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
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT de tabela `compras`
--
ALTER TABLE `compras`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `logs`
--
ALTER TABLE `logs`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
