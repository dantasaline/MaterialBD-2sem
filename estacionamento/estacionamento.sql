-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/09/2024 às 00:32
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `estacionamento`
--
CREATE DATABASE IF NOT EXISTS `estacionamento` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `estacionamento`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `andar`
--

CREATE TABLE `andar` (
  `codLugar` int(11) NOT NULL,
  `capacidade` int(11) DEFAULT NULL,
  `andar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `andar`
--

INSERT INTO `andar` (`codLugar`, `capacidade`, `andar`) VALUES
(1, 100, 'Primeiro Andar'),
(2, 150, 'Segundo Andar'),
(3, 200, 'Terceiro Andar'),
(4, 120, 'Quarto Andar'),
(5, 180, 'Quinto Andar'),
(6, 100, 'Sexto Andar'),
(7, 150, 'Sétimo Andar'),
(8, 200, 'Oitavo Andar');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cpf` varchar(255) NOT NULL,
  `dtnasc` date DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cpf`, `dtnasc`, `nome`) VALUES
('012.345.678-10', '1995-08-30', 'Lucas Rodrigues'),
('012.345.678-99', '1975-01-29', 'Ricardo Souza'),
('123.456.789-00', '1980-05-15', 'Ana Silva'),
('123.456.789-01', '1983-03-12', 'João Pereira'),
('234.567.890-11', '1992-08-22', 'Carlos Oliveira'),
('234.567.890-12', '1990-07-21', 'Mariana Costa'),
('345.678.901-22', '1985-12-30', 'Maria Santos'),
('345.678.901-23', '1979-11-30', 'Roberta Lima'),
('456.789.012-33', '2000-02-19', 'Pedro Costa'),
('456.789.012-34', '1987-06-04', 'Miguel Almeida'),
('567.890.123-44', '1995-11-07', 'Juliana Almeida'),
('567.890.123-45', '2001-01-19', 'Sofia Martins'),
('678.901.234-55', '1978-07-25', 'Roberto Lima'),
('678.901.234-56', '1994-05-25', 'Felipe Oliveira'),
('789.012.345-66', '1990-03-10', 'Fernanda Pereira'),
('789.012.345-67', '1988-09-16', 'Juliana Souza'),
('890.123.456-77', '1988-09-17', 'Thiago Martins'),
('890.123.456-78', '1999-12-09', 'Gustavo Santos'),
('901.234.567-88', '2002-06-04', 'Larissa Carvalho'),
('901.234.567-89', '1982-10-14', 'Camila Silva');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estaciona`
--

CREATE TABLE `estaciona` (
  `codestaciona` int(11) NOT NULL,
  `horSaida` datetime DEFAULT NULL,
  `dtEntrada` date DEFAULT NULL,
  `hrEntrada` datetime DEFAULT NULL,
  `dtSaida` date DEFAULT NULL,
  `placa` varchar(255) DEFAULT NULL,
  `codLugar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `estaciona`
--

INSERT INTO `estaciona` (`codestaciona`, `horSaida`, `dtEntrada`, `hrEntrada`, `dtSaida`, `placa`, `codLugar`) VALUES
(1, '2024-09-10 15:30:00', '2024-09-10', '2024-09-10 08:00:00', '2024-09-10', 'ABC1234', 1),
(2, '2024-09-11 16:00:00', '2024-09-11', '2024-09-11 09:15:00', '2024-09-11', 'XYZ5678', 2),
(3, '2024-09-12 14:45:00', '2024-09-12', '2024-09-12 10:30:00', '2024-09-12', 'LMN9012', 3),
(4, '2024-09-13 18:00:00', '2024-09-13', '2024-09-13 11:00:00', '2024-09-13', 'PQR3456', 4),
(5, '2024-09-14 20:30:00', '2024-09-14', '2024-09-14 12:00:00', '2024-09-14', 'STU7890', 5),
(6, '2024-09-15 16:45:00', '2024-09-15', '2024-09-15 13:30:00', '2024-09-15', 'GHI1234', 6),
(7, '2024-09-16 19:00:00', '2024-09-16', '2024-09-16 14:00:00', '2024-09-16', 'JKL5678', 7),
(8, '2024-09-17 15:15:00', '2024-09-17', '2024-09-17 15:00:00', '2024-09-17', 'MNO9012', 8),
(9, '2024-09-18 17:30:00', '2024-09-18', '2024-09-18 16:00:00', '2024-09-18', 'RST3456', 1),
(10, '2024-09-19 18:45:00', '2024-09-19', '2024-09-19 17:30:00', '2024-09-19', 'UVW7890', 2),
(11, '2024-09-20 21:00:00', '2024-09-20', '2024-09-20 18:00:00', '2024-09-20', 'DEF1234', 3),
(12, '2024-09-21 16:30:00', '2024-09-21', '2024-09-21 19:00:00', '2024-09-21', 'VWX5678', 4),
(13, '2024-09-22 14:15:00', '2024-09-22', '2024-09-22 08:30:00', '2024-09-22', 'YZA9012', 5),
(14, '2024-09-23 17:00:00', '2024-09-23', '2024-09-23 10:45:00', '2024-09-23', 'BCD3456', 6),
(15, '2024-09-24 18:30:00', '2024-09-24', '2024-09-24 12:15:00', '2024-09-24', 'EFG7890', 7),
(16, '2024-09-25 15:00:00', '2024-09-25', '2024-09-25 13:00:00', '2024-09-25', 'HIJ1234', 8),
(17, '2024-09-26 19:15:00', '2024-09-26', '2024-09-26 14:30:00', '2024-09-26', 'KLM5678', 1),
(18, '2024-09-27 20:00:00', '2024-09-27', '2024-09-27 15:00:00', '2024-09-27', 'NOP9012', 2),
(19, '2024-09-28 16:30:00', '2024-09-28', '2024-09-28 16:30:00', '2024-09-28', 'QRS3456', 3),
(20, '2024-09-29 17:45:00', '2024-09-29', '2024-09-29 18:00:00', '2024-09-29', 'TUV7890', 4),
(21, '2024-09-30 15:30:00', '2024-09-30', '2024-09-30 09:00:00', '2024-09-30', 'ABC1234', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `modelo`
--

CREATE TABLE `modelo` (
  `codModelo` int(11) NOT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `modelo`
--

INSERT INTO `modelo` (`codModelo`, `modelo`, `descricao`) VALUES
(1, 'Fusca', 'Fusca Clássico'),
(2, 'Civic', 'Honda Civic 0.7'),
(3, 'Corolla', 'Toyota Corolla 1.6'),
(4, 'Onix', 'Chevrolet Onix LT'),
(5, 'Hilux', 'Toyota Hilux 4x4'),
(6, 'Celta', 'Chevrolet Celta Spirit'),
(7, 'Kwid', 'Renault Kwid Zen'),
(8, 'Fox', 'Volkswagen Fox Connect'),
(9, 'Palio', 'Fiat Palio Attractive'),
(10, 'Uno', 'Fiat Uno Way'),
(11, 'Siena', 'Fiat Siena 1.4'),
(12, 'Polo', 'Volkswagen Polo Highline'),
(13, 'Argo', 'Fiat Argo Drive'),
(14, 'Renegade', 'Jeep Renegade Sport'),
(15, 'Compass', 'Jeep Compass Longitude'),
(16, 'Jetta', 'Volkswagen Jetta Comfortline'),
(17, 'Toro', 'Fiat Toro 1.8'),
(18, 'HR-V', 'Honda HR-V EX'),
(19, 'Tracker', 'Chevrolet Tracker Premier'),
(20, 'Ka', 'Ford Ka SE');

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `placa` varchar(255) NOT NULL,
  `cor` varchar(255) DEFAULT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `codModelo` int(11) DEFAULT NULL,
  `ano` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `veiculo`
--

INSERT INTO `veiculo` (`placa`, `cor`, `cpf`, `codModelo`, `ano`) VALUES
('ABC1234', 'Preto', '123.456.789-00', 1, '1998'),
('BCD3456', 'Preto', '456.789.012-33', 2, '2001'),
('DEF1234', 'Branco', '123.456.789-00', 3, '1995'),
('EFG7890', 'Cinza', '567.890.123-44', 5, '2010'),
('GHI1234', 'Preto', '678.901.234-55', 4, '2003'),
('HIJ1234', 'Verde', '678.901.234-55', 6, '2002'),
('JKL5678', 'Cinza', '789.012.345-66', 7, '2005'),
('KLM5678', 'Amarelo', '789.012.345-66', 8, '1999'),
('LMN9012', 'Vermelho', '345.678.901-22', 9, '2011'),
('MNO9012', 'Verde', '890.123.456-77', 10, '2013'),
('NOP9012', 'Branco', '890.123.456-77', 11, '1996'),
('PQR3456', 'Azul', '456.789.012-33', 14, '2023'),
('QRS3456', 'Azul', '901.234.567-88', 13, '2004'),
('RST3456', 'Amarelo', '901.234.567-88', 16, '1997'),
('STU7890', 'Prata', '567.890.123-44', 17, '2002'),
('TUV7890', 'Vermelho', '012.345.678-99', 12, '2000'),
('UVW7890', 'Azul', '012.345.678-99', 18, '2006'),
('VWX5678', 'Vermelho', '234.567.890-11', 15, '2012'),
('XYZ5678', 'Branco', '234.567.890-11', 19, '2021'),
('YZA9012', 'Prata', '345.678.901-22', 20, '1999');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `andar`
--
ALTER TABLE `andar`
  ADD PRIMARY KEY (`codLugar`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `estaciona`
--
ALTER TABLE `estaciona`
  ADD PRIMARY KEY (`codestaciona`),
  ADD KEY `placa` (`placa`),
  ADD KEY `codLugar` (`codLugar`);

--
-- Índices de tabela `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`codModelo`);

--
-- Índices de tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `cpf` (`cpf`),
  ADD KEY `codModelo` (`codModelo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `andar`
--
ALTER TABLE `andar`
  MODIFY `codLugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `estaciona`
--
ALTER TABLE `estaciona`
  MODIFY `codestaciona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `modelo`
--
ALTER TABLE `modelo`
  MODIFY `codModelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `estaciona`
--
ALTER TABLE `estaciona`
  ADD CONSTRAINT `estaciona_ibfk_1` FOREIGN KEY (`placa`) REFERENCES `veiculo` (`placa`),
  ADD CONSTRAINT `estaciona_ibfk_2` FOREIGN KEY (`codLugar`) REFERENCES `andar` (`codLugar`);

--
-- Restrições para tabelas `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `cliente` (`cpf`),
  ADD CONSTRAINT `veiculo_ibfk_2` FOREIGN KEY (`codModelo`) REFERENCES `modelo` (`codModelo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
