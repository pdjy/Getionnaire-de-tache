-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 20, 2017 at 02:51 AM
-- Server version: 5.7.19-0ubuntu0.17.04.1
-- PHP Version: 7.0.22-0ubuntu0.17.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `TP1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Assignation_Insert` (IN `ID_Membre` INT(10), IN `ID_Tache` INT(10))  NO SQL
INSERT Into TP1.Assignation values(ID_Membre,ID_Tache)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Member_Delete` (IN `ID_Membre` INT(10))  NO SQL
DELETE FROM TP1.Membre 
WHERE Membre.ID_Membre = ID_Membre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Member_Insert` (IN `ID_Membre` INT(10), IN `NomMembre` VARCHAR(40))  NO SQL
INSERT Into TP1.Membre values(ID_Membre,NomMembre)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Member_List` ()  NO SQL
SELECT * FROM TP1.Membre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Member_Modify` (IN `ID_Membre` INT(10), IN `NomMembre` VARCHAR(40))  NO SQL
UPDATE TP1.Membre SET Membre.ID_Membre = IF(ID_Membre = '', Membre.ID_Membre, ID_Membre) , Membre.NomMembre = IF(NomMembre = '', Membre.NomMembre, NomMembre) 
WHERE Membre.ID_Membre = ID_Membre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Task_Delete` (IN `ID_Tache` INT(11))  NO SQL
DELETE FROM TP1.Tache 
WHERE Tache.ID_Tache = ID_Tache$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Task_Insert` (IN `ID_Tache` INT(11), IN `NomTache` VARCHAR(30), IN `Description` VARCHAR(100), IN `StatusT` VARCHAR(15))  NO SQL
INSERT Into TP1.Tache values(ID_Tache,NomTache,Description,StatusT)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Task_List` ()  NO SQL
SELECT * FROM TP1.Tache$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Task_Modify` (IN `ID_Tache` INT(11), IN `NomTache` VARCHAR(30), IN `Description` VARCHAR(100), IN `StatusT` VARCHAR(15))  NO SQL
UPDATE TP1.Tache SET Tache.ID_Tache = IF(ID_Tache = '', Tache.ID_Tache, ID_Tache) , Tache.NomTache = IF(NomTache = '', Tache.NomTache, NomTache) , Tache.Description = IF(Description = '', Tache.Description, Description) , Tache.StatusT = IF(StatusT = '', Tache.StatusT, StatusT) WHERE Tache.ID_Tache = ID_Tache$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Task_Search` (IN `StatusT` VARCHAR(15))  NO SQL
SELECT TP1.Tache.ID_Tache, TP1.Tache.NomTache, TP1.Tache.Description, TP1.Tache.StatusT, TP1.Membre.NomMembre
FROM Tache
INNER JOIN Assignation 
ON Assignation.ID_Tache = Tache.ID_Tache
RIGHT JOIN Membre
ON Membre.ID_Membre = Assignation.ID_Membre
WHERE Tache.StatusT = StatusT$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Task_Search_With_IDMembre` (IN `ID_Membre` INT)  NO SQL
SELECT TP1.Tache.ID_Tache, TP1.Tache.NomTache, TP1.Tache.Description, TP1.Tache.StatusT, TP1.Membre.NomMembre
FROM Tache
INNER JOIN Assignation 
ON Assignation.ID_Tache = Tache.ID_Tache
RIGHT JOIN Membre
ON Membre.ID_Membre = Assignation.ID_Membre
WHERE Membre.ID_Membre = ID_Membre$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Assignation`
--

CREATE TABLE `Assignation` (
  `ID_Membre` int(10) NOT NULL,
  `ID_Tache` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Membre`
--

CREATE TABLE `Membre` (
  `ID_Membre` int(10) NOT NULL,
  `NomMembre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Tache`
--

CREATE TABLE `Tache` (
  `ID_Tache` int(11) NOT NULL,
  `NomTache` varchar(30) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `StatusT` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Assignation`
--
ALTER TABLE `Assignation`
  ADD PRIMARY KEY (`ID_Membre`,`ID_Tache`),
  ADD UNIQUE KEY `ID_Tache` (`ID_Tache`),
  ADD KEY `Tache` (`ID_Tache`),
  ADD KEY `ID_Membre` (`ID_Membre`);

--
-- Indexes for table `Membre`
--
ALTER TABLE `Membre`
  ADD PRIMARY KEY (`ID_Membre`),
  ADD UNIQUE KEY `ID_Membre` (`ID_Membre`);

--
-- Indexes for table `Tache`
--
ALTER TABLE `Tache`
  ADD PRIMARY KEY (`ID_Tache`),
  ADD UNIQUE KEY `ID_Tache` (`ID_Tache`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Assignation`
--
ALTER TABLE `Assignation`
  ADD CONSTRAINT `Assignation_ibfk_1` FOREIGN KEY (`ID_Membre`) REFERENCES `Membre` (`ID_Membre`),
  ADD CONSTRAINT `Assignation_ibfk_2` FOREIGN KEY (`ID_Tache`) REFERENCES `Tache` (`ID_Tache`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
