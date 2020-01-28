-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 08 mars 2019 à 11:47
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

DROP DATABASE IF EXISTS expressfood;
CREATE DATABASE expressfood CHARACTER SET 'utf8';
USE expressfood;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `expressfood`
--

-- ------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id_adresse` smallint NOT NULL AUTO_INCREMENT,
  `numero` tinyint NOT NULL,
  `rue` varchar(60) NOT NULL,
  `code_postal` smallint NOT NULL,
  `ville` varchar(30) NOT NULL,
  PRIMARY KEY (`id_adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id_adresse`, `numero`, `rue`, `code_postal`, `ville`) VALUES
(1, 5, 'Rue Armand Dutreix', 87000, 'Limoges'),
(2, 39, 'Rue Sainte-Claire', 87000, 'Limoges'),
(3, 85, 'Rue Louis Casimir Ranson', 87000, 'Limoges'),
(4, 116, 'Rue François Perrin', 87000, 'Limoges'),
(5, 23, 'Rue du Clos Augier', 87000, 'Limoges');

-- --------------------------------------------------------

--
-- Structure de la table `adresse_client`
--

DROP TABLE IF EXISTS `adresse_client`;
CREATE TABLE IF NOT EXISTS `adresse_client` (
  `id_adresse` smallint NOT NULL,
  `id_client` smallint NOT NULL,
  PRIMARY KEY (`id_adresse`,`id_client`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse_client`
--

INSERT INTO `adresse_client` (`id_adresse`, `id_client`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` SMALLINT NOT NULL AUTO_INCREMENT,
  `nom` char(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom`, `prenom`, `telephone`) VALUES
(1, 'John', 'Doe', '0555000000'),
(2, 'Jane', 'Doe', '0555000001'),
(3, 'John', 'Doz', '0555000002'),
(4, 'Jane', 'Doz', '0555000002');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `id_client` SMALLINT NOT NULL,
  `date_creation` timestamp NOT NULL,
  `date_livraison` timestamp NULL DEFAULT NULL,
  `prix` decimal(6,2) NOT NULL,
  `paye` tinyint(1) NOT NULL,
  `id_statut_commande` TINYINT NOT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `id_client` (`id_client`),
  KEY `id_statut_commande` (`id_statut_commande`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `id_client`, `date_creation`, `date_livraison`, `prix`, `paye`, `id_statut_commande`) VALUES
(1, 1, '2019-03-05 22:00:00', NULL, '35.90', 1, 2),
(2, 2, '2019-03-07 22:00:00', NULL, '24.90', 0, 1),
(3, 3, '2019-03-07 22:00:00', '2019-03-07 22:00:00', '12.90', 1, 3),
(4, 4, '2019-03-07 22:00:00', NULL, '12.99', 0, 4);

-- --------------------------------------------------------

--
-- Structure de la table `commande_livreur`
--

DROP TABLE IF EXISTS `commande_livreur`;
CREATE TABLE IF NOT EXISTS `commande_livreur` (
  `id_commande` MEDIUMINT NOT NULL,
  `id_livreur` tinyint NOT NULL,
  PRIMARY KEY (`id_commande`,`id_livreur`),
  KEY `id_livreur` (`id_livreur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande_livreur`
--

INSERT INTO `commande_livreur` (`id_commande`, `id_livreur`) VALUES
(1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `commande_menu`
--

DROP TABLE IF EXISTS `commande_menu`;
CREATE TABLE IF NOT EXISTS `commande_menu` (
  `id_commande` MEDIUMINT NOT NULL,
  `id_menu` tinyint NOT NULL,
  `quantite` tinyint NOT NULL,
  PRIMARY KEY (`id_commande`,`id_menu`),
  KEY `id_menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande_menu`
--

INSERT INTO `commande_menu` (`id_commande`, `id_menu`, `quantite`) VALUES
(1, 1, 2),
(1, 5, 2);


-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `id_livreur` tinyint NOT NULL AUTO_INCREMENT,
  `id_status_livreur` TINYINT NOT NULL,
  `nom` varchar(20) NOT NULL,
  `longitude` decimal(8,6) NOT NULL,
  `latitude` decimal(8,6) NOT NULL,
  PRIMARY KEY (`id_livreur`,`id_status_livreur`),
  KEY `id_status_livreur` (`id_status_livreur`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`id_livreur`, `id_status_livreur`, `nom`, `longitude`, `latitude`) VALUES
(1, 1, 'John', '2.287592', '48.862725'),
(2, 2, 'Jane', '1.276300', '45.845000'),
(3, 1, 'Dozeur', '1.256400', '45.831400'),
(4, 3, 'Danish', '1.247300', '45.831800');

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id_menu` tinyint NOT NULL AUTO_INCREMENT,
  `date_du_jour` date NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prix` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`id_menu`, `date_du_jour`, `nom`, `prix`) VALUES
(1, '2019-03-03', 'Hamburger', '9.99'),
(3, '2019-03-05', 'Salade César', '12.99'),
(4, '2019-03-01', 'Brownie', '4.99'),
(5, '2019-03-05', 'Cookies', '2.99');

-- --------------------------------------------------------

--
-- Structure de la table `menu_livreur`
--

DROP TABLE IF EXISTS `menu_livreur`;
CREATE TABLE IF NOT EXISTS `menu_livreur` (
  `id_menu` tinyint NOT NULL,
  `id_livreur` tinyint NOT NULL,
  `quantite` tinyint NOT NULL,
  PRIMARY KEY (`id_menu`,`id_livreur`),
  KEY `id_livreur` (`id_livreur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `menu_livreur`
--

INSERT INTO `menu_livreur` (`id_menu`, `id_livreur`, `quantite`) VALUES
(1, 1, 5),
(1, 2, 5),
(1, 3, 5),
(1, 4, 5),
(3, 1, 5),
(3, 2, 5),
(3, 3, 5),
(3, 4, 5),
(4, 1, 5),
(4, 2, 5),
(4, 3, 5),
(4, 4, 5),
(5, 1, 5),
(5, 2, 5),
(5, 3, 5),
(5, 4, 5);

-- --------------------------------------------------------

--
-- Structure de la table `statut_commande`
--

DROP TABLE IF EXISTS `statut_commande`;
CREATE TABLE IF NOT EXISTS `statut_commande` (
  `id_statut_commande` TINYINT NOT NULL AUTO_INCREMENT,
  `statut` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_statut_commande`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statut_commande`
--

INSERT INTO `statut_commande` (`id_statut_commande`, `statut`) VALUES
(1, 'EN ATTENTE'),
(2, 'EN LIVRAISON'),
(3, 'LIVRER'),
(4, 'ANNULER');

-- --------------------------------------------------------

--
-- Structure de la table `statut_livreur`
--

DROP TABLE IF EXISTS `statut_livreur`;
CREATE TABLE IF NOT EXISTS `statut_livreur` (
  `id_statut_livreur` TINYINT NOT NULL AUTO_INCREMENT,
  `statut` varchar(15) NOT NULL,
  PRIMARY KEY (`id_statut_livreur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statut_livreur`
--

INSERT INTO `statut_livreur` (`id_statut_livreur`, `statut`) VALUES
(1, 'DISPONIBLE'),
(2, 'INDISPONBLE'),
(3, 'EN LIVRAISON');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse_client`
--
ALTER TABLE `adresse_client`
  ADD CONSTRAINT `adresse_client_ibfk_1` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`),
  ADD CONSTRAINT `adresse_client_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`id_statut_commande`) REFERENCES `statut_commande` (`id_statut_commande`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande_livreur`
--
ALTER TABLE `commande_livreur`
  ADD CONSTRAINT `commande_livreur_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `commande_livreur_ibfk_2` FOREIGN KEY (`id_livreur`) REFERENCES `livreur` (`id_livreur`);

--
-- Contraintes pour la table `commande_menu`
--
ALTER TABLE `commande_menu`
  ADD CONSTRAINT `commande_menu_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `commande_menu_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `livreur_ibfk_1` FOREIGN KEY (`id_status_livreur`) REFERENCES `statut_livreur` (`id_statut_livreur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `menu_livreur`
--
ALTER TABLE `menu_livreur`
  ADD CONSTRAINT `menu_livreur_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`),
  ADD CONSTRAINT `menu_livreur_ibfk_2` FOREIGN KEY (`id_livreur`) REFERENCES `livreur` (`id_livreur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
