-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 19, 2016 at 08:55 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=401 ;

--
-- Dumping data for table `associado`
--

INSERT INTO `associado` (`codigo`, `nome`, `endereco`, `email`, `senha`, `status`) VALUES
(100, 'Zezinho', 'Rua do Zé, 25', 'ze@gmail.com', 'zeze123', 'grad'),
(110, 'José Guimarães', 'Rua Garças Brancas, 25', 'jose.guimaraes@hotmail.com', 'guimaraes01', 'posgrad'),
(120, 'JosÃ© Animateia', 'Rua Barca do Inferno, 78', 'jose_anima@hotmail.com', 'anima01', 'prof'),
(130, 'LetÃ­cia Diliane', 'Rua Agenor Ferreira, 485', 'let.diliane@email.it', 'let123', 'grad'),
(140, 'Roberto Campos', 'Avenida Conceição Aparecida, 145', 'roberto.campos@gmail.com', 'campos123', 'posgrad'),
(150, 'Tereza Gonçalves', 'Avenida João Ribeiro, 65', 'terezinha@aol.com', 'tereza12345', 'prof'),
(160, 'Larissa Magalhães', 'Rua Fernando Faria Gonçalves, 97', 'lari.magalhaes@gmail.com', 'lari54321', 'posgrad'),
(170, 'José Andrades', 'Rua Dom Zé, 29', 'andrades@gmail.com', 'andrades123', 'prof'),
(180, 'Clarissa Gonçalves Cazé', 'Rua das Garças, 45', 'clarissa.gc@hotmail.com', 'clari123', 'grad'),
(300, 'Augustus ', 'Rua Maria Josefina, 67', 'august@hotmail.com', '12345', 'grad'),
(400, 'Laercio Baldochi', 'Rua José Verano, 470', 'baldochi@gmail.com', 'baldochi123', 'prof');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `emprestimo`
--

INSERT INTO `emprestimo` (`id`, `dataRetirada`, `dataDevolucao`, `associado_codigo`, `exemplar_ISBN`, `exemplar_numero`, `status`) VALUES
(1, '2016-10-12', '2016-10-19', 100, 105525, 1, 0),
(2, '2016-10-01', '2016-10-07', 100, 105525, 2, 0),
(3, '2016-10-20', '2016-10-26', 100, 205240, 1, 1),
(5, '2016-10-05', '2016-10-19', 120, 192566, 1, 1),
(6, '2016-10-01', '2016-10-11', 160, 309535, 1, 0),
(7, '2016-10-01', '2016-10-11', 160, 105525, 1, 0),
(8, '2016-10-01', '2016-10-08', 100, 105525, 1, 0),
(9, '2016-10-01', '2016-10-11', 160, 105525, 1, 0),
(10, '2016-10-01', '2016-10-11', 160, 105525, 1, 0),
(11, '2016-10-01', '2016-10-08', 100, 105525, 1, 0),
(12, '2016-10-01', '2016-10-08', 100, 105525, 1, 0),
(13, '2016-10-01', '2016-10-08', 100, 105525, 1, 0),
(14, '2016-09-25', '2016-10-05', 160, 309535, 1, 0),
(15, '2016-08-08', '2016-08-22', 120, 105525, 1, 0),
(16, '2016-09-14', '2016-09-21', 100, 309535, 1, 0),
(17, '2016-10-18', '2016-10-25', 300, 457872, 1, 0),
(18, '2016-10-12', '2016-10-19', 300, 457872, 1, 0);

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
(105525, 1, 25.3, 0),
(105525, 2, 27, 0),
(105525, 3, 19.8, 0),
(192566, 1, 52.6, 1),
(205240, 1, 30, 1),
(301998, 1, 39.2, 0),
(309535, 1, 20.2, 0),
(457872, 1, 35.5, 0),
(809045, 1, 70.9, 0);

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
(192566, 'PHP Moderno', 'Josh Lockhart', 'O reilly', 2014),
(205240, 'Vinte Mil Léguas Submarinas', 'Julio Verne', 'Rocco', 2000),
(301998, 'Inferno', 'Dan Brown', 'Arqueiro', 2014),
(309535, 'Harry Potter e a Ordem da Fenix', 'J. K. Rolling', 'Rocco', 2008),
(309786, 'As Viagens de Gulliver', 'Jonathan Swift', 'PENGUIN COMPANHIA', 2010),
(457872, 'O Guia do Mochileiro das Galaxias', 'Douglas Adams', 'Arqueiro', 2013),
(809045, 'Decamerão', 'Giovanni Boccaccio', 'Abril', 1985);

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
