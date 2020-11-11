-- phpMyAdmin SQL Dump
-- version 4.9.7deb1~bpo10+1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 09/11/2020 às 16:17
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
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `logs`
--
ALTER TABLE `logs`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
