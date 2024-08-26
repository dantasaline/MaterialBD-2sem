-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Ago-2024 às 14:04
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `imobiliaria`
--
CREATE DATABASE IF NOT EXISTS `imobiliaria` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `imobiliaria`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluguel`
--

CREATE TABLE `aluguel` (
  `codaluguel` int(11) NOT NULL,
  `datafim` date NOT NULL,
  `datainicio` date NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` float(7,2) NOT NULL,
  `vencimento` date NOT NULL,
  `idinquilino` int(11) DEFAULT NULL,
  `idcorretor` int(11) DEFAULT NULL,
  `idimovel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `aluguel`
--

INSERT INTO `aluguel` (`codaluguel`, `datafim`, `datainicio`, `descricao`, `valor`, `vencimento`, `idinquilino`, `idcorretor`, `idimovel`) VALUES
(1, '2024-12-31', '2024-01-01', 'Aluguel de apartamento no centro', 1200.89, '2024-05-01', 1, 1, 1),
(2, '2024-12-31', '2024-02-01', 'Aluguel de casa com piscina', 899.00, '2024-06-01', 2, 2, 2),
(3, '2024-12-31', '2024-03-01', 'Aluguel de cobertura duplex', 925.45, '2024-07-01', 3, 3, 3),
(4, '2024-12-31', '2024-04-01', 'Aluguel de sala comercial', 1789.79, '2024-08-01', 4, 4, 4),
(5, '2024-12-31', '2024-05-01', 'Aluguel de kitnet próximo à universidade', 3989.00, '2024-09-01', 5, 5, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `corretor`
--

CREATE TABLE `corretor` (
  `idcorretor` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `corretor`
--

INSERT INTO `corretor` (`idcorretor`, `email`, `telefone`, `nome`) VALUES
(1, 'joao.silva@gmail.com', '+55 11 98765-4321', 'João Silva'),
(2, 'maria.souza@email.com', '+55 21 91234-5678', 'Maria Souza'),
(3, 'pedro.lima@yahoo.com', '+55 31 99876-5432', 'Pedro Lima'),
(4, 'ana.carvalho@gmail.com', '+55 41 95555-1111', 'Ana Carvalho'),
(5, 'luan.pereira@gmail.com', '+55 51 94444-2222', 'Luan Pereira');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `idendereco` int(11) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `cep` varchar(255) NOT NULL,
  `numero` int(11) NOT NULL,
  `rua` varchar(255) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`idendereco`, `cidade`, `cep`, `numero`, `rua`, `bairro`, `complemento`, `estado`) VALUES
(1, 'São Paulo', '12345-678', 123, 'Avenida Paulista', 'Centro', 'G', 'SP'),
(2, 'Rio de Janeiro', '22222-123', 456, 'Praia de Copacabana', 'Copacabana', '', 'RJ'),
(3, 'Belo Horizonte', '40028-922', 789, 'Rua dos Tupinambás', 'Centro', 'E', 'MG'),
(4, 'Curitiba', '987654-321', 321, 'Rua XV de Novembro', 'Centro', 'F', 'PR'),
(5, 'Porto Alegre', '90000-666', 654, 'Avenida Ipiranga', 'Cidade Baixa', '', 'RS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fiador`
--

CREATE TABLE `fiador` (
  `idfiador` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `rg` varchar(255) DEFAULT NULL,
  `cpf` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `idendereco` int(11) DEFAULT NULL,
  `idinquilino` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `fiador`
--

INSERT INTO `fiador` (`idfiador`, `email`, `telefone`, `rg`, `cpf`, `nome`, `idendereco`, `idinquilino`) VALUES
(1, 'jose.santos@gmail.com', '+55 11 97654-3210', 'MG1234567', '123.456.789-00', 'José Santos', 3, 1),
(2, 'luana.oliveira@gmail.com', '+55 21 98765-4321', 'RJ2345678', '234.567.890-11', 'Luana Oliveira', 2, 2),
(3, 'marcos.pereira@ymail.com', '+55 31 99876-5432', 'MG3456789', '345.678.901-22', 'Marcos Pereira', 4, 3),
(4, 'beatriz.silva@email.com', '+55 41 95555-3333', 'PR4567890', '456.789.012-33', 'Beatriz Silva', 1, 4),
(5, 'carla.souza@yahoo.com', '+55 51 94444-4444', 'RS5678901', '567.890.123-44', 'Carla Souza', 5, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel`
--

CREATE TABLE `imovel` (
  `idimovel` int(11) NOT NULL,
  `disponivel` bit(1) NOT NULL,
  `quintal` varchar(255) NOT NULL,
  `suite` bit(1) NOT NULL,
  `nbanheiros` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `garagem` bit(1) NOT NULL,
  `lavanderia` bit(1) NOT NULL,
  `piscina` bit(1) NOT NULL,
  `comodos` int(11) NOT NULL,
  `idmidida` int(11) DEFAULT NULL,
  `idproprietario` int(11) DEFAULT NULL,
  `idendereco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `imovel`
--

INSERT INTO `imovel` (`idimovel`, `disponivel`, `quintal`, `suite`, `nbanheiros`, `tipo`, `garagem`, `lavanderia`, `piscina`, `comodos`, `idmidida`, `idproprietario`, `idendereco`) VALUES
(1, b'1', '1', b'1', 3, 'Apartamento', b'1', b'1', b'0', 4, 1, 1, 1),
(2, b'1', '1', b'0', 2, 'Casa', b'1', b'0', b'1', 3, 2, 2, 2),
(3, b'0', '1', b'1', 4, 'Cobertura', b'1', b'1', b'1', 5, 3, 3, 3),
(4, b'1', '0', b'0', 1, 'Sala Comercial', b'0', b'0', b'0', 4, 4, 4, 4),
(5, b'1', '1', b'1', 2, 'Kitnet', b'0', b'1', b'0', 7, 5, 5, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `inquilino`
--

CREATE TABLE `inquilino` (
  `idinquilino` int(11) NOT NULL,
  `rg` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `inquilino`
--

INSERT INTO `inquilino` (`idinquilino`, `rg`, `telefone`, `nome`, `email`, `cpf`) VALUES
(1, 'MG1234567', '(31) 99999-0001', 'Ana Silva', 'ana.silva@gmail.com', '123.456.789-00'),
(2, 'SP2345678', '(11) 98888-0002', 'Bruno Oliveira', 'bruno.oliveira@ymail.com', '234.567.890-11'),
(3, 'RJ3456789', '(21) 97777-0003', 'Clara Souza', 'clara.souza@email.com', '345.678.901-22'),
(4, 'RS4567890', '(51) 96666-0004', 'Daniel Costa', 'daniel.costa@email.com', '456.789.012-33'),
(5, 'BA5678901', '(71) 95555-0005', 'Elisa Martins', 'elisa.martins@gmail.com', '567.890.123-44');

-- --------------------------------------------------------

--
-- Estrutura da tabela `midias`
--

CREATE TABLE `midias` (
  `idmidida` int(11) NOT NULL,
  `midia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `midias`
--

INSERT INTO `midias` (`idmidida`, `midia`) VALUES
(1, 'https://casinhadadora.com/video1.mp4'),
(2, 'https://apartamentolondres.com.mp4'),
(3, 'https://casapraia.com/image1.jpg'),
(4, 'https://fotosdacasa.com/document1.pdf'),
(5, 'https://apelondrina.com/video2.mp4');

-- --------------------------------------------------------

--
-- Estrutura da tabela `proprietario`
--

CREATE TABLE `proprietario` (
  `idproprietario` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `pix` varchar(255) DEFAULT NULL,
  `banco` varchar(255) DEFAULT NULL,
  `agencia` varchar(255) NOT NULL,
  `idendereco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `proprietario`
--

INSERT INTO `proprietario` (`idproprietario`, `email`, `telefone`, `nome`, `pix`, `banco`, `agencia`, `idendereco`) VALUES
(1, 'ana.martins@email.com', '+55 11 91234-5678', 'Ana Martins', 'ana.martins@gmail.com', 'Banco do Brasil', '001', 1),
(2, 'ricardo.souza@gmail.com', '+55 21 93456-7890', 'Ricardo Souza', 'ricardo.souza@ymail.com', 'Itaú', '034', 2),
(3, 'lucas.costa@gmail.com', '+55 31 97654-3210', 'Lucas Costa', 'lucas.costa@gmail.com', 'Santander', '033', 3),
(4, 'maria.oliveira@ymail.com', '+55 41 98765-4321', 'Maria Oliveira', 'maria.oliveira@ymail.com', 'Caixa Econômica Federal', '104', 4),
(5, 'beatriz.lima@gmail.com', '+55 51 94567-8901', 'Beatriz Lima', 'beatriz.lima@gmail.com', 'Bradesco', '237', 5);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `aluguel`
--
ALTER TABLE `aluguel`
  ADD PRIMARY KEY (`codaluguel`),
  ADD KEY `idinquilino` (`idinquilino`),
  ADD KEY `idcorretor` (`idcorretor`),
  ADD KEY `idimovel` (`idimovel`);

--
-- Índices para tabela `corretor`
--
ALTER TABLE `corretor`
  ADD PRIMARY KEY (`idcorretor`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`idendereco`),
  ADD UNIQUE KEY `cep` (`cep`);

--
-- Índices para tabela `fiador`
--
ALTER TABLE `fiador`
  ADD PRIMARY KEY (`idfiador`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `rg` (`rg`),
  ADD KEY `idendereco` (`idendereco`),
  ADD KEY `idinquilino` (`idinquilino`);

--
-- Índices para tabela `imovel`
--
ALTER TABLE `imovel`
  ADD PRIMARY KEY (`idimovel`),
  ADD KEY `idproprietario` (`idproprietario`),
  ADD KEY `idendereco` (`idendereco`),
  ADD KEY `idmidida` (`idmidida`);

--
-- Índices para tabela `inquilino`
--
ALTER TABLE `inquilino`
  ADD PRIMARY KEY (`idinquilino`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `rg` (`rg`);

--
-- Índices para tabela `midias`
--
ALTER TABLE `midias`
  ADD PRIMARY KEY (`idmidida`);

--
-- Índices para tabela `proprietario`
--
ALTER TABLE `proprietario`
  ADD PRIMARY KEY (`idproprietario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `pix` (`pix`),
  ADD KEY `idendereco` (`idendereco`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluguel`
--
ALTER TABLE `aluguel`
  MODIFY `codaluguel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `corretor`
--
ALTER TABLE `corretor`
  MODIFY `idcorretor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `idendereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `fiador`
--
ALTER TABLE `fiador`
  MODIFY `idfiador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `imovel`
--
ALTER TABLE `imovel`
  MODIFY `idimovel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `inquilino`
--
ALTER TABLE `inquilino`
  MODIFY `idinquilino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `midias`
--
ALTER TABLE `midias`
  MODIFY `idmidida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `proprietario`
--
ALTER TABLE `proprietario`
  MODIFY `idproprietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluguel`
--
ALTER TABLE `aluguel`
  ADD CONSTRAINT `aluguel_ibfk_1` FOREIGN KEY (`idinquilino`) REFERENCES `inquilino` (`idinquilino`),
  ADD CONSTRAINT `aluguel_ibfk_2` FOREIGN KEY (`idcorretor`) REFERENCES `corretor` (`idcorretor`),
  ADD CONSTRAINT `aluguel_ibfk_3` FOREIGN KEY (`idimovel`) REFERENCES `imovel` (`idimovel`);

--
-- Limitadores para a tabela `fiador`
--
ALTER TABLE `fiador`
  ADD CONSTRAINT `fiador_ibfk_1` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`),
  ADD CONSTRAINT `fiador_ibfk_2` FOREIGN KEY (`idinquilino`) REFERENCES `inquilino` (`idinquilino`);

--
-- Limitadores para a tabela `imovel`
--
ALTER TABLE `imovel`
  ADD CONSTRAINT `imovel_ibfk_1` FOREIGN KEY (`idproprietario`) REFERENCES `proprietario` (`idproprietario`),
  ADD CONSTRAINT `imovel_ibfk_2` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`),
  ADD CONSTRAINT `imovel_ibfk_3` FOREIGN KEY (`idmidida`) REFERENCES `midias` (`idmidida`);

--
-- Limitadores para a tabela `proprietario`
--
ALTER TABLE `proprietario`
  ADD CONSTRAINT `proprietario_ibfk_1` FOREIGN KEY (`idendereco`) REFERENCES `endereco` (`idendereco`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
