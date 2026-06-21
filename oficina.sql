CREATE DATABASE  IF NOT EXISTS `oficina` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `oficina`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: oficina
-- ------------------------------------------------------
-- Server version	8.4.9

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Carlos Silva','519999990000','Rua das Flores 100'),(2,'Mariana Souza','51988887777','Av Brasil 500'),(3,'Carlos Silva','51999990001',NULL),(4,'Ana Souza','51999990002',NULL),(5,'Joao Oliveira','51999990003',NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe` (
  `idEquipe` int NOT NULL AUTO_INCREMENT,
  `nomeEquipe` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEquipe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` VALUES (1,'Equipe Motor'),(2,'Equipe Elétrica');
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanico`
--

DROP TABLE IF EXISTS `mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanico` (
  `nome` varchar(100) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  `idEquipe` int DEFAULT NULL,
  KEY `idEquipe` (`idEquipe`),
  CONSTRAINT `mecanico_ibfk_1` FOREIGN KEY (`idEquipe`) REFERENCES `equipe` (`idEquipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico`
--

LOCK TABLES `mecanico` WRITE;
/*!40000 ALTER TABLE `mecanico` DISABLE KEYS */;
INSERT INTO `mecanico` VALUES ('João Pereira','Rua mecânicos 50','Motor',1),('Pedro Santos','Av Oficina 200','Elétrica',2);
/*!40000 ALTER TABLE `mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os`
--

DROP TABLE IF EXISTS `os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `os` (
  `numeroOS` int NOT NULL AUTO_INCREMENT,
  `dataEmissao` date DEFAULT NULL,
  `valorTotal` decimal(10,2) DEFAULT NULL,
  `statusOS` varchar(50) DEFAULT NULL,
  `dataConclusao` date DEFAULT NULL,
  `idVeiculo` int DEFAULT NULL,
  `idEquipe` int DEFAULT NULL,
  PRIMARY KEY (`numeroOS`),
  KEY `idEquipe` (`idEquipe`),
  CONSTRAINT `os_ibfk_1` FOREIGN KEY (`idEquipe`) REFERENCES `equipe` (`idEquipe`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os`
--

LOCK TABLES `os` WRITE;
/*!40000 ALTER TABLE `os` DISABLE KEYS */;
INSERT INTO `os` VALUES (1,'2026-06-01',0.00,'Aberta','2026-06-05',1,1),(2,'2026-06-01',NULL,'Concluida',NULL,1,NULL),(3,'2026-06-10',NULL,'Em andamento',NULL,2,NULL),(4,'2026-06-15',NULL,'Concluida',NULL,3,NULL);
/*!40000 ALTER TABLE `os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_peca`
--

DROP TABLE IF EXISTS `os_peca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `os_peca` (
  `numeroOS` int NOT NULL,
  `idPeca` int NOT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`numeroOS`,`idPeca`),
  KEY `idPeca` (`idPeca`),
  CONSTRAINT `os_peca_ibfk_1` FOREIGN KEY (`numeroOS`) REFERENCES `os` (`numeroOS`),
  CONSTRAINT `os_peca_ibfk_2` FOREIGN KEY (`idPeca`) REFERENCES `peca` (`idPeca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_peca`
--

LOCK TABLES `os_peca` WRITE;
/*!40000 ALTER TABLE `os_peca` DISABLE KEYS */;
INSERT INTO `os_peca` VALUES (1,1,1),(1,2,1);
/*!40000 ALTER TABLE `os_peca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_servico`
--

DROP TABLE IF EXISTS `os_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `os_servico` (
  `numeroOS` int NOT NULL,
  `idServico` int NOT NULL,
  `quantidade` int DEFAULT NULL,
  `valorServico` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`numeroOS`,`idServico`),
  KEY `idServico` (`idServico`),
  CONSTRAINT `os_servico_ibfk_1` FOREIGN KEY (`numeroOS`) REFERENCES `os` (`numeroOS`),
  CONSTRAINT `os_servico_ibfk_2` FOREIGN KEY (`idServico`) REFERENCES `servico` (`idServico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_servico`
--

LOCK TABLES `os_servico` WRITE;
/*!40000 ALTER TABLE `os_servico` DISABLE KEYS */;
INSERT INTO `os_servico` VALUES (1,1,1,80.00),(1,2,1,150.00),(2,3,1,600.00),(3,5,1,500.00),(4,6,1,100.00);
/*!40000 ALTER TABLE `os_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peca`
--

DROP TABLE IF EXISTS `peca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peca` (
  `idPeca` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(150) DEFAULT NULL,
  `valorUnitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idPeca`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peca`
--

LOCK TABLES `peca` WRITE;
/*!40000 ALTER TABLE `peca` DISABLE KEYS */;
INSERT INTO `peca` VALUES (1,'Óleo 5W30',45.00),(2,'Filtro de óleo',35.00),(3,'Kit embreagem',900.00),(4,'Filtro de óleo',50.00),(5,'Pastilha de freio',220.00),(6,'Correia dentada',300.00);
/*!40000 ALTER TABLE `peca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `idServico` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(150) DEFAULT NULL,
  `valorMaoObra` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idServico`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (1,'TROCA DE ÓLEO',80.00),(2,'Revisão elétrica',150.00),(3,'Troca de embreagem',600.00),(4,'Troca de óleo',150.00),(5,'Revisão completa',500.00),(6,'Alinhamento',100.00);
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `idVeiculo` int NOT NULL AUTO_INCREMENT,
  `placa` varchar(10) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `ano` int DEFAULT NULL,
  `idCliente` int DEFAULT NULL,
  PRIMARY KEY (`idVeiculo`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,'ABC1234','Toyota','Corolla',2020,1),(2,'xyz9876','Honda','Civic',2019,2),(3,'ABC1234',NULL,'Honda Civic',NULL,1),(4,'DEF5678',NULL,'Toyota Corolla',NULL,2),(5,'GHI9012',NULL,'VW Gol',NULL,3);
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;



-- Dump completed on 2026-06-21 18:11:41


-- =====================================================
-- CONSULTAS SQL - DESAFIO OFICINA
-- =====================================================


-- 1) Lista de clientes cadastrados

SELECT *
FROM cliente;


-- 2) Ordens de serviço concluídas

SELECT *
FROM os
WHERE status = 'Concluida';


-- 3) Serviços ordenados pelo maior valor de mão de obra

SELECT
	descricao AS Servico,
	valorMaoObra AS Valor
FROM servico
ORDER BY valorMaoObra DESC;


-- 4) Valor total de serviços por Ordem de Serviço

SELECT
	os.numeroOS AS OrdemServico,
	SUM(oss.valorServico * oss.quantidade) AS TotalServico

FROM os

JOIN os_servico oss
ON os.numeroOS = oss.numeroOS

GROUP BY os.numeroOS;


-- 5) Relação Cliente, Veículo, OS e Serviço

SELECT
	c.nome AS Cliente,
	v.modelo AS Veiculo,
	os.numeroOS AS OrdemServico,
	s.descricao AS Servico,
	oss.valorServico AS Valor

FROM cliente c

JOIN veiculo v
ON c.idCliente = v.idCliente

JOIN os
ON v.idVeiculo = os.idVeiculo

JOIN os_servico oss
ON os.numeroOS = oss.numeroOS

JOIN servico s
ON oss.idServico = s.idServico;


-- 6) Clientes com mais de uma Ordem de Serviço

SELECT
	c.nome AS Cliente,
	COUNT(os.numeroOS) AS TotalOrdens

FROM cliente c

JOIN veiculo v
ON c.idCliente = v.idCliente

JOIN os
ON v.idVeiculo = os.idVeiculo

GROUP BY c.nome

HAVING COUNT(os.numeroOS) > 1;