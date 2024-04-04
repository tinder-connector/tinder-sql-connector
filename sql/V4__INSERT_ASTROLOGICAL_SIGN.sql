-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 04 avr. 2024 à 21:53
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
-- Déchargement des données de la table `astrologicalsign`
--

INSERT INTO `astrologicalsign` (`id`, `label`) VALUES
(1, 'Capricorne'),
(2, 'Scorpion'),
(3, 'Balance'),
(4, 'Gémeaux'),
(5, 'Poisson'),
(6, 'Vierge'),
(7, 'Bélier'),
(8, 'Taureau'),
(9, 'Verseau'),
(10, 'Sagittaire'),
(11, 'Lion'),
(12, 'Cancer');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
