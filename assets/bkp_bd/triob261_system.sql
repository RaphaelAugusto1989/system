-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 17-Set-2021 às 14:44
-- Versão do servidor: 5.6.41-84.1
-- versão do PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `triob261_system`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts`
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
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`id_account`, `id_account_one`, `id_user_fk`, `tipo_conta`, `nome_conta`, `data_vencimento`, `valor_conta`, `tipo_parcela`, `parcelamento`, `conta_fixa`, `status`, `date_insert`, `date_update`, `date_delete`) VALUES
(134, 70204, 12, 'r', 'SALÁRIO', '2021-08-06', 3992.52, 'v', 0, 's', 's', '2021-08-24 19:02:04', '2021-08-26 11:41:33', '0000-00-00 00:00:00'),
(135, 70204, 12, 'r', 'SALÁRIO', '2021-09-07', 3992.52, 'v', 0, 's', 's', '2021-08-24 19:02:04', '2021-09-06 17:44:01', '0000-00-00 00:00:00'),
(136, 70204, 12, 'r', 'SALÁRIO', '2021-10-07', 3992.52, 'v', 0, 's', 'n', '2021-08-24 19:02:04', '2021-09-15 12:33:34', '0000-00-00 00:00:00'),
(137, 70204, 12, 'r', 'SALÁRIO', '2021-11-05', 4021.16, 'v', 0, 's', 'n', '2021-08-24 19:02:04', '2021-08-24 19:06:25', '0000-00-00 00:00:00'),
(138, 70204, 12, 'r', 'SALÁRIO', '2021-12-07', 4021.16, 'v', 0, 's', 'n', '2021-08-24 19:02:04', '2021-08-24 19:04:59', '0000-00-00 00:00:00'),
(139, 70204, 12, 'r', 'SALÁRIO', '2022-01-07', 4021.16, 'v', 0, 's', 'n', '2021-08-24 19:02:04', '2021-08-24 19:06:58', '0000-00-00 00:00:00'),
(140, 70204, 12, 'r', 'SALÁRIO', '2022-02-07', 4021.16, 'v', 0, 's', 'n', '2021-08-24 19:02:04', '2021-08-24 19:07:29', '0000-00-00 00:00:00'),
(141, 70204, 12, 'r', 'SALÁRIO', '2022-03-07', 4021.16, 'v', 0, 's', 'n', '2021-08-24 19:02:04', '2021-08-24 19:09:00', '0000-00-00 00:00:00'),
(142, 70204, 12, 'r', 'SALÁRIO', '2022-04-07', 4021.16, 'v', 0, 's', 'n', '2021-08-24 19:02:04', '2021-08-24 19:10:04', '0000-00-00 00:00:00'),
(143, 70204, 12, 'r', 'SALÁRIO', '2022-05-24', 4021.16, 'v', 0, 's', 'n', '2021-08-24 19:02:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 70204, 12, 'r', 'SALÁRIO', '2022-06-24', 4021.16, 'v', 0, 's', 'n', '2021-08-24 19:02:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 70204, 12, 'r', 'SALÁRIO', '2022-07-24', 4021.16, 'v', 0, 's', 'n', '2021-08-24 19:02:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 112832, 12, 'p', 'CONDOMINIO', '2021-08-10', 550, 'v', 0, 's', 's', '2021-08-26 11:28:32', '2021-08-26 11:40:28', '0000-00-00 00:00:00'),
(147, 112832, 12, 'p', 'CONDOMINIO', '2021-09-10', 621.05, 'v', 0, 's', 's', '2021-08-26 11:28:32', '2021-09-06 16:48:02', '0000-00-00 00:00:00'),
(148, 112832, 12, 'p', 'CONDOMINIO', '2021-10-08', 550, 'v', 0, 's', 'n', '2021-08-26 11:28:32', '2021-09-15 12:31:59', '0000-00-00 00:00:00'),
(149, 112832, 12, 'p', 'CONDOMINIO', '2021-11-26', 550, 'v', 0, 's', 'n', '2021-08-26 11:28:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 112832, 12, 'p', 'CONDOMINIO', '2021-12-26', 550, 'v', 0, 's', 'n', '2021-08-26 11:28:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 112832, 12, 'p', 'CONDOMINIO', '2022-01-26', 550, 'v', 0, 's', 'n', '2021-08-26 11:28:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 112832, 12, 'p', 'CONDOMINIO', '2022-02-26', 550, 'v', 0, 's', 'n', '2021-08-26 11:28:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 112832, 12, 'p', 'CONDOMINIO', '2022-03-26', 550, 'v', 0, 's', 'n', '2021-08-26 11:28:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 112832, 12, 'p', 'CONDOMINIO', '2022-04-26', 550, 'v', 0, 's', 'n', '2021-08-26 11:28:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 112832, 12, 'p', 'CONDOMINIO', '2022-05-26', 550, 'v', 0, 's', 'n', '2021-08-26 11:28:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 112832, 12, 'p', 'CONDOMINIO', '2022-06-26', 550, 'v', 0, 's', 'n', '2021-08-26 11:28:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 112832, 12, 'p', 'CONDOMINIO', '2022-07-26', 550, 'v', 0, 's', 'n', '2021-08-26 11:28:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 112854, 12, 'p', 'ALUGUEL', '2021-08-10', 1150, 'v', 0, 's', 's', '2021-08-26 11:28:54', '2021-08-26 11:40:31', '0000-00-00 00:00:00'),
(159, 112854, 12, 'p', 'ALUGUEL', '2021-09-10', 950, 'v', 0, 's', 's', '2021-08-26 11:28:54', '2021-09-06 17:43:25', '0000-00-00 00:00:00'),
(160, 112854, 12, 'p', 'ALUGUEL', '2021-10-11', 1150, 'v', 0, 's', 'n', '2021-08-26 11:28:54', '2021-09-15 12:28:51', '0000-00-00 00:00:00'),
(161, 112854, 12, 'p', 'ALUGUEL', '2021-11-26', 1150, 'v', 0, 's', 'n', '2021-08-26 11:28:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 112854, 12, 'p', 'ALUGUEL', '2021-12-26', 1150, 'v', 0, 's', 'n', '2021-08-26 11:28:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 112854, 12, 'p', 'ALUGUEL', '2022-01-26', 1150, 'v', 0, 's', 'n', '2021-08-26 11:28:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 112854, 12, 'p', 'ALUGUEL', '2022-02-26', 1150, 'v', 0, 's', 'n', '2021-08-26 11:28:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 112854, 12, 'p', 'ALUGUEL', '2022-03-26', 1150, 'v', 0, 's', 'n', '2021-08-26 11:28:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 112854, 12, 'p', 'ALUGUEL', '2022-04-26', 1150, 'v', 0, 's', 'n', '2021-08-26 11:28:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 112854, 12, 'p', 'ALUGUEL', '2022-05-26', 1150, 'v', 0, 's', 'n', '2021-08-26 11:28:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 112854, 12, 'p', 'ALUGUEL', '2022-06-26', 1150, 'v', 0, 's', 'n', '2021-08-26 11:28:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 112854, 12, 'p', 'ALUGUEL', '2022-07-26', 1150, 'v', 0, 's', 'n', '2021-08-26 11:28:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 113218, 12, 'p', 'CARTÃO PAN (1 de 10)', '2021-08-10', 268.6, 'p', 10, 'n', 's', '2021-08-26 11:32:18', '2021-08-26 11:40:37', '0000-00-00 00:00:00'),
(171, 113218, 12, 'p', 'CARTÃO PAN (2 de 10)', '2021-09-10', 268.6, 'p', 10, 'n', 's', '2021-08-26 11:32:18', '2021-09-09 15:04:25', '0000-00-00 00:00:00'),
(172, 113218, 12, 'p', 'CARTÃO PAN (3 de 10)', '2021-10-10', 268.6, 'p', 10, 'n', 'n', '2021-08-26 11:32:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 113218, 12, 'p', 'CARTÃO PAN (4 de 10)', '2021-11-10', 268.6, 'p', 10, 'n', 'n', '2021-08-26 11:32:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 113218, 12, 'p', 'CARTÃO PAN (5 de 10)', '2021-12-10', 268.6, 'p', 10, 'n', 'n', '2021-08-26 11:32:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 113218, 12, 'p', 'CARTÃO PAN (6 de 10)', '2022-01-10', 268.6, 'p', 10, 'n', 'n', '2021-08-26 11:32:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 113218, 12, 'p', 'CARTÃO PAN (7 de 10)', '2022-02-10', 268.6, 'p', 10, 'n', 'n', '2021-08-26 11:32:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 113218, 12, 'p', 'CARTÃO PAN (8 de 10)', '2022-03-10', 268.6, 'p', 10, 'n', 'n', '2021-08-26 11:32:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 113218, 12, 'p', 'CARTÃO PAN (9 de 10)', '2022-04-10', 268.6, 'p', 10, 'n', 'n', '2021-08-26 11:32:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 113218, 12, 'p', 'CARTÃO PAN (10 de 10)', '2022-05-10', 268.6, 'p', 10, 'n', 'n', '2021-08-26 11:32:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 113326, 12, 'p', 'CARTÃO CARREFOUR (1 de 10)', '2021-08-10', 453.99, 'p', 10, 'n', 's', '2021-08-26 11:33:26', '2021-08-26 11:40:40', '0000-00-00 00:00:00'),
(181, 113326, 12, 'p', 'CARTÃO CARREFOUR (2 de 10)', '2021-09-10', 453.99, 'p', 10, 'n', 's', '2021-08-26 11:33:26', '2021-09-09 15:04:13', '0000-00-00 00:00:00'),
(182, 113326, 12, 'p', 'CARTÃO CARREFOUR (3 de 10)', '2021-10-10', 453.99, 'p', 10, 'n', 'n', '2021-08-26 11:33:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 113326, 12, 'p', 'CARTÃO CARREFOUR (4 de 10)', '2021-11-10', 453.99, 'p', 10, 'n', 'n', '2021-08-26 11:33:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 113326, 12, 'p', 'CARTÃO CARREFOUR (5 de 10)', '2021-12-10', 453.99, 'p', 10, 'n', 'n', '2021-08-26 11:33:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 113326, 12, 'p', 'CARTÃO CARREFOUR (6 de 10)', '2022-01-10', 453.99, 'p', 10, 'n', 'n', '2021-08-26 11:33:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 113326, 12, 'p', 'CARTÃO CARREFOUR (7 de 10)', '2022-02-10', 453.99, 'p', 10, 'n', 'n', '2021-08-26 11:33:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 113326, 12, 'p', 'CARTÃO CARREFOUR (8 de 10)', '2022-03-10', 453.99, 'p', 10, 'n', 'n', '2021-08-26 11:33:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 113326, 12, 'p', 'CARTÃO CARREFOUR (9 de 10)', '2022-04-10', 453.99, 'p', 10, 'n', 'n', '2021-08-26 11:33:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 113326, 12, 'p', 'CARTÃO CARREFOUR (10 de 10)', '2022-05-10', 453.99, 'p', 10, 'n', 'n', '2021-08-26 11:33:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 113836, 12, 'p', 'EMPRESTIMO SANTANDER (1 de 4)', '2021-08-10', 1086, 'p', 4, 'n', 's', '2021-08-26 11:38:36', '2021-08-26 11:40:43', '0000-00-00 00:00:00'),
(191, 113836, 12, 'p', 'EMPRESTIMO SANTANDER (2 DE 4)', '2021-09-10', 1084.43, 'p', 4, 'n', 's', '2021-08-26 11:38:36', '2021-09-06 17:45:33', '0000-00-00 00:00:00'),
(192, 113836, 12, 'p', 'EMPRESTIMO SANTANDER (3 de 4)', '2021-10-10', 1086, 'p', 4, 'n', 'n', '2021-08-26 11:38:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 113836, 12, 'p', 'EMPRESTIMO SANTANDER (4 de 4)', '2021-11-10', 1086, 'p', 4, 'n', 'n', '2021-08-26 11:38:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 114240, 12, 'p', 'VALMIR', '2021-09-07', 85, 'v', 0, 'n', 's', '2021-08-26 11:42:40', '2021-09-06 18:21:12', '0000-00-00 00:00:00'),
(195, 114434, 12, 'p', 'CARTÃO INTER', '2021-09-10', 1276.43, 'v', 0, 'n', 'n', '2021-08-26 11:44:34', '2021-09-09 15:04:09', '0000-00-00 00:00:00'),
(196, 114831, 12, 'p', 'NUBANK CARLA', '2021-09-10', 340.78, 'v', 0, 'n', 's', '2021-08-26 11:48:31', '2021-09-09 15:04:20', '0000-00-00 00:00:00'),
(197, 115119, 12, 'r', 'ALUGUEL SALÃO DANI', '2021-09-10', 70.63, 'v', 0, 'n', 's', '2021-09-03 11:51:19', '2021-09-09 15:03:44', '0000-00-00 00:00:00'),
(198, 51425, 12, 'p', 'RIFA AER FRY', '2021-09-06', 20, 'v', 0, 'n', 's', '2021-09-06 17:14:25', '2021-09-06 17:39:07', '0000-00-00 00:00:00'),
(199, 22758, 12, 'p', 'LANCHE', '2021-09-08', 80, 'v', 0, 'n', 's', '2021-09-08 14:27:58', '2021-09-08 14:28:12', '0000-00-00 00:00:00'),
(200, 75737, 12, 'p', 'PAMONHA', '2021-09-08', 22, 'v', 0, 'n', 's', '2021-09-08 19:57:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `compras`
--

CREATE TABLE `compras` (
  `id_product` int(11) NOT NULL,
  `product` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `amount` int(11) NOT NULL,
  `total_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `compras`
--

INSERT INTO `compras` (`id_product`, `product`, `price`, `amount`, `total_price`) VALUES
(1, 'Arroz', 17.99, 1, 17.99),
(2, 'Feijão ', 5.79, 2, 11.58),
(3, 'Detergente ', 0, 0, 0),
(4, 'Sabão em. Pó ', 9.99, 1, 9.99),
(5, 'Macarrão ', 3.99, 3, 11.97),
(6, 'Molho de tomate', 1.19, 6, 7.14),
(7, 'Leite', 0, 0, 0),
(8, 'Desinfetante ', 3.99, 3, 11.97),
(9, 'Desodorante', 7.99, 2, 15.98),
(10, 'Azeite', 16.99, 2, 33.98),
(11, 'Óleo ', 0, 0, 0),
(12, 'Desodorante Carla ', 7.99, 2, 15.98),
(13, 'Veja ', 3.29, 2, 6.58),
(14, 'Feijão branco ', 5.99, 1, 5.99),
(15, 'Tapioca', 3.19, 3, 9.57),
(16, 'Pipoca caramelo', 4.39, 3, 13.17),
(17, 'Papel toalha', 3.99, 3, 11.97),
(18, 'Milho ', 1.99, 3, 5.97),
(19, 'Mabel', 4.99, 1, 4.99),
(20, 'Katchup', 4.39, 1, 4.39),
(21, 'Azeitona', 3.79, 3, 11.37),
(22, 'Biscoito', 3.59, 1, 3.59),
(23, 'Cereal', 7.79, 1, 7.79),
(24, 'Lasanha', 3.39, 1, 3.39),
(25, 'Miojo', 0.99, 6, 5.94),
(26, 'Batata palha ', 9.99, 1, 9.99),
(27, 'Condensado ', 5.99, 2, 11.98),
(28, 'Creme de leite ', 2.99, 6, 17.94),
(29, 'Pão de queijo ', 6.99, 3, 20.97),
(30, 'Costela', 18.62, 1, 18.62),
(31, 'Linguiça de frango', 13.49, 1, 13.49),
(32, 'Danone ', 9.99, 1, 9.99);

-- --------------------------------------------------------

--
-- Estrutura da tabela `logs`
--

CREATE TABLE `logs` (
  `id_log` int(11) NOT NULL,
  `id_user_fk` int(11) DEFAULT NULL,
  `id_module` int(11) DEFAULT NULL,
  `ip_user` varchar(15) DEFAULT NULL,
  `browser_user` varchar(300) DEFAULT NULL,
  `url` text,
  `page` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `date_insert` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `logs`
--

INSERT INTO `logs` (`id_log`, `id_user_fk`, `id_module`, `ip_user`, `browser_user`, `url`, `page`, `type`, `date_insert`) VALUES
(233, 12, 0, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-08-24 18:45:46'),
(234, 12, 122, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 18:49:11'),
(235, 12, 123, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 18:49:11'),
(236, 12, 124, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 18:49:11'),
(237, 12, 125, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 18:49:11'),
(238, 12, 126, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 18:49:11'),
(239, 12, 127, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 18:49:11'),
(240, 12, 128, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 18:49:11'),
(241, 12, 129, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 18:49:11'),
(242, 12, 130, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 18:49:11'),
(243, 12, 131, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 18:49:11'),
(244, 12, 132, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 18:49:11'),
(245, 12, 133, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 18:49:11'),
(246, 12, 0, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/deleteAllAccount', 'deleteAccount', 3, '2021-08-24 18:49:52'),
(247, 12, 0, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-08-24 19:01:02'),
(248, 12, 134, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 19:02:04'),
(249, 12, 135, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 19:02:04'),
(250, 12, 136, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 19:02:04'),
(251, 12, 137, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 19:02:04'),
(252, 12, 138, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 19:02:04'),
(253, 12, 139, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 19:02:04'),
(254, 12, 140, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 19:02:04'),
(255, 12, 141, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 19:02:04'),
(256, 12, 142, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 19:02:04'),
(257, 12, 143, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 19:02:04'),
(258, 12, 144, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 19:02:04'),
(259, 12, 145, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-24 19:02:04'),
(260, 12, 138, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-08-24 19:04:59'),
(261, 12, 135, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-08-24 19:05:31'),
(262, 12, 136, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-08-24 19:05:58'),
(263, 12, 137, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-08-24 19:06:25'),
(264, 12, 139, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-08-24 19:06:58'),
(265, 12, 140, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-08-24 19:07:29'),
(266, 12, 141, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-08-24 19:08:17'),
(267, 12, 141, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-08-24 19:09:00'),
(268, 12, 142, '177.43.145.226', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-08-24 19:10:04'),
(269, 12, 0, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-08-26 11:27:29'),
(270, 12, 134, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-08-26 11:27:39'),
(271, 12, 146, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:32'),
(272, 12, 147, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:32'),
(273, 12, 148, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:32'),
(274, 12, 149, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:32'),
(275, 12, 150, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:32'),
(276, 12, 151, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:32'),
(277, 12, 152, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:32'),
(278, 12, 153, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:32'),
(279, 12, 154, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:32'),
(280, 12, 155, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:32'),
(281, 12, 156, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:32'),
(282, 12, 157, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:32'),
(283, 12, 158, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:54'),
(284, 12, 159, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:54'),
(285, 12, 160, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:54'),
(286, 12, 161, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:54'),
(287, 12, 162, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:54'),
(288, 12, 163, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:54'),
(289, 12, 164, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:54'),
(290, 12, 165, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:54'),
(291, 12, 166, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:54'),
(292, 12, 167, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:54'),
(293, 12, 168, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:54'),
(294, 12, 169, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:28:54'),
(295, 12, 170, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:32:18'),
(296, 12, 171, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:32:18'),
(297, 12, 172, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:32:18'),
(298, 12, 173, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:32:18'),
(299, 12, 174, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:32:18'),
(300, 12, 175, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:32:18'),
(301, 12, 176, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:32:18'),
(302, 12, 177, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:32:18'),
(303, 12, 178, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:32:18'),
(304, 12, 179, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:32:18'),
(305, 12, 180, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:33:26'),
(306, 12, 181, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:33:26'),
(307, 12, 182, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:33:26'),
(308, 12, 183, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:33:26'),
(309, 12, 184, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:33:26'),
(310, 12, 185, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:33:26'),
(311, 12, 186, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:33:26'),
(312, 12, 187, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:33:26'),
(313, 12, 188, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:33:26'),
(314, 12, 189, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:33:26'),
(315, 12, 190, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:38:36'),
(316, 12, 191, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:38:36'),
(317, 12, 192, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:38:36'),
(318, 12, 193, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:38:36'),
(319, 12, 146, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-08-26 11:40:28'),
(320, 12, 158, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-08-26 11:40:31'),
(321, 12, 170, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-08-26 11:40:37'),
(322, 12, 180, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-08-26 11:40:40'),
(323, 12, 190, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-08-26 11:40:43'),
(324, 12, 134, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-08-26 11:41:33'),
(325, 12, 194, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:42:40'),
(326, 12, 195, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:44:34'),
(327, 12, 196, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-08-26 11:48:31'),
(328, 12, 0, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-08-26 15:43:11'),
(329, 12, 0, '177.133.51.223', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-09-02 08:06:58'),
(330, 12, 147, '177.133.51.223', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-09-02 08:09:21'),
(331, 12, 159, '177.133.51.223', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-09-02 08:09:36'),
(332, 12, 0, '177.133.51.223', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-09-02 08:43:50'),
(333, 12, 195, '177.133.51.223', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-09-02 08:44:30'),
(334, 12, 0, '177.133.51.223', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-09-02 10:16:43'),
(335, 12, 0, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-09-03 11:24:58'),
(336, 12, 197, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-09-03 11:51:19'),
(337, 12, 0, '177.133.51.223', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-09-06 09:35:53'),
(338, 12, 159, '177.133.51.223', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-09-06 09:37:17'),
(339, 12, 147, '177.133.51.223', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-09-06 09:38:38'),
(340, 12, 147, '177.133.51.223', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-09-06 09:39:15'),
(341, 12, 0, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-09-06 12:12:58'),
(342, 12, 135, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-09-06 12:13:28'),
(343, 12, 0, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-09-06 16:03:08'),
(344, 12, 191, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-09-06 16:06:12'),
(345, 12, 0, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-09-06 16:47:26'),
(346, 12, 147, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-09-06 16:47:34'),
(347, 12, 147, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-09-06 16:48:02'),
(348, 12, 198, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-09-06 17:14:25'),
(349, 12, 0, '189.40.79.171', 'Mozilla/5.0 (Linux; Android 11; SM-G980F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-09-06 17:38:51'),
(350, 12, 198, '189.40.79.171', 'Mozilla/5.0 (Linux; Android 11; SM-G980F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-09-06 17:39:07'),
(351, 12, 159, '189.40.79.171', 'Mozilla/5.0 (Linux; Android 11; SM-G980F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-09-06 17:43:25'),
(352, 12, 135, '189.40.79.171', 'Mozilla/5.0 (Linux; Android 11; SM-G980F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-09-06 17:44:01'),
(353, 12, 191, '189.40.79.171', 'Mozilla/5.0 (Linux; Android 11; SM-G980F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-09-06 17:45:33'),
(354, 12, 0, '189.40.79.171', 'Mozilla/5.0 (Linux; Android 11; SM-G980F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-09-06 18:20:59'),
(355, 12, 194, '189.40.79.171', 'Mozilla/5.0 (Linux; Android 11; SM-G980F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-09-06 18:21:12'),
(356, 12, 0, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-09-06 19:49:35'),
(357, 12, 0, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-09-08 14:06:56'),
(358, 12, 0, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-09-08 14:08:26'),
(359, 12, 0, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-09-08 14:27:02'),
(360, 12, 199, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-09-08 14:27:58'),
(361, 12, 199, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-09-08 14:28:12'),
(362, 12, 0, '186.213.214.109', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-09-08 19:56:53'),
(363, 12, 200, '186.213.214.109', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2021-09-08 19:57:37'),
(364, 12, 0, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-09-09 15:02:40'),
(365, 12, 197, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-09-09 15:03:44'),
(366, 12, 195, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-09-09 15:04:00'),
(367, 12, 195, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-09-09 15:04:09'),
(368, 12, 181, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-09-09 15:04:13'),
(369, 12, 196, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-09-09 15:04:20'),
(370, 12, 171, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/system/Contas/AlterStatus', 'AlterStatus', 2, '2021-09-09 15:04:25'),
(371, 12, 0, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', '/system/Home/SignIn', 'SignIn', 4, '2021-09-15 12:26:30'),
(372, 12, 160, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-09-15 12:28:51'),
(373, 12, 148, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-09-15 12:29:10'),
(374, 12, 148, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-09-15 12:31:59'),
(375, 12, 136, '189.3.94.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', '/system/Contas/RegisterAccount', 'updateAccount', 2, '2021-09-15 12:33:34');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
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
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id_user`, `name_user`, `cpf_user`, `nascimento_user`, `email_user`, `img_user`, `login_user`, `password_user`) VALUES
(12, 'RAPHAEL AUGUSTO ALMEIDA PEREIRA', '023.486.491-52', '1989-06-08', 'raphael.a.a.p@gmail.com', NULL, 'system', '18c6d818ae35a3e8279b5330eda01498');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id_account`);

--
-- Índices para tabela `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_product`);

--
-- Índices para tabela `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id_log`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT de tabela `compras`
--
ALTER TABLE `compras`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `logs`
--
ALTER TABLE `logs`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=376;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
