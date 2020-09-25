-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 25/09/2020 às 14:35
-- Versão do servidor: 10.4.13-MariaDB
-- Versão do PHP: 7.4.8

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
-- Estrutura para tabela `contas`
--

CREATE TABLE `contas` (
  `id_account` int(11) NOT NULL,
  `tipo_conta` varchar(10) DEFAULT NULL,
  `nome_conta` varchar(200) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `valor_conta` decimal(10,0) DEFAULT NULL,
  `parcelamento_conta` int(11) DEFAULT NULL,
  `conta_fixa` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `logs`
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
-- Despejando dados para a tabela `logs`
--

INSERT INTO `logs` (`id_log`, `id_user_fk`, `ip_user`, `browser_user`, `url`, `page`, `type`, `datetime`) VALUES
(2, 1, '000.000.000.000', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36', '/system/index.php/Usuarios/RegisterUser', 'RegisterUser', 1, '2020-09-24 18:18:41');

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
  `login_user` varchar(20) DEFAULT NULL,
  `password_user` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id_user`, `name_user`, `cpf_user`, `nascimento_user`, `email_user`, `login_user`, `password_user`) VALUES
(4, 'ADMINISTRADOR DO SISTEMA', '999.999.999-99', '1989-06-08', 'suporte@artspeck.com.br', 'admin', '18c6d818ae35a3e8279b5330eda01498');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `contas`
--
ALTER TABLE `contas`
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
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `contas`
--
ALTER TABLE `contas`
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `logs`
--
ALTER TABLE `logs`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
