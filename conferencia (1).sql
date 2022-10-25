-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 13-Maio-2022 às 22:20
-- Versão do servidor: 5.6.12-log
-- versão do PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `conferencia`
--
CREATE DATABASE IF NOT EXISTS `conferencia` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `conferencia`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE IF NOT EXISTS `alunos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  `disciplina` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`id`, `nome`, `disciplina`) VALUES
(1, 'Lewroy s Lopes', 'portugues'),
(3, 'Prince', 'portugues'),
(4, 'Karine', 'portugues'),
(5, 'João', 'historia'),
(6, 'Fabricio', 'portugues'),
(7, 'Albert', 'matematica'),
(8, 'Vegeta - Rei dos Sayajins', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `data_contratacao` date NOT NULL,
  `data_demissao` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `cpf`, `telefone`, `data_contratacao`, `data_demissao`) VALUES
(1, 'Lewroy', '03955741541', '77988451245', '2000-01-01', '2022-01-01'),
(2, 'Joana das Flores', '02541452541', '12345678', '0000-00-00', '0000-00-00'),
(3, 'Joao Matos', NULL, '12341078', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `costureira`
--

CREATE TABLE IF NOT EXISTS `costureira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `if_funcionaria` int(11) NOT NULL,
  `id_dupervisora` int(11) NOT NULL,
  `id_tipo_maquina` int(11) NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `salario_valor_minimo` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `costureira`
--

INSERT INTO `costureira` (`id`, `if_funcionaria`, `id_dupervisora`, `id_tipo_maquina`, `matricula`, `salario_valor_minimo`) VALUES
(3, 2, 2, 2, '1234', '1000.00');

--
-- Acionadores `costureira`
--
DROP TRIGGER IF EXISTS `tgr_status`;
DELIMITER //
CREATE TRIGGER `tgr_status` AFTER INSERT ON `costureira`
 FOR EACH ROW INSERT into status_costureira (id_costureira, status) values (NEW.id, 'disponivel')
//
DELIMITER ;
DROP TRIGGER IF EXISTS `tgr_status_off`;
DELIMITER //
CREATE TRIGGER `tgr_status_off` AFTER DELETE ON `costureira`
 FOR EACH ROW DELETE FROM status_costureira WHERE status_costureira.id_costureira = OLD.id
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento_costureira`
--

CREATE TABLE IF NOT EXISTS `pagamento_costureira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_costureira` int(11) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `mes_competencia` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `pagamento_costureira`
--

INSERT INTO `pagamento_costureira` (`id`, `id_costureira`, `salario`, `mes_competencia`) VALUES
(1, 3, '250.00', '2022-04-01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE IF NOT EXISTS `pessoa` (
  `pessoa_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pessoa` varchar(200) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `tipo_pessoa` varchar(200) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  PRIMARY KEY (`pessoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `producao`
--

CREATE TABLE IF NOT EXISTS `producao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_costureira` int(11) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `inicio` date NOT NULL,
  `termino` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `producao`
--

INSERT INTO `producao` (`id`, `id_costureira`, `preco`, `inicio`, `termino`) VALUES
(4, 3, '1000.00', '2022-04-01', '2022-04-04');

--
-- Acionadores `producao`
--
DROP TRIGGER IF EXISTS `pagamento_mensal`;
DELIMITER //
CREATE TRIGGER `pagamento_mensal` AFTER INSERT ON `producao`
 FOR EACH ROW update pagamento_costureira set pagamento_costureira.salario = pagamento_costureira.salario + (new.preco*0.15) where pagamento_costureira.id_costureira = new.id_costureira  and month(mes_competencia) = month(new.inicio)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `descricao` longtext,
  `qtd_estoque` int(11) DEFAULT NULL,
  `prazo_validade` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `preco`, `descricao`, `qtd_estoque`, `prazo_validade`) VALUES
(1, 'Bola de Basquete', '90.00', 'Bola semiprofissional - Garantia de 2 anos (Material Sintético)', 40, '2022-06-14'),
(2, 'livro - Harry Porter e a pedra filosofal', '50.00', 'Livro Usado, ótimo estado.', 15, '2022-10-26'),
(3, 'Pelúcia do Capitão América', '24.00', 'Pelúcia Usada em perfeito estado de conservação.', 2, '2023-05-12'),
(4, 'Pelúcia do Capitão América', '24.99', 'Pelúcia Usada em perfeito estado de conservação.', 2, '2023-10-11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_costureira`
--

CREATE TABLE IF NOT EXISTS `status_costureira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_costureira` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `status_costureira`
--

INSERT INTO `status_costureira` (`id`, `id_costureira`, `status`) VALUES
(1, 3, 'disponivel');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE IF NOT EXISTS `vendas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_cliente` int(11) DEFAULT NULL,
  `Id_produto` int(11) DEFAULT NULL,
  `Qtd` int(11) DEFAULT NULL,
  `Valor_unitario` decimal(10,2) DEFAULT NULL,
  `tarifa` decimal(10,2) NOT NULL,
  `Desconto` int(3) DEFAULT NULL,
  `Data_venda` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_cliente` (`Id_cliente`),
  KEY `Id_produto` (`Id_produto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`Id`, `Id_cliente`, `Id_produto`, `Qtd`, `Valor_unitario`, `tarifa`, `Desconto`, `Data_venda`) VALUES
(1, 1, 2, 10, '5.00', '2.00', 10, '2022-03-16'),
(2, 3, 4, 40, '12.50', '4.50', 10, '2022-03-07'),
(3, 2, 4, 3, '150.00', '1.25', 50, '2022-03-02');

--
-- Acionadores `vendas`
--
DROP TRIGGER IF EXISTS `tr_baixa_estoque`;
DELIMITER //
CREATE TRIGGER `tr_baixa_estoque` AFTER INSERT ON `vendas`
 FOR EACH ROW begin
update produtos set produto.qtd_estoque = produtos.qtd_estoque - new.Qtd
where produtos.id = new.Id_produto;
end
//
DELIMITER ;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`Id_cliente`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `vendas_ibfk_2` FOREIGN KEY (`Id_produto`) REFERENCES `produtos` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
