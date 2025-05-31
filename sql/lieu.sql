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
-- Table structure for table `lieu`
--

CREATE TABLE `lieu` (
  `idLieu` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `coordonnees` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `lieu`
--

INSERT INTO `lieu` (`idLieu`, `description`, `coordonnees`) VALUES
('Adour', 'l’estuaire de l’Adour', '43.6615, -1.0662'),
('Aigues-Mortes', 'Aigues-Mortes', '43.5775, 4.1880'),
('Alpes', 'Alpes', '44.0000, 6.0000'),
('Angleterre', 'Angleterre', '55.3781, -3.4360'),
('Arcachon', 'Arcachon', '44.6572, -1.1581'),
('Bâle', 'Bâle', '47.5596, 7.5886'),
('Barcelone', 'Barcelone', '41.3851, 2.1734'),
('Bayonne', 'Bayonne', '43.4806, -1.4748'),
('Béarn', 'Béarn', '43.3000, -0.3000'),
('Beaulieu', 'Beaulieu', '43.4050, 6.9330'),
('Berlin', 'Berlin', '52.5200, 13.4050'),
('Berne', 'Berne', '46.9480, 7.4474'),
('Blessington', 'Kippure Park, Blessington. Irlande', '53.2025, -6.4875'),
('Bordeaux', 'Bordeaux', '44.8378, -0.5792'),
('Bordighera', 'Bordighera', '43.7833, 7.6167'),
('Boucau', 'Boucau', '43.5500, -1.4333'),
('Boucau de Bayonne', 'Boucau de Bayonne', '43.5500, -1.4333'),
('Brésil', 'Brésil', '-14.2350, -51.9253'),
('Buenos-Ayres', 'Buenos-Ayres', '-34.6037, -58.3816'),
('Cadix', 'Cadix', '36.5271, -6.2886'),
('Cannes', 'Cannes', '43.5528, 7.0174'),
('Cappawhite', 'chez M. Ponneleather, à Cappawhite', '52.6100, -8.2050'),
('Catane', 'Catane', '37.5079, 14.9950'),
('Cévennes', 'Cévennes', '44.0833, 3.9833'),
('Chine', 'Chine', '35.8617, 104.1954'),
('Cuba', 'Cuba', '21.5216, -77.7812'),
('Espagne', 'Espagne', '40.4637, -3.7492'),
('Figueras', 'Figueras', '42.2650, 2.9583'),
('France', 'France', '46.6034, 1.8883'),
('Frejus', 'Fréjus', '43.4333, 6.7500'),
('Gap', 'Gap', '44.5667, 6.0833'),
('Gênes', 'Gênes', '44.4056, 8.9463'),
('Greatest England', 'Greatest England', '55.3781, -3.4360'),
('Guettary', 'Guettary', '43.6000, -1.5000'),
('Hastings', 'Hastings', '50.8580, 0.5730'),
('Huntingdon', 'chez Lady O. Sparron, Bampton Park, Huntingdon.', '52.3290, -0.1830'),
('Hyères', 'Hyères', '43.1200, 6.1167'),
('Irlande', 'Irlande.', '53.4129, -8.2439'),
('Italie', 'Italie', '41.8719, 12.5674'),
('lac de Genève', 'lac de Genève', '46.4167, 6.1667'),
('Landes', 'Landes', '43.6500, -1.2000'),
('Laroche', 'Laroche', '45.5000, 4.0000'),
('Le Boucau', 'Le Boucau', '43.5500, -1.4333'),
('le Grau', 'le Grau', '43.5000, 4.2000'),
('Le Grau du Roi', 'Le Grau du Roi', '43.5250, 4.1450'),
('le Nord', 'le Nord', '50.6000, 3.1667'),
('LeBoucau', 'Le Boucau', '43.5500, -1.4333'),
('les Cévennes', 'les Cévennes', '44.0833, 3.9833'),
('Limoges', 'Limoges', '45.8336, 1.2611'),
('Londres', '26 Tichborne Street, Edeware Road', '51.5155, -0.1640'),
('LxAdour', 'LxAdour', '43.6500, -1.2000'),
('Lyon', 'Lyon', '45.7640, 4.8357'),
('Malaga', 'Malaga', '36.7213, -4.4214'),
('Marseille', 'Marseille', '43.2965, 5.3698'),
('Mazamet', 'Mazamet', '43.3667, 2.5000'),
('Menton', 'Menton', '43.7750, 7.5000'),
('Monaco', 'Monaco', '43.7384, 7.4246'),
('mont Agel', 'mont Agel', '43.7490, 7.3960'),
('Montauban', 'Montauban', '44.0150, 1.3550'),
('Montpellier', 'Montpellier', '43.6119, 3.8767'),
('Moret', 'Moret', '48.3960, 2.9490'),
('Neuwied', 'Neuwied', '50.4280, 7.4660'),
('Nice', 'Nice', '43.7102, 7.2620'),
('Nimes', 'Nîmes', '43.8367, 4.3601'),
('NouvelleGrenade', 'Nouvelle-Grenade', '37.0000, -4.0000'),
('NouvelleOrleans', 'Plantation Fortier, près la Nouvelle-Orléans', '29.9511, -90.0715'),
('Orthez', 'Orthez, Basses-Pyrénées', '43.4900, -0.7333'),
('Paris', 'Paris', '48.8566, 2.3522'),
('Pau', 'Pau', '43.2951, -0.3708'),
('Pons', 'Pons', '45.6340, -0.5160'),
('Puy', 'Puy', '45.4370, 3.8830'),
('Quai de la Fontaine', 'Quai de la Fontaine', '48.8566, 2.3522'),
('Redhill', 'Redhill', '51.2400, -0.1670'),
('Riohacha', 'Riohacha', '11.5440, -72.9070'),
('Rome', 'Rome', '41.9028, 12.4964'),
('Sabadell', 'Sabadell', '41.5430, 2.1090'),
('Saint-Etienne', 'Saint-Etienne', '45.4397, 4.3872'),
('Saint-Georges', 'Saint-Georges', '45.5000, 1.0000'),
('Saint-Jean de Luz', 'Saint-Jean de Luz', '43.3840, -1.6700'),
('Saint-Mandé', 'Saint-Mandé', '48.8480, 2.4260'),
('Sainte-Foy', 'Sainte-Foy', '45.5000, 4.7000'),
('SainteFoy', 'Sainte-Foy', '45.5000, 4.7000'),
('SaintTropez', 'Saint-Tropez', '43.2580, 6.6340'),
('San Remo', 'San Remo', '43.8150, 7.7740'),
('SanAntonio', 'San Antonio, Sierra Nevada', '37.0902, -119.6816'),
('Sandhurst', 'Sandhurst', '51.3500, -0.8000'),
('Sens', 'Sens', '48.2000, 3.3000'),
('Solliès-Farlède', 'Solliès-Farlède', '43.1667, 6.0167'),
('Stettin', 'Stettin', '53.4285, 14.5528'),
('StGeorgesDidonne', 'Saint-Georges de Didonne', '45.6340, -0.9500'),
('Toulon', 'Toulon', '43.1258, 5.9280'),
('Turin', 'Turin', '45.0703, 7.6869'),
('Vascolium', 'Vascolium', '43.5000, 7.5000'),
('Vascœil', 'Vascœil', '49.0000, 0.0000'),
('Vascœuil', 'Vascœuil', '49.0000, 0.0000'),
('Ventimiglia', 'Ventimiglia', '43.8170, 7.5900'),
('Villefranche', 'Villefranche', '43.7000, 7.3000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lieu`
--
ALTER TABLE `lieu`
  ADD PRIMARY KEY (`idLieu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
