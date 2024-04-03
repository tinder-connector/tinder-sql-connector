-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 01 avr. 2024 à 00:30
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
-- Déchargement des données de la table `sexualorientation`
--

INSERT INTO `sexualorientation` (`id`, `code`, `label`, `description`) VALUES
(1, 'str', 'Hétéro', 'Personne exclusivement attirée par les membres du genre opposé.'),
(2, 'gay', 'Gay', 'Terme générique utilisé pour décrire quelqu’un qui est attiré par les personnes du même genre.'),
(3, 'les', 'Lesbienne', 'Femme attirée émotionnellement, romantiquement ou sexuellement par les femmes.'),
(4, 'bi', 'Bisexuel(le)', 'Personne pouvant être attirée émotionnellement, romantiquement ou sexuellement par des personnes de genres différents.'),
(5, 'asex', 'Asexuel(le)', 'Personne qui ne ressent aucune attirance sexuelle.'),
(6, 'demi', 'Demisexuel(le)', 'Personne qui ne ressent aucune attirance sexuelle, sauf en cas de lien émotionnel fort.'),
(7, 'pan', 'Pansexuel(le)', 'Personne pouvant être attirée émotionnellement, romantiquement ou sexuellement par des personnes sans distinction de genre.'),
(8, 'qur', 'Queer', 'Terme générique utilisé pour décrire plusieurs orientations sexuelles et genres, généralement employé pour qualifier les personnes n’étant pas exclusivement hétérosexuelles.'),
(9, 'ques', 'En questionnement', 'Personne qui explore et découvre son orientation sexuelle et/ou son genre.');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
