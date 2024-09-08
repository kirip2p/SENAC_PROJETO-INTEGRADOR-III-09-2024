-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: projeto_senac
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao` (
  `ID_SAEB` int NOT NULL,
  `ID_Escola` int NOT NULL,
  PRIMARY KEY (`ID_SAEB`,`ID_Escola`),
  KEY `ID_Escola` (`ID_Escola`),
  CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`ID_SAEB`) REFERENCES `saeb` (`id_saeb`),
  CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`ID_Escola`) REFERENCES `escola_municipal` (`id_escola`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(15) DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL,
  `populacao` int DEFAULT NULL,
  `territorio_m2` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cidade_id` int DEFAULT NULL,
  `bairro` varchar(20) DEFAULT NULL,
  `rua` varchar(25) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cidade_id` (`cidade_id`),
  CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`cidade_id`) REFERENCES `cidade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escola_municipal`
--

DROP TABLE IF EXISTS `escola_municipal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escola_municipal` (
  `id_escola` int NOT NULL AUTO_INCREMENT,
  `capacidade_alunos` int DEFAULT NULL,
  `nivel_educacao` enum('Fundamental','Médio') DEFAULT NULL,
  `id_saeb` int DEFAULT NULL,
  `id_fundeb` int DEFAULT NULL,
  `numero_professores` int DEFAULT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `endereco_id` int DEFAULT NULL,
  PRIMARY KEY (`id_escola`),
  KEY `id_saeb` (`id_saeb`),
  KEY `id_fundeb` (`id_fundeb`),
  KEY `endereco_id` (`endereco_id`),
  CONSTRAINT `escola_municipal_ibfk_1` FOREIGN KEY (`id_saeb`) REFERENCES `saeb` (`id_saeb`),
  CONSTRAINT `escola_municipal_ibfk_2` FOREIGN KEY (`id_fundeb`) REFERENCES `fundeb` (`id_fundeb`),
  CONSTRAINT `escola_municipal_ibfk_3` FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escola_municipal`
--

LOCK TABLES `escola_municipal` WRITE;
/*!40000 ALTER TABLE `escola_municipal` DISABLE KEYS */;
/*!40000 ALTER TABLE `escola_municipal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fundeb`
--

DROP TABLE IF EXISTS `fundeb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fundeb` (
  `id_fundeb` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `valor_distribuido` decimal(15,2) DEFAULT NULL,
  `ano` int DEFAULT NULL,
  `recebimento_uniao` decimal(15,2) DEFAULT NULL,
  `recebimento_estados` decimal(15,2) DEFAULT NULL,
  `recebimento_municipio` decimal(15,2) DEFAULT NULL,
  `valor_recebido` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id_fundeb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fundeb`
--

LOCK TABLES `fundeb` WRITE;
/*!40000 ALTER TABLE `fundeb` DISABLE KEYS */;
/*!40000 ALTER TABLE `fundeb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repasado_recebido`
--

DROP TABLE IF EXISTS `repasado_recebido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repasado_recebido` (
  `ID_FUNDEB` int NOT NULL,
  `ID_Escola` int NOT NULL,
  PRIMARY KEY (`ID_FUNDEB`,`ID_Escola`),
  KEY `ID_Escola` (`ID_Escola`),
  CONSTRAINT `repasado_recebido_ibfk_1` FOREIGN KEY (`ID_FUNDEB`) REFERENCES `fundeb` (`id_fundeb`),
  CONSTRAINT `repasado_recebido_ibfk_2` FOREIGN KEY (`ID_Escola`) REFERENCES `escola_municipal` (`id_escola`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repasado_recebido`
--

LOCK TABLES `repasado_recebido` WRITE;
/*!40000 ALTER TABLE `repasado_recebido` DISABLE KEYS */;
/*!40000 ALTER TABLE `repasado_recebido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saeb`
--

DROP TABLE IF EXISTS `saeb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saeb` (
  `id_saeb` int NOT NULL AUTO_INCREMENT,
  `contato` varchar(25) DEFAULT NULL,
  `responsavel` varchar(30) DEFAULT NULL,
  `ano` int DEFAULT NULL,
  `nome_avaliacao` varchar(20) DEFAULT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`id_saeb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saeb`
--

LOCK TABLES `saeb` WRITE;
/*!40000 ALTER TABLE `saeb` DISABLE KEYS */;
/*!40000 ALTER TABLE `saeb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Creating Trigger for table `fundeb`
--

DELIMITER //
CREATE TRIGGER update_valor_recebido
BEFORE INSERT ON fundeb
FOR EACH ROW
BEGIN
    SET NEW.valor_recebido = COALESCE(NEW.recebimento_uniao, 0) + 
                             COALESCE(NEW.recebimento_estados, 0) + 
                             COALESCE(NEW.recebimento_municipio, 0);
END;
//
DELIMITER ;

--
-- Dump completed on 2024-09-07 20:48:13
