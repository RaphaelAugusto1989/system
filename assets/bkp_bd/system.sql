-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Out-2020 às 03:16
-- Versão do servidor: 10.4.13-MariaDB
-- versão do PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Estrutura da tabela `accounts`
--

CREATE TABLE `accounts` (
  `id_account` int(11) NOT NULL,
  `tipo_conta` varchar(1) DEFAULT NULL,
  `nome_conta` varchar(200) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `valor_conta` float DEFAULT NULL,
  `tipo_parcela` varchar(1) DEFAULT NULL,
  `parcelamento` int(11) DEFAULT NULL,
  `conta_fixa` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`id_account`, `tipo_conta`, `nome_conta`, `data_vencimento`, `valor_conta`, `tipo_parcela`, `parcelamento`, `conta_fixa`) VALUES
(1, 'p', '2020-10-23', '0000-00-00', 50, 'p', 2, ''),
(2, 'r', '2020-11-10', '0000-00-00', 3, '', 0, 's'),
(3, 'r', '2020-11-10', '0000-00-00', 3, '', 0, 's'),
(4, 'r', '2020-11-10', '0000-00-00', 3, '', 0, 's'),
(5, 'r', '2020-10-12', '0000-00-00', 500, '', 0, 'n'),
(6, 'r', '2020-10-12', '0000-00-00', 250, '', 0, 'n'),
(7, 'r', '2020-10-21', '0000-00-00', 1, '', 0, 'n'),
(8, 'r', '2020-10-22', '0000-00-00', 10, '', 0, 'n'),
(9, 'r', '2020-10-12', '0000-00-00', 444, '', 0, 'n'),
(10, 'r', '2020-10-07', '0000-00-00', 234, '', 0, 'n'),
(11, 'p', '2020-10-23', '0000-00-00', 542, 'v', 0, ''),
(12, 'p', '2020-10-14', '0000-00-00', 54, 'v', 0, ''),
(13, 'r', '2020-11-10', '0000-00-00', 4, '', 0, 's'),
(14, 'r', 'SALARIO', '2020-11-10', 4, '', 0, 's'),
(15, 'p', 'NET', '2020-11-10', 99, 'p', 12, ''),
(16, 'r', 'TESTET', '2020-10-21', 500, '', 0, 'n'),
(17, 'r', 'TESTET', '2020-10-21', 3928, '', 0, 'n');

-- --------------------------------------------------------

--
-- Estrutura da tabela `logs`
--

CREATE TABLE `logs` (
  `id_log` int(11) NOT NULL,
  `id_user_fk` int(11) DEFAULT NULL,
  `ip_user` varchar(15) DEFAULT NULL,
  `browser_user` varchar(300) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `page` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `logs`
--

INSERT INTO `logs` (`id_log`, `id_user_fk`, `ip_user`, `browser_user`, `url`, `page`, `type`, `datetime`) VALUES
(2, 1, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/index.php/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-24 18:18:41'),
(3, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-25 19:37:16'),
(4, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 19:56:17'),
(5, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 21:13:39'),
(6, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 21:13:49'),
(7, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 21:18:44'),
(8, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 21:20:09'),
(9, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 21:21:54'),
(10, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 21:29:46'),
(11, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 21:57:19'),
(12, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 22:02:38'),
(13, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 22:07:08'),
(14, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 22:09:23'),
(15, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 22:12:09'),
(16, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 23:08:24'),
(17, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 23:09:29'),
(18, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 23:10:58'),
(19, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 23:12:04'),
(20, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 23:18:54'),
(21, 1, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-26 23:19:01'),
(22, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/AlterPass', 'RegisterUser', 2, '2020-10-10 21:43:57'),
(23, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Contas/RegisterAccount', 'InsertAccount', 1, '2020-10-11 00:17:24'),
(24, NULL, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-10-11 22:41:56'),
(25, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-10-11 23:01:50'),
(26, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterUser', 2, '2020-10-11 23:10:16'),
(27, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-10-11 23:29:46'),
(28, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-10-11 23:31:19'),
(29, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-10-11 23:32:41'),
(30, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-10-11 23:34:42'),
(31, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-10-11 23:35:33'),
(32, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-10-11 23:36:23'),
(33, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-10-11 23:38:32'),
(34, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-10-11 23:48:02'),
(35, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-10-11 23:50:16'),
(36, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-10-11 23:53:37'),
(37, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-10-11 23:56:00'),
(38, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-10-11 23:56:53'),
(39, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-10-12 00:08:29'),
(40, 4, '000.000.000.000', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', '/system/Contas/RegisterAccount', 'RegisterAccount', 1, '2020-10-12 00:33:23');

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
(4, 'ADMINISTRADOR DO SISTEMA', '999.999.999-99', '1989-06-08', 'suporte@artspeck.com.br', NULL, 'admin', '18c6d818ae35a3e8279b5330eda01498'),
(5, 'RAPHAEL AUGUSTO ALMEIDA PEREIRA', '023.486.491-52', '1989-06-08', 'raphael.a.a.p@gmail.com', NULL, 'raphael', 'af79a8227f6f020dac98afce2a06d061'),
(6, 'TESTE1', '888.888.888-88', '2020-09-02', 'teste@teste.com.br', NULL, 'teste', 'af79a8227f6f020dac98afce2a06d061'),
(7, 'TESTE', '000.000.000-00', '2020-09-01', 'teste@gmail.com', NULL, 'teste', '6e78dd994e528529ee43f4172e9e633c'),
(8, 'TESTE', '000.000.000-00', '2020-09-01', 'teste@gmail.com', NULL, 'teste', '6e78dd994e528529ee43f4172e9e633c'),
(9, 'TESTE3', '777.777.777-77', '2020-09-03', 'teste3@teste.com', NULL, 'teste', 'af79a8227f6f020dac98afce2a06d061'),
(10, 'TESTE4', '777.777.777-77', '2020-09-03', 'teste3@teste.com', NULL, 'teste', 'af79a8227f6f020dac98afce2a06d061'),
(11, 'ASDASD', '222.222.222-22', '2020-09-03', 'edwrwer@tewrwer', NULL, 'werwerwe', '1adbd1ae0658a0f0cdb12f743c67ea76'),
(12, 'TWERTERTER', '222.222.222-22', '2020-09-09', 'teste@tesadasd', NULL, 'asdasdasd', 'f60e6e7404e4d5f360cbd2e169f9f648'),
(13, 'EWRWERWER', '333.333.333-33', '2020-09-01', 'dsfsdfsdfdf', NULL, 'sdfdsfsdfdf', '19fbfe6e3878f068dca639b80506a943'),
(14, 'TEETWETWET', '555.555.555-55', '2020-09-03', 'teste@teste2', NULL, 'teste', '0161bfcb0e6ab56713152c22c9658903'),
(15, 'ASADASDADASD', '000.000.000-00', '2020-09-08', 'sasdasd@sdfsdfsdf', NULL, 'dfsdfdfsfsdf', '0c27ef46859dc5960a7d7e4056d1bdff'),
(16, 'ASDASDASDASDASD', '023.486.491-52', '2020-09-09', 'teste@teste.com', NULL, 'testeeee', '85dd5beb55582ef65558e93281320cc4'),
(17, 'RWERWEREWR', '333.333.333-33', '2020-09-15', 'teste@teste222', NULL, 'dfsdfsdfdsfdsf', '05d76eb19813f0cf7f7a5178cd91d48d'),
(18, 'TESTE', '333.333.333-33', '2020-09-15', 'teste@teste', NULL, 'teste', '42106987b1bcd9f82785972b314c15ca'),
(19, 'ASDDASDASDASD', '666.666.666-66', '2020-09-14', 'teste@teste', NULL, 'teste', 'dae7154379cedec104616fbf9727c517'),
(20, 'TESTE', '234.234.234-23', '2020-09-23', 'teste@teste', NULL, 'asdasdasd', '3128207e9dc8d8cd825906e1d8e53a59'),
(21, 'ERWERWEREWRWE', '111.111.111-11', '2020-09-08', 'teste@teste', NULL, 'wqeqwewqeqwe', '612bad3967dcdbbf565d52321dc40c3d'),
(22, 'TESTE33', '333.333.333-33', '0000-00-00', 'teste@teste', NULL, 'teste33', 'ee090bf26d2196f8ec7ce615fdf2a685'),
(23, 'TESTE33', '333.333.333-33', '2020-09-26', 'teste@teste', NULL, 'teste33', 'ee090bf26d2196f8ec7ce615fdf2a685'),
(24, 'TESTE43', '777.777.777-77', '2020-10-01', 'teste43@gmail.com', NULL, 'teste43', '8688d127f1e2098e89154a2d0fb8f8b2'),
(25, 'TESTE99', '213.139.182-73', '2020-10-01', 'teste@teste', NULL, 'sdfsdfdsfsdf', 'fdf912843360cefd54bb7afdad10e8a2');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id_account`);

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
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `logs`
--
ALTER TABLE `logs`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
