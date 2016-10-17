SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `associado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `associado` ;

CREATE TABLE IF NOT EXISTS `associado` (
  `codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(100) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(15) NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `publicacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `publicacao` ;

CREATE TABLE IF NOT EXISTS `publicacao` (
  `ISBN` INT(11) NOT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `autor` VARCHAR(100) NOT NULL,
  `editora` VARCHAR(45) NOT NULL,
  `ano` INT(11) NOT NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `exemplar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exemplar` ;

CREATE TABLE IF NOT EXISTS `exemplar` (
  `publicacao_ISBN` INT(11) NOT NULL,
  `numero` INT(11) NOT NULL,
  `preco` FLOAT NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`publicacao_ISBN`, `numero`),
  INDEX `fk_exemplar_publicacao1_idx` (`publicacao_ISBN` ASC),
  CONSTRAINT `fk_exemplar_publicacao1`
    FOREIGN KEY (`publicacao_ISBN`)
    REFERENCES `publicacao` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `emprestimo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `emprestimo` ;

CREATE TABLE IF NOT EXISTS `emprestimo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dataEmprestimo` DATE NOT NULL,
  `associado_codigo` INT(11) NOT NULL,
  `exemplar_ISBN` INT(11) NOT NULL,
  `exemplar_numero` INT(11) NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_emprestimo_associado_idx` (`associado_codigo` ASC),
  INDEX `fk_emprestimo_exemplar1_idx` (`exemplar_ISBN` ASC, `exemplar_numero` ASC),
  CONSTRAINT `fk_emprestimo_associado`
    FOREIGN KEY (`associado_codigo`)
    REFERENCES `associado` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emprestimo_exemplar1`
    FOREIGN KEY (`exemplar_ISBN` , `exemplar_numero`)
    REFERENCES `exemplar` (`publicacao_ISBN` , `numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `funcionario` ;

CREATE TABLE IF NOT EXISTS `funcionario` (
  `codigo` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(100) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = MyISAM
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `funcionario`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `funcionario` (`codigo`, `nome`, `endereco`, `email`, `senha`) VALUES (1010, 'Wallace Felipe', 'Avenida Henriqueto Cardinali, 485', 'wallace.feliper@hotmail.com', 'wf1234');
INSERT INTO `funcionario` (`codigo`, `nome`, `endereco`, `email`, `senha`) VALUES (1020, 'Letícia Guedes', 'Rua JK', 'le_10_lele@hotmail.com', 'leeh1995');
INSERT INTO `funcionario` (`codigo`, `nome`, `endereco`, `email`, `senha`) VALUES (1030, 'João Oliveira', 'Largo Grimmauld, 12', 'joao@talugo.com', 'joao12345');
INSERT INTO `funcionario` (`codigo`, `nome`, `endereco`, `email`, `senha`) VALUES (1040, 'Isabella', 'Rua Andre Doria', 'isabella@gmail.com', 'isabella12345');

COMMIT;

