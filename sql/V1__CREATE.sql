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
-- Structure de la table `alcohol`
--

CREATE TABLE `alcohol` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `astrologicalsign`
--

CREATE TABLE `astrologicalsign` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `badge`
--

CREATE TABLE `badge` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bloodgroup`
--

CREATE TABLE `bloodgroup` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `communication`
--

CREATE TABLE `communication` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `familyprojects`
--

CREATE TABLE `familyprojects` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `foodpreferences`
--

CREATE TABLE `foodpreferences` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `languageoflove`
--

CREATE TABLE `languageoflove` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `levelstudy`
--

CREATE TABLE `levelstudy` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personality`
--

CREATE TABLE `personality` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pet`
--

CREATE TABLE `pet` (
  `id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

CREATE TABLE `photo` (
  `id` int(11) NOT NULL,
  `id_photo_tinder` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `crop_info` varchar(1024) DEFAULT NULL,
  `image` blob DEFAULT NULL,
  `image_blurred` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `latitude` decimal(30,20) NOT NULL,
  `longitude` decimal(30,20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `school`
--

CREATE TABLE `school` (
  `id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sexualorientation`
--

CREATE TABLE `sexualorientation` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sleephabits`
--

CREATE TABLE `sleephabits` (
  `id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `smokingfrequency`
--

CREATE TABLE `smokingfrequency` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `socialnetworks`
--

CREATE TABLE `socialnetworks` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `relationshipintent`
--

CREATE TABLE `relationshipintent` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sport`
--

CREATE TABLE `sport` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `userbadge`
--

CREATE TABLE `userbadge` (
  `user_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `userlanguage`
--

CREATE TABLE `userlanguage` (
  `user_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `id_tinder` varchar(255) NOT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `sexual_orientation_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `measurement` int(11) DEFAULT NULL,
  `astrological_sign_id` int(11) DEFAULT NULL,
  `level_study_id` int(11) DEFAULT NULL,
  `family_projects_id` int(11) DEFAULT NULL,
  `covid_vaccine` tinyint(1) DEFAULT NULL,
  `personality_id` int(11) DEFAULT NULL,
  `communication_id` int(11) DEFAULT NULL,
  `language_of_love_id` int(11) DEFAULT NULL,
  `blood_group_id` int(11) DEFAULT NULL,
  `pet_id` int(11) DEFAULT NULL,
  `alcohol_id` int(11) DEFAULT NULL,
  `smoking_frequency_id` int(11) DEFAULT NULL,
  `sport_id` int(11) DEFAULT NULL,
  `food_preferences_id` int(11) DEFAULT NULL,
  `social_networks_id` int(11) DEFAULT NULL,
  `sleep_habits_id` int(11) DEFAULT NULL,
  `relationship_intent_id` int(11) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `position_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `alcohol`
--
ALTER TABLE `alcohol`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `astrologicalsign`
--
ALTER TABLE `astrologicalsign`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `badge`
--
ALTER TABLE `badge`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bloodgroup`
--
ALTER TABLE `bloodgroup`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `communication`
--
ALTER TABLE `communication`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `familyprojects`
--
ALTER TABLE `familyprojects`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `foodpreferences`
--
ALTER TABLE `foodpreferences`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `languageoflove`
--
ALTER TABLE `languageoflove`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `levelstudy`
--
ALTER TABLE `levelstudy`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personality`
--
ALTER TABLE `personality`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sexualorientation`
--
ALTER TABLE `sexualorientation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sleephabits`
--
ALTER TABLE `sleephabits`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `smokingfrequency`
--
ALTER TABLE `smokingfrequency`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `socialnetworks`
--
ALTER TABLE `socialnetworks`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `relationshipintent`
--
ALTER TABLE `relationshipintent`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sport`
--
ALTER TABLE `sport`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `userbadge`
--
ALTER TABLE `userbadge`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `badge_id` (`badge_id`);

--
-- Index pour la table `userlanguage`
--
ALTER TABLE `userlanguage`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `astrological_sign_id` (`astrological_sign_id`),
  ADD KEY `level_study_id` (`level_study_id`),
  ADD KEY `family_projects_id` (`family_projects_id`),
  ADD KEY `personality_id` (`personality_id`),
  ADD KEY `communication_id` (`communication_id`),
  ADD KEY `language_of_love_id` (`language_of_love_id`),
  ADD KEY `blood_group_id` (`blood_group_id`),
  ADD KEY `pet_id` (`pet_id`),
  ADD KEY `alcohol_id` (`alcohol_id`),
  ADD KEY `smoking_frequency_id` (`smoking_frequency_id`),
  ADD KEY `sport_id` (`sport_id`),
  ADD KEY `food_preferences_id` (`food_preferences_id`),
  ADD KEY `social_networks_id` (`social_networks_id`),
  ADD KEY `relationship_intent_id` (`relationship_intent_id`),
  ADD KEY `sleep_habits_id` (`sleep_habits_id`),
  ADD KEY `fk_position_id` (`position_id`),
  ADD KEY `sexual_orientation_id` (`sexual_orientation_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `alcohol`
--
ALTER TABLE `alcohol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `astrologicalsign`
--
ALTER TABLE `astrologicalsign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `badge`
--
ALTER TABLE `badge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bloodgroup`
--
ALTER TABLE `bloodgroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `communication`
--
ALTER TABLE `communication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `familyprojects`
--
ALTER TABLE `familyprojects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `foodpreferences`
--
ALTER TABLE `foodpreferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `languageoflove`
--
ALTER TABLE `languageoflove`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `levelstudy`
--
ALTER TABLE `levelstudy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personality`
--
ALTER TABLE `personality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pet`
--
ALTER TABLE `pet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `photo`
--
ALTER TABLE `photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `school`
--
ALTER TABLE `school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sexualorientation`
--
ALTER TABLE `sexualorientation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sleephabits`
--
ALTER TABLE `sleephabits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `smokingfrequency`
--
ALTER TABLE `smokingfrequency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `socialnetworks`
--
ALTER TABLE `socialnetworks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `relationshipintent`
--
ALTER TABLE `relationshipintent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sport`
--
ALTER TABLE `sport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `userbadge`
--
ALTER TABLE `userbadge`
  ADD CONSTRAINT `userbadge_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `userbadge_ibfk_2` FOREIGN KEY (`badge_id`) REFERENCES `badge` (`id`);

--
-- Contraintes pour la table `userlanguage`
--
ALTER TABLE `userlanguage`
  ADD CONSTRAINT `userlanguage_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `userlanguage_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_position_id` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`),
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`),
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`astrological_sign_id`) REFERENCES `astrologicalsign` (`id`),
  ADD CONSTRAINT `users_ibfk_5` FOREIGN KEY (`level_study_id`) REFERENCES `levelstudy` (`id`),
  ADD CONSTRAINT `users_ibfk_6` FOREIGN KEY (`family_projects_id`) REFERENCES `familyprojects` (`id`),
  ADD CONSTRAINT `users_ibfk_7` FOREIGN KEY (`personality_id`) REFERENCES `personality` (`id`),
  ADD CONSTRAINT `users_ibfk_8` FOREIGN KEY (`communication_id`) REFERENCES `communication` (`id`),
  ADD CONSTRAINT `users_ibfk_9` FOREIGN KEY (`language_of_love_id`) REFERENCES `languageoflove` (`id`),
  ADD CONSTRAINT `users_ibfk_10` FOREIGN KEY (`blood_group_id`) REFERENCES `bloodgroup` (`id`),
  ADD CONSTRAINT `users_ibfk_11` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`id`),
  ADD CONSTRAINT `users_ibfk_12` FOREIGN KEY (`alcohol_id`) REFERENCES `alcohol` (`id`),
  ADD CONSTRAINT `users_ibfk_13` FOREIGN KEY (`smoking_frequency_id`) REFERENCES `smokingfrequency` (`id`),
  ADD CONSTRAINT `users_ibfk_14` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`id`),
  ADD CONSTRAINT `users_ibfk_15` FOREIGN KEY (`food_preferences_id`) REFERENCES `foodpreferences` (`id`),
  ADD CONSTRAINT `users_ibfk_16` FOREIGN KEY (`social_networks_id`) REFERENCES `socialnetworks` (`id`),
  ADD CONSTRAINT `users_ibfk_17` FOREIGN KEY (`sleep_habits_id`) REFERENCES `sleephabits` (`id`),
  ADD CONSTRAINT `users_ibfk_18` FOREIGN KEY (`sexual_orientation_id`) REFERENCES `sexualorientation` (`id`),
  ADD CONSTRAINT `users_ibfk_19` FOREIGN KEY (`relationship_intent_id`) REFERENCES `relationshipintent` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
