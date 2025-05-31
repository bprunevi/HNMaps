-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 31, 2025 at 07:30 PM
-- Server version: 10.5.23-MariaDB-0+deb11u1
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bprunevielle`
--

-- --------------------------------------------------------

--
-- Table structure for table `mention_lieu`
--

CREATE TABLE `mention_lieu` (
  `idLettre` varchar(100) NOT NULL,
  `idLieu` varchar(100) NOT NULL,
  `qualite` set('mention','reception','lesdeux','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `mention_lieu`
--

INSERT INTO `mention_lieu` (`idLettre`, `idLieu`, `qualite`) VALUES
('L.101', 'NouvelleOrleans', 'mention'),
('L.104', 'NouvelleOrleans', 'mention'),
('L.113', 'Riohacha', 'mention'),
('L.117', 'NouvelleGrenade', 'mention'),
('L.121', 'Riohacha', 'mention'),
('L.129', 'Riohacha', 'mention'),
('L.133', 'Riohacha', 'mention'),
('L.141', 'Riohacha', 'mention'),
('L.148', 'Riohacha', 'mention'),
('L.151', 'SanAntonio', 'mention'),
('L.156', 'Riohacha', 'mention'),
('L.159', 'Riohacha', 'mention'),
('L.163', 'Riohacha', 'mention'),
('L.167', 'Riohacha', 'mention'),
('L.168', 'Paris', 'mention'),
('L.169', 'Paris', 'mention'),
('L.173', 'Paris', 'mention'),
('L.175', 'Orthez', 'mention'),
('L.187', 'Paris', 'mention'),
('L.190', 'Stettin', 'mention'),
('L.194', 'Berlin', 'mention'),
('L.198', 'Gap', 'mention'),
('L.201', 'SainteFoy', 'mention'),
('L.203', 'Paris', 'mention'),
('L.205', 'Irlande', 'reception'),
('L.205', 'Paris', 'mention'),
('L.21', 'Neuwied', 'mention'),
('L.21', 'Orthez', 'reception'),
('L.211', 'Figueras', 'mention'),
('L.214', 'Paris', 'mention'),
('L.216', 'Paris', 'mention'),
('L.218', 'SaintTropez', 'mention'),
('L.220', 'Nimes', 'mention'),
('L.224', 'Londres', 'mention'),
('L.23', 'Orthez', 'reception'),
('L.230', 'Vascœuil', 'mention'),
('L.232', 'SainteFoy', 'mention'),
('L.234', 'StGeorgesDidonne', 'mention'),
('L.236', 'Nimes', 'mention'),
('L.240', 'Frejus', 'mention'),
('L.242', 'Hyères', 'mention'),
('L.244', 'Catane', 'mention'),
('L.248', 'Paris', 'mention'),
('L.250', 'Lyon', 'mention'),
('L.250', 'Montauban', 'mention'),
('L.250', 'Paris', 'mention'),
('L.252', 'Bordeaux', 'mention'),
('L.252', 'France', 'mention'),
('L.252', 'Landes', 'mention'),
('L.252', 'Laroche', 'mention'),
('L.252', 'Mazamet', 'mention'),
('L.252', 'Orthez', 'mention'),
('L.252', 'Paris', 'mention'),
('L.252', 'Pau', 'mention'),
('L.252', 'Puy', 'mention'),
('L.252', 'Sainte-Foy', 'mention'),
('L.252', 'Toulon', 'mention'),
('L.254', 'Arcachon', 'mention'),
('L.254', 'Boucau de Bayonne', 'mention'),
('L.254', 'Saint-Georges', 'mention'),
('L.255', 'Adour', 'mention'),
('L.255', 'Arcachon', 'mention'),
('L.255', 'Boucau', 'mention'),
('L.255', 'Le Boucau', 'mention'),
('L.255', 'Saint-Georges', 'mention'),
('L.255', 'Sainte-Foy', 'mention'),
('L.255', 'SainteFoy', 'mention'),
('L.255', 'Vascolium', 'mention'),
('L.257', 'Bayonne', 'mention'),
('L.257', 'Le Boucau', 'mention'),
('L.257', 'LeBoucau', 'mention'),
('L.257', 'LxAdour', 'mention'),
('L.257', 'Saint-Georges', 'mention'),
('L.258', 'Bayonne', 'mention'),
('L.258', 'Guettary', 'mention'),
('L.258', 'Le Boucau', 'mention'),
('L.258', 'LeBoucau', 'mention'),
('L.258', 'LxAdour', 'mention'),
('L.258', 'Saint-Georges', 'mention'),
('L.258', 'Saint-Jean de Luz', 'mention'),
('L.259', 'Bordeaux', 'mention'),
('L.260', 'Paris', 'mention'),
('L.262', 'Paris', 'mention'),
('L.262', 'Rome', 'mention'),
('L.262', 'Vascœuil', 'reception'),
('L.265', 'Berne', 'mention'),
('L.265', 'Paris', 'mention'),
('L.265', 'Vascœil', 'reception'),
('L.267', 'Berne', 'mention'),
('L.267', 'France', 'mention'),
('L.267', 'Italie', 'mention'),
('L.267', 'Paris', 'mention'),
('L.267', 'Saint-Etienne', 'mention'),
('L.269', 'Berne', 'mention'),
('L.269', 'Paris', 'mention'),
('L.269', 'Rome', 'mention'),
('L.269', 'Saint-Etienne', 'mention'),
('L.269', 'Vascœuil', 'reception'),
('L.27', 'Orthez', 'reception'),
('L.271', 'Berne', 'mention'),
('L.271', 'Paris', 'mention'),
('L.271', 'Vascœuil', 'reception'),
('L.273', 'Brésil', 'mention'),
('L.273', 'Paris', 'mention'),
('L.273', 'Vascœuil', 'reception'),
('L.275', 'Paris', 'mention'),
('L.275', 'Vascœuil', 'reception'),
('L.277', 'Buenos-Ayres', 'mention'),
('L.277', 'Paris', 'mention'),
('L.289', 'Paris', 'mention'),
('L.289', 'Vascœuil', 'reception'),
('L.292', 'Vascœuil', 'reception'),
('L.296', 'Paris', 'mention'),
('L.299', 'Paris', 'mention'),
('L.299', 'Vascœuil', 'reception'),
('L.303', 'Espagne', 'reception'),
('L.303', 'Paris', 'mention'),
('L.304', 'Espagne', 'reception'),
('L.304', 'Paris', 'mention'),
('L.305', 'Paris', 'mention'),
('L.31', 'Berlin', 'mention'),
('L.31', 'Orthez', 'reception'),
('L.310', 'Cuba', 'mention'),
('L.310', 'Espagne', 'reception'),
('L.310', 'Paris', 'mention'),
('L.313', 'Espagne', 'reception'),
('L.313', 'Paris', 'mention'),
('L.315', 'Barcelone', 'mention'),
('L.315', 'Espagne', 'reception'),
('L.315', 'Malaga', 'mention'),
('L.315', 'Pons', 'mention'),
('L.315', 'Sabadell', 'mention'),
('L.315', 'Saint-Mandé', 'mention'),
('L.316', 'Barcelone', 'mention'),
('L.316', 'Espagne', 'reception'),
('L.316', 'Malaga', 'mention'),
('L.316', 'Pons', 'mention'),
('L.316', 'Sabadell', 'mention'),
('L.316', 'Saint-Mandé', 'mention'),
('L.318', 'Bordeaux', 'mention'),
('L.318', 'Espagne', 'reception'),
('L.318', 'Paris', 'mention'),
('L.320', 'Paris', 'mention'),
('L.320', 'Vascœuil', 'reception'),
('L.321', 'Paris', 'mention'),
('L.321', 'Vascœuil', 'reception'),
('L.324', 'Bayonne', 'mention'),
('L.324', 'Cévennes', 'mention'),
('L.324', 'Montpellier', 'mention'),
('L.324', 'Orthez', 'mention'),
('L.324', 'Quai de la Fontaine', 'mention'),
('L.326', 'Bayonne', 'mention'),
('L.326', 'Nice', 'mention'),
('L.326', 'Orthez', 'mention'),
('L.327', 'Adour', 'mention'),
('L.327', 'Bayonne', 'mention'),
('L.327', 'Béarn', 'mention'),
('L.327', 'lac de Genève', 'mention'),
('L.327', 'Laroche', 'mention'),
('L.329', 'Arcachon', 'mention'),
('L.329', 'Bordeaux', 'mention'),
('L.329', 'Laroche', 'mention'),
('L.329', 'Nice', 'mention'),
('L.329', 'Nimes', 'mention'),
('L.329', 'Orthez', 'mention'),
('L.329', 'Pons', 'mention'),
('L.331', 'Angleterre', 'mention'),
('L.331', 'Greatest England', 'mention'),
('L.331', 'Limoges', 'mention'),
('L.331', 'Londres', 'mention'),
('L.331', 'Nice', 'mention'),
('L.331', 'Redhill', 'mention'),
('L.331', 'Sandhurst', 'mention'),
('L.333', 'Angleterre', 'mention'),
('L.333', 'Bâle', 'mention'),
('L.333', 'France', 'mention'),
('L.333', 'Hastings', 'mention'),
('L.333', 'Londres', 'mention'),
('L.335', 'Angleterre', 'mention'),
('L.335', 'Londres', 'mention'),
('L.335', 'mont Agel', 'mention'),
('L.335', 'Nice', 'mention'),
('L.335', 'Paris', 'mention'),
('L.335', 'Vascœuil', 'reception'),
('L.337', 'Beaulieu', 'mention'),
('L.337', 'Bordighera', 'mention'),
('L.337', 'Menton', 'mention'),
('L.337', 'Monaco', 'mention'),
('L.337', 'Nice', 'mention'),
('L.337', 'Nimes', 'mention'),
('L.337', 'Sens', 'mention'),
('L.337', 'Vascœuil', 'reception'),
('L.337', 'Villefranche', 'mention'),
('L.341', 'Alpes', 'mention'),
('L.341', 'Beaulieu', 'mention'),
('L.341', 'Bordighera', 'mention'),
('L.341', 'Cannes', 'mention'),
('L.341', 'Gênes', 'mention'),
('L.341', 'Hyères', 'mention'),
('L.341', 'Italie', 'mention'),
('L.341', 'Lyon', 'mention'),
('L.341', 'Marseille', 'mention'),
('L.341', 'Menton', 'mention'),
('L.341', 'Nice', 'mention'),
('L.341', 'Nimes', 'mention'),
('L.341', 'Paris', 'mention'),
('L.341', 'San Remo', 'mention'),
('L.341', 'Sens', 'mention'),
('L.341', 'Solliès-Farlède', 'mention'),
('L.341', 'Turin', 'mention'),
('L.341', 'Vascœuil', 'mention'),
('L.341', 'Ventimiglia', 'mention'),
('L.344', 'Barcelone', 'mention'),
('L.344', 'Cadix', 'mention'),
('L.344', 'Cuba', 'mention'),
('L.344', 'Espagne', 'mention'),
('L.344', 'Nimes', 'mention'),
('L.344', 'Orthez', 'mention'),
('L.346', 'Aigues-Mortes', 'mention'),
('L.346', 'Chine', 'mention'),
('L.346', 'le Grau', 'mention'),
('L.346', 'Le Grau du Roi', 'mention'),
('L.346', 'le Nord', 'mention'),
('L.346', 'les Cévennes', 'mention'),
('L.346', 'Moret', 'mention'),
('L.346', 'Nimes', 'mention'),
('L.346', 'Orthez', 'mention'),
('L.346', 'Paris', 'mention'),
('L.35', 'Berlin', 'mention'),
('L.35', 'Orthez', 'reception'),
('L.38', 'Berlin', 'mention'),
('L.38', 'Orthez', 'reception'),
('L.47', 'Londres', 'mention'),
('L.49', 'Londres', 'mention'),
('L.50', 'Huntingdon', 'reception'),
('L.50', 'Londres', 'mention'),
('L.54', 'Irlande', 'reception'),
('L.54', 'Londres', 'mention'),
('L.56', 'Londres', 'mention'),
('L.59', 'Blessington', 'mention'),
('L.62', 'Blessington', 'mention'),
('L.64', 'Blessington', 'mention'),
('L.65', 'Cappawhite', 'mention'),
('L.73', 'NouvelleOrleans', 'mention'),
('L.75', 'NouvelleOrleans', 'mention'),
('L.78', 'NouvelleOrleans', 'mention'),
('L.82', 'NouvelleOrleans', 'mention'),
('L.85', 'NouvelleOrleans', 'mention'),
('L.88', 'NouvelleOrleans', 'mention'),
('L.91', 'NouvelleOrleans', 'mention'),
('L.95', 'NouvelleOrleans', 'mention'),
('L.99', 'NouvelleOrleans', 'mention');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mention_lieu`
--
ALTER TABLE `mention_lieu`
  ADD PRIMARY KEY (`idLettre`,`idLieu`),
  ADD KEY `idLieu` (`idLieu`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mention_lieu`
--
ALTER TABLE `mention_lieu`
  ADD CONSTRAINT `idLettre_lieu` FOREIGN KEY (`idLettre`) REFERENCES `lettres` (`idLettre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idLieu` FOREIGN KEY (`idLieu`) REFERENCES `lieu` (`idLieu`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
