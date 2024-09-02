-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Set-2024 às 14:02
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

INSERT INTO `aluguel` (`codaluguel`, `datainicio`, `descricao`, `valor`, `vencimento`, `idinquilino`, `idcorretor`, `idimovel`) VALUES
(1, '2024-01-01', 'Aluguel de apartamento no centro', 1615.79, '2024-05-01', 1, 1, 1),
(2, '2024-02-01', 'Aluguel de casa com piscina', 1209.60, '2024-06-01', 2, 2, 2),
(3, '2024-03-01', 'Aluguel de cobertura duplex', 1245.20, '2024-07-01', 3, 3, 3),
(4, '2024-04-01', 'Aluguel de sala comercial', 2408.16, '2024-08-01', 4, 4, 4),
(5, '2024-05-01', 'Aluguel de kitnet próximo à universidade', 5367.20, '2024-09-01', 5, 5, 5);

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
(5, 'luan.pereira@gmail.com', '+55 51 94444-2222', 'Luan Pereira'),
(6, 'carmo.araujo@gmail.com', '+55 11 98765-4321', 'Carmo'),
(7, 'andre.santos@gmail.com', '+55 21 91234-5678', 'André Santos'),
(8, 'luana.martins@yahoo.com', '+55 31 99876-5432', 'Luana Martins'),
(9, 'roberto.oliveira@etec.com', '+55 41 92345-6789', 'Roberto Oliveira'),
(10, 'patricia.souza@gmail.com', '+55 51 93456-7890', 'Patrícia Souza');

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
(1, 'São Paulo', '12345-678', 123, 'Avenida Paulista', 'Vila Delphi', 'G', 'SP'),
(2, 'Rio de Janeiro', '22222-123', 456, 'Praia de Copacabana', 'Copacabana', '', 'RJ'),
(3, 'Mauá', '40028-922', 789, 'Rua dos Tupinambás', 'Seu Longuinho', 'E', 'MG'),
(4, 'Ribeirão Pires', '987654-321', 321, 'Rua XV de Novembro', 'Centro', 'F', 'PR'),
(5, 'Porto Alegre', '90000-666', 654, 'Avenida Ipiranga', 'Cidade Baixa', '', 'RS'),
(6, 'Ribeirão Pires', '01001-000', 123, 'Rua A', 'Centro', 'Apto 101', 'SP'),
(7, 'Mauá', '20010-000', 456, 'Rua Bolina', 'Itapark', 'I', 'RJ'),
(8, 'Belo Horizonte', '30120-000', 789, 'Rua Marina', 'Funcionários', 'E', 'MG'),
(9, 'Mauá', '80010-000', 101, 'Rua Maringá', 'Vila Delphi', 'Apto 204', 'PR'),
(10, 'Porto Alegre', '90010-000', 202, 'Rua Amora', 'Moinhos de Vento', 'D', 'RS');

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
  `idendereco` int(11) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `imovel`
--

INSERT INTO `imovel` (`idimovel`, `disponivel`, `quintal`, `suite`, `nbanheiros`, `tipo`, `garagem`, `lavanderia`, `piscina`, `comodos`, `idmidida`, `idproprietario`, `idendereco`, `area`) VALUES
(1, b'1', '1', b'1', 3, 'Apartamento', b'1', b'1', b'0', 4, 1, 1, 1, '100'),
(2, b'1', '1', b'0', 2, 'Casa', b'1', b'0', b'1', 3, 2, 2, 2, '150'),
(3, b'0', '1', b'1', 4, 'Cobertura', b'1', b'1', b'1', 5, 3, 3, 3, '200'),
(4, b'1', '0', b'0', 1, 'Sala Comercial', b'0', b'0', b'0', 4, 4, 4, 4, '250'),
(5, b'1', '1', b'1', 2, 'Kitnet', b'0', b'1', b'0', 7, 5, 5, 5, '300');

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
  `cpf` varchar(255) NOT NULL,
  `nascimento` date DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `inquilino`
--

INSERT INTO `inquilino` (`idinquilino`, `rg`, `telefone`, `nome`, `email`, `cpf`, `nascimento`, `salario`) VALUES
(1, '12.345.678-9', '(31) 99999-0001', 'Ana Silva', 'ana.silva@gmail.com', '123.456.789-00', '1990-01-15', '2500.00'),
(2, '23.456.789-0', '(11) 98888-0002', 'Bruno Oliveira', 'bruno.oliveira@ymail.com', '234.567.890-11', '1985-07-22', '3200.50'),
(3, '34.567.890-1', '(21) 97777-0003', 'Clara Souza', 'clara.souza@email.com', '345.678.901-22', '1992-03-30', '2800.75'),
(4, '45.678.901-2', '(51) 96666-0004', 'Daniel Costa', 'daniel.costa@email.com', '456.789.012-33', '1988-11-05', '3100.25'),
(5, '56.789.012-3', '(71) 95555-0005', 'Elisa Martins', 'elisa.martins@gmail.com', '567.890.123-44', '1995-12-10', '2700.00'),
(6, '28.654.321-0', '+55 11 92234-5678', 'Juliana Fernandes', 'juliana.fernandes@example.com', '876.543.210-11', '1992-09-05', '3100.00'),
(7, '12.555.678-9', '+55 11 91234-5678', 'João Silva', 'joao.silva@example.com', '123.555.789-00', '1985-01-15', '2500.00'),
(8, '56.789.432-1', '+55 11 95567-8901', 'Ricardo Oliveira', 'ricardo.oliveira@example.com', '543.210.987-44', '1989-08-30', '3050.00'),
(9, '15.789.654-3', '+55 11 91123-4567', 'Lucas Almeida', 'lucas.almeida@example.com', '987.654.321-00', '1987-04-12', '2900.00'),
(10, '47.890.123-4', '+55 11 94456-7890', 'Fernanda Souza', 'fernanda.souza@example.com', '654.321.098-33', '1990-02-14', '3200.00');

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
(1, 'ana.araujo@email.com', '+55 11 91234-5678', 'Ana Araujo', 'ana.araujo@gmail.com', 'Banco do Brasil', '001', 1),
(2, 'ricardo.souza@gmail.com', '+55 11 93456-7890', 'Ricardo Souza', 'ricardo.souza@ymail.com', 'Itaú', '034', 2),
(3, 'lucas.costa@gmail.com', '+55 11 97654-3210', 'Lucas Costa', 'lucas.costa@gmail.com', 'Santander', '033', 3),
(4, 'maria.clara@ymail.com', '+55 11 98765-4321', 'Maria Clara', 'maria.clara@ymail.com', 'Caixa Econômica Federal', '104', 4),
(5, 'beatriz.lima@gmail.com', '+55 11 94567-8901', 'Beatriz Lima', 'beatriz.lima@gmail.com', 'Bradesco', '237', 5),
(6, 'joao.silva@email.com', '+55 11 91901-2345', 'João Silva', '12345678901', 'Banco do Brasil', '1234', 6),
(7, 'maria.oliveira@email.com', '+55 11 91234-5678', 'Maria Oliveira', '10987654321', 'Caixa Econômica', '5678', 7),
(8, 'claudia.araujo@email.com', '+55 11 93456-7890', 'Claudia Araujo', '11223344556', 'Itaú', '9012', 8),
(9, 'ana.pereira@email.com', '+55 11 98765-4321', 'Ana Pereira', '55667788990', 'Santander', '3456', 9),
(10, 'carla.martins@email.com', '+55 11 92123-4567', 'Carla Martins', '99887766554', 'Bradesco', '7890', 10);

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
  MODIFY `idcorretor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `idendereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `idinquilino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `midias`
--
ALTER TABLE `midias`
  MODIFY `idmidida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `proprietario`
--
ALTER TABLE `proprietario`
  MODIFY `idproprietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
