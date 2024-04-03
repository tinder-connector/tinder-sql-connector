-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 02 avr. 2024 à 20:55
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tdbdd`
--

-- --------------------------------------------------------

--
-- Déchargement des données de la table `personality`
--

INSERT INTO `personality` (`id`, `label`) VALUES
(1, 'ESFP'),
(2, 'ISTP'),
(3, 'INFP'),
(4, 'ISFP'),
(5, 'ENFJ'),
(6, 'ENFP'),
(7, 'ESFJ'),
(8, 'ISTJ'),
(9, 'ESTJ'),
(10, 'INTJ'),
(11, 'ESTP'),
(12, 'ENTJ'),
(13, 'ISFJ'),
(14, 'INTP'),
(15, 'INFJ'),
(16, 'ENTP');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
