-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 18, 2016 at 10:26 PM
-- Server version: 5.5.52-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bibliotecaDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `associado`
--

CREATE TABLE IF NOT EXISTS `associado` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `associado`
--

INSERT INTO `associado` (`codigo`, `nome`, `endereco`, `email`, `senha`, `status`) VALUES
(100, 'Zezinho', 'Rua do ZÃ©, 25', 'ze@gmail.com', 'zeze123', 'grad');

-- --------------------------------------------------------

--
-- Table structure for table `emprestimo`
--

CREATE TABLE IF NOT EXISTS `emprestimo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataRetirada` date NOT NULL,
  `dataDevolucao` date NOT NULL,
  `associado_codigo` int(11) NOT NULL,
  `exemplar_ISBN` int(11) NOT NULL,
  `exemplar_numero` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_emprestimo_associado_idx` (`associado_codigo`),
  KEY `fk_emprestimo_exemplar1_idx` (`exemplar_ISBN`,`exemplar_numero`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `emprestimo`
--

INSERT INTO `emprestimo` (`id`, `dataRetirada`, `dataDevolucao`, `associado_codigo`, `exemplar_ISBN`, `exemplar_numero`, `status`) VALUES
(1, '2016-10-12', '2016-10-19', 100, 105525, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exemplar`
--

CREATE TABLE IF NOT EXISTS `exemplar` (
  `publicacao_ISBN` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `preco` float NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`publicacao_ISBN`,`numero`),
  KEY `fk_exemplar_publicacao1_idx` (`publicacao_ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exemplar`
--

INSERT INTO `exemplar` (`publicacao_ISBN`, `numero`, `preco`, `status`) VALUES
(105525, 1, 25.3, 1),
(105525, 2, 27, 0),
(205240, 1, 30, 0);

-- --------------------------------------------------------

--
-- Table structure for table `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(15) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1041 ;

--
-- Dumping data for table `funcionario`
--

INSERT INTO `funcionario` (`codigo`, `nome`, `endereco`, `email`, `senha`) VALUES
(1010, 'Wallace Felipe', 'Avenida Henriqueto Cardinali, 485', 'wallace.feliper@hotmail.com', 'wf1234'),
(1020, 'Letícia Guedes', 'Rua JK', 'le_10_lele@hotmail.com', 'leeh1995'),
(1030, 'João Oliveira', 'Largo Grimmauld, 12', 'joao@talugo.com', 'joao12345'),
(1040, 'Isabella', 'Rua Andre Doria', 'isabella@gmail.com', 'isabella12345');

-- --------------------------------------------------------

--
-- Table structure for table `publicacao`
--

CREATE TABLE IF NOT EXISTS `publicacao` (
  `ISBN` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `editora` varchar(45) NOT NULL,
  `ano` int(11) NOT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publicacao`
--

INSERT INTO `publicacao` (`ISBN`, `titulo`, `autor`, `editora`, `ano`) VALUES
(105525, 'Viagem ao Centro da Terra', 'Julio Verne', 'Elsevier', 2004),
(205240, 'Vinte Mil Léguas Submarinas', 'Julio Verne', 'Rocco', 2000);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD CONSTRAINT `emprestimo_ibfk_1` FOREIGN KEY (`exemplar_ISBN`) REFERENCES `exemplar` (`publicacao_ISBN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emprestimo_associado` FOREIGN KEY (`associado_codigo`) REFERENCES `associado` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emprestimo_exemplar1` FOREIGN KEY (`exemplar_ISBN`, `exemplar_numero`) REFERENCES `exemplar` (`publicacao_ISBN`, `numero`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `exemplar`
--
ALTER TABLE `exemplar`
  ADD CONSTRAINT `fk_exemplar_publicacao1` FOREIGN KEY (`publicacao_ISBN`) REFERENCES `publicacao` (`ISBN`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
