-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: projeto_final_web
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'doce','doce'),(2,'hgj','ghj'),(3,'salgado','salgado descrição '),(4,'Abner da Silva Luiz','curriculo teste'),(5,'TESTE CAT','TESTE CAT');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidades`
--

DROP TABLE IF EXISTS `cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado_id` int(11) DEFAULT NULL,
  `nome` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estado_cidade_idx` (`estado_id`),
  CONSTRAINT `fk_cidade_estado` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidades`
--

LOCK TABLES `cidades` WRITE;
/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;
INSERT INTO `cidades` VALUES (1,1,'São Jose dos Campo');
/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contatos`
--

DROP TABLE IF EXISTS `contatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contatos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text DEFAULT NULL,
  `telefone` bigint(20) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `mensagem` text DEFAULT NULL,
  `cidade_id` int(11) DEFAULT NULL,
  `data_hora` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_contato_cidade_idx` (`cidade_id`),
  CONSTRAINT `fk_contato_cidade` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contatos`
--

LOCK TABLES `contatos` WRITE;
/*!40000 ALTER TABLE `contatos` DISABLE KEYS */;
INSERT INTO `contatos` VALUES (3,'Abner da Silva Luiz',35999439591,'abnerluis123@outlook.com','erwter',1,NULL),(4,'Abner da Silva Luiz',35999439591,'abnerluis123@outlook.com','rewewr',1,NULL),(5,'Abner da Silva Luiz',35999439591,'abnerluis123@outlook.com','SDFSDF',1,NULL);
/*!40000 ALTER TABLE `contatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text DEFAULT NULL,
  `sigla` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'São Paulo','SP');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens`
--

DROP TABLE IF EXISTS `itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `foto` blob NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_itens_categorias_idx` (`id_categoria`),
  CONSTRAINT `fk_itens_categorias` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens`
--

LOCK TABLES `itens` WRITE;
/*!40000 ALTER TABLE `itens` DISABLE KEYS */;
INSERT INTO `itens` VALUES (4,'bolo','chocolate','imagem teste',1),(5,'Abner da Silva Luiz','curriculo teste','imagem teste',1),(6,'xadrex','sdfsdf','imagem teste',1),(7,'torta','quente','imagem teste',3),(8,'teste','curriculo teste 2 ','https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.cisoadvisor.com.br%2Fwp-content%2Fuploads%2F2021%2F03%2Fphp-script-language-linguagem.jpg&imgrefurl=https%3A%2F%2Fwww.cisoadvisor.com.br%2Fcodigo-fonte-do-php-foi-contaminado-com-backdoor%2F&tbnid=0qV',4),(9,'Abner da Silva Luiz','curriculo teste','https://www.google.com/imgres?imgurl=https%3A%2F%2Fpetsistemas.ufms.br%2Fwp-content%2Fuploads%2F2015%2F09%2FWebysther_20160423_-_Elephpant.svg_.png&imgrefurl=https%3A%2F%2Fpetsistemas.ufms.br%2Findex.php%2Fblog%2F2015%2F06%2F10%2Fprimeiros-passos-no-php%2',1),(10,'xadrex','curriculo teste','https://www.onthewall.com.br/blog/o-t-w/uploads/2020/10/fotos-pontos-turisticos-03.png',1),(11,'Abner da Silva Luiz','curriculo teste','https://www.google.com/imgres?imgurl=https%3A%2F%2Fgartic.com.br%2Fimgs%2Fmural%2F_c%2F_chopper_so_cute_%2Fpequeno-link.png&imgrefurl=https%3A%2F%2Fgartic.com.br%2F_chopper_so_cute_%2Fdesenho-livre%2Fpequeno-link&tbnid=O_0iTBsWjd2OeM&vet=12ahUKEwidj-yY4sr',1),(12,'Abner da Silva Luiz','curriculo teste','https://www.google.com/imgres?imgurl=https%3A%2F%2Fgartic.com.br%2Fimgs%2Fmural%2F_c%2F_chopper_so_cute_%2Fpequeno-link.png&imgrefurl=https%3A%2F%2Fgartic.com.br%2F_chopper_so_cute_%2Fdesenho-livre%2Fpequeno-link&tbnid=O_0iTBsWjd2OeM&vet=12ahUKEwidj-yY4srxAhVOiJUCHbjWAeoQMygCegUIARCpAQ..i&docid=S0AdzXnKj4GhxM&w=510&h=420&q=imagem%20com%20o%20link%20pequeno&ved=2ahUKEwidj-yY4srxAhVOiJUCHbjWAeoQMygCegUIARCpAQ',1),(13,'torre','chocolate','https://www.onthewall.com.br/blog/o-t-w/uploads/2020/10/fotos-pontos-turisticos-03.png',3),(14,'teste final','teste final','https://www.onthewall.com.br/blog/o-t-w/uploads/2020/10/fotos-pontos-turisticos-03.png',1);
/*!40000 ALTER TABLE `itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `senha` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Abner da Silva Luiz','abnerluis123@outlook.com','35999439591','202cb962ac59075b964b07152d234b70'),(2,'Abner da Silva Luiz','abnerluis123@outlook.com','35999439591','202cb962ac59075b964b07152d234b70'),(3,'Abner da Silva Luiz','abnerluis123@outlook.com','35999439591','202cb962ac59075b964b07152d234b70'),(4,'Abner da Silva Luiz','abnerluis123@outlook.com','35999439591','202cb962ac59075b964b07152d234b70');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-04 23:28:03
