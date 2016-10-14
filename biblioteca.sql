-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 14-Out-2016 às 14:33
-- Versão do servidor: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblioteca`
--
CREATE DATABASE IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `biblioteca`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `associado`
--

DROP TABLE IF EXISTS `associado`;
CREATE TABLE `associado` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
CREATE TABLE `emprestimo` (
  `dataEmprestimo` date NOT NULL,
  `Associado_codigo` int(11) NOT NULL,
  `Exemplar_numero` int(11) NOT NULL,
  `Exemplar_Publicacao_ISBN` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `exemplar`
--

DROP TABLE IF EXISTS `exemplar`;
CREATE TABLE `exemplar` (
  `numero` int(11) NOT NULL,
  `preco` float NOT NULL,
  `Publicacao_ISBN` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE `funcionario` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`codigo`, `nome`, `endereco`, `email`, `senha`) VALUES
(1, 'Wallace', 'Av. Doutor Henrique Cardinari', 'wallace.feliper@hotmail.com', 'wf12345'),
(2, 'Letícia', 'R. JK', 'le_10_lele@hotmail.com', 'leeh1995'),
(3, 'João', 'R. Itabaianinha', 'joao@talugo.com', 'joao12345');

-- --------------------------------------------------------

--
-- Estrutura da tabela `publicacao`
--

DROP TABLE IF EXISTS `publicacao`;
CREATE TABLE `publicacao` (
  `ISBN` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `editora` varchar(45) DEFAULT NULL,
  `ano` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `associado`
--
ALTER TABLE `associado`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD PRIMARY KEY (`dataEmprestimo`,`Exemplar_numero`,`Exemplar_Publicacao_ISBN`),
  ADD KEY `Associado_codigo` (`Associado_codigo`),
  ADD KEY `Exemplar_numero` (`Exemplar_numero`),
  ADD KEY `Exemplar_Publicacao_ISBN` (`Exemplar_Publicacao_ISBN`);

--
-- Indexes for table `exemplar`
--
ALTER TABLE `exemplar`
  ADD PRIMARY KEY (`numero`,`Publicacao_ISBN`),
  ADD KEY `Publicacao_ISBN` (`Publicacao_ISBN`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `associado`
--
ALTER TABLE `associado`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
