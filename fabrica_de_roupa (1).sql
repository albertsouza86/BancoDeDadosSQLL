-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 13-Maio-2022 às 22:11
-- Versão do servidor: 5.6.12-log
-- versão do PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `fabrica_de_roupa`
--
CREATE DATABASE IF NOT EXISTS `fabrica_de_roupa` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fabrica_de_roupa`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `costureira`
--

CREATE TABLE IF NOT EXISTS `costureira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_funcionaria` int(11) DEFAULT NULL,
  `id_tipo_maquina` int(11) DEFAULT NULL,
  `matricula` int(11) DEFAULT NULL,
  `salario_valor_minimo` decimal(10,2) DEFAULT NULL,
  `id_supervisora` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_funcionaria` (`id_funcionaria`),
  KEY `id_tipo_maquina` (`id_tipo_maquina`),
  KEY `id_supervisora` (`id_supervisora`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `costureira`
--

INSERT INTO `costureira` (`id`, `id_funcionaria`, `id_tipo_maquina`, `matricula`, `salario_valor_minimo`, `id_supervisora`) VALUES
(1, 2, 2, 6, '1200.00', 1),
(2, 4, 10, 5, '1000.00', 3),
(3, 6, 7, 4, '1500.00', 3),
(4, 8, 5, 3, '1050.00', 2),
(5, 9, 4, 2, '900.00', 4),
(6, 10, 4, 1, '1010.00', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estilista`
--

CREATE TABLE IF NOT EXISTS `estilista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `estilista`
--

INSERT INTO `estilista` (`id`, `nome`) VALUES
(1, 'Alexandre_rossi'),
(2, 'zuzu_angel'),
(3, 'Francisco_costa'),
(4, 'Larissa_oliveira'),
(5, 'Elizabete_maria'),
(6, 'Rose_mary'),
(7, 'Rita_costa'),
(8, 'Manuela_costa'),
(9, 'Ester_souza'),
(10, 'Ribeiro_araujo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fabricante`
--

CREATE TABLE IF NOT EXISTS `fabricante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `cnpj` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `fabricante`
--

INSERT INTO `fabricante` (`id`, `nome`, `telefone`, `endereco`, `cnpj`) VALUES
(1, 'maquinas OK', '75-34519687', 'rua pataro macharo,39 - centro', '01.1000.2000/0001-19'),
(2, 'maquinas over', '75-34519757', 'rua rui barbosa,39 - centro', '01.1050.2000/0001-59'),
(3, 'Bahia costura', '75-33575488', 'rua do cacique, 50 - centro', '08.6000.2000/2001-19'),
(4, 'maquinas aerorporto', '75-34558617', 'rua campinas ,89 - aeroporto', '05.8000.2000/0001-31'),
(5, 'maquinas cidade', '75-335919687', 'rua do centro,39 - centro', '04.1000.3500/0001-16'),
(6, 'maquinas trobogy', '75-34515895', 'rua joana angelica,34 - trobogy', '05.8000.8000/0003-15'),
(7, 'maquinas paralela', '75-31925687', 'rua parelela , 58 - paralela', '01.9000.2000/0001-18'),
(8, 'maquinas OK', '75-34519686', 'rua da mouraria,39 - centro', '21.5000.2000/0001-19'),
(9, 'maquinas Graca', '75-34519650', 'rua corredor da vitoria,s/n - graca', '34.1000.2000/0001-33'),
(10, 'maquinas boa viagem', '75-345194589', 'rua boa viagem,39 - boa viagem', '10.1000.2000/0001-51');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionaria`
--

CREATE TABLE IF NOT EXISTS `funcionaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `funcionaria`
--

INSERT INTO `funcionaria` (`id`, `nome`) VALUES
(1, 'Rita_souza'),
(2, 'Maria_luiza'),
(3, 'Eliza_santos'),
(4, 'tabata_souza'),
(5, 'Luciana_franca'),
(6, 'ivete_sangalo'),
(7, 'Roberta_miranda'),
(8, 'Maria_souza'),
(9, 'Rita_souza'),
(10, 'Rita_souza');

-- --------------------------------------------------------

--
-- Estrutura da tabela `manutencao_conserto`
--

CREATE TABLE IF NOT EXISTS `manutencao_conserto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_supervisora` int(11) DEFAULT NULL,
  `id_maquina` int(11) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_termino` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_supervisora` (`id_supervisora`),
  KEY `id_maquina` (`id_maquina`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `manutencao_conserto`
--

INSERT INTO `manutencao_conserto` (`id`, `id_supervisora`, `id_maquina`, `data_inicio`, `data_termino`) VALUES
(1, 1, 6, '2022-01-15', '2022-01-20'),
(2, 4, 10, '2022-01-17', '2022-01-21'),
(3, 2, 8, '2022-01-02', '2022-01-10'),
(4, 3, 7, '2022-02-11', '2022-02-22'),
(5, 1, 6, '2022-03-19', '2022-03-29'),
(6, 4, 3, '2022-02-05', '2022-01-09'),
(7, 4, 4, '2022-03-29', '2022-03-31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `maquina_costura`
--

CREATE TABLE IF NOT EXISTS `maquina_costura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) DEFAULT NULL,
  `id_tipo_costura` int(11) DEFAULT NULL,
  `id_tipo_maquina` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tipo_maquina` (`id_tipo_maquina`),
  KEY `id_tipo_costura` (`id_tipo_costura`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Extraindo dados da tabela `maquina_costura`
--

INSERT INTO `maquina_costura` (`id`, `codigo`, `id_tipo_costura`, `id_tipo_maquina`) VALUES
(6, 1, 3, 3),
(7, 2, 1, 1),
(8, 3, 2, 2),
(9, 4, 5, 5),
(10, 5, 4, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `maquina_tipocostura`
--

CREATE TABLE IF NOT EXISTS `maquina_tipocostura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_maquina` int(11) DEFAULT NULL,
  `id_tipo_costura` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_maquina` (`id_maquina`),
  KEY `id_tipo_costura` (`id_tipo_costura`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `maquina_tipocostura`
--

INSERT INTO `maquina_tipocostura` (`id`, `id_maquina`, `id_tipo_costura`) VALUES
(1, 6, 5),
(2, 8, 6),
(3, 10, 7),
(4, 9, 3),
(5, 7, 2),
(6, 9, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_roupa`
--

CREATE TABLE IF NOT EXISTS `modelo_roupa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelo` varchar(30) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `id_estilista` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_estilista` (`id_estilista`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `modelo_roupa`
--

INSERT INTO `modelo_roupa` (`id`, `modelo`, `descricao`, `id_estilista`) VALUES
(1, 'vestido', 'vestido_feminino', 1),
(2, 'vestido', 'short_vermelho', 4),
(3, 'camiseta_masculina', 'camiseta_regata', 4),
(4, 'saia', 'saia_justa', 10),
(5, 'saia', 'saia_longa', 8),
(6, 'calca_justa', 'calca_longa', 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento_costureira`
--

CREATE TABLE IF NOT EXISTS `pagamento_costureira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_costureira` int(11) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `mes_competencia` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_costureira` (`id_costureira`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `pagamento_costureira`
--

INSERT INTO `pagamento_costureira` (`id`, `id_costureira`, `salario`, `mes_competencia`) VALUES
(7, 4, '157.95', '2022-05-12'),
(6, 3, '150.00', '2022-05-12'),
(5, 1, '150.00', '2022-05-12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `producao`
--

CREATE TABLE IF NOT EXISTS `producao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_modelo_roupa` int(11) DEFAULT NULL,
  `id_costureira` int(11) DEFAULT NULL,
  `id_maquina` int(11) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `termino` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_modelo_roupa` (`id_modelo_roupa`),
  KEY `id_costureira` (`id_costureira`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `producao`
--

INSERT INTO `producao` (`id`, `id_modelo_roupa`, `id_costureira`, `id_maquina`, `preco`, `inicio`, `termino`) VALUES
(1, 2, 1, 1, '1000.00', '2022-01-04', '2022-05-18'),
(2, 4, 3, 2, '1000.00', '2022-04-04', '2022-05-05'),
(3, 6, 6, 3, '1000.00', '2022-03-04', '2022-05-10'),
(4, 3, 4, 7, '53.00', '2022-03-23', '2022-03-31'),
(5, 3, 4, 8, '57.00', '2022-02-23', '2022-05-28'),
(6, 3, 4, 7, '53.00', '2022-05-01', '2022-05-13');

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_costureira`
--

CREATE TABLE IF NOT EXISTS `status_costureira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_costureira` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `status_costureira`
--

INSERT INTO `status_costureira` (`id`, `id_costureira`, `status`) VALUES
(1, 6, 'indisponivel');

-- --------------------------------------------------------

--
-- Estrutura da tabela `supervisora`
--

CREATE TABLE IF NOT EXISTS `supervisora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_funcionaria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_funcionaria` (`id_funcionaria`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `supervisora`
--

INSERT INTO `supervisora` (`id`, `id_funcionaria`) VALUES
(1, 1),
(2, 5),
(3, 7),
(4, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tempo_de_trabalho`
--

CREATE TABLE IF NOT EXISTS `tempo_de_trabalho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_costureira` int(11) NOT NULL,
  `horario` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=114 ;

--
-- Extraindo dados da tabela `tempo_de_trabalho`
--

INSERT INTO `tempo_de_trabalho` (`id`, `id_costureira`, `horario`, `status`) VALUES
(1, 4, '2022-05-12 22:56:00', 'Ativo'),
(2, 4, '2022-05-12 22:57:00', 'Ativo'),
(3, 4, '2022-05-12 22:58:00', 'Ativo'),
(4, 4, '2022-05-12 22:59:00', 'Ativo'),
(5, 4, '2022-05-12 23:00:00', 'Ativo'),
(6, 4, '2022-05-12 23:01:00', 'Ativo'),
(7, 4, '2022-05-12 23:02:00', 'Ativo'),
(8, 4, '2022-05-12 23:03:00', 'Ativo'),
(9, 4, '2022-05-12 23:04:00', 'Ativo'),
(10, 4, '2022-05-12 23:05:00', 'Ativo'),
(11, 4, '2022-05-12 23:06:00', 'Ativo'),
(12, 4, '2022-05-12 23:07:00', 'Ativo'),
(13, 4, '2022-05-12 23:08:00', 'Ativo'),
(14, 4, '2022-05-12 23:09:00', 'Ativo'),
(15, 4, '2022-05-12 23:10:00', 'Ativo'),
(16, 4, '2022-05-12 23:11:00', 'Ativo'),
(17, 4, '2022-05-12 23:12:00', 'Ativo'),
(18, 4, '2022-05-12 23:13:00', 'Ativo'),
(19, 4, '2022-05-12 23:14:00', 'Ativo'),
(20, 4, '2022-05-12 23:15:00', 'Ativo'),
(21, 4, '2022-05-12 23:16:00', 'Ativo'),
(22, 4, '2022-05-12 23:17:00', 'Ativo'),
(23, 4, '2022-05-12 23:18:00', 'Ativo'),
(24, 4, '2022-05-12 23:19:00', 'Ativo'),
(25, 4, '2022-05-12 23:20:00', 'Ativo'),
(26, 4, '2022-05-12 23:21:00', 'Ativo'),
(27, 4, '2022-05-12 23:22:00', 'Ativo'),
(28, 4, '2022-05-12 23:23:00', 'Ativo'),
(29, 4, '2022-05-12 23:24:00', 'Ativo'),
(30, 4, '2022-05-12 23:25:00', 'Ativo'),
(31, 4, '2022-05-12 23:26:00', 'Ativo'),
(32, 4, '2022-05-12 23:27:00', 'Ativo'),
(33, 4, '2022-05-12 23:28:00', 'Ativo'),
(34, 4, '2022-05-12 23:29:00', 'Ativo'),
(35, 4, '2022-05-12 23:30:00', 'Ativo'),
(36, 4, '2022-05-12 23:31:00', 'Ativo'),
(37, 4, '2022-05-12 23:32:00', 'Ativo'),
(38, 4, '2022-05-12 23:33:00', 'Ativo'),
(39, 4, '2022-05-12 23:34:00', 'Ativo'),
(40, 4, '2022-05-12 23:35:00', 'Ativo'),
(41, 4, '2022-05-12 23:36:00', 'Ativo'),
(42, 4, '2022-05-12 23:37:00', 'Ativo'),
(43, 4, '2022-05-12 23:38:00', 'Ativo'),
(44, 4, '2022-05-12 23:39:00', 'Ativo'),
(45, 4, '2022-05-12 23:40:00', 'Ativo'),
(46, 4, '2022-05-12 23:41:00', 'Ativo'),
(47, 4, '2022-05-12 23:42:00', 'Ativo'),
(48, 4, '2022-05-12 23:43:00', 'Ativo'),
(49, 4, '2022-05-12 23:44:00', 'Ativo'),
(50, 4, '2022-05-12 23:45:00', 'Ativo'),
(51, 4, '2022-05-12 23:46:00', 'Ativo'),
(52, 4, '2022-05-12 23:47:00', 'Ativo'),
(53, 4, '2022-05-12 23:48:00', 'Ativo'),
(54, 4, '2022-05-12 23:49:00', 'Ativo'),
(55, 4, '2022-05-12 23:50:00', 'Ativo'),
(56, 4, '2022-05-12 23:51:00', 'Ativo'),
(57, 4, '2022-05-12 23:52:00', 'Ativo'),
(58, 4, '2022-05-12 23:53:00', 'Ativo'),
(59, 4, '2022-05-12 23:54:00', 'Ativo'),
(60, 4, '2022-05-12 23:55:00', 'Ativo'),
(61, 4, '2022-05-12 23:56:00', 'Ativo'),
(62, 4, '2022-05-12 23:57:00', 'Ativo'),
(63, 4, '2022-05-12 23:58:00', 'Ativo'),
(64, 4, '2022-05-12 23:59:00', 'Ativo'),
(65, 4, '2022-05-13 00:00:00', 'Ativo'),
(66, 4, '2022-05-13 00:01:00', 'Ativo'),
(67, 4, '2022-05-13 00:02:00', 'Ativo'),
(68, 4, '2022-05-13 00:03:00', 'Ativo'),
(69, 4, '2022-05-13 00:04:00', 'Ativo'),
(70, 4, '2022-05-13 00:05:00', 'Ativo'),
(71, 4, '2022-05-13 00:06:00', 'Ativo'),
(72, 4, '2022-05-13 00:07:00', 'Ativo'),
(73, 4, '2022-05-13 00:08:00', 'Ativo'),
(74, 4, '2022-05-13 00:09:00', 'Ativo'),
(75, 4, '2022-05-13 00:10:00', 'Ativo'),
(76, 4, '2022-05-13 00:11:00', 'Ativo'),
(77, 4, '2022-05-13 00:12:00', 'Ativo'),
(78, 4, '2022-05-13 00:13:00', 'Ativo'),
(79, 4, '2022-05-13 00:14:00', 'Ativo'),
(80, 4, '2022-05-13 00:15:00', 'Ativo'),
(81, 4, '2022-05-13 00:16:00', 'Ativo'),
(82, 4, '2022-05-13 00:17:00', 'Ativo'),
(83, 4, '2022-05-13 00:18:00', 'Ativo'),
(84, 4, '2022-05-13 00:19:00', 'Ativo'),
(85, 4, '2022-05-13 00:20:00', 'Ativo'),
(86, 4, '2022-05-13 00:21:00', 'Ativo'),
(87, 4, '2022-05-13 00:22:00', 'Ativo'),
(88, 4, '2022-05-13 00:23:00', 'Ativo'),
(89, 4, '2022-05-13 00:24:00', 'Ativo'),
(90, 4, '2022-05-13 00:25:00', 'Ativo'),
(91, 4, '2022-05-13 00:26:00', 'Ativo'),
(92, 4, '2022-05-13 00:27:00', 'Ativo'),
(93, 4, '2022-05-13 00:28:00', 'Ativo'),
(94, 4, '2022-05-13 00:29:00', 'Ativo'),
(95, 4, '2022-05-13 00:30:00', 'Ativo'),
(96, 4, '2022-05-13 00:31:00', 'Ativo'),
(97, 4, '2022-05-13 00:32:00', 'Ativo'),
(98, 4, '2022-05-13 00:33:00', 'Ativo'),
(99, 4, '2022-05-13 00:34:00', 'Ativo'),
(100, 4, '2022-05-13 00:35:00', 'Ativo'),
(101, 4, '2022-05-13 00:36:00', 'Ativo'),
(102, 4, '2022-05-13 00:37:00', 'Ativo'),
(103, 4, '2022-05-13 00:38:00', 'Ativo'),
(104, 4, '2022-05-13 00:39:00', 'Ativo'),
(105, 4, '2022-05-13 00:40:00', 'Ativo'),
(106, 4, '2022-05-13 00:41:00', 'Ativo'),
(107, 4, '2022-05-13 00:42:00', 'Ativo'),
(108, 4, '2022-05-13 00:43:00', 'Ativo'),
(109, 4, '2022-05-13 00:44:00', 'Ativo'),
(110, 4, '2022-05-13 00:45:00', 'Ativo'),
(111, 4, '2022-05-13 00:46:00', 'Ativo'),
(112, 4, '2022-05-13 00:47:00', 'Ativo'),
(113, 4, '2022-05-13 00:48:00', 'Ativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_costura`
--

CREATE TABLE IF NOT EXISTS `tipo_costura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `tipo_costura`
--

INSERT INTO `tipo_costura` (`id`, `nome`) VALUES
(1, 'Costura aberta'),
(2, 'Costura francesa'),
(3, 'Costura fechada'),
(4, ' travete'),
(5, 'Overloque'),
(6, 'ZIGZAG');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_maquina`
--

CREATE TABLE IF NOT EXISTS `tipo_maquina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `tipo_maquina`
--

INSERT INTO `tipo_maquina` (`id`, `nome`) VALUES
(1, 'Bordadeira.'),
(2, 'Caseadeira'),
(3, 'Portátil'),
(4, 'Fechadeira'),
(5, 'Caseadeira'),
(6, 'Galoneira'),
(7, 'Interloque'),
(8, 'Overloque'),
(9, 'Pespontadeira'),
(10, 'Caseadeira');

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `evento_teste01` ON SCHEDULE EVERY 1 MINUTE STARTS '2022-05-12 00:00:00' ENDS '2022-05-13 00:00:00' ON COMPLETION PRESERVE ENABLE DO insert into tempo_de_trabalho (id_costureira,horario, status ) values(4,(current_timestamp),'Ativo')$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
