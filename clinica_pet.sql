-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13/07/2022 às 02:39
-- Versão do servidor: 10.4.24-MariaDB
-- Versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clinica_pet`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `administrador`
--

CREATE TABLE `administrador` (
  `id_administrador` int(11) NOT NULL,
  `email_administrador` varchar(200) NOT NULL,
  `senha_administrador` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `administrador`
--

INSERT INTO `administrador` (`id_administrador`, `email_administrador`, `senha_administrador`) VALUES
(7, 'israel@gmail.com', '1234'),
(10, 'ronaldinho@gmail.com', '1010');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(150) NOT NULL,
  `email_cliente` varchar(200) NOT NULL,
  `cpf_cliente` varchar(14) NOT NULL,
  `telefone_cliente` varchar(17) NOT NULL,
  `endereco_cliente` varchar(300) NOT NULL,
  `data_cadastro_cliente` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome_cliente`, `email_cliente`, `cpf_cliente`, `telefone_cliente`, `endereco_cliente`, `data_cadastro_cliente`) VALUES
(7, 'ISRAEL', 'israel@hotmail.com', '12345678900', '22345678900', 'Rua boa visao', '2022-07-09 22:09:51'),
(10, 'BOY', 'boyl@gmail.com', '00114477', '77441100', 'la cucaratcha', '2022-07-12 12:57:41'),
(11, 'GIRL', 'girl@gmail.com', '45678912300', '00321987654', 'blabla bla', '2022-07-12 15:51:04');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pet`
--

CREATE TABLE `pet` (
  `id_pet` int(11) NOT NULL,
  `nome_pet` varchar(100) NOT NULL,
  `raca_pet` varchar(100) NOT NULL,
  `observacao_pet` varchar(300) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `data_cadastro_pet` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `pet`
--

INSERT INTO `pet` (`id_pet`, `nome_pet`, `raca_pet`, `observacao_pet`, `id_cliente`, `data_cadastro_pet`) VALUES
(7, 'Brutus', 'cachorro', 'muito velho', 7, '2022-07-10 13:57:19'),
(11, 'SNOW', 'Cachorro', 'Hiperativo', 10, '2022-07-12 12:57:59'),
(12, 'FLARA', 'Passaro', 'Não quer voar', 7, '2022-07-12 12:58:36'),
(14, 'PET', 'Hamster', 'Obesa', 11, '2022-07-12 21:15:27');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_administrador`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`id_pet`),
  ADD KEY `adcionar_pet` (`id_cliente`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_administrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `pet`
--
ALTER TABLE `pet`
  MODIFY `id_pet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `adcionar_pet` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
