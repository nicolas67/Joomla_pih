-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 28 Mars 2016 à 10:33
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `joomla`
--

-- --------------------------------------------------------

--
-- Structure de la table `joo_alfcontact`
--

CREATE TABLE IF NOT EXISTS `joo_alfcontact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `bcc` varchar(255) NOT NULL,
  `prefix` varchar(255) NOT NULL,
  `extra` text NOT NULL,
  `defsubject` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `access` tinyint(3) unsigned NOT NULL,
  `language` char(7) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `joo_alfcontact`
--

INSERT INTO `joo_alfcontact` (`id`, `name`, `email`, `bcc`, `prefix`, `extra`, `defsubject`, `ordering`, `access`, `language`, `published`) VALUES
(1, 'Sales', 'sales@mysite.com', 'archive@mysite.com', '[Sales]', 'Client No:\nOrder No:\nItem No:', 'Order inquiry', 1, 1, 'en-GB', 0),
(2, 'Verkoop', 'verkoop@mijnsite.nl', 'archief@mijnsite.nl', '[Verkoop]', 'Klant Nr:\nOrder Nr:\nItem Nr:', 'Order navraag', 2, 1, 'nl-NL', 0),
(3, 'Webmaster', '', 'webmaster@mysite.com', '[Webmaster]', '', '', 3, 1, '*', 0),
(4, 'Support', '', 'support1@mysite.com\nsupport2@mysite.com\nsupport3@mysite.com', '[Support]', '', 'Question', 4, 2, '*', 0);

-- --------------------------------------------------------

--
-- Structure de la table `joo_assets`
--

CREATE TABLE IF NOT EXISTS `joo_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=111 ;

--
-- Contenu de la table `joo_assets`
--

INSERT INTO `joo_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 215, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 112, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.options":[],"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 113, 114, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 115, 116, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 117, 118, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 119, 120, 1, 'com_login', 'com_login', '{}'),
(13, 1, 121, 122, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 123, 124, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 125, 126, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 127, 128, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.options":[],"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 129, 130, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 131, 182, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 183, 186, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 187, 188, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 189, 190, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 191, 192, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 193, 194, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 195, 198, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(26, 1, 199, 200, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 33, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 184, 185, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 196, 197, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 201, 202, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 203, 204, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 1, 205, 206, 1, 'com_tags', 'com_tags', '{"core.admin":[],"core.manage":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(36, 1, 207, 208, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(37, 1, 209, 210, 1, 'com_ajax', 'com_ajax', '{}'),
(38, 1, 211, 212, 1, 'com_postinstall', 'com_postinstall', '{}'),
(39, 18, 132, 133, 2, 'com_modules.module.1', 'Menu principal', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(40, 18, 134, 135, 2, 'com_modules.module.2', 'Login', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(41, 18, 136, 137, 2, 'com_modules.module.3', 'Popular Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(42, 18, 138, 139, 2, 'com_modules.module.4', 'Recently Added Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(43, 18, 140, 141, 2, 'com_modules.module.8', 'Toolbar', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(44, 18, 142, 143, 2, 'com_modules.module.9', 'Quick Icons', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(45, 18, 144, 145, 2, 'com_modules.module.10', 'Logged-in Users', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(46, 18, 146, 147, 2, 'com_modules.module.12', 'Admin Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(47, 18, 148, 149, 2, 'com_modules.module.13', 'Admin Submenu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(48, 18, 150, 151, 2, 'com_modules.module.14', 'User Status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(49, 18, 152, 153, 2, 'com_modules.module.15', 'Title', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(50, 18, 154, 155, 2, 'com_modules.module.16', 'Connexion', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(51, 18, 156, 157, 2, 'com_modules.module.17', 'fil d''ariane', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(52, 18, 158, 159, 2, 'com_modules.module.79', 'Multilanguage status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(53, 18, 160, 161, 2, 'com_modules.module.86', 'Joomla Version', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(54, 27, 19, 20, 3, 'com_content.article.1', 'Main', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(55, 27, 21, 22, 3, 'com_content.article.2', 'Qui sommes-nous ?', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(56, 27, 23, 24, 3, 'com_content.article.3', 'Offres d''emploi', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(57, 27, 25, 26, 3, 'com_content.article.4', 'Devenir locataire', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(58, 1, 213, 214, 1, 'com_alfcontact', 'COM_ALFCONTACT', '{"core.admin":[],"core.manage":[],"core.create":[],"core.delete":[]}'),
(59, 18, 162, 163, 2, 'com_modules.module.87', 'Menu bas de page', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(60, 61, 35, 36, 3, 'com_content.article.5', 'Visitez notre patrimoine', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(61, 8, 34, 39, 2, 'com_content.category.8', 'informations', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(62, 8, 40, 43, 2, 'com_content.category.9', 'locations', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(63, 8, 44, 49, 2, 'com_content.category.10', 'aide', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(64, 27, 27, 28, 3, 'com_content.article.6', 'Mentions légales', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(65, 63, 45, 46, 3, 'com_content.article.7', 'Liens utiles', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(66, 27, 29, 30, 3, 'com_content.article.8', 'F.A.Q.', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(67, 63, 47, 48, 3, 'com_content.article.9', 'Contact', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(68, 61, 37, 38, 3, 'com_content.article.10', 'Travaux en cours', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(69, 8, 50, 59, 2, 'com_content.category.11', 'Actus', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(70, 8, 60, 67, 2, 'com_content.category.12', 'Espace Pro', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(71, 8, 68, 81, 2, 'com_content.category.13', 'Espace locataire', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(72, 8, 82, 83, 2, 'com_content.category.14', 'Visitez notre patrimoine', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(73, 8, 84, 101, 2, 'com_content.category.15', 'Devenir locataire', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(74, 8, 102, 103, 2, 'com_content.category.16', 'Consulter nos logements', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(75, 8, 104, 105, 2, 'com_content.category.17', 'Logements etudiants', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(76, 71, 73, 74, 3, 'com_content.category.18', 'payez votre loyer', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(77, 8, 106, 107, 2, 'com_content.category.19', 'Qui sommes-nous ?', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(78, 8, 108, 109, 2, 'com_content.category.20', 'F.A.Q.', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(79, 73, 87, 88, 3, 'com_content.article.11', 'Plafonds et textes de loi', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(80, 27, 31, 32, 3, 'com_content.article.12', 'APL', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(81, 73, 85, 86, 3, 'com_content.article.13', 'Droits et oblgations', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(82, 71, 69, 70, 3, 'com_content.article.14', 'Coordonnées des gardiens / astreinte', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(83, 73, 89, 90, 3, 'com_content.article.15', 'Modalités et Infos pratiques', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(84, 73, 91, 92, 3, 'com_content.article.16', 'Conditions de ressources', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(85, 18, 164, 165, 2, 'com_modules.module.88', 'Comment obtenir un logement ?', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(86, 18, 166, 167, 2, 'com_modules.module.89', 'menu espace locataire', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(87, 18, 168, 169, 2, 'com_modules.module.90', 'map_pih', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(88, 18, 170, 171, 2, 'com_modules.module.91', 'pih_map', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(89, 18, 172, 173, 2, 'com_modules.module.92', 'Devenir locataire sousmenu', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(90, 18, 174, 175, 2, 'com_modules.module.93', ' Comment obtenir un logement ?', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(91, 18, 176, 177, 2, 'com_modules.module.94', 'Recherche d''un garage, un parcking ?', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(92, 18, 178, 179, 2, 'com_modules.module.95', 'Recherche d''un local, d''un commerce ?', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(93, 18, 180, 181, 2, 'com_modules.module.96', 'Vous êtes étudiant ?', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(94, 73, 93, 94, 3, 'com_content.category.21', 'Comment obtenir un logement', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(95, 73, 95, 96, 3, 'com_content.category.22', 'Recherche garage-parcking', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(96, 73, 99, 100, 3, 'com_content.category.23', 'Recherche local - commerce', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(97, 73, 97, 98, 3, 'com_content.category.24', 'Vous êtes étudiant', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(98, 71, 71, 72, 3, 'com_content.category.25', 'accès au compte et dossier locatif', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(99, 71, 75, 76, 3, 'com_content.category.26', 'Infos utiles - Occupation du logement', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(100, 71, 77, 78, 3, 'com_content.category.27', 'faire une demande d''échange', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(101, 71, 79, 80, 3, 'com_content.category.28', 'quitter votre logement', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(102, 70, 61, 62, 3, 'com_content.category.29', 'Liste des marchés', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(103, 70, 63, 64, 3, 'com_content.category.30', 'consultations en cours', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(104, 70, 65, 66, 3, 'com_content.category.31', 'procédure', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(105, 69, 51, 52, 3, 'com_content.category.32', 'Travaux en cours', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(106, 69, 57, 58, 3, 'com_content.category.33', 'Constructions en cours', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(107, 69, 53, 54, 3, 'com_content.category.34', 'A vendre / Location-accession', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(108, 69, 55, 56, 3, 'com_content.category.35', 'Info générale', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(109, 62, 41, 42, 3, 'com_content.category.36', 'logements disponibles', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(110, 8, 110, 111, 2, 'com_content.category.37', 'Offres d''emploi', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}');

-- --------------------------------------------------------

--
-- Structure de la table `joo_associations`
--

CREATE TABLE IF NOT EXISTS `joo_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_banners`
--

CREATE TABLE IF NOT EXISTS `joo_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `joo_banner_clients`
--

CREATE TABLE IF NOT EXISTS `joo_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `joo_banner_tracks`
--

CREATE TABLE IF NOT EXISTS `joo_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_categories`
--

CREATE TABLE IF NOT EXISTS `joo_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Contenu de la table `joo_categories`
--

INSERT INTO `joo_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 71, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '{}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(8, 61, 1, 11, 12, 1, 'informations', 'com_content', 'informations', 'informations', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-02-28 21:20:09', 0, '2016-02-28 21:20:09', 0, '*', 1),
(9, 62, 1, 13, 16, 1, 'locations', 'com_content', 'locations', 'locations', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-02-28 21:21:06', 0, '2016-02-28 21:21:06', 0, '*', 1),
(10, 63, 1, 17, 18, 1, 'aide', 'com_content', 'aide', 'aide', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-16 17:58:42', 0, '2016-03-16 17:58:42', 0, '*', 1),
(11, 69, 1, 19, 28, 1, 'actus', 'com_content', 'Actus', 'actus', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-16 19:33:29', 0, '2016-03-16 19:33:29', 0, '*', 1),
(12, 70, 1, 29, 36, 1, 'espace-pro', 'com_content', 'Espace Pro', 'espace-pro', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-16 19:33:42', 0, '2016-03-16 19:33:42', 0, '*', 1),
(13, 71, 1, 37, 48, 1, 'espace-locataire', 'com_content', 'Espace locataire', 'espace-locataire', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-16 19:33:54', 0, '2016-03-16 19:33:54', 0, '*', 1),
(14, 72, 1, 49, 50, 1, 'visitez-notre-patrimoine', 'com_content', 'Visitez notre patrimoine', 'visitez-notre-patrimoine', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-16 19:34:01', 0, '2016-03-16 19:34:01', 0, '*', 1),
(15, 73, 1, 51, 60, 1, 'devenir-locataire', 'com_content', 'Devenir locataire', 'devenir-locataire', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-16 19:34:12', 0, '2016-03-16 19:34:12', 0, '*', 1),
(16, 74, 1, 61, 62, 1, 'consulter-nos-logements', 'com_content', 'Consulter nos logements', 'consulter-nos-logements', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-16 19:34:47', 0, '2016-03-16 19:34:47', 0, '*', 1),
(17, 75, 1, 63, 64, 1, 'logements-etudiants', 'com_content', 'Logements etudiants', 'logements-etudiants', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-16 19:35:07', 0, '2016-03-16 19:35:07', 0, '*', 1),
(18, 76, 13, 40, 41, 2, 'espace-locataire/payez-votre-loyer', 'com_content', 'payez votre loyer', 'payez-votre-loyer', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-16 19:35:20', 502, '2016-03-18 09:54:33', 0, '*', 1),
(19, 77, 1, 65, 66, 1, 'qui-sommes-nous', 'com_content', 'Qui sommes-nous ?', 'qui-sommes-nous', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-16 19:35:33', 0, '2016-03-16 19:35:33', 0, '*', 1),
(20, 78, 1, 67, 68, 1, 'f-a-q', 'com_content', 'F.A.Q.', 'f-a-q', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-16 19:36:15', 0, '2016-03-16 19:36:15', 0, '*', 1),
(21, 94, 15, 52, 53, 2, 'devenir-locataire/comment-obtenir-un-logement', 'com_content', 'Comment obtenir un logement', 'comment-obtenir-un-logement', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-18 09:50:27', 0, '2016-03-18 09:50:27', 0, '*', 1),
(22, 95, 15, 54, 55, 2, 'devenir-locataire/recherche-garage-parcking', 'com_content', 'Recherche garage-parcking', 'recherche-garage-parcking', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-18 09:51:02', 0, '2016-03-18 09:51:02', 0, '*', 1),
(23, 96, 15, 58, 59, 2, 'devenir-locataire/recherche-local-commerce', 'com_content', 'Recherche local - commerce', 'recherche-local-commerce', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-18 09:51:33', 502, '2016-03-18 09:52:34', 0, '*', 1),
(24, 97, 15, 56, 57, 2, 'devenir-locataire/vous-etes-etudiant', 'com_content', 'Vous êtes étudiant', 'vous-etes-etudiant', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-18 09:52:16', 0, '2016-03-18 09:52:16', 0, '*', 1),
(25, 98, 13, 38, 39, 2, 'espace-locataire/acces-au-compte-et-dossier-locatif', 'com_content', 'accès au compte et dossier locatif', 'acces-au-compte-et-dossier-locatif', '', '', 1, 0, '0000-00-00 00:00:00', 2, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-18 09:53:54', 502, '2016-03-18 09:56:23', 0, '*', 1),
(26, 99, 13, 42, 43, 2, 'espace-locataire/infos-utiles-occupation-du-logement', 'com_content', 'Infos utiles - Occupation du logement', 'infos-utiles-occupation-du-logement', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-18 09:55:49', 0, '2016-03-18 09:55:49', 0, '*', 1),
(27, 100, 13, 44, 45, 2, 'espace-locataire/faire-une-demande-d-echange', 'com_content', 'faire une demande d''échange', 'faire-une-demande-d-echange', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-18 09:57:10', 0, '2016-03-18 09:57:10', 0, '*', 1),
(28, 101, 13, 46, 47, 2, 'espace-locataire/quitter-votre-logement', 'com_content', 'quitter votre logement', 'quitter-votre-logement', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-18 09:57:50', 0, '2016-03-18 09:57:50', 0, '*', 1),
(29, 102, 12, 30, 31, 2, 'espace-pro/liste-des-marches', 'com_content', 'Liste des marchés', 'liste-des-marches', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-18 09:59:56', 0, '2016-03-18 09:59:56', 0, '*', 1),
(30, 103, 12, 32, 33, 2, 'espace-pro/consultations-en-cours', 'com_content', 'consultations en cours', 'consultations-en-cours', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-18 10:00:24', 0, '2016-03-18 10:00:24', 0, '*', 1),
(31, 104, 12, 34, 35, 2, 'espace-pro/procedure', 'com_content', 'procédure', 'procedure', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-18 10:00:35', 502, '2016-03-18 10:01:34', 0, '*', 1),
(32, 105, 11, 20, 21, 2, 'actus/travaux-en-cours', 'com_content', 'Travaux en cours', 'travaux-en-cours', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-18 10:02:48', 0, '2016-03-18 10:02:48', 0, '*', 1),
(33, 106, 11, 22, 23, 2, 'actus/constructions-en-cours', 'com_content', 'Constructions en cours', 'constructions-en-cours', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-18 10:03:03', 502, '2016-03-18 10:04:39', 0, '*', 1),
(34, 107, 11, 24, 25, 2, 'actus/a-vendre-location-accession', 'com_content', 'A vendre / Location-accession', 'a-vendre-location-accession', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-18 10:03:57', 0, '2016-03-18 10:03:57', 0, '*', 1),
(35, 108, 11, 26, 27, 2, 'actus/info-generale', 'com_content', 'Info générale', 'info-generale', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-18 10:04:15', 0, '2016-03-18 10:04:15', 0, '*', 1),
(36, 109, 9, 14, 15, 2, 'locations/logements-disponibles', 'com_content', 'logements disponibles', 'logements-disponibles', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-18 10:09:03', 0, '2016-03-18 10:09:03', 0, '*', 1),
(37, 110, 1, 69, 70, 1, 'offres-d-emploi', 'com_content', 'Offres d''emploi', 'offres-d-emploi', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 502, '2016-03-18 10:12:29', 0, '2016-03-18 10:12:29', 0, '*', 1);

-- --------------------------------------------------------

--
-- Structure de la table `joo_contact_details`
--

CREATE TABLE IF NOT EXISTS `joo_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `joo_content`
--

CREATE TABLE IF NOT EXISTS `joo_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `joo_content`
--

INSERT INTO `joo_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 54, 'Main', 'main', '<p>this is the main article on the main page</p>\r\n<p> </p>', '', 1, 2, '2016-01-27 13:16:01', 502, '', '2016-01-27 13:16:01', 0, 0, '0000-00-00 00:00:00', '2016-01-27 13:16:01', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 10, '', '', 1, 469, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(2, 55, 'Qui sommes-nous ?', 'qui-sommes-nous', '<p> </p>\r\n<p><b>Presqu’île Habitat est l''Office Public de l’Habitat de la Communauté urbaine de Cherbourg (CUC).<br /> <br /> Situé au 1 rue de Nancy à Cherbourg-Octeville, son siège social se trouve au coeur de son <a href="http://www.presquile-habitat.fr/visite-patrimoine-logement-communaute-urbaine-de-cherbourg.html">patrimoine</a>. <br /> <span style="font-size: medium;"><br /> Les horaires d''ouverture du siège : du lundi au vendredi, de 9h à 12h00 et de 13h30 à 17h00</span><br /> <br /> </b></p>\r\n<p><em>"Avec un patrimoine de 7755</em><em> logements situés sur la CUC, Presqu’île Habitat loge environ 18000 habitants, soit environ 20% de de la population de l’agglomération cherbourgeoise. <br /> <br /> Au travers de son histoire, l''office a évolué et dispose aujourd’hui d’un parc immobilier bâti avec les décideurs locaux et les professionnels de l’urbanisme et de l’architecture.<br /> <br /> La satisfaction des locataires est essentielle dans la politique menée par Presqu''île Habitat : cela passe par des opérations de rénovation et réhabilitation, par le suivi des demandes, par le traitement des réclamations...<br /> <br /> Nous avons également mis en place une stratégie énergétique afin de maîtriser les charges locatives et économiser les énergies. Des travaux importants d''isolation ont été réalisés et les nouvelles constructions répondent aux critères THPE (Très Haute Performance Energétique).<br /> Notre but est de contenir le montant des charges locatives alors que le prix des énergies augmente.<br /> <br /> L''objectif majeur de Presqu''Ile Habitat est d''assurer une qualité de service optimum."</em></p>', '', 1, 2, '2016-02-28 16:50:11', 502, '', '2016-02-28 16:50:11', 0, 0, '0000-00-00 00:00:00', '2016-02-28 16:50:11', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 9, '', '', 1, 9, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(3, 56, 'Offres d''emploi', 'offres-d-emploi', '<p> </p>\r\n<p>Vous souhaitez travailler pour Presqu''île Habitat ? Toutes nos offres d''emploi sont disponibles dans cette rubrique, envoyez-nous votre candidature d''un simple clic.</p>\r\n<p> </p>\r\n<div class="offre">\r\n<p><a class="pole icon" href="http://www.pole-emploi.fr/">Site du Pôle Emploi</a> - <a href="https://www.apec.fr/" target="_blank">Site de l''APEC</a></p>\r\n</div>\r\n<p>Aucune offre d''emploi n''est actuellement en ligne.</p>', '', 1, 2, '2016-02-28 17:05:24', 502, '', '2016-02-28 17:05:24', 0, 0, '0000-00-00 00:00:00', '2016-02-28 17:05:24', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 8, '', '', 1, 8, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(4, 57, 'Devenir locataire', 'devenir-locataire', '<h1>Vous cherchez un logement</h1>\r\n<p>Pour devenir locataire (logements familiaux ou logements étudiants) de Presqu’Ile Habitat, Office Public de l’Habitat de la Communauté urbaine de Cherbourg, vous devez préalablement être inscrit sur le fichier central du logement. <br /> <b>Nos bureaux sont ouverts du lundi au vendredi, de 9h00 à 12h00 et de 13h30 à 17h00.</b></p>\r\n<div style="line-height: 120%; margin-bottom: 0cm;"> </div>\r\n<div style="line-height: 120%; margin-bottom: 0cm;"><span style="font-size: large;"><b>Comment s’inscrire ?<br /> <br /> <br /> </b></span></div>\r\n<ul>\r\n<li><strong><span style="font-size: x-large;">S''enregistrer sur Internet : </span></strong><span style="font-size: x-large;"><br /> </span></li>\r\n</ul>\r\n<p><strong>A compter du 10 octobre 2014, vous pouvez enregistrer directement votre demande de logement en ligne en cliquant sur le lien suivant :  </strong><strong><a href="http://www.demandelogement50.fr/imhowebgp-prod/">https://www.demandelogement50.fr</a><br /> <br /> <br /> </strong></p>\r\n<ul>\r\n<li><strong><span style="font-size: x-large;">Remplir un formulaire papier de demande de logement : </span><br /> </strong></li>\r\n</ul>\r\n<div style="line-height: 120%; margin-bottom: 0cm;"><strong>1<sup>ère</sup> étape </strong>: Vous devez <strong>remplir un formulaire</strong> de demande que vous pouvez vous procurer :</div>\r\n<ul>\r\n<li>\r\n<div style="line-height: 120%; margin-bottom: 0cm;">Auprès de votre Mairie ;</div>\r\n</li>\r\n<li>auprès du Service Logement de la CUC (7<span style="color: #000000;"> <span style="font-size: 9pt;"><span style="font-style: normal;">rue Tour Carrée, BP 808, 50108 CHERBOURG-OCTEVILLE - Tél : 02 33 08 26 45) ;</span></span><span style="font-size: small;"><span style="font-style: normal;"><span style="font-size: medium;"><br /> </span></span></span></span></li>\r\n<li><span style="color: #000000;"><span style="font-size: small;"><span style="font-style: normal;"><span style="font-size: medium;"><span style="color: #000000;"><span style="font-size: 9pt;"><span style="font-style: normal;">auprès de Presqu''Ile Habitat (1 rue de Nancy, CS 30122, 50101 CHERBOURG-OCTEVILLE cedex - Tél : 02 33 87 84 00).</span></span></span></span></span></span></span></li>\r\n</ul>\r\n<ul>\r\n<li>\r\n<div style="line-height: 120%; margin-bottom: 0cm;"><strong><span style="color: #000000;">sur ce site</span></strong><span style="color: #000000;"> (voir imprimé en pièce jointe ci-dessous)<br /> <br /> </span></div>\r\n</li>\r\n</ul>\r\n<p><strong>2<sup>ème</sup> étape</strong> : Votre formulaire de demande et les pièces justificatives sont à déposer ou à envoyer :  </p>\r\n<ul>\r\n<li>\r\n<div style="line-height: 120%; margin-bottom: 0cm;">à votre Mairie si vous habitez déjà sur la CUC ;<br />  </div>\r\n</li>\r\n<li>\r\n<div style="line-height: 120%; margin-bottom: 0cm;">au Service Logement de la CUC (<span style="font-size: smaller;">7<span style="color: #000000;"><span style="font-size: 9pt;"><span style="font-style: normal;"> rue Tour Carrée, BP 808, 50108 CHERBOURG-OCTEVILLE - Tél :02 33 08 26 45) si vous résidez hors CUC ;<br /> </span></span></span></span></div>\r\n<div style="line-height: 120%; margin-bottom: 0cm;"> </div>\r\n</li>\r\n<li>ou <strong>directement à Presqu''Ile Habitat </strong>(1 rue de Nancy, CS 30122, 50101 CHERBOURG-OCTEVILLE cedex - Tél : 02 33 87 84 00). Votre dossier sera alors instruit et des propositions pourront vous être faites.</li>\r\n</ul>\r\n<p><em>Vous devez fournir la photocopie de votre pièce d''identité ou de votre titre de séjour uniquement pour la transmission du dossier par courrier.<br /> Une simple présentation de cette pièce est suffisante si vous déposez votre dossier.</em></p>\r\n<p><b>Dans un délai d''un mois vous recevrez par courrier une attestation sur laquelle figure votre NUMERO UNIQUE DEPARTEMENTAL. Vous êtes désormais inscrit sur le fichier départemental de demandeurs de logement.<br /> </b><br /> Vous pouvez prendre contact avec Presqu’Ile Habitat pour connaître les logements disponibles :<br /> =&gt; en envoyant un mail à l''adresse suivante : <strong><br /> demande-logement@presquile-habitat.fr</strong><br /> =&gt; en appelant au 02.33.87.84.00<br /> =&gt; en vous rendant au siège de Presqu''Ile Habitat, 1 rue de Nancy à Cherbourg-Octeville<br /> <br />  <br /> <b>Vous êtes intéressé par un logement</b><br /> Votre dossier sera examiné avec d’autres candidatures en commission d’attribution de logement.<br /> Cette commission se réunit tous les 10 jours environ et décide du candidat retenu en fonction de critères sociaux, d’ancienneté, d’urgence et de mixité sociale.</p>\r\n<h2>Documents à télécharger</h2>\r\n<p> </p>', '', 1, 2, '2016-02-28 17:17:23', 502, '', '2016-02-28 17:17:23', 0, 0, '0000-00-00 00:00:00', '2016-02-28 17:17:23', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 7, '', '', 1, 108, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(5, 60, 'Visitez notre patrimoine', 'visitez-notre-patrimoine', '<p>{mosmap width=''800''|height=''400''|Largeur=''800''|Hauteur=''400''|lat=''49.6337308''|lon=''-1.6221370''|zoom=''13''|mapType=''Normal''|text=''sv DWO''|tooltip=''DWO''|marker=''0''|align=''center'' }</p>', '', 1, 8, '2016-02-28 21:04:16', 502, '', '2016-03-16 18:05:53', 502, 0, '0000-00-00 00:00:00', '2016-02-28 21:04:16', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"0","info_block_position":"0","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"0","link_author":"","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 14, 1, '', '', 1, 55, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(6, 64, 'Mentions légales', 'mentions-legales', '<p>lois</p>', '', 1, 2, '2016-03-16 17:59:06', 502, '', '2016-03-16 17:59:06', 0, 0, '0000-00-00 00:00:00', '2016-03-16 17:59:06', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 6, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(7, 65, 'Liens utiles', 'liens-utiles', '<ul style="display: block;">\r\n<li><a href="http://conseil.general.manche.fr/FSL.asp">Le Fonds de Solidarité pour le Logement (FSL) - Conseil Général</a></li>\r\n<li><a href="http://wwwd.caf.fr/wps/portal/caffr/aidesetservices/lesservicesenligne/estimervosdroits/lelogement">Calcul d''aide au logement</a></li>\r\n<li><a href="http://www.caf.fr/">Site de la Caisse d''Allocations Familiales</a></li>\r\n<li><a href="http://www.logiliance-ouest.fr/">Site de Logiliance Ouest</a></li>\r\n</ul>', '', 1, 10, '2016-03-16 17:59:48', 502, '', '2016-03-16 19:38:38', 502, 0, '0000-00-00 00:00:00', '2016-03-16 17:59:48', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, '', '', 1, 11, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(8, 66, 'F.A.Q.', 'f-a-q', '<p>aide</p>', '', 1, 2, '2016-03-16 18:00:24', 502, '', '2016-03-16 18:00:24', 0, 0, '0000-00-00 00:00:00', '2016-03-16 18:00:24', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 5, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(9, 67, 'Contact', 'contact', '<p>{mosmap width=''250''|height=''300''|Largeur=''250''|Hauteur=''300''|zoom=''16''|mapType=''Normal''|text=''</p>\r\n<div align="left"><strong>Presqu''île Habitat</strong><br /> 1 rue de Nancy - CS 30122 50101 CHERBOURG OCTEVILLE Cedex<br /> Tel : 02 33 87 84 00<br />Fax : 02 33 08 03 67</div>\r\n<p>''|tooltip=''<strong>Presqu''île Habitat</strong>''|marker=''0''|align=''center''|address=''Presqu''île Habitat, 1 rue de Nancy, 50101, CHERBOURG OCTEVILLE''}</p>\r\n<p><strong>Presqu''île Habitat</strong><br /> 1 rue de Nancy - CS 30122<br /> 50101 CHERBOURG OCTEVILLE Cedex</p>\r\n<p>Tel : 02 33 87 84 00<br /> Fax : 02 33 08 03 67</p>\r\n<p>{component index.php?option=com_alfcontact&amp;view=alfcontact}</p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>', '', 1, 10, '2016-03-16 18:16:10', 502, '', '2016-03-17 11:00:34', 502, 502, '2016-03-17 11:00:34', '2016-03-16 18:16:10', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 9, 4, '', '', 1, 693, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(10, 68, 'Travaux en cours', 'travaux-en-cours', '<h4>"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."</h4>\r\n<h5>"Il n’y a personne qui n’aime la souffrance pour elle-même, qui ne la recherche et qui ne la veuille pour elle-même…"</h5>\r\n<div style="float: right; margin-left: 6px; margin-bottom: 6px;"><a href="http://www.cafepress.com/lipsum/" target="_blank"><img src="http://fr.lipsum.com/images/lipsum07.gif" alt="Lipsum" width="100" height="100" border="0" /></a><br /><a href="http://www.cafepress.com/lipsum/" target="_blank"><img src="http://fr.lipsum.com/images/lipsum08.gif" alt="Lipsum" width="100" height="100" border="0" /></a><br /><a href="http://www.cafepress.com/lipsum/" target="_blank"><img src="http://fr.lipsum.com/images/lipsum04.gif" alt="Lipsum" width="100" height="100" border="0" /></a><br /><a href="http://www.cafepress.com/lipsum/" target="_blank"><img src="http://fr.lipsum.com/images/lipsum05.gif" alt="Lipsum" width="100" height="100" border="0" /></a></div>\r\n<div id="lipsum">\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam leo felis, dictum in neque nec, posuere commodo nibh. Donec euismod volutpat sagittis. Ut sollicitudin tempus ante quis porttitor. Nullam eu nunc viverra urna mattis rhoncus. Phasellus odio ligula, ullamcorper ut leo sed, molestie sollicitudin tortor. Mauris pharetra sodales tempus. Integer sed pharetra arcu. Etiam tempus magna mi, eu sagittis augue commodo quis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Etiam in justo dapibus, dignissim diam et, feugiat dolor.</p>\r\n<p>Donec tincidunt nunc vitae ligula maximus, sit amet vestibulum augue sollicitudin. Mauris eros eros, vehicula sed malesuada eget, tristique ut neque. Aliquam ligula dolor, vehicula in tempus nec, egestas pellentesque diam. Pellentesque volutpat malesuada orci sed gravida. Nulla tristique eros ac tortor aliquam, sed euismod velit rhoncus. Mauris ultrices dignissim enim, ut eleifend augue fermentum ac. Mauris egestas nisl eget euismod condimentum. Maecenas ut urna quis ligula eleifend suscipit ut id augue. Vivamus id eros massa. Praesent dapibus ut est auctor pellentesque. In dictum malesuada orci. In efficitur laoreet tempus. Proin cursus est mauris, ut feugiat odio gravida quis. Ut porttitor egestas gravida. Ut tempus consectetur neque sit amet imperdiet. Donec ac sodales est.</p>\r\n<p>Mauris viverra, erat nec pharetra hendrerit, lectus orci posuere sem, ut faucibus urna risus facilisis nisl. Aliquam faucibus vitae dui ut suscipit. Aliquam vehicula lacinia finibus. Cras luctus turpis lacus, in pharetra sem interdum sit amet. In quis hendrerit mauris. Donec faucibus arcu eget orci mattis tristique. Etiam lorem nunc, lacinia non neque a, pellentesque pharetra libero.</p>\r\n<p>Vivamus tincidunt finibus pretium. Morbi porta id ex vitae finibus. Vestibulum sed nisi vel lorem tempus pulvinar. Nullam euismod tristique nunc ac iaculis. Aenean pretium, est eu rutrum maximus, nisl ipsum porttitor diam, id commodo justo sapien eu libero. Suspendisse placerat tortor sit amet dolor dictum faucibus. In euismod massa laoreet, ullamcorper nibh vitae, tincidunt est. Maecenas eleifend arcu a est bibendum, id maximus mi faucibus. Nulla rhoncus aliquet enim, sed eleifend ex aliquam vitae. Sed posuere, urna ut dapibus ullamcorper, dolor libero malesuada lacus, id aliquet erat libero sed odio. Vivamus ut libero ex. Fusce sit amet est nec erat ornare blandit quis a orci. Pellentesque vulputate ultricies tortor ut convallis.</p>\r\n<p>Praesent semper et diam ac sollicitudin. Aliquam vestibulum nisi a urna pretium ultrices. Nam vulputate hendrerit dictum. Ut venenatis purus sed tincidunt ultrices. Nulla nec lectus suscipit, commodo sapien vel, accumsan mi. Aliquam sed consequat elit. Aliquam tristique nisi lorem, sit amet varius dui rhoncus sed. Proin quis lacus pellentesque, rutrum massa sit amet, lobortis leo. Fusce porta massa sit amet dui fringilla maximus.</p>\r\n</div>', '', 1, 8, '2016-03-16 18:49:11', 502, '', '2016-03-16 19:05:27', 502, 0, '0000-00-00 00:00:00', '2016-03-16 18:49:11', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(11, 79, 'Plafonds et textes de loi', 'plafonds-et-textes-de-loi', '<p> </p>\r\n<ul>\r\n<li>Duis ornare libero pellentesque massa tincidunt egestas.</li>\r\n<li>Etiam eu quam vitae mi dictum dapibus.</li>\r\n<li>Etiam at enim vel felis commodo tincidunt ac ultrices purus.</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Phasellus tempor purus sit amet mauris tincidunt dignissim.</li>\r\n<li>Vestibulum sodales leo ac lectus pulvinar accumsan.</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Nam posuere lacus sit amet tortor ullamcorper convallis.</li>\r\n<li>In aliquet tortor a diam efficitur, ut placerat nisl sagittis.</li>\r\n<li>Ut non metus mollis, ornare massa ut, iaculis urna.</li>\r\n<li>Duis pulvinar felis quis molestie mattis.</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Suspendisse dapibus mauris sit amet purus eleifend sagittis.</li>\r\n<li>Praesent placerat arcu in eleifend ultricies.</li>\r\n<li>Sed consectetur odio id elit vulputate aliquet.</li>\r\n<li>Morbi imperdiet tellus luctus scelerisque bibendum.</li>\r\n<li>In molestie dui id velit viverra auctor.</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Nam bibendum nulla sed justo consectetur, non malesuada nisi ornare.</li>\r\n<li>Donec rutrum tellus id nibh cursus, quis condimentum ante mattis.</li>\r\n<li>Mauris in velit finibus, pharetra sapien a, blandit nulla.</li>\r\n</ul>\r\n<p>Praesent eget diam molestie neque tincidunt sodales. Praesent a consectetur ligula, in congue ligula. Nam sed ipsum suscipit orci pretium semper in id sem. Vivamus ligula nunc, dignissim eget felis nec, condimentum semper sapien. Donec diam nibh, laoreet at egestas at, tempor a ligula. Sed nec dictum dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam tincidunt nulla in dolor sollicitudin elementum.</p>\r\n<p>Nulla facilisi. Morbi ut fermentum dui, et imperdiet leo. Vestibulum consectetur erat ligula, ac sollicitudin ipsum varius non. Sed congue eleifend vulputate. Proin varius ligula sed velit imperdiet lobortis. Sed eget consequat dui, eu lacinia massa. In faucibus in augue nec vehicula. Duis sed nulla in nibh mattis faucibus ut in lectus. Integer accumsan tempus tincidunt. Donec id massa sit amet diam gravida pellentesque tempor a est. Duis hendrerit purus in sapien ornare venenatis. Curabitur eleifend accumsan lacus, ac eleifend risus aliquet sit amet.</p>\r\n<p>Proin pretium sapien libero, vitae interdum ante vehicula eget. Nunc at arcu ac mauris ultrices dignissim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec varius, sapien ut vehicula eleifend, magna tortor bibendum massa, sit amet dapibus odio magna in diam. Duis nec luctus purus. Proin rhoncus metus ac justo egestas, in laoreet augue luctus. Duis ullamcorper feugiat eros pharetra accumsan.</p>\r\n<p>Maecenas tristique augue ac mi vestibulum, ut iaculis sem rutrum. Maecenas id augue ex. Duis lobortis tincidunt lobortis. Fusce convallis convallis dui nec luctus. Mauris in malesuada justo, in euismod diam. Donec sed nisi in erat consequat rhoncus. Aliquam dapibus ac lorem sit amet porttitor.</p>\r\n<p>Sed imperdiet velit arcu, rhoncus auctor tellus volutpat eget. Curabitur enim ipsum, consectetur nec erat a, rutrum congue lectus. Nulla volutpat diam arcu, ac viverra ante rhoncus nec. In imperdiet, nisl vitae imperdiet convallis, arcu nisl euismod tellus, ut consequat sem elit et mauris. Cras tristique mauris dolor, sit amet lacinia mauris auctor eu. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut eu purus vitae ipsum eleifend scelerisque in vel neque</p>', '', 1, 15, '2016-03-16 19:51:22', 502, '', '2016-03-16 20:05:58', 502, 0, '0000-00-00 00:00:00', '2016-03-16 19:51:22', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 3, '', '', 1, 13, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(12, 80, 'APL', 'apl', '<ul>\r\n<li>Nunc molestie sapien a ex tincidunt finibus.</li>\r\n<li>Sed pulvinar arcu ut lorem semper sagittis.</li>\r\n<li>Morbi lobortis dolor ac commodo molestie.</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Quisque vel elit tincidunt, mattis dolor vitae, pellentesque libero.</li>\r\n<li>Curabitur facilisis purus et justo mollis fermentum.</li>\r\n<li>Donec vel metus feugiat, suscipit mi at, consectetur lorem.</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Mauris eget justo sit amet nibh elementum bibendum at eu ipsum.</li>\r\n<li>Nam vulputate velit eget erat consequat, quis malesuada ex commodo.</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Sed non augue non sapien interdum hendrerit quis vitae magna.</li>\r\n<li>Aliquam blandit tellus a erat porttitor cursus vel sit amet ligula.</li>\r\n<li>Quisque ac nisi sit amet orci suscipit sagittis.</li>\r\n<li>Nullam dapibus mi sit amet est ultrices, et rutrum nulla lobortis.</li>\r\n<li>Curabitur ullamcorper lorem id urna facilisis, in vehicula ligula lacinia.</li>\r\n</ul>\r\n<p> </p>\r\n<ul>\r\n<li>Nunc eu nibh vestibulum sem laoreet egestas sit amet vel sem.</li>\r\n<li>Aenean vulputate enim vel tempor commodo.</li>\r\n<li>Nullam vestibulum tellus vitae tortor rutrum auctor.</li>\r\n<li>Aliquam eget metus posuere, malesuada ipsum vel, eleifend odio.</li>\r\n<li>Cras vestibulum arcu vitae pulvinar condimentum.</li>\r\n</ul>', '', -2, 2, '2016-03-16 19:54:17', 502, '', '2016-03-16 19:54:17', 0, 0, '0000-00-00 00:00:00', '2016-03-16 19:54:17', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 2, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(13, 81, 'Droits et oblgations', 'droits-et-oblgations', '<div id="lipsum">\r\n<h2><span style="text-decoration: underline;"><strong>APL</strong></span></h2>\r\n<p>Quisque ut dui eget dolor faucibus consequat tempor vel nisl. Aenean odio justo, rutrum egestas sapien quis, viverra efficitur elit. Donec dui leo, ornare a erat eget, egestas varius lectus. Sed auctor, tortor eu venenatis auctor, neque purus accumsan ex, eget volutpat ex risus ut ipsum. Donec in sapien ut ex pharetra mattis ut vel lectus. Vivamus vitae ipsum scelerisque, cursus augue non, lobortis erat. Cras justo diam, placerat in massa quis, lobortis tempus sem. Mauris tempus, mauris vitae ultrices posuere, purus leo aliquam velit, non tincidunt sapien lectus eu sapien. Nam quis eros vitae diam varius eleifend. Aliquam dapibus erat augue, non volutpat dui tempus sit amet. Donec ac justo tellus. Etiam volutpat ligula sit amet neque pharetra viverra. Integer ac mi tincidunt, eleifend sapien nec, mattis nulla.</p>\r\nIn hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque in purus volutpat, aliquam turpis nec, finibus mi. Aliquam libero lectus, euismod id dignissim ut, feugiat vel lacus. Vestibulum condi.\r\n<h2> </h2>\r\n<p>In id posuere dui. Morbi ac porta felis, ac gravida nunc. Nullam at metus eleifend, sagittis sem aliquet, dignissim sapien. In euismod non ipsum vel sagittis. Nam auctor leo elit, at lacinia tellus semper in. Etiam tempus turpis eu dui bibendum dignissim. Quisque sed odio libero. Maecenas maximus, ante sit amet fermentum aliquet, tellus mi eleifend nulla, quis tincidunt lectus arcu ut odio. Praesent malesuada imperdiet nibh nec porta. Etiam rhoncus, elit sit amet viverra consequat, dui lacus commodo augue, suscipit tincidunt magna justo sit amet erat. Aliquam vehicula sapien convallis luctus tristique.</p>\r\n<p> </p>\r\n<h2><span style="text-decoration: underline;"><strong>Règlement intérieur</strong></span></h2>\r\n<p>Curabitur eget urna viverra, lacinia sem eleifend, tincidunt tortor. Aliquam fringilla ipsum turpis. Donec congue semper nisi sed scelerisque. Sed fringilla quis augue ac consequat. Vestibulum viverra at mauris eget sagittis. Nulla fringilla sollicitudin libero, eu consequat ante vulputate ac. Aenean nec mauris nec eros faucibus cursus eget nec eros. Nunc a neque et odio accumsan consectetur. Etiam volutpat sapien arcu, ultrices ullamcorper turpis ullamcorper pharetra. Morbi interdum ultrices lorem in egestas. Pellentesque dignissim, dui id vulputate euismod, nulla diam sodales libero, vel tincidunt lectus ligula vel nisi. Suspendisse a dignissim felis. Donec ac augue sed libero elementum vestibulum eu ut lorem. Nullam ac semper quam, et egestas nulla. Duis posuere maximus arcu scelerisque accumsan.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et enim sed lorem suscipit euismod. Morbi faucibus orci tortor, eu condimentum elit posuere non. Duis aliquet nisi vel ex mattis scelerisque. Aliquam erat volutpat. Mauris porta dui nisl, sed dapibus ante hendrerit id. Etiam rhoncus eget mauris et imperdiet. Etiam varius aliquam diam, quis placerat magna. Curabitur id ultricies est, vitae facilisis erat. Aenean vitae arcu non est faucibus convallis vitae eget erat. Donec consequat turpis eu auctor elementum. Fusce vitae ligula id est congue feugiat a in purus. Quisque in condimentum odio. Praesent pellentesque ante vitae sapien laoreet semper.</p>\r\n<p>In id posuere dui. Morbi ac porta felis, ac gravida nunc. Nullam at metus eleifend, sagittis sem aliquet, dignissim sapien. In euismod non ipsum vel sagittis. Nam auctor leo elit, at lacinia tellus semper in. Etiam tempus turpis eu dui bibendum dignissim. Quisque sed odio libero. Maecenas maximus, ante sit amet fermentum aliquet, tellus mi eleifend nulla, quis tincidunt lectus arcu ut odio. Praesent malesuada imperdiet nibh nec porta. Etiam rhoncus, elit sit amet viverra consequat, dui lacus commodo augue, suscipit tincidunt magna justo sit amet erat. Aliquam vehicula sapien convallis luctus tristique.</p>\r\n<p>Duis mollis ac elit et porttitor. Curabitur augue sapien, pulvinar in arcu porttitor, condimentum bibendum mauris. Morbi hendrerit orci sed quam porttitor, quis egestas sem convallis. Donec iaculis felis eu turpis fringilla, et maximus quam posuere. Quisque diam tortor, faucibus eget lorem non, aliquet viverra tortor. Proin tincidunt in mauris vitae eleifend. Donec varius ullamcorper nisl quis blandit. Duis vitae ipsum nec odio placerat faucibus. Curabitur gravida neque a metus viverra, sit amet finibus ex ultricies. Curabitur accumsan nulla sed ex hendrerit, eget faucibus nisl volutpat. Aenean eleifend id dui at faucibus. Phasellus lobortis dignissim tempus. Aenean massa nisl, pretium non sollicitudin non, finibus quis metus. Proin ultrices lacus nisl. Curabitur porttitor pretium urna, ut dictum sapien blandit ac. Cras vel sapien vulputate risus laoreet ullamcorper ut vitae elit.</p>\r\n<p>Quisque ut dui eget dolor faucibus consequat tempor vel nisl. Aenean odio justo, rutrum egestas sapien quis, viverra efficitur elit. Donec dui leo, ornare a erat eget, egestas varius lectus. Sed auctor, tortor eu venenatis auctor, neque purus accumsan ex, eget volutpat ex risus ut ipsum. Donec in sapien ut ex pharetra mattis ut vel lectus. Vivamus vitae ipsum scelerisque, cursus augue non, lobortis erat. Cras justo diam, placerat in massa quis, lobortis tempus sem. Mauris tempus, mauris vitae ultrices posuere, purus leo aliquam velit, non tincidunt sapien lectus eu sapien. Nam quis eros vitae diam varius eleifend. Aliquam dapibus erat augue, non volutpat dui tempus sit amet. Donec ac justo tellus. Etiam volutpat ligula sit amet neque pharetra viverra. Integer ac mi tincidunt, eleifend sapien nec, mattis nulla.</p>\r\n<p>In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque in purus volutpat, aliquam turpis nec, finibus mi. Aliquam libero lectus, euismod id dignissim ut, feugiat vel lacus. Vestibulum condimentum ut leo dignissim faucibus. Vestibulum mattis nisl nibh, et imperdiet urna consequat nec. Morbi vitae maximus lectus, condimentum tincidunt neque. Nulla pellentesque ex nulla, non consectetur nisl ullamcorper dignissim. Integer porta interdum massa et lacinia. Nullam mollis libero eget facilisis lobortis. Pellentesque vitae vehicula nisi. In sagittis lacus id nulla molestie, eu aliquam felis accumsan. Vivamus id sem purus. Nulla non blandit mauris. Nullam id molestie nisi, a scelerisque sapien. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>\r\n</div>', '', 1, 15, '2016-03-16 19:55:13', 502, '', '2016-03-16 20:05:21', 502, 0, '0000-00-00 00:00:00', '2016-03-16 19:55:13', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 2, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(14, 82, 'Coordonnées des gardiens / astreinte', 'coordonnees-des-gardiens-astreinte', '<select>\r\n<option>gardien 1</option>\r\n<option>gardien 2</option>\r\n<option>gardien 3</option>\r\n<option>gardien 4</option>\r\n</select>', '', 1, 13, '2016-03-16 19:58:05', 502, '', '2016-03-16 20:02:06', 502, 0, '0000-00-00 00:00:00', '2016-03-16 19:58:05', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(15, 83, 'Modalités et Infos pratiques', 'modalites-et-infos-pratiques', '<h3>Le passage de Lorem Ipsum standard, utilisé depuis 1500</h3>\r\n<p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>\r\n<h3>Section 1.10.32 du "De Finibus Bonorum et Malorum" de Ciceron (45 av. J.-C.)</h3>\r\n<p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"</p>\r\n<h3>Traduction de H. Rackham (1914)</h3>\r\n<p>"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"</p>\r\n<h3>Section 1.10.33 du "De Finibus Bonorum et Malorum" de Ciceron (45 av. J.-C.)</h3>\r\n<p>"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."</p>', '', 1, 15, '2016-03-16 20:06:46', 502, '', '2016-03-16 20:06:46', 0, 0, '0000-00-00 00:00:00', '2016-03-16 20:06:46', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 1, '', '', 1, 16, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(16, 84, 'Conditions de ressources', 'conditions-de-ressources', '<div id="lipsum">\r\n<p>{module Comment obtenir un logement ?}</p>\r\n<p>Praesent ut accumsan leo. Praesent ac diam a nisl imperdiet bibendum. Morbi ipsum dolor, ultricies quis purus et, accumsan posuere metus. Donec ultrices, lorem vel maximus vulputate, odio ipsum euismod nisl, ut efficitur odio nisl feugiat justo. Vestibulum laoreet massa at blandit semper. Phasellus fringilla porta metus, quis placerat magna rutrum non. Integer elementum ipsum eget nulla faucibus, et finibus arcu finibus. Aenean at tellus sit amet risus pretium tincidunt. In mauris magna, vestibulum in pulvinar in, pharetra ac neque. Phasellus eu odio eget nulla sollicitudin ullamcorper non non ipsum. Nulla facilisi. Sed tincidunt velit ut odio tempus interdum. Integer interdum erat nibh, nec facilisis elit mollis ac. Praesent bibendum massa eget quam pulvinar ultrices. Nulla tempus nunc nec posuere consequat. Mauris turpis mi, congue nec leo id, interdum congue dui.</p>\r\n<p>Proin eu dolor tellus. Ut dignissim, augue sit amet pretium cursus, massa felis mattis nunc, vitae mollis justo lacus et diam. Suspendisse dictum augue ac metus aliquet, non posuere orci vestibulum. Nam condimentum neque orci, eu volutpat diam porta eget. Etiam vitae lacus at urna bibendum fermentum. In pellentesque ut dui eget egestas. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus at risus nulla. Curabitur cursus magna purus. Nunc gravida nulla eget nunc interdum ornare. Sed imperdiet ex ac leo pharetra, at rhoncus enim luctus.</p>\r\n<p>Nulla vel nisl nec velit condimentum tempor. Aliquam et eleifend purus, sed varius nisl. Mauris aliquet sapien in scelerisque ultricies. Sed rutrum dolor id mauris condimentum facilisis. Vivamus turpis magna, cursus quis erat et, fringilla sodales orci. Cras venenatis velit sapien, nec varius sapien sodales ut. Duis ac ex sapien. In malesuada felis et tempor euismod. Pellentesque pharetra nulla vitae volutpat aliquet. Ut condimentum velit ut velit feugiat tempus. Vivamus a blandit arcu, nec malesuada quam. Donec bibendum arcu vel ex porttitor pellentesque.</p>\r\n<p>In aliquet, enim quis lacinia venenatis, odio dui suscipit est, id pretium sapien mi id leo. Curabitur mattis leo id maximus suscipit. Morbi urna velit, tempor id feugiat in, efficitur id turpis. Sed a nisi vestibulum, fermentum ante aliquam, semper turpis. Vestibulum pulvinar dui lectus, ac ornare risus vulputate id. Proin luctus condimentum volutpat. Duis scelerisque sem eu lorem vestibulum laoreet.</p>\r\n</div>', '', 1, 15, '2016-03-16 20:07:36', 502, '', '2016-03-17 12:59:55', 502, 0, '0000-00-00 00:00:00', '2016-03-16 20:07:36', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, '', '', 1, 25, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

-- --------------------------------------------------------

--
-- Structure de la table `joo_contentitem_tag_map`
--

CREATE TABLE IF NOT EXISTS `joo_contentitem_tag_map` (
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_tag` (`tag_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps items from content tables to tags';

-- --------------------------------------------------------

--
-- Structure de la table `joo_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `joo_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_content_rating`
--

CREATE TABLE IF NOT EXISTS `joo_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_content_types`
--

CREATE TABLE IF NOT EXISTS `joo_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `table` varchar(255) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `field_mappings` text NOT NULL,
  `router` varchar(255) NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `joo_content_types`
--

INSERT INTO `joo_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{"special":{"dbtable":"#__content","key":"id","type":"Content","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"introtext", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"attribs", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"asset_id"}, "special":{"fulltext":"fulltext"}}', 'ContentHelperRoute::getArticleRoute', '{"formFile":"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml", "hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(2, 'Contact', 'com_contact.contact', '{"special":{"dbtable":"#__contact_details","key":"id","type":"Contact","prefix":"ContactTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"address", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"image", "core_urls":"webpage", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"con_position":"con_position","suburb":"suburb","state":"state","country":"country","postcode":"postcode","telephone":"telephone","fax":"fax","misc":"misc","email_to":"email_to","default_con":"default_con","user_id":"user_id","mobile":"mobile","sortname1":"sortname1","sortname2":"sortname2","sortname3":"sortname3"}}', 'ContactHelperRoute::getContactRoute', '{"formFile":"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml","hideFields":["default_con","checked_out","checked_out_time","version","xreference"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"], "displayLookup":[ {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ] }'),
(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{"special":{"dbtable":"#__newsfeeds","key":"id","type":"Newsfeed","prefix":"NewsfeedsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"numarticles":"numarticles","cache_time":"cache_time","rtl":"rtl"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{"formFile":"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml","hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(4, 'User', 'com_users.user', '{"special":{"dbtable":"#__users","key":"id","type":"User","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"null","core_alias":"username","core_created_time":"registerdate","core_modified_time":"lastvisitDate","core_body":"null", "core_hits":"null","core_publish_up":"null","core_publish_down":"null","access":"null", "core_params":"params", "core_featured":"null", "core_metadata":"null", "core_language":"null", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"null", "core_metadesc":"null", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{}}', 'UsersHelperRoute::getUserRoute', ''),
(5, 'Article Category', 'com_content.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContentHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(6, 'Contact Category', 'com_contact.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContactHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(8, 'Tag', 'com_tags.tag', '{"special":{"dbtable":"#__tags","key":"tag_id","type":"Tag","prefix":"TagsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path"}}', 'TagsHelperRoute::getTagRoute', '{"formFile":"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml", "hideFields":["checked_out","checked_out_time","version", "lft", "rgt", "level", "path", "urls", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(9, 'Banner', 'com_banners.banner', '{"special":{"dbtable":"#__banners","key":"id","type":"Banner","prefix":"BannersTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"null","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"null", "asset_id":"null"}, "special":{"imptotal":"imptotal", "impmade":"impmade", "clicks":"clicks", "clickurl":"clickurl", "custombannercode":"custombannercode", "cid":"cid", "purchase_type":"purchase_type", "track_impressions":"track_impressions", "track_clicks":"track_clicks"}}', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml", "hideFields":["checked_out","checked_out_time","version", "reset"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "imptotal", "impmade", "reset"], "convertToInt":["publish_up", "publish_down", "ordering"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"cid","targetTable":"#__banner_clients","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(10, 'Banners Category', 'com_banners.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(11, 'Banner Client', 'com_banners.client', '{"special":{"dbtable":"#__banner_clients","key":"id","type":"Client","prefix":"BannersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml", "hideFields":["checked_out","checked_out_time"], "ignoreChanges":["checked_out", "checked_out_time"], "convertToInt":[], "displayLookup":[]}'),
(12, 'User Notes', 'com_users.note', '{"special":{"dbtable":"#__user_notes","key":"id","type":"Note","prefix":"UsersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml", "hideFields":["checked_out","checked_out_time", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(13, 'User Notes Category', 'com_users.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}');

-- --------------------------------------------------------

--
-- Structure de la table `joo_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `joo_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_extensions`
--

CREATE TABLE IF NOT EXISTS `joo_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10018 ;

--
-- Contenu de la table `joo_extensions`
--

INSERT INTO `joo_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MAILTO_XML_DESCRIPTION","group":"","filename":"mailto"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":"","filename":"wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_BANNERS_XML_DESCRIPTION","group":"","filename":"banners"}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":"","save_history":"1","history_limit":10}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '{"show_contact_category":"hide","save_history":"1","history_limit":10,"show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"fr-FR","site":"fr-FR"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MEDIA_XML_DESCRIPTION","group":"","filename":"media"}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"newsfeed_layout":"_:default","save_history":"1","history_limit":5,"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_character_count":"0","feed_display_order":"des","float_first":"right","float_second":"right","show_tags":"1","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_items_cat":"1","filter_field":"1","show_pagination_limit":"1","show_headings":"1","show_articles":"0","show_link":"1","show_pagination":"1","show_pagination_results":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '{"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_SEARCH_XML_DESCRIPTION","group":"","filename":"search"}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"0","upload_limit":"2","image_formats":"gif,bmp,jpg,jpeg,png","source_formats":"txt,less,ini,xml,js,php,css","font_formats":"woff,ttf,otf","compressed_formats":"zip"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"article_layout":"_:default","show_title":"0","link_titles":"0","show_intro":"0","info_block_position":"1","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_readmore":"0","show_readmore_title":"0","readmore_limit":"100","show_tags":"0","show_icons":"1","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"0","show_publishing_options":"1","show_article_options":"1","save_history":"1","history_limit":10,"show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_heading_title_text":"1","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_featured":"show","show_feed_link":"1","feed_summary":"0","feed_show_readmore":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"9":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_USERS_XML_DESCRIPTION","group":"","filename":"users"}', '{"allowUserRegistration":"0","new_usertype":"2","guest_usergroup":"9","sendpassword":"1","useractivation":"1","mail_to_admin":"0","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","minimum_length":"4","minimum_integers":"0","minimum_symbols":"0","minimum_uppercase":"0","save_history":"1","history_limit":5,"mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{"name":"com_tags","type":"component","creationDate":"December 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"COM_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"tag_layout":"_:default","save_history":"1","history_limit":5,"show_tag_title":"0","tag_list_show_tag_image":"0","tag_list_show_tag_description":"0","tag_list_image":"","show_tag_num_items":"0","tag_list_orderby":"title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"0","tag_list_show_item_image":"0","tag_list_show_item_description":"0","tag_list_item_maximum_characters":0,"return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_descripion":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"1","show_pagination_limit":"1","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(30, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 1, 1, 0, '{"name":"com_contenthistory","type":"component","creationDate":"May 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_CONTENTHISTORY_XML_DESCRIPTION","group":"","filename":"contenthistory"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(31, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 0, '{"name":"com_ajax","type":"component","creationDate":"August 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_AJAX_XML_DESCRIPTION","group":"","filename":"ajax"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(32, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '{"name":"com_postinstall","type":"component","creationDate":"September 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_POSTINSTALL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"name":"SimplePie","type":"library","creationDate":"2004","author":"SimplePie","copyright":"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.2","description":"LIB_SIMPLEPIE_XML_DESCRIPTION","group":"","filename":"simplepie"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"name":"phputf8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":"","filename":"phputf8"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"13.1","description":"LIB_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"mediaversion":"b9123cf9661f8ab59dfdf7868d229e2f"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 'IDNA Convert', 'library', 'idna_convert', '', 0, 1, 1, 1, '{"name":"IDNA Convert","type":"library","creationDate":"2004","author":"phlyLabs","copyright":"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de","authorEmail":"phlymail@phlylabs.de","authorUrl":"http:\\/\\/phlylabs.de","version":"0.8.0","description":"LIB_IDNA_XML_DESCRIPTION","group":"","filename":"idna_convert"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(105, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '{"name":"FOF","type":"library","creationDate":"2015-04-22 13:15:32","author":"Nicholas K. Dionysopoulos \\/ Akeeba Ltd","copyright":"(C)2011-2015 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"2.4.3","description":"LIB_FOF_XML_DESCRIPTION","group":"","filename":"fof"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(106, 'PHPass', 'library', 'phpass', '', 0, 1, 1, 1, '{"name":"PHPass","type":"library","creationDate":"2004-2006","author":"Solar Designer","copyright":"","authorEmail":"solar@openwall.com","authorUrl":"http:\\/\\/www.openwall.com\\/phpass\\/","version":"0.3","description":"LIB_PHPASS_XML_DESCRIPTION","group":"","filename":"phpass"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":"","filename":"mod_articles_archive"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_articles_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":"","filename":"mod_banners"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":"","filename":"mod_breadcrumbs"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":"","filename":"mod_footer"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_news"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":"","filename":"mod_random_image"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RELATED_XML_DESCRIPTION","group":"","filename":"mod_related_items"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":"","filename":"mod_search"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":"","filename":"mod_syndicate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":"","filename":"mod_users_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":"","filename":"mod_whosonline"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":"","filename":"mod_wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":"","filename":"mod_articles_category"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":"","filename":"mod_articles_categories"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":"","filename":"mod_languages"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FINDER_XML_DESCRIPTION","group":"","filename":"mod_finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_XML_DESCRIPTION","group":"","filename":"mod_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":"","filename":"mod_logged"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":"","filename":"mod_quickicon"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATUS_XML_DESCRIPTION","group":"","filename":"mod_status"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":"","filename":"mod_submenu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TITLE_XML_DESCRIPTION","group":"","filename":"mod_title"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":"","filename":"mod_toolbar"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":"","filename":"mod_multilangstatus"}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_VERSION_XML_DESCRIPTION","group":"","filename":"mod_version"}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{"name":"mod_stats_admin","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats_admin"}', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{"name":"mod_tags_popular","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_tags_popular"}', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{"name":"mod_tags_similar","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_SIMILAR_XML_DESCRIPTION","group":"","filename":"mod_tags_similar"}', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":"","filename":"gmail"}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LDAP_XML_DESCRIPTION","group":"","filename":"ldap"}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(403, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 1, 1, 0, '{"name":"plg_content_contact","type":"plugin","creationDate":"January 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.2","description":"PLG_CONTENT_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":"","filename":"emailcloak"}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":"","filename":"loadmodule"}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":"","filename":"pagenavigation"}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 0, '{"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_VOTE_XML_DESCRIPTION","group":"","filename":"vote"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"Copyright (C) 2014 by Marijn Haverbeke <marijnh@gmail.com> and others","authorEmail":"marijnh@gmail.com","authorUrl":"http:\\/\\/codemirror.net\\/","version":"5.6","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":"","filename":"codemirror"}', '{"lineNumbers":"1","lineWrapping":"1","matchTags":"1","matchBrackets":"1","marker-gutter":"1","autoCloseTags":"1","autoCloseBrackets":"1","autoFocus":"1","theme":"default","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_none","type":"plugin","creationDate":"September 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_NONE_XML_DESCRIPTION","group":"","filename":"none"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2014","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com","version":"4.1.7","description":"PLG_TINY_XML_DESCRIPTION","group":"","filename":"tinymce"}', '{"mode":"1","skin":"0","mobile":"0","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","html_height":"550","html_width":"750","resizing":"1","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","colors":"1","table":"1","smilies":"1","hr":"1","link":"1","media":"1","print":"1","directionality":"1","fullscreen":"1","alignment":"1","visualchars":"1","visualblocks":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":"","filename":"article"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":"","filename":"image"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_READMORE_XML_DESCRIPTION","group":"","filename":"readmore"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0);
INSERT INTO `joo_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":"","filename":"languagefilter"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 0, 1, 0, '{"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_P3P_XML_DESCRIPTION","group":"","filename":"p3p"}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CACHE_XML_DESCRIPTION","group":"","filename":"cache"}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":"","filename":"debug"}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOG_XML_DESCRIPTION","group":"","filename":"log"}', '', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '{"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION","group":"","filename":"redirect"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":"","filename":"remember"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEF_XML_DESCRIPTION","group":"","filename":"sef"}', '', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":"","filename":"logout"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":"","filename":"contactcreator"}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"autoregister":"1","mail_to_user":"1","forceLogout":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '{"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":"","filename":"profile"}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":"","filename":"languagecode"}', '', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":"","filename":"joomlaupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":"","filename":"extensionupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '{"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":"","filename":"recaptcha"}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":"","filename":"highlight"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(447, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_tags","type":"plugin","creationDate":"February 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(448, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_totp","type":"plugin","creationDate":"August 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION","group":"","filename":"totp"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(449, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '{"name":"plg_authentication_cookie","type":"plugin","creationDate":"July 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_COOKIE_XML_DESCRIPTION","group":"","filename":"cookie"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(450, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_yubikey","type":"plugin","creationDate":"September 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION","group":"","filename":"yubikey"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(451, 'plg_search_tags', 'plugin', 'tags', 'search', 0, 1, 1, 0, '{"name":"plg_search_tags","type":"plugin","creationDate":"March 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"search_limit":"50","show_tagged_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{"name":"beez3","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"3.1.0","description":"TPL_BEEZ3_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"3.0.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{"name":"protostar","type":"template","creationDate":"4\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_PROTOSTAR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{"name":"isis","type":"template","creationDate":"3\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_ISIS_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (en-GB)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"2013-03-07","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.3","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (en-GB)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"2013-03-07","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.3","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"name":"files_joomla","type":"file","creationDate":"December 2015","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.8","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 'French_fr-FR', 'language', 'fr-FR', '', 0, 1, 0, 0, '{"name":"French_fr-FR","type":"language","creationDate":"22\\/10\\/2015","author":"French translation team : joomla.fr","copyright":"Copyright (C) 2005 - 2015 Joomla.fr and Open Source Matters, Inc. All rights reserved.","authorEmail":"traduction@joomla.fr","authorUrl":"http:\\/\\/joomla.fr","version":"3.4.8.1","description":"fr-FR_site language","group":"","filename":"install"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 'French_fr-FR', 'language', 'fr-FR', '', 1, 1, 0, 0, '{"name":"French_fr-FR","type":"language","creationDate":"22\\/10\\/2015","author":"French translation team : joomla.fr","copyright":"Copyright (C) 2005 - 2015 Joomla.fr and Open Source Matters, Inc. All rights reserved.","authorEmail":"traduction@joomla.fr","authorUrl":"http:\\/\\/joomla.fr","version":"3.4.8.1","description":"fr-FR_admin language","group":"","filename":"install"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10002, 'French_fr-FR', 'package', 'pkg_fr-FR', '', 0, 1, 1, 0, '{"name":"French_fr-FR","type":"package","creationDate":"22\\/10\\/2015","author":"French translation team : joomla.fr","copyright":"Copyright (C) 2005 - 2015 Joomla.fr and Open Source Matters, Inc. All rights reserved.","authorEmail":"traduction@joomla.fr","authorUrl":"http:\\/\\/joomla.fr","version":"3.4.8.1","description":"<div style=\\"text-align:left;\\">\\n\\n<h3>Joomla! 3.4.8 Full French (fr-FR) Language Package - Version 3.4.8.1<\\/h3>\\n\\n<h3>Paquet de langue Joomla! 3.4.8 fran\\u00e7ais (fr-FR) complet - Version 3.4.8.1<\\/h3>\\n\\n<\\/div>","group":"","filename":"pkg_fr-FR"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10003, '1870j3', 'template', '1870j3', '', 0, 1, 1, 0, '{"name":"1870j3","type":"template","creationDate":"mars 2013","author":"C\\u00e9dric KEIFLIN","copyright":"Copyright (C) 2013 C\\u00e9dric KEIFLIN All rights reserved.","authorEmail":"ced1870@gmail.com","authorUrl":"","version":"1.0.0","description":"TPL_1870J3_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateBackgroundColor":"#F4F6F7"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10004, 'mnstyle', 'template', 'mnstyle', '', 0, 1, 1, 0, '{"name":"mnstyle","type":"template","creationDate":"Janvier 2016","author":"Nicolas Lacombe","copyright":"Copyright (C) 2016 soci\\u00e9t\\u00e9 MN All rights reserved.","authorEmail":"nicolas.lacombe67@gmail.com","authorUrl":"","version":"1.0","description":"TPL_MNSTYLE_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateBackgroundColor":"#DFEBF7","templateTitleColor":"#F09947","templateSubtitleColor":"#204274","templateTextColor":"#2E3031"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10005, 'apicloud', 'template', 'apicloud', '', 0, 1, 1, 0, '{"name":"apicloud","type":"template","creationDate":"septembre 2015","author":"charline mattissier","copyright":"","authorEmail":"","authorUrl":"","version":"1.0.0","description":"\\n        <h1> APICLOUD joomla template <\\/h1>\\n\\t    \\n\\t\\t\\t<br \\/><br \\/>\\n\\n\\t","group":"","filename":"templateDetails"}', '{"bgname":"templates\\/apicloud\\/images\\/bg.jpg","slidedisable":"1","image1":"templates\\/apicloud\\/images\\/slide1.jpg","image2":"templates\\/apicloud\\/images\\/slide2.jpg","image3":"templates\\/apicloud\\/images\\/slide3.jpg"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10006, 'System - Google Maps', 'plugin', 'plugin_googlemap3', 'system', 0, 1, 1, 0, '{"name":"System - Google Maps","type":"plugin","creationDate":"July 2014","author":"Mike Reumer","copyright":"(C) 2014 Reumer","authorEmail":"tech@reumer.net","authorUrl":"tech.reumer.net","version":"3.3","description":"PLUGIN_GOOGLE_MAP3_INSTALLATION","group":"","filename":"plugin_googlemap3"}', '{"debug":"0","plugincode":"mosmap","brackets":"{","Google_API_version":"3","visualrefresh":"0","signedin":"0","show":"1","mapclass":"","mapprint":"icon","mapcss":"\\/* For img in the map remove borders, shadow, no margin and no max-width\\r\\n*\\/\\r\\n.map img, .svPanel img {\\r\\n    border: 0px;\\r\\n    box-shadow: none;\\r\\n    margin: 0px !important;\\r\\n    padding: 0px !important;\\r\\n    max-width: none !important;\\r\\n    background: none !important;\\r\\n}\\r\\n\\r\\n\\/* Make sure the directions are below the map\\r\\n*\\/\\r\\n.directions {\\r\\n    clear: left;\\r\\n}\\r\\n\\r\\n.adp-directions {\\r\\n    width: 100%;\\r\\n}\\r\\n\\r\\n\\/* Solve problems in chrome with the show of the direction steps in full width\\r\\n*\\/\\r\\n.adp-placemark {\\r\\n    width : 100%;\\r\\n}\\r\\n\\r\\n\\/* Padding for image overlay\\r\\n*\\/\\r\\n.controlDiv {\\r\\n    padding : 5px;\\r\\n}\\r\\n","loadmootools":"1","timeinterval":"500","Google_API_key":"","Google_Multi_API_key":"","urlsetting":"http_host","googlewebsite":"maps.google.com","styledmap":"","align":"center","langtype":"site","lang":"","width":"500","height":"400","effect":"none","lat":"49.6337308","lon":"-1.6221370","centerlat":"","centerlon":"","address":"","geoloc":"0","geocenter":"0","controltype":"UI","zoomType":"3D-large","svcontrol":"1","returncontrol":"1","zoom":"10","corzoom":"0","minzoom":"0","maxzoom":"19","rotation":"1","zoomnew":"0","zoomWheel":"0","keyboard":"0","mapType":"Normal","showmaptype":"1","showNormalMaptype":"1","showSatelliteMaptype":"1","showHybridMaptype":"1","showTerrainMaptype":"1","showscale":"0","overview":"0","dragging":"1","marker":"1","icon":"","iconwidth":"","iconheight":"","iconanchorx":"","iconanchory":"","iconshadow":"","iconshadowwidth":"","iconshadowheight":"","iconimagemap":"","traffic":"0","transit":"0","bicycle":"0","panoramio":"0","panominzoom":"none","panomaxzoom":"none","pano_userid":"","pano_tag":"","weather":"0","weathercloud":"0","weatherinfo":"1","weathertempunit":"celsius","weatherwindunit":"km","dir":"0","dirtype":"D","formdirtype":"1","avoidhighways":"0","avoidtoll":"0","diroptimize":"0","diralternatives":"0","showdir":"1","animdir":"0","animspeed":"1","animautostart":"0","animunit":"kilometers","formspeed":"0","formaddress":"0","formdir":"0","autocompl":"both","langanim":"en-GB;The requested panorama could not be displayed|Could not generate a route for the current start and end addresses|Street View coverage is not available for this route|You have reached your destination|miles|miles|ft|kilometers|kilometer|meters|In|You will reach your destination|Stop|Drive|Press Drive to follow your route|Route|Speed|Fast|Medium|Slow","txtdir":"Directions: ","txtgetdir":"Get Directions","txtfrom":"From here","txtto":"To here","txtdiraddr":"Address: ","txt_driving":"","txt_avhighways":"","txt_avtoll":"","txt_walking":"","txt_bicycle":"","txt_transit":"","txt_optimize":"","txt_alternatives":"","inputsize":"25","dirdefault":"0","gotoaddr":"0","gotoaddrzoom":"0","gotoaddrtimeout":"5000","txtaddr":"Address: ##","erraddr":"Address ## not found!","txtgotoaddr":"Goto","clientgeotype":"google","lightbox":"0","txtlightbox":"Open lightbox","lbxcaption":"","lbxwidth":"500","lbxheight":"700","lbxcenterlat":"","lbxcenterlon":"","lbxzoom":"","sv":"none","svpano":"","svwidth":"100%","svheight":"300","svyaw":"0","svpitch":"0","svzoom":"","svautorotate":"0","svaddress":"1","kmlrenderer":"google","kmlsidebar":"none","kmlsbwidth":"200","kmlfoldersopen":"0","kmlhide":"0","kmlscale":"0","kmlopenmethod":"click","kmlsbsort":"none","kmllightbox":"0","kmlmessshow":"0","kmlclickablemarkers":"1","kmlzoommarkers":"0","kmlopendivmarkers":"","kmlcontentlinkmarkers":"0","kmllinkablemarkers":"0","kmllinktarget":"_self","kmllinkmethod":"dblclick","kmlhighlite":"{ ''color'': ''#aaffff'', ''opacity'': 0.3,  ''textcolor'': ''#000000'' }","kmlmarkerlabel":"100","kmlmarkerlabelclass":"","kmlpolylabel":"100","kmlpolylabelclass":"","proxy":"0","txtsrchnrby":"Search nearby","txtzoomhere":"Zoom Here","txtaddrstart":"Start address:","txtkmlgetdir":"Go","txtback":"« Back","txtsearchnearby":"Search nearby: e.g. pizza","txtsearch":"Go","maxcluster":"","clustericonurl":"\\/media\\/plugin_googlemap3\\/site\\/geoxmlv3\\/images\\/m","gridsize":"","minmarkerscluster":"","maxlinesinfocluster":"","clusterinfowindow":"click","clusterzoom":"dblclick","clustermarkerzoom":"16","txtzoomin":"Zoom in to show more","txtclustercount1":"...and","txtclustercount2":"more","tilelayer":"","tilemethod":"","tileopacity":"1","tilebounds":"","tileminzoom":"0","tilemaxzoom":"19","imageurl":"","imageposition":"RIGHT_TOP","imageindex":"1","imagewidth":"","imageheight":"","twittername":"","twittertweets":"15","twittericon":"\\/media\\/plugin_googlemap3\\/site\\/Twitter\\/twitter_map_icon.png","twitterline":"#ff0000ff","twitterlinewidth":"4","twitterstartloc":"0,0,0","twitterconsumerkey":"","twitterconsumersecret":"","twitteraccesstoken":"","twitteraccesstokensecret":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10007, 'COM_ALFCONTACT', 'component', 'com_alfcontact', '', 1, 1, 0, 0, '{"name":"COM_ALFCONTACT","type":"component","creationDate":"June 2015","author":"Alfred Vink","copyright":"Copyright \\u00a9 2015 - All rights reserved.","authorEmail":"alfred@alfsoft.com","authorUrl":"http:\\/\\/www.alfsoft.com","version":"3.2.1","description":"","group":"","filename":"alfcontact"}', '{"maxchars":"","autouser":"1","fromsite":"1","captcha":"0","captchatype":"0","copytome":"1","resetbtn":"1","verbose":"1","mailformat":"1","captchas_user":"","captchas_key":"","captchas_alphabet":"","captchas_chars":"","captchas_width":"","captchas_height":"","captchas_color":"","captchas_audiolink":"0","captchas_audiolng":"fr","redirect_option":"1","custom_header":"","custom_text":"","css_style":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10008, 'real_estate_v1', 'template', 'real_estate_v1', '', 0, 1, 1, 0, '{"name":"real_estate_v1","type":"template","creationDate":"Creation Date","author":"Your name","copyright":"Your copyrights","authorEmail":"Your email","authorUrl":"Link to Your website","version":"2.5.0","description":" \\n\\t\\n\\t      <link href=''http:\\/\\/fonts.googleapis.com\\/css?family=Quicksand:400,700,300'' rel=''stylesheet'' type=''text\\/css''>\\n\\t      <br>\\n\\t      <h1 class=\\"temph1\\">The OS Framework<\\/h1>\\n\\t      <h4 class=\\"temph4\\">Beautiful Fast & Light joomla framework<\\/h4>\\n\\t      <p class=\\"text_propery\\">Powerfull admin area allow easy control templeate elements like fonts, logo, colors etc. Fully responsive grid based on Twitter Bootstrap, looking great on all screen sizes and platforms.<\\/p>\\n\\t      <br>\\n\\t      <div id=\\"down_pictures\\"> \\n\\t\\t    <a href=\\"http:\\/\\/www.youtube.com\\/watch?v=KCfAXQ5S6iQ&feature=youtu.be\\" onclick=\\"window.open(''http:\\/\\/www.youtube.com\\/watch?v=KCfAXQ5S6iQ&feature=youtu.be'',''OrdaSoft Joomla Template Features'',''width=635,height=610,left=''+(screen.availWidth\\/2-317.5)+'',top=''+(screen.availHeight\\/2-305)+'''');return false;\\" target=\\"_blank\\"><img style=\\"width:400px; height:306px;\\" src=\\"..\\/templates\\/real_estate_v1\\/joomla_template_features_video.jpg\\"\\/><\\/a>\\n\\t\\t    <div style=\\"clear:both;\\"><\\/div>\\n\\t\\t    <div class=\\"sepp_div\\"><\\/div>\\n\\t\\t    <a href=\\"http:\\/\\/ordasoft.com\\/membership-page.html\\" target=\\"_blank\\"><img src=\\"..\\/templates\\/real_estate_v1\\/button_become_member.jpg\\"\\/><\\/a> \\n\\t      <\\/div>\\n\\t\\n\\t","group":"","filename":"templateDetails"}', '{"body_color":"#f8f8f8","logo_link":"index.php","logo_width":"173","logo_height":"26","body_link_color":"#92999E","body_link_hover_color":"#12ABFF","body_underline":"none","body_hover_underline":"underline","top_menu_color":"#92999E","top_menu_hover_color":"#000000","top_menu_underline":"none","top_menu_hover_underline":"none","main_menu_color":"#92999E","main_menu_hover_color":"#000000","main_menu_underline":"none","main_menu_hover_underline":"none","menu_footer_color":"#92999E","menu_footer_hover_color":"#000000","menu_footer_underline":"none","menu_footer_hover_underline":"none","body_font":"PT Sans Narrow","links_font":"PT Sans Narrow","top_menu_font":"PT Sans Narrow","main_menu_font":"PT Sans Narrow","footer_menu_font":"PT Sans Narrow","h1_font":"PT Sans Narrow","h2_font":"PT Sans Narrow","h3_font":"PT Sans Narrow","h4_font":"PT Sans Narrow","h5_font":"PT Sans Narrow","h6_font":"PT Sans Narrow","twitter":"","facebook":"","flickr":"","linkedin":"","youtube":"","pinterest":"","google":"","dribbble":"","vimeo":"","instagram":"","vk":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10009, 'agricol', 'template', 'agricol', '', 0, 1, 1, 0, '{"name":"agricol","type":"template","creationDate":"10\\/2014","author":"C\\u00e9dric KEIFLIN","copyright":"C\\u00e9dric KEIFLIN","authorEmail":"","authorUrl":"http:\\/\\/www.joomlack.fr","version":"1.0.0","description":"Template made with Template Creator CK","group":"","filename":"templateDetails"}', '{"bannerlogo_logoimgsrc":"templates\\/agricol\\/images\\/your_logo_here.png","bannerlogo_logoheight":"53","bannerlogo_logowidth":"216","bannerlogo_logolink":"","bannerlogo_logotitle":"","bannerlogo_logodescription":"","usecsspie":"1","useresponsive":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10010, 'Content - Load Module in Article', 'plugin', 'loadmoduleinarticle', 'content', 0, 0, 1, 0, '{"name":"Content - Load Module in Article","type":"plugin","creationDate":"januari 2015","author":"Carsten Engel","copyright":"Copyright (C) 2008-2015 Carsten Engel, pages-and-items. All rights reserved.","authorEmail":"-","authorUrl":"www.pages-and-items.com","version":"3.1.0","description":"\\n\\t    Plugin to display a module into an article. Placing the same module more then once on a page might result in conflicts. Dont forget to ENABLE this plugin in the plugin-manager. Syntax in editor: {module [63]} where 63 is the id of the module. You can overrule the default style like this: {module [63|rounded]}. Options are ''none'', ''xhtml'' (wrapped by a div) and ''rounded'' (wrapped by multiple divs). Check the <a href=\\"http:\\/\\/www.pages-and-items.com\\/extensions\\/load-module-into-article\\/faqs\\" target=\\"_blank\\">FAQs<\\/a>. Check the <a href=\\"http:\\/\\/www.pages-and-items.com\\/forum\\/33-plugin-module-in-article\\" target=\\"_blank\\">forum<\\/a>.\\n\\t   \\n\\t","group":"","filename":"loadmoduleinarticle"}', '{"style":"none","displayunpublished":"1","tags":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10012, 'plg_system_nnframework', 'plugin', 'nnframework', 'system', 0, 1, 1, 0, '{"name":"plg_system_nnframework","type":"plugin","creationDate":"March 2016","author":"NoNumber (Peter van Westen)","copyright":"Copyright \\u00a9 2016 NoNumber All Rights Reserved","authorEmail":"peter@nonumber.nl","authorUrl":"https:\\/\\/www.nonumber.nl","version":"16.3.12531","description":"PLG_SYSTEM_NNFRAMEWORK_DESC","group":"","filename":"nnframework"}', '{"max_list_count":"2500"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10013, 'plg_editors-xtd_modulesanywhere', 'plugin', 'modulesanywhere', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_modulesanywhere","type":"plugin","creationDate":"January 2016","author":"NoNumber (Peter van Westen)","copyright":"Copyright \\u00a9 2016 NoNumber All Rights Reserved","authorEmail":"peter@nonumber.nl","authorUrl":"https:\\/\\/www.nonumber.nl","version":"4.1.4","description":"PLG_EDITORS-XTD_MODULESANYWHERE_DESC","group":"","filename":"modulesanywhere"}', '[]', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10014, 'plg_system_modulesanywhere', 'plugin', 'modulesanywhere', 'system', 0, 1, 1, 0, '{"name":"plg_system_modulesanywhere","type":"plugin","creationDate":"January 2016","author":"NoNumber (Peter van Westen)","copyright":"Copyright \\u00a9 2016 NoNumber All Rights Reserved","authorEmail":"peter@nonumber.nl","authorUrl":"https:\\/\\/www.nonumber.nl","version":"4.1.4","description":"PLG_SYSTEM_MODULESANYWHERE_DESC","group":"","filename":"modulesanywhere"}', '{"style":"none","styles":"none,division,tabs,well","override_style":"1","@notice_override_settings":"NN_ONLY_AVAILABLE_IN_PRO","ignore_access":"0","ignore_state":"0","ignore_assignments":"1","ignore_caching":"0","@notice_show_edit":"NN_ONLY_AVAILABLE_IN_PRO","place_comments":"1","@notice_articles":"NN_ONLY_AVAILABLE_IN_PRO","@notice_components":"NN_ONLY_AVAILABLE_IN_PRO","@notice_otherareas":"NN_ONLY_AVAILABLE_IN_PRO","button_text":"Module","enable_frontend":"1","@notice_div_enable":"NN_ONLY_AVAILABLE_IN_PRO","@notice_div_width":"NN_ONLY_AVAILABLE_IN_PRO","@notice_div_height":"NN_ONLY_AVAILABLE_IN_PRO","@notice_div_float":"NN_ONLY_AVAILABLE_IN_PRO","@notice_div_class":"NN_ONLY_AVAILABLE_IN_PRO","module_tag":"module","modulepos_tag":"modulepos","tag_characters":"{.}","handle_loadposition":"0","activate_jumper":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10016, 'plg_system_componentsanywhere', 'plugin', 'componentsanywhere', 'system', 0, 1, 1, 0, '{"name":"plg_system_componentsanywhere","type":"plugin","creationDate":"March 2016","author":"NoNumber (Peter van Westen)","copyright":"Copyright \\u00a9 2016 NoNumber All Rights Reserved","authorEmail":"peter@nonumber.nl","authorUrl":"https:\\/\\/www.nonumber.nl","version":"2.4.0","description":"PLG_SYSTEM_COMPONENTSANYWHERE_DESC","group":"","filename":"componentsanywhere"}', '{"place_comments":"1","force_remove_tmpl":"0","force_itemid":"0","keepurls":"0","caching":"1","timeout":"5","force_curl":"0","use_negotiate_authentication":"0","negotiate_login":"","negotiate_password":"","@notice_articles":"NN_ONLY_AVAILABLE_IN_PRO","@notice_components":"NN_ONLY_AVAILABLE_IN_PRO","@notice_otherareas":"NN_ONLY_AVAILABLE_IN_PRO","component_tag":"component","tag_characters":"{.}"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10017, 'Include Content Item', 'plugin', 'include_content_item', 'content', 0, 0, 1, 0, '{"name":"Include Content Item","type":"plugin","creationDate":"Oct 2011","author":"kksou","copyright":"(C) kksou.com. All Rights Reserved.","authorEmail":"support@kksou.com","authorUrl":"www.kksou.com\\/php-gtk2\\/","version":"3.0.12","description":"This plugin allows you to insert or include one content item into another content item.","group":"","filename":"include_content_item"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_filters`
--

CREATE TABLE IF NOT EXISTS `joo_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_links`
--

CREATE TABLE IF NOT EXISTS `joo_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_links_terms0`
--

CREATE TABLE IF NOT EXISTS `joo_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_links_terms1`
--

CREATE TABLE IF NOT EXISTS `joo_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_links_terms2`
--

CREATE TABLE IF NOT EXISTS `joo_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_links_terms3`
--

CREATE TABLE IF NOT EXISTS `joo_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_links_terms4`
--

CREATE TABLE IF NOT EXISTS `joo_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_links_terms5`
--

CREATE TABLE IF NOT EXISTS `joo_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_links_terms6`
--

CREATE TABLE IF NOT EXISTS `joo_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_links_terms7`
--

CREATE TABLE IF NOT EXISTS `joo_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_links_terms8`
--

CREATE TABLE IF NOT EXISTS `joo_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_links_terms9`
--

CREATE TABLE IF NOT EXISTS `joo_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_links_termsa`
--

CREATE TABLE IF NOT EXISTS `joo_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_links_termsb`
--

CREATE TABLE IF NOT EXISTS `joo_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_links_termsc`
--

CREATE TABLE IF NOT EXISTS `joo_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_links_termsd`
--

CREATE TABLE IF NOT EXISTS `joo_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_links_termse`
--

CREATE TABLE IF NOT EXISTS `joo_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_links_termsf`
--

CREATE TABLE IF NOT EXISTS `joo_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_taxonomy`
--

CREATE TABLE IF NOT EXISTS `joo_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `joo_finder_taxonomy`
--

INSERT INTO `joo_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_taxonomy_map`
--

CREATE TABLE IF NOT EXISTS `joo_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_terms`
--

CREATE TABLE IF NOT EXISTS `joo_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_terms_common`
--

CREATE TABLE IF NOT EXISTS `joo_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `joo_finder_terms_common`
--

INSERT INTO `joo_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_tokens`
--

CREATE TABLE IF NOT EXISTS `joo_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_tokens_aggregate`
--

CREATE TABLE IF NOT EXISTS `joo_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_finder_types`
--

CREATE TABLE IF NOT EXISTS `joo_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `joo_languages`
--

CREATE TABLE IF NOT EXISTS `joo_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `joo_languages`
--

INSERT INTO `joo_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `joo_menu`
--

CREATE TABLE IF NOT EXISTS `joo_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=119 ;

--
-- Contenu de la table `joo_menu`
--

INSERT INTO `joo_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 77, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 39, 44, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 40, 41, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 42, 43, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 45, 50, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 46, 47, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 48, 49, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 51, 56, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 52, 53, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 54, 55, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 57, 58, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 59, 60, 0, '*', 1),
(18, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 61, 62, 0, '*', 1),
(19, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 1, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 63, 64, 0, '*', 1),
(20, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 0, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 65, 66, 0, '', 1),
(21, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 0, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 67, 68, 0, '*', 1),
(101, 'mainmenu', 'Accueil', 'home', '', 'home', 'index.php?option=com_content&view=article&id=1', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"1","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 11, 12, 1, '*', 0),
(102, 'infomenu', 'Qui sommes-nous ?', 'qui-sommes-nous', '', 'qui-sommes-nous', 'index.php?option=com_content&view=article&id=2', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"Qui sommes-nous ?","menu-meta_keywords":"Presqu''île habitat\\r\\nQui sommes-nous ?\\r\\nlogement pas cher cherbourg \\/ tourlaville \\/ la glacerie \\/ octeville \\/ equeurdreville \\/ portbail \\/ \\r\\nbarneville-carteret","robots":"","secure":0}', 27, 28, 0, '*', 0),
(103, 'infomenu', 'Offres d''emploi', 'offres-d-emploi', '', 'offres-d-emploi', 'index.php?option=com_content&view=article&id=3', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 29, 30, 0, '*', 0),
(104, 'mainmenu', 'Devenir locataire', 'devenir-locataire', '', 'devenir-locataire', 'index.php?option=com_content&view=article&id=4', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 13, 16, 0, '*', 0),
(105, 'main', 'COM_ALFCONTACT_MENU', 'com-alfcontact-menu', '', 'com-alfcontact-menu', 'index.php?option=com_alfcontact', 'component', 0, 1, 1, 10007, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_alfcontact/images/alfcontact-16.png', 0, '{}', 69, 70, 0, '', 1),
(106, 'infomenu', 'Contact', 'contact', '', 'contact', 'index.php?option=com_alfcontact&view=alfcontact', 'component', 1, 1, 1, 10007, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"title":"","header":"","footer":"","captchalng":"en","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 31, 32, 0, '*', 0),
(107, 'mainmenu', 'Visitez notre patrimoine', 'visitez-notre-patrimoine', '', 'visitez-notre-patrimoine', 'index.php?option=com_content&view=article&id=5', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 17, 18, 0, '*', 0),
(108, 'infomenu', 'Mentions légales', 'mentions-legales', '', 'mentions-legales', 'index.php?option=com_content&view=article&id=6', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 33, 34, 0, '*', 0),
(109, 'infomenu', 'F.A.Q.', 'f-a-q', '', 'f-a-q', 'index.php?option=com_content&view=article&id=8', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 37, 38, 0, '*', 0),
(110, 'infomenu', 'Liens utiles', 'liens-utiles', '', 'liens-utiles', 'index.php?option=com_content&view=article&id=7', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 35, 36, 0, '*', 0),
(111, 'mainmenu', 'Espace locataire', 'espace-locataire', '', 'espace-locataire', 'index.php?option=com_content&view=form&layout=edit', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"enable_category":"0","catid":"2","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 19, 20, 0, '*', 0),
(112, 'mainmenu', 'Travaux en cours', 'travaux-en-cours', '', 'actus/travaux-en-cours', 'index.php?option=com_content&view=article&id=10', 'component', 1, 113, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":0,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 24, 25, 0, '*', 0),
(113, 'mainmenu', 'Actus', 'actus', '', 'actus', 'index.php?option=com_content&view=category&layout=blog&id=8', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 23, 26, 0, '*', 0),
(114, 'devenirlocataire', 'Conditions de ressources', 'conditions-de-ressources', '', 'conditions-de-ressources', 'index.php?option=com_content&view=article&id=16', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 71, 72, 0, '*', 0),
(115, 'devenirlocataire', 'Modalités et Infos pratiques', 'modalites-et-infos-pratiques', '', 'modalites-et-infos-pratiques', 'index.php?option=com_content&view=article&id=15', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 73, 74, 0, '*', 0),
(116, 'devenirlocataire', 'Plafonds et textes de loi', 'plafonds-et-textes-de-loi', '', 'plafonds-et-textes-de-loi', 'index.php?option=com_content&view=article&id=11', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 75, 76, 0, '*', 0),
(117, 'mainmenu', 'Comment obtenir un logement ?', 'comment-obtenir-un-logement', '', 'devenir-locataire/comment-obtenir-un-logement', 'index.php?option=com_content&view=category&id=21', 'component', 1, 104, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_category_heading_title_text":"","show_subcat_desc":"","show_cat_num_articles":"","show_cat_tags":"","page_subheading":"","show_pagination_limit":"","filter_field":"","show_headings":"","list_show_date":"","date_format":"","list_show_hits":"","list_show_author":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","display_num":"10","show_featured":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 14, 15, 0, '*', 0),
(118, 'mainmenu', 'Espace Pro', 'espace-pro', '', 'espace-pro', 'index.php?option=com_content&view=category', 'heading', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 21, 22, 0, '*', 0);

-- --------------------------------------------------------

--
-- Structure de la table `joo_menu_types`
--

CREATE TABLE IF NOT EXISTS `joo_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `joo_menu_types`
--

INSERT INTO `joo_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(7, 'infomenu', 'Bas de page', ''),
(8, 'devenirlocataire', 'Devenir locataire', '');

-- --------------------------------------------------------

--
-- Structure de la table `joo_messages`
--

CREATE TABLE IF NOT EXISTS `joo_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `joo_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `joo_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_modules`
--

CREATE TABLE IF NOT EXISTS `joo_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

--
-- Contenu de la table `joo_modules`
--

INSERT INTO `joo_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 39, 'Menu principal', '', '', 1, 'menu-haut', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"mainmenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"menu_top","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(2, 40, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 41, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(8, 43, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 44, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(12, 46, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 47, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 48, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 49, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 50, 'Connexion', '', '', 1, 'module-gauche', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{"pretext":"","posttext":"","login":"","logout":"","greeting":"1","name":"0","usesecure":"0","usetext":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(17, 51, 'fil d''ariane', '', '', 1, 'ariane', 502, '2016-03-18 11:09:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 0, '{"showHere":"1","showHome":"1","homeText":"","showLast":"1","separator":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(79, 52, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 53, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(87, 59, 'Menu bas de page', '', '', 1, 'menu-bas', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"infomenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"menu_bot","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(88, 85, 'Comment obtenir un logement ?', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"devenirlocataire","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(90, 87, 'map_pih', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_related_items', 1, 1, '{"showDate":"0","maximum":"1","layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(91, 88, 'pih_map', '', '<p>{mosmap width=''200''|height=''300''|Largeur=''200''|Hauteur=''300''|zoom=''16''|mapType=''Normal''|text=''</p>\r\n<div align="left"><strong>Presqu''île Habitat</strong><br /> 1 rue de Nancy - CS 30122 50101 CHERBOURG OCTEVILLE Cedex<br /> Tel : 02 33 87 84 00<br />Fax : 02 33 08 03 67</div>\r\n<p>''|tooltip=''<strong>Presqu''île Habitat</strong>''|marker=''0''|align=''center''|address=''Presqu''île Habitat, 1 rue de Nancy, 50101, CHERBOURG OCTEVILLE''}</p>\r\n<p><strong>Presqu''île Habitat</strong><br /> 1 rue de Nancy - CS 30122<br /> 50101 CHERBOURG OCTEVILLE Cedex</p>\r\n<p>Tel : 02 33 87 84 00<br /> Fax : 02 33 08 03 67</p>', 1, 'module-gauche', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(92, 89, 'Devenir locataire sousmenu', '', '<p>{module Comment obtenir un logement ?|showtitle=1}</p>', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(93, 90, ' Comment obtenir un logement ?', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_menu', 1, 1, '{"menutype":"devenirlocataire","base":"104","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(94, 91, 'Recherche d''un garage, un parcking ?', '', '', 1, '', 502, '2016-03-17 15:23:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_menu', 1, 1, '{"menutype":"devenirlocataire","base":"104","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(95, 92, 'Recherche d''un local, d''un commerce ?', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_menu', 1, 1, '{"menutype":"devenirlocataire","base":"104","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(96, 93, 'Vous êtes étudiant ?', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_menu', 1, 1, '{"menutype":"devenirlocataire","base":"104","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*');

-- --------------------------------------------------------

--
-- Structure de la table `joo_modules_menu`
--

CREATE TABLE IF NOT EXISTS `joo_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `joo_modules_menu`
--

INSERT INTO `joo_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 101),
(17, 0),
(79, 0),
(86, 0),
(87, 0),
(88, 104),
(89, 111),
(90, 106),
(91, 106),
(92, -116),
(92, -115),
(92, -114),
(92, -113),
(92, -112),
(92, -111),
(92, -110),
(92, -109),
(92, -108),
(92, -107),
(92, -106),
(92, -103),
(92, -102),
(92, -101),
(93, 104),
(94, 104),
(95, 104),
(96, 104);

-- --------------------------------------------------------

--
-- Structure de la table `joo_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `joo_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `joo_overrider`
--

CREATE TABLE IF NOT EXISTS `joo_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `joo_postinstall_messages`
--

CREATE TABLE IF NOT EXISTS `joo_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) NOT NULL DEFAULT '',
  `language_extension` varchar(255) NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `joo_postinstall_messages`
--

INSERT INTO `joo_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1, 700, 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION', 'plg_twofactorauth_totp', 1, 'action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_condition', '3.2.0', 1),
(2, 700, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 1);

-- --------------------------------------------------------

--
-- Structure de la table `joo_redirect_links`
--

CREATE TABLE IF NOT EXISTS `joo_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) DEFAULT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `joo_schemas`
--

CREATE TABLE IF NOT EXISTS `joo_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `joo_schemas`
--

INSERT INTO `joo_schemas` (`extension_id`, `version_id`) VALUES
(700, '3.4.0-2015-02-26'),
(10007, '3.2.0');

-- --------------------------------------------------------

--
-- Structure de la table `joo_session`
--

CREATE TABLE IF NOT EXISTS `joo_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `joo_session`
--

INSERT INTO `joo_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
('6jtrbi9uo0totlfhlh1vph7oo2', 0, 1, '1459153492', 'joomla|s:1552:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxNDtzOjU6InRpbWVyIjtPOjg6InN0ZENsYXNzIjozOntzOjU6InN0YXJ0IjtpOjE0NTkxNTI2MDg7czo0OiJsYXN0IjtpOjE0NTkxNTM0ODk7czozOiJub3ciO2k6MTQ1OTE1MzQ5MTt9czo1OiJ0b2tlbiI7czozMjoiMTA1ODYxMGNmOTlhNWE1YzgyNjg1N2YxNzFkZDg0M2EiO31zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjI6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6MDp7fXM6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjI2OntzOjk6IgAqAGlzUm9vdCI7YjowO3M6MjoiaWQiO2k6MDtzOjQ6Im5hbWUiO047czo4OiJ1c2VybmFtZSI7TjtzOjU6ImVtYWlsIjtOO3M6ODoicGFzc3dvcmQiO047czoxNDoicGFzc3dvcmRfY2xlYXIiO3M6MDoiIjtzOjU6ImJsb2NrIjtOO3M6OToic2VuZEVtYWlsIjtpOjA7czoxMjoicmVnaXN0ZXJEYXRlIjtOO3M6MTM6Imxhc3R2aXNpdERhdGUiO047czoxMDoiYWN0aXZhdGlvbiI7TjtzOjY6InBhcmFtcyI7TjtzOjY6Imdyb3VwcyI7YToxOntpOjA7czoxOiI5Ijt9czo1OiJndWVzdCI7aToxO3M6MTM6Imxhc3RSZXNldFRpbWUiO047czoxMDoicmVzZXRDb3VudCI7TjtzOjEyOiJyZXF1aXJlUmVzZXQiO047czoxMDoiACoAX3BhcmFtcyI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czoxNDoiACoAX2F1dGhHcm91cHMiO2E6Mjp7aTowO2k6MTtpOjE7aTo5O31zOjE0OiIAKgBfYXV0aExldmVscyI7YTozOntpOjA7aToxO2k6MTtpOjE7aToyO2k6NTt9czoxNToiACoAX2F1dGhBY3Rpb25zIjtOO3M6MTI6IgAqAF9lcnJvck1zZyI7TjtzOjEzOiIAKgB1c2VySGVscGVyIjtPOjE4OiJKVXNlcldyYXBwZXJIZWxwZXIiOjA6e31zOjEwOiIAKgBfZXJyb3JzIjthOjA6e31zOjM6ImFpZCI7aTowO319fXM6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=";', 0, '');

-- --------------------------------------------------------

--
-- Structure de la table `joo_tags`
--

CREATE TABLE IF NOT EXISTS `joo_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `joo_tags`
--

INSERT INTO `joo_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 42, '2011-01-01 00:00:01', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `joo_template_styles`
--

CREATE TABLE IF NOT EXISTS `joo_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `joo_template_styles`
--

INSERT INTO `joo_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.png","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(7, 'protostar', 0, '0', 'protostar - Default', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(8, 'isis', 1, '1', 'isis - Default', '{"templateColor":"","logoFile":""}'),
(10, '1870j3', 0, '0', '1870j3 - Default', '{"templateBackgroundColor":"#F4F6F7"}'),
(11, 'mnstyle', 0, '1', 'mnstyle - Par défaut', '{"styleBackgroundColor":"#ffffff","styleTitleColor":"#f09947","styleSubtitleColor":"#204274","styleTextColor":"#2e3031","styleBoxGradient":"1","styleBoxColor1":"#fcfcfc","styleBoxRepartition1":"80%","styleBoxColor2":"#dbdbdb","styleBoxRepartition2":"100%"}'),
(12, 'apicloud', 0, '0', 'apicloud - Par défaut', '{"bgname":"templates\\/apicloud\\/images\\/bg.jpg","slidedisable":"0","image1":"templates\\/apicloud\\/images\\/slide1.jpg","image2":"templates\\/apicloud\\/images\\/slide2.jpg","image3":"templates\\/apicloud\\/images\\/slide3.jpg"}'),
(13, 'apicloud', 0, '0', 'apicloud - mnStyle', '{"bgname":"images\\/Cherbourg\\/PlagedePorquerolles_NotreDame.jpg","slidedisable":"1","image1":"images\\/Cherbourg\\/slide\\/813x313-Cherbourg_Bassin_de_commerce.JPG","image2":"images\\/Cherbourg\\/slide\\/813x313-Cherbourg-Port2.jpg","image3":"images\\/Cherbourg\\/slide\\/813x313-balade-port-Cherbourg.jpg","image4":"images\\/Cherbourg\\/slide\\/813x313-CherbourgAmCVilleRe.jpg"}'),
(14, 'real_estate_v1', 0, '0', 'real_estate_v1 - Par défaut', '{"body_color":"#f8f8f8","logo_link":"index.php","logo_width":"173","logo_height":"26","body_link_color":"#92999E","body_link_hover_color":"#12ABFF","body_underline":"none","body_hover_underline":"underline","top_menu_color":"#92999E","top_menu_hover_color":"#000000","top_menu_underline":"none","top_menu_hover_underline":"none","main_menu_color":"#92999E","main_menu_hover_color":"#000000","main_menu_underline":"none","main_menu_hover_underline":"none","menu_footer_color":"#92999E","menu_footer_hover_color":"#000000","menu_footer_underline":"none","menu_footer_hover_underline":"none","body_font":"PT Sans Narrow","links_font":"PT Sans Narrow","top_menu_font":"PT Sans Narrow","main_menu_font":"PT Sans Narrow","footer_menu_font":"PT Sans Narrow","h1_font":"PT Sans Narrow","h2_font":"PT Sans Narrow","h3_font":"PT Sans Narrow","h4_font":"PT Sans Narrow","h5_font":"PT Sans Narrow","h6_font":"PT Sans Narrow","twitter":"","facebook":"","flickr":"","linkedin":"","youtube":"","pinterest":"","google":"","dribbble":"","vimeo":"","instagram":"","vk":""}'),
(15, 'agricol', 0, '0', 'agricol - Par défaut', '{"bannerlogo_logoimgsrc":"images\\/logo\\/logo.png","bannerlogo_logoheight":"53","bannerlogo_logowidth":"216","bannerlogo_logolink":"","bannerlogo_logotitle":"","bannerlogo_logodescription":"","usecsspie":"1","useresponsive":"1"}');

-- --------------------------------------------------------

--
-- Structure de la table `joo_ucm_base`
--

CREATE TABLE IF NOT EXISTS `joo_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `joo_ucm_content`
--

CREATE TABLE IF NOT EXISTS `joo_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(255) NOT NULL,
  `core_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `core_body` mediumtext NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` text NOT NULL,
  `core_urls` text NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text NOT NULL,
  `core_metadesc` text NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains core content data in name spaced fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `joo_ucm_history`
--

CREATE TABLE IF NOT EXISTS `joo_ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=76 ;

--
-- Contenu de la table `joo_ucm_history`
--

INSERT INTO `joo_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(1, 1, 1, '', '2016-01-27 13:16:01', 502, 1715, 'e80d87ef7b70cfafdb048014404966e1f8c196c8', '{"id":1,"asset_id":54,"title":"Main","alias":"main","introtext":"<p>this is the main article on the main page<\\/p>\\r\\n<p>\\u00a0<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-01-27 13:16:01","created_by":"502","created_by_alias":"","modified":"2016-01-27 13:16:01","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-01-27 13:16:01","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(2, 2, 1, '', '2016-02-28 16:50:11', 502, 3584, 'eb72cdd3e49609cdae75ed08ffaa829c647b0a8a', '{"id":2,"asset_id":55,"title":"Qui sommes-nous ?","alias":"qui-sommes-nous","introtext":"<p>\\u00a0<\\/p>\\r\\n<p><b>Presqu\\u2019\\u00eele Habitat est l''Office Public de l\\u2019Habitat de la Communaut\\u00e9 urbaine de Cherbourg (CUC).<br \\/> <br \\/> Situ\\u00e9 au 1 rue de Nancy \\u00e0 Cherbourg-Octeville, son si\\u00e8ge social se trouve au coeur de son <a href=\\"http:\\/\\/www.presquile-habitat.fr\\/visite-patrimoine-logement-communaute-urbaine-de-cherbourg.html\\">patrimoine<\\/a>. <br \\/> <span style=\\"font-size: medium;\\"><br \\/> Les horaires d''ouverture du si\\u00e8ge : du lundi au vendredi, de 9h \\u00e0 12h00 et de 13h30 \\u00e0 17h00<\\/span><br \\/> <br \\/> <\\/b><\\/p>\\r\\n<p><em>\\"Avec un patrimoine de 7755<\\/em><em> logements situ\\u00e9s sur la CUC, Presqu\\u2019\\u00eele Habitat loge environ 18000 habitants, soit environ 20% de\\u00a0de la population de l\\u2019agglom\\u00e9ration cherbourgeoise. <br \\/> <br \\/> Au travers de son histoire, l''office a \\u00e9volu\\u00e9 et dispose aujourd\\u2019hui d\\u2019un parc immobilier b\\u00e2ti avec les d\\u00e9cideurs locaux et les professionnels de l\\u2019urbanisme et de l\\u2019architecture.<br \\/> <br \\/> La satisfaction des locataires est essentielle dans la politique men\\u00e9e par Presqu''\\u00eele Habitat : cela passe par des op\\u00e9rations de r\\u00e9novation et r\\u00e9habilitation, par le suivi des demandes, par le traitement des r\\u00e9clamations...<br \\/> <br \\/> Nous avons \\u00e9galement mis en place une strat\\u00e9gie \\u00e9nerg\\u00e9tique afin de ma\\u00eetriser les charges locatives et \\u00e9conomiser les \\u00e9nergies. Des travaux importants d''isolation ont \\u00e9t\\u00e9 r\\u00e9alis\\u00e9s et les nouvelles constructions r\\u00e9pondent aux crit\\u00e8res THPE (Tr\\u00e8s Haute Performance Energ\\u00e9tique).<br \\/> Notre but est de contenir le montant des charges locatives alors que le prix des \\u00e9nergies augmente.<br \\/> <br \\/> L''objectif majeur de Presqu''Ile Habitat est d''assurer une qualit\\u00e9 de service optimum.\\"<\\/em><\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-02-28 16:50:11","created_by":"502","created_by_alias":"","modified":"2016-02-28 16:50:11","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-02-28 16:50:11","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(3, 3, 1, '', '2016-02-28 17:05:24', 502, 2161, '41d0833b28ceebe1c475792621bbb8a8daa20c5e', '{"id":3,"asset_id":56,"title":"Offres d''emploi","alias":"offres-d-emploi","introtext":"<p>\\u00a0<\\/p>\\r\\n<p>Vous souhaitez travailler pour Presqu''\\u00eele Habitat ? Toutes nos offres d''emploi sont disponibles dans cette rubrique, envoyez-nous votre candidature d''un simple clic.<\\/p>\\r\\n<p>\\u00a0<\\/p>\\r\\n<div class=\\"offre\\">\\r\\n<p><a class=\\"pole icon\\" href=\\"http:\\/\\/www.pole-emploi.fr\\/\\">Site du P\\u00f4le Emploi<\\/a> - <a href=\\"https:\\/\\/www.apec.fr\\/\\" target=\\"_blank\\">Site de l''APEC<\\/a><\\/p>\\r\\n<\\/div>\\r\\n<p>Aucune offre d''emploi n''est actuellement en ligne.<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-02-28 17:05:24","created_by":"502","created_by_alias":"","modified":"2016-02-28 17:05:24","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-02-28 17:05:24","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(4, 4, 1, '', '2016-02-28 17:17:23', 502, 6954, '78b1e7d8e8fa86ca8607fa1be6c54989513b7814', '{"id":4,"asset_id":57,"title":"Devenir locataire","alias":"devenir-locataire","introtext":"<h1>Vous cherchez un logement<\\/h1>\\r\\n<p>Pour devenir locataire (logements familiaux ou logements \\u00e9tudiants) de Presqu\\u2019Ile Habitat, Office Public de l\\u2019Habitat de la Communaut\\u00e9 urbaine de Cherbourg, vous devez pr\\u00e9alablement \\u00eatre inscrit sur le fichier central du logement. <br \\/> <b>Nos bureaux sont ouverts du lundi au vendredi, de 9h00 \\u00e0 12h00 et de 13h30 \\u00e0 17h00.<\\/b><\\/p>\\r\\n<div style=\\"line-height: 120%; margin-bottom: 0cm;\\">\\u00a0<\\/div>\\r\\n<div style=\\"line-height: 120%; margin-bottom: 0cm;\\"><span style=\\"font-size: large;\\"><b>Comment s\\u2019inscrire\\u00a0?<br \\/> <br \\/> <br \\/> <\\/b><\\/span><\\/div>\\r\\n<ul>\\r\\n<li><strong><span style=\\"font-size: x-large;\\">S''enregistrer sur Internet :\\u00a0<\\/span><\\/strong><span style=\\"font-size: x-large;\\"><br \\/> <\\/span><\\/li>\\r\\n<\\/ul>\\r\\n<p><strong>A compter du 10 octobre 2014, vous pouvez enregistrer directement votre demande de logement en ligne en cliquant sur le lien suivant :\\u00a0 <\\/strong><strong><a href=\\"http:\\/\\/www.demandelogement50.fr\\/imhowebgp-prod\\/\\">https:\\/\\/www.demandelogement50.fr<\\/a><br \\/> <br \\/> <br \\/> <\\/strong><\\/p>\\r\\n<ul>\\r\\n<li><strong><span style=\\"font-size: x-large;\\">Remplir un formulaire papier de demande de logement : <\\/span><br \\/> <\\/strong><\\/li>\\r\\n<\\/ul>\\r\\n<div style=\\"line-height: 120%; margin-bottom: 0cm;\\"><strong>1<sup>\\u00e8re<\\/sup> \\u00e9tape\\u00a0<\\/strong>: Vous devez <strong>remplir un formulaire<\\/strong> de demande que vous pouvez vous procurer\\u00a0:<\\/div>\\r\\n<ul>\\r\\n<li>\\r\\n<div style=\\"line-height: 120%; margin-bottom: 0cm;\\">Aupr\\u00e8s de votre Mairie ;<\\/div>\\r\\n<\\/li>\\r\\n<li>aupr\\u00e8s du Service Logement de la CUC (7<span style=\\"color: #000000;\\"> <span style=\\"font-size: 9pt;\\"><span style=\\"font-style: normal;\\">rue Tour Carr\\u00e9e, BP 808, 50108 CHERBOURG-OCTEVILLE - T\\u00e9l : 02 33 08 26 45) ;<\\/span><\\/span><span style=\\"font-size: small;\\"><span style=\\"font-style: normal;\\"><span style=\\"font-size: medium;\\"><br \\/> <\\/span><\\/span><\\/span><\\/span><\\/li>\\r\\n<li><span style=\\"color: #000000;\\"><span style=\\"font-size: small;\\"><span style=\\"font-style: normal;\\"><span style=\\"font-size: medium;\\"><span style=\\"color: #000000;\\"><span style=\\"font-size: 9pt;\\"><span style=\\"font-style: normal;\\">aupr\\u00e8s de Presqu''Ile Habitat (1 rue de Nancy, CS 30122, 50101 CHERBOURG-OCTEVILLE\\u00a0cedex - T\\u00e9l : 02 33 87 84 00).<\\/span><\\/span><\\/span><\\/span><\\/span><\\/span><\\/span><\\/li>\\r\\n<\\/ul>\\r\\n<ul>\\r\\n<li>\\r\\n<div style=\\"line-height: 120%; margin-bottom: 0cm;\\"><strong><span style=\\"color: #000000;\\">sur ce site<\\/span><\\/strong><span style=\\"color: #000000;\\"> (voir imprim\\u00e9 en pi\\u00e8ce jointe ci-dessous)<br \\/> <br \\/> <\\/span><\\/div>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<p><strong>2<sup>\\u00e8me<\\/sup> \\u00e9tape<\\/strong>\\u00a0: Votre formulaire de demande et les pi\\u00e8ces justificatives sont \\u00e0 d\\u00e9poser ou \\u00e0 envoyer :\\u00a0\\u00a0<\\/p>\\r\\n<ul>\\r\\n<li>\\r\\n<div style=\\"line-height: 120%; margin-bottom: 0cm;\\">\\u00e0 votre Mairie si vous habitez d\\u00e9j\\u00e0 sur la CUC\\u00a0;<br \\/> \\u00a0<\\/div>\\r\\n<\\/li>\\r\\n<li>\\r\\n<div style=\\"line-height: 120%; margin-bottom: 0cm;\\">au Service Logement de la CUC (<span style=\\"font-size: smaller;\\">7<span style=\\"color: #000000;\\"><span style=\\"font-size: 9pt;\\"><span style=\\"font-style: normal;\\"> rue Tour Carr\\u00e9e, BP 808, 50108 CHERBOURG-OCTEVILLE - T\\u00e9l :02 33 08 26 45) si vous r\\u00e9sidez hors CUC ;<br \\/> <\\/span><\\/span><\\/span><\\/span><\\/div>\\r\\n<div style=\\"line-height: 120%; margin-bottom: 0cm;\\">\\u00a0<\\/div>\\r\\n<\\/li>\\r\\n<li>ou <strong>directement \\u00e0 Presqu''Ile Habitat <\\/strong>(1 rue de Nancy, CS 30122, 50101 CHERBOURG-OCTEVILLE cedex - T\\u00e9l : 02 33 87 84 00). Votre dossier sera alors instruit et des propositions pourront vous \\u00eatre faites.<\\/li>\\r\\n<\\/ul>\\r\\n<p><em>Vous devez fournir la photocopie de votre pi\\u00e8ce d''identit\\u00e9 ou de votre titre de s\\u00e9jour uniquement pour la transmission du dossier par courrier.<br \\/> Une simple pr\\u00e9sentation de cette pi\\u00e8ce est suffisante si vous d\\u00e9posez votre dossier.<\\/em><\\/p>\\r\\n<p><b>Dans un d\\u00e9lai d''un mois vous recevrez par courrier une attestation sur laquelle figure votre NUMERO UNIQUE DEPARTEMENTAL. Vous \\u00eates d\\u00e9sormais inscrit sur le fichier d\\u00e9partemental de demandeurs de logement.<br \\/> <\\/b><br \\/> Vous pouvez prendre contact avec Presqu\\u2019Ile Habitat pour conna\\u00eetre les logements disponibles :<br \\/> =&gt; en envoyant un mail \\u00e0 l''adresse suivante : <strong><br \\/> demande-logement@presquile-habitat.fr<\\/strong><br \\/> =&gt; en appelant au 02.33.87.84.00<br \\/> =&gt; en vous rendant au si\\u00e8ge de Presqu''Ile Habitat, 1 rue de Nancy \\u00e0 Cherbourg-Octeville<br \\/> <br \\/> \\u00a0<br \\/> <b>Vous \\u00eates int\\u00e9ress\\u00e9 par un logement<\\/b><br \\/> Votre dossier sera examin\\u00e9 avec d\\u2019autres candidatures en commission d\\u2019attribution de logement.<br \\/> Cette commission se r\\u00e9unit tous les 10 jours environ et d\\u00e9cide du candidat retenu en fonction de crit\\u00e8res sociaux, d\\u2019anciennet\\u00e9, d\\u2019urgence et de mixit\\u00e9 sociale.<\\/p>\\r\\n<h2>Documents \\u00e0 t\\u00e9l\\u00e9charger<\\/h2>\\r\\n<p>\\u00a0<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-02-28 17:17:23","created_by":"502","created_by_alias":"","modified":"2016-02-28 17:17:23","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-02-28 17:17:23","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(7, 5, 1, '', '2016-02-28 21:09:53', 502, 1866, '11c5c4dab5ef50296c2f9752d5e24de391273cc9', '{"id":5,"asset_id":"60","title":"Visitez notre patrimoine","alias":"visitez-notre-patrimoine","introtext":"<p>{mosmap Largeur=''500''|Hauteur=''400''|lat=''49.6337308''|lon=''-1.6221370''|zoom=''9''|mapType=''Normal''|text=''sv DWO''|tooltip=''DWO''|marker=''0''|align=''center'' }<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-02-28 21:04:16","created_by":"502","created_by_alias":"","modified":"2016-02-28 21:09:53","modified_by":"502","checked_out":"502","checked_out_time":"2016-02-28 21:09:19","publish_up":"2016-02-28 21:04:16","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"2","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(8, 5, 1, '', '2016-02-28 21:10:13', 502, 1867, 'e03c2d97d885b90fca65edc65b52ff6ae46ecc66', '{"id":5,"asset_id":"60","title":"Visitez notre patrimoine","alias":"visitez-notre-patrimoine","introtext":"<p>{mosmap Largeur=''500''|Hauteur=''400''|lat=''49.6337308''|lon=''-1.6221370''|zoom=''13''|mapType=''Normal''|text=''sv DWO''|tooltip=''DWO''|marker=''0''|align=''center'' }<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-02-28 21:04:16","created_by":"502","created_by_alias":"","modified":"2016-02-28 21:10:13","modified_by":"502","checked_out":"502","checked_out_time":"2016-02-28 21:09:53","publish_up":"2016-02-28 21:04:16","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":4,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"3","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(9, 5, 1, '', '2016-02-28 21:10:35', 502, 1867, '3996113df729f567729e21513eae80ceed9875f2', '{"id":5,"asset_id":"60","title":"Visitez notre patrimoine","alias":"visitez-notre-patrimoine","introtext":"<p>{mosmap Largeur=''600''|Hauteur=''400''|lat=''49.6337308''|lon=''-1.6221370''|zoom=''13''|mapType=''Normal''|text=''sv DWO''|tooltip=''DWO''|marker=''0''|align=''center'' }<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-02-28 21:04:16","created_by":"502","created_by_alias":"","modified":"2016-02-28 21:10:35","modified_by":"502","checked_out":"502","checked_out_time":"2016-02-28 21:10:13","publish_up":"2016-02-28 21:04:16","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":5,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"4","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(10, 5, 1, '', '2016-02-28 21:17:36', 502, 1868, 'b3ecdf1fa4f715e562fe445c5c52851f13ab0e5b', '{"id":5,"asset_id":"60","title":"Visitez notre patrimoine","alias":"visitez-notre-patrimoine","introtext":"<p>{mosmap Largeur=''600''|Hauteur=''400''|lat=''49.6337308''|lon=''-1.6221370''|zoom=''13''|mapType=''Normal''|text=''sv DWO''|tooltip=''DWO''|marker=''0''|align=''center'' }<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-02-28 21:04:16","created_by":"502","created_by_alias":"","modified":"2016-02-28 21:17:36","modified_by":"502","checked_out":"502","checked_out_time":"2016-02-28 21:17:00","publish_up":"2016-02-28 21:04:16","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"0\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":7,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"6","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(11, 5, 1, '', '2016-02-28 21:18:05', 502, 1869, '797f54ee22f951244406742f2411ff67cc6077c2', '{"id":5,"asset_id":"60","title":"Visitez notre patrimoine","alias":"visitez-notre-patrimoine","introtext":"<p>{mosmap Largeur=''600''|Hauteur=''400''|lat=''49.6337308''|lon=''-1.6221370''|zoom=''13''|mapType=''Normal''|text=''sv DWO''|tooltip=''DWO''|marker=''0''|align=''center'' }<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-02-28 21:04:16","created_by":"502","created_by_alias":"","modified":"2016-02-28 21:18:05","modified_by":"502","checked_out":"502","checked_out_time":"2016-02-28 21:17:36","publish_up":"2016-02-28 21:04:16","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"0\\",\\"info_block_position\\":\\"0\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":8,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"7","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(12, 5, 1, '', '2016-02-28 21:19:02', 502, 1873, '7727419c586cef68f29dc720d3fb7f8967f49caa', '{"id":5,"asset_id":"60","title":"Visitez notre patrimoine","alias":"visitez-notre-patrimoine","introtext":"<p>{mosmap Largeur=''600''|Hauteur=''400''|lat=''49.6337308''|lon=''-1.6221370''|zoom=''13''|mapType=''Normal''|text=''sv DWO''|tooltip=''DWO''|marker=''0''|align=''center'' }<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-02-28 21:04:16","created_by":"502","created_by_alias":"","modified":"2016-02-28 21:19:02","modified_by":"502","checked_out":"502","checked_out_time":"2016-02-28 21:18:05","publish_up":"2016-02-28 21:04:16","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"0\\",\\"info_block_position\\":\\"0\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"0\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"0\\",\\"show_modify_date\\":\\"0\\",\\"show_publish_date\\":\\"0\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":9,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"9","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(13, 8, 5, '', '2016-02-28 21:20:09', 502, 561, 'b056b2f60765e96db42c90979e75b01e25becaef', '{"id":8,"asset_id":61,"parent_id":"1","lft":"11","rgt":12,"level":1,"path":null,"extension":"com_content","title":"informations","alias":"informations","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-02-28 21:20:09","modified_user_id":null,"modified_time":"2016-02-28 21:20:09","hits":"0","language":"*","version":null}', 0),
(14, 9, 5, '', '2016-02-28 21:21:06', 502, 555, '5a0019470dc06db0b4c7847650d327820c2d2cdd', '{"id":9,"asset_id":62,"parent_id":"1","lft":"13","rgt":14,"level":1,"path":null,"extension":"com_content","title":"locations","alias":"locations","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-02-28 21:21:06","modified_user_id":null,"modified_time":"2016-02-28 21:21:06","hits":"0","language":"*","version":null}', 0),
(15, 5, 1, '', '2016-02-28 21:30:11', 502, 1875, '0510b2f2199c36b0045a23dd9d65eb1bcf2e433b', '{"id":5,"asset_id":"60","title":"Visitez notre patrimoine","alias":"visitez-notre-patrimoine","introtext":"<p>{mosmap Largeur=''800''|Hauteur=''400''|lat=''49.6337308''|lon=''-1.6221370''|zoom=''13''|mapType=''Normal''|text=''sv DWO''|tooltip=''DWO''|marker=''0''|align=''center'' }<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-02-28 21:04:16","created_by":"502","created_by_alias":"","modified":"2016-02-28 21:30:11","modified_by":"502","checked_out":"502","checked_out_time":"2016-02-28 21:29:56","publish_up":"2016-02-28 21:04:16","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"0\\",\\"info_block_position\\":\\"0\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"0\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"0\\",\\"show_modify_date\\":\\"0\\",\\"show_publish_date\\":\\"0\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":11,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"22","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(16, 5, 1, '', '2016-02-28 21:30:46', 502, 1899, '800ddd42811770d27c02e6077ff4306027160b27', '{"id":5,"asset_id":"60","title":"Visitez notre patrimoine","alias":"visitez-notre-patrimoine","introtext":"<p>{mosmap width=''800''|height=''400''Largeur=''800''|Hauteur=''400''|lat=''49.6337308''|lon=''-1.6221370''|zoom=''13''|mapType=''Normal''|text=''sv DWO''|tooltip=''DWO''|marker=''0''|align=''center'' }<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-02-28 21:04:16","created_by":"502","created_by_alias":"","modified":"2016-02-28 21:30:46","modified_by":"502","checked_out":"502","checked_out_time":"2016-02-28 21:30:11","publish_up":"2016-02-28 21:04:16","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"0\\",\\"info_block_position\\":\\"0\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"0\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"0\\",\\"show_modify_date\\":\\"0\\",\\"show_publish_date\\":\\"0\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":12,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"25","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(17, 5, 1, '', '2016-02-28 21:30:53', 502, 1900, 'e07927a22e0cf1565573504fe9a13116fd5febfb', '{"id":5,"asset_id":"60","title":"Visitez notre patrimoine","alias":"visitez-notre-patrimoine","introtext":"<p>{mosmap width=''800''|height=''400''|Largeur=''800''|Hauteur=''400''|lat=''49.6337308''|lon=''-1.6221370''|zoom=''13''|mapType=''Normal''|text=''sv DWO''|tooltip=''DWO''|marker=''0''|align=''center'' }<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-02-28 21:04:16","created_by":"502","created_by_alias":"","modified":"2016-02-28 21:30:53","modified_by":"502","checked_out":"502","checked_out_time":"2016-02-28 21:30:46","publish_up":"2016-02-28 21:04:16","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"0\\",\\"info_block_position\\":\\"0\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"0\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"0\\",\\"show_modify_date\\":\\"0\\",\\"show_publish_date\\":\\"0\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":13,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"25","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(18, 10, 5, '', '2016-03-16 17:58:42', 502, 546, '8c3dc1430b474ab49f5f4617dcb07d802605e76f', '{"id":10,"asset_id":63,"parent_id":"1","lft":"15","rgt":16,"level":1,"path":null,"extension":"com_content","title":"aide","alias":"aide","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-16 17:58:42","modified_user_id":null,"modified_time":"2016-03-16 17:58:42","hits":"0","language":"*","version":null}', 0),
(19, 6, 1, '', '2016-03-16 17:59:06', 502, 1689, '2212e837eb14afe0e2983d875e6c75006743451d', '{"id":6,"asset_id":64,"title":"Mentions l\\u00e9gales","alias":"mentions-legales","introtext":"<p>lois<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-03-16 17:59:06","created_by":"502","created_by_alias":"","modified":"2016-03-16 17:59:06","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-03-16 17:59:06","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(20, 7, 1, '', '2016-03-16 17:59:48', 502, 1687, '0888bc90dc93f384aa2e93fbe11ab0ea0119f61e', '{"id":7,"asset_id":65,"title":"Liens utiles","alias":"liens-utiles","introtext":"<p>villes CUC FTJ<\\/p>","fulltext":"","state":1,"catid":"10","created":"2016-03-16 17:59:48","created_by":"502","created_by_alias":"","modified":"2016-03-16 17:59:48","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-03-16 17:59:48","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(21, 8, 1, '', '2016-03-16 18:00:24', 502, 1663, 'dfbbc53027deaa80ded4781c65225ef4b3f1af08', '{"id":8,"asset_id":66,"title":"F.A.Q.","alias":"f-a-q","introtext":"<p>aide<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-03-16 18:00:24","created_by":"502","created_by_alias":"","modified":"2016-03-16 18:00:24","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-03-16 18:00:24","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(22, 5, 1, '', '2016-03-16 18:05:53', 502, 1900, 'da9b0aaa27de04d01eacefb43e6a073e8d2dccc6', '{"id":5,"asset_id":"60","title":"Visitez notre patrimoine","alias":"visitez-notre-patrimoine","introtext":"<p>{mosmap width=''800''|height=''400''|Largeur=''800''|Hauteur=''400''|lat=''49.6337308''|lon=''-1.6221370''|zoom=''13''|mapType=''Normal''|text=''sv DWO''|tooltip=''DWO''|marker=''0''|align=''center'' }<\\/p>","fulltext":"","state":1,"catid":"8","created":"2016-02-28 21:04:16","created_by":"502","created_by_alias":"","modified":"2016-03-16 18:05:53","modified_by":"502","checked_out":"502","checked_out_time":"2016-03-16 18:05:41","publish_up":"2016-02-28 21:04:16","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"0\\",\\"info_block_position\\":\\"0\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"0\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"0\\",\\"show_modify_date\\":\\"0\\",\\"show_publish_date\\":\\"0\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":14,"ordering":"2","metakey":"","metadesc":"","access":"1","hits":"31","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(23, 9, 1, '', '2016-03-16 18:16:10', 502, 2312, '0df48bbf50a0e717e9caabb5e6b0ab083837ea09', '{"id":9,"asset_id":67,"title":"Contact","alias":"contact","introtext":"<p>{mosmap width=''200''|height=''280''|Largeur=''200''|Hauteur=''280''|zoom=''13''|mapType=''Normal''|text=''<strong>Presqu''\\u00eele Habitat<\\/strong>''|tooltip=''<strong>Presqu''\\u00eele Habitat<\\/strong>&lt;br&gt;<br \\/> 1 rue de Nancy - CS 30122&lt;br&gt;<br \\/> 50101 CHERBOURG OCTEVILLE Cedex&lt;br&gt;<\\/p>\\r\\n<p>Tel : 02 33 87 84 00&lt;br&gt;<br \\/> Fax : 02 33 08 03 67''|marker=''0''|align=''center''|address=''Presqu''\\u00eele Habitat, 1 rue de Nancy, 50101, CHERBOURG OCTEVILLE''}<\\/p>\\r\\n<p><strong>Presqu''\\u00eele Habitat<\\/strong><br \\/> 1 rue de Nancy - CS 30122<br \\/> 50101 CHERBOURG OCTEVILLE Cedex<\\/p>\\r\\n<p>Tel : 02 33 87 84 00<br \\/> Fax : 02 33 08 03 67<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-03-16 18:16:10","created_by":"502","created_by_alias":"","modified":"2016-03-16 18:16:10","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-03-16 18:16:10","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0);
INSERT INTO `joo_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(24, 9, 1, '', '2016-03-16 18:20:02', 502, 2331, 'f26eeabb106be0d01f47fd70faabf766c9c0c075', '{"id":9,"asset_id":"67","title":"Contact","alias":"contact","introtext":"<p>{mosmap width=''250''|height=''300''|Largeur=''250''|Hauteur=''300''|zoom=''16''|mapType=''Normal''|text=''<strong>Presqu''\\u00eele Habitat<\\/strong>''|tooltip=''<strong>Presqu''\\u00eele Habitat<\\/strong>&lt;br&gt;<br \\/> 1 rue de Nancy - CS 30122&lt;br&gt;<br \\/> 50101 CHERBOURG OCTEVILLE Cedex&lt;br&gt;<\\/p>\\r\\n<p>Tel : 02 33 87 84 00&lt;br&gt;<br \\/> Fax : 02 33 08 03 67''|marker=''0''|align=''center''|address=''Presqu''\\u00eele Habitat, 1 rue de Nancy, 50101, CHERBOURG OCTEVILLE''}<\\/p>\\r\\n<p><strong>Presqu''\\u00eele Habitat<\\/strong><br \\/> 1 rue de Nancy - CS 30122<br \\/> 50101 CHERBOURG OCTEVILLE Cedex<\\/p>\\r\\n<p>Tel : 02 33 87 84 00<br \\/> Fax : 02 33 08 03 67<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-03-16 18:16:10","created_by":"502","created_by_alias":"","modified":"2016-03-16 18:20:02","modified_by":"502","checked_out":"502","checked_out_time":"2016-03-16 18:16:10","publish_up":"2016-03-16 18:16:10","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"2","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(25, 10, 1, '', '2016-03-16 18:49:11', 502, 5813, 'ccfc3ccbf21ae05b8b06913a61c51a89d66a7d57', '{"id":10,"asset_id":68,"title":"Travaux en cours","alias":"travaux-en-cours","introtext":"<h4>\\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...\\"<\\/h4>\\r\\n<h5>\\"Il n\\u2019y a personne qui n\\u2019aime la souffrance pour elle-m\\u00eame, qui ne la recherche et qui ne la veuille pour elle-m\\u00eame\\u2026\\"<\\/h5>\\r\\n<div style=\\"float: right; margin-left: 6px; margin-bottom: 6px;\\"><a href=\\"http:\\/\\/www.cafepress.com\\/lipsum\\/\\" target=\\"_blank\\"><img src=\\"http:\\/\\/fr.lipsum.com\\/images\\/lipsum07.gif\\" alt=\\"Lipsum\\" width=\\"100\\" height=\\"100\\" border=\\"0\\" \\/><\\/a><br \\/><a href=\\"http:\\/\\/www.cafepress.com\\/lipsum\\/\\" target=\\"_blank\\"><img src=\\"http:\\/\\/fr.lipsum.com\\/images\\/lipsum08.gif\\" alt=\\"Lipsum\\" width=\\"100\\" height=\\"100\\" border=\\"0\\" \\/><\\/a><br \\/><a href=\\"http:\\/\\/www.cafepress.com\\/lipsum\\/\\" target=\\"_blank\\"><img src=\\"http:\\/\\/fr.lipsum.com\\/images\\/lipsum04.gif\\" alt=\\"Lipsum\\" width=\\"100\\" height=\\"100\\" border=\\"0\\" \\/><\\/a><br \\/><a href=\\"http:\\/\\/www.cafepress.com\\/lipsum\\/\\" target=\\"_blank\\"><img src=\\"http:\\/\\/fr.lipsum.com\\/images\\/lipsum05.gif\\" alt=\\"Lipsum\\" width=\\"100\\" height=\\"100\\" border=\\"0\\" \\/><\\/a><\\/div>\\r\\n<div id=\\"lipsum\\">\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam leo felis, dictum in neque nec, posuere commodo nibh. Donec euismod volutpat sagittis. Ut sollicitudin tempus ante quis porttitor. Nullam eu nunc viverra urna mattis rhoncus. Phasellus odio ligula, ullamcorper ut leo sed, molestie sollicitudin tortor. Mauris pharetra sodales tempus. Integer sed pharetra arcu. Etiam tempus magna mi, eu sagittis augue commodo quis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Etiam in justo dapibus, dignissim diam et, feugiat dolor.<\\/p>\\r\\n<p>Donec tincidunt nunc vitae ligula maximus, sit amet vestibulum augue sollicitudin. Mauris eros eros, vehicula sed malesuada eget, tristique ut neque. Aliquam ligula dolor, vehicula in tempus nec, egestas pellentesque diam. Pellentesque volutpat malesuada orci sed gravida. Nulla tristique eros ac tortor aliquam, sed euismod velit rhoncus. Mauris ultrices dignissim enim, ut eleifend augue fermentum ac. Mauris egestas nisl eget euismod condimentum. Maecenas ut urna quis ligula eleifend suscipit ut id augue. Vivamus id eros massa. Praesent dapibus ut est auctor pellentesque. In dictum malesuada orci. In efficitur laoreet tempus. Proin cursus est mauris, ut feugiat odio gravida quis. Ut porttitor egestas gravida. Ut tempus consectetur neque sit amet imperdiet. Donec ac sodales est.<\\/p>\\r\\n<p>Mauris viverra, erat nec pharetra hendrerit, lectus orci posuere sem, ut faucibus urna risus facilisis nisl. Aliquam faucibus vitae dui ut suscipit. Aliquam vehicula lacinia finibus. Cras luctus turpis lacus, in pharetra sem interdum sit amet. In quis hendrerit mauris. Donec faucibus arcu eget orci mattis tristique. Etiam lorem nunc, lacinia non neque a, pellentesque pharetra libero.<\\/p>\\r\\n<p>Vivamus tincidunt finibus pretium. Morbi porta id ex vitae finibus. Vestibulum sed nisi vel lorem tempus pulvinar. Nullam euismod tristique nunc ac iaculis. Aenean pretium, est eu rutrum maximus, nisl ipsum porttitor diam, id commodo justo sapien eu libero. Suspendisse placerat tortor sit amet dolor dictum faucibus. In euismod massa laoreet, ullamcorper nibh vitae, tincidunt est. Maecenas eleifend arcu a est bibendum, id maximus mi faucibus. Nulla rhoncus aliquet enim, sed eleifend ex aliquam vitae. Sed posuere, urna ut dapibus ullamcorper, dolor libero malesuada lacus, id aliquet erat libero sed odio. Vivamus ut libero ex. Fusce sit amet est nec erat ornare blandit quis a orci. Pellentesque vulputate ultricies tortor ut convallis.<\\/p>\\r\\n<p>Praesent semper et diam ac sollicitudin. Aliquam vestibulum nisi a urna pretium ultrices. Nam vulputate hendrerit dictum. Ut venenatis purus sed tincidunt ultrices. Nulla nec lectus suscipit, commodo sapien vel, accumsan mi. Aliquam sed consequat elit. Aliquam tristique nisi lorem, sit amet varius dui rhoncus sed. Proin quis lacus pellentesque, rutrum massa sit amet, lobortis leo. Fusce porta massa sit amet dui fringilla maximus.<\\/p>\\r\\n<\\/div>","fulltext":"","state":1,"catid":"8","created":"2016-03-16 18:49:11","created_by":"502","created_by_alias":"","modified":"2016-03-16 18:49:11","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-03-16 18:49:11","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(26, 11, 5, '', '2016-03-16 19:33:29', 502, 548, 'a0aac39d3277fbf47dbaa38245d624de596cb352', '{"id":11,"asset_id":69,"parent_id":"1","lft":"17","rgt":18,"level":1,"path":null,"extension":"com_content","title":"Actus","alias":"actus","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-16 19:33:29","modified_user_id":null,"modified_time":"2016-03-16 19:33:29","hits":"0","language":"*","version":null}', 0),
(27, 12, 5, '', '2016-03-16 19:33:42', 502, 558, '33cd5339130574f48dced63b1d1b5d35d7f08dc6', '{"id":12,"asset_id":70,"parent_id":"1","lft":"19","rgt":20,"level":1,"path":null,"extension":"com_content","title":"Espace Pro","alias":"espace-pro","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-16 19:33:42","modified_user_id":null,"modified_time":"2016-03-16 19:33:42","hits":"0","language":"*","version":null}', 0),
(28, 13, 5, '', '2016-03-16 19:33:54', 502, 570, '24ece54906a6566caf57be92c64e8de08a829835', '{"id":13,"asset_id":71,"parent_id":"1","lft":"21","rgt":22,"level":1,"path":null,"extension":"com_content","title":"Espace locataire","alias":"espace-locataire","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-16 19:33:54","modified_user_id":null,"modified_time":"2016-03-16 19:33:54","hits":"0","language":"*","version":null}', 0),
(29, 14, 5, '', '2016-03-16 19:34:01', 502, 586, '98602d699b7ae53aa515497e9fd98c931e858061', '{"id":14,"asset_id":72,"parent_id":"1","lft":"23","rgt":24,"level":1,"path":null,"extension":"com_content","title":"Visitez notre patrimoine","alias":"visitez-notre-patrimoine","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-16 19:34:01","modified_user_id":null,"modified_time":"2016-03-16 19:34:01","hits":"0","language":"*","version":null}', 0),
(30, 15, 5, '', '2016-03-16 19:34:12', 502, 572, 'fa211919b13238580f47529ef0571e555788bbc5', '{"id":15,"asset_id":73,"parent_id":"1","lft":"25","rgt":26,"level":1,"path":null,"extension":"com_content","title":"Devenir locataire","alias":"devenir-locataire","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-16 19:34:12","modified_user_id":null,"modified_time":"2016-03-16 19:34:12","hits":"0","language":"*","version":null}', 0),
(31, 16, 5, '', '2016-03-16 19:34:47', 502, 584, '477e154ce1a5cce0c145af9ef4e3e337450c7def', '{"id":16,"asset_id":74,"parent_id":"1","lft":"27","rgt":28,"level":1,"path":null,"extension":"com_content","title":"Consulter nos logements","alias":"consulter-nos-logements","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-16 19:34:47","modified_user_id":null,"modified_time":"2016-03-16 19:34:47","hits":"0","language":"*","version":null}', 0),
(32, 17, 5, '', '2016-03-16 19:35:07', 502, 576, 'c82b9ce741d8d3ff2eb3d56c8bfdc4e1f6017b8a', '{"id":17,"asset_id":75,"parent_id":"1","lft":"29","rgt":30,"level":1,"path":null,"extension":"com_content","title":"Logements etudiants","alias":"logements-etudiants","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-16 19:35:07","modified_user_id":null,"modified_time":"2016-03-16 19:35:07","hits":"0","language":"*","version":null}', 0),
(33, 18, 5, '', '2016-03-16 19:35:20', 502, 572, 'c3576e56327953724e1638d58a904c75b9c71a1b', '{"id":18,"asset_id":76,"parent_id":"1","lft":"31","rgt":32,"level":1,"path":null,"extension":"com_content","title":"Payez votre loyer","alias":"payez-votre-loyer","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-16 19:35:20","modified_user_id":null,"modified_time":"2016-03-16 19:35:20","hits":"0","language":"*","version":null}', 0),
(34, 19, 5, '', '2016-03-16 19:35:33', 502, 570, 'a29367890c7d8050bad0b69c8e1578b90c5ace42', '{"id":19,"asset_id":77,"parent_id":"1","lft":"33","rgt":34,"level":1,"path":null,"extension":"com_content","title":"Qui sommes-nous ?","alias":"qui-sommes-nous","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-16 19:35:33","modified_user_id":null,"modified_time":"2016-03-16 19:35:33","hits":"0","language":"*","version":null}', 0),
(35, 20, 5, '', '2016-03-16 19:36:15', 502, 549, '9451d09d1849e36c07938a3bfc48e0e847a4731c', '{"id":20,"asset_id":78,"parent_id":"1","lft":"35","rgt":36,"level":1,"path":null,"extension":"com_content","title":"F.A.Q.","alias":"f-a-q","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-16 19:36:15","modified_user_id":null,"modified_time":"2016-03-16 19:36:15","hits":"0","language":"*","version":null}', 0),
(36, 7, 1, '', '2016-03-16 19:38:38', 502, 2226, '694e37e9a68c6c9b9486b043f3fb320b7f9b5939', '{"id":7,"asset_id":"65","title":"Liens utiles","alias":"liens-utiles","introtext":"<ul style=\\"display: block;\\">\\r\\n<li><a href=\\"http:\\/\\/conseil.general.manche.fr\\/FSL.asp\\">Le Fonds de Solidarit\\u00e9 pour le Logement (FSL) - Conseil G\\u00e9n\\u00e9ral<\\/a><\\/li>\\r\\n<li><a href=\\"http:\\/\\/wwwd.caf.fr\\/wps\\/portal\\/caffr\\/aidesetservices\\/lesservicesenligne\\/estimervosdroits\\/lelogement\\">Calcul d''aide au logement<\\/a><\\/li>\\r\\n<li><a href=\\"http:\\/\\/www.caf.fr\\/\\">Site de la Caisse d''Allocations Familiales<\\/a><\\/li>\\r\\n<li><a href=\\"http:\\/\\/www.logiliance-ouest.fr\\/\\">Site de Logiliance Ouest<\\/a><\\/li>\\r\\n<\\/ul>","fulltext":"","state":1,"catid":"10","created":"2016-03-16 17:59:48","created_by":"502","created_by_alias":"","modified":"2016-03-16 19:38:38","modified_by":"502","checked_out":"502","checked_out_time":"2016-03-16 19:38:24","publish_up":"2016-03-16 17:59:48","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(37, 11, 1, '', '2016-03-16 19:51:22', 502, 5315, 'de5ffa9484ec6808bd8424565d36dca4ce3f0358', '{"id":11,"asset_id":79,"title":"Plafonds et textes de loi","alias":"plafonds-et-textes-de-loi","introtext":"<p>\\u00a0<\\/p>\\r\\n<ul>\\r\\n<li>Duis ornare libero pellentesque massa tincidunt egestas.<\\/li>\\r\\n<li>Etiam eu quam vitae mi dictum dapibus.<\\/li>\\r\\n<li>Etiam at enim vel felis commodo tincidunt ac ultrices purus.<\\/li>\\r\\n<\\/ul>\\r\\n<p>\\u00a0<\\/p>\\r\\n<ul>\\r\\n<li>Phasellus tempor purus sit amet mauris tincidunt dignissim.<\\/li>\\r\\n<li>Vestibulum sodales leo ac lectus pulvinar accumsan.<\\/li>\\r\\n<\\/ul>\\r\\n<p>\\u00a0<\\/p>\\r\\n<ul>\\r\\n<li>Nam posuere lacus sit amet tortor ullamcorper convallis.<\\/li>\\r\\n<li>In aliquet tortor a diam efficitur, ut placerat nisl sagittis.<\\/li>\\r\\n<li>Ut non metus mollis, ornare massa ut, iaculis urna.<\\/li>\\r\\n<li>Duis pulvinar felis quis molestie mattis.<\\/li>\\r\\n<\\/ul>\\r\\n<p>\\u00a0<\\/p>\\r\\n<ul>\\r\\n<li>Suspendisse dapibus mauris sit amet purus eleifend sagittis.<\\/li>\\r\\n<li>Praesent placerat arcu in eleifend ultricies.<\\/li>\\r\\n<li>Sed consectetur odio id elit vulputate aliquet.<\\/li>\\r\\n<li>Morbi imperdiet tellus luctus scelerisque bibendum.<\\/li>\\r\\n<li>In molestie dui id velit viverra auctor.<\\/li>\\r\\n<\\/ul>\\r\\n<p>\\u00a0<\\/p>\\r\\n<ul>\\r\\n<li>Nam bibendum nulla sed justo consectetur, non malesuada nisi ornare.<\\/li>\\r\\n<li>Donec rutrum tellus id nibh cursus, quis condimentum ante mattis.<\\/li>\\r\\n<li>Mauris in velit finibus, pharetra sapien a, blandit nulla.<\\/li>\\r\\n<\\/ul>\\r\\n<p>Praesent eget diam molestie neque tincidunt sodales. Praesent a consectetur ligula, in congue ligula. Nam sed ipsum suscipit orci pretium semper in id sem. Vivamus ligula nunc, dignissim eget felis nec, condimentum semper sapien. Donec diam nibh, laoreet at egestas at, tempor a ligula. Sed nec dictum dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam tincidunt nulla in dolor sollicitudin elementum.<\\/p>\\r\\n<p>Nulla facilisi. Morbi ut fermentum dui, et imperdiet leo. Vestibulum consectetur erat ligula, ac sollicitudin ipsum varius non. Sed congue eleifend vulputate. Proin varius ligula sed velit imperdiet lobortis. Sed eget consequat dui, eu lacinia massa. In faucibus in augue nec vehicula. Duis sed nulla in nibh mattis faucibus ut in lectus. Integer accumsan tempus tincidunt. Donec id massa sit amet diam gravida pellentesque tempor a est. Duis hendrerit purus in sapien ornare venenatis. Curabitur eleifend accumsan lacus, ac eleifend risus aliquet sit amet.<\\/p>\\r\\n<p>Proin pretium sapien libero, vitae interdum ante vehicula eget. Nunc at arcu ac mauris ultrices dignissim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec varius, sapien ut vehicula eleifend, magna tortor bibendum massa, sit amet dapibus odio magna in diam. Duis nec luctus purus. Proin rhoncus metus ac justo egestas, in laoreet augue luctus. Duis ullamcorper feugiat eros pharetra accumsan.<\\/p>\\r\\n<p>Maecenas tristique augue ac mi vestibulum, ut iaculis sem rutrum. Maecenas id augue ex. Duis lobortis tincidunt lobortis. Fusce convallis convallis dui nec luctus. Mauris in malesuada justo, in euismod diam. Donec sed nisi in erat consequat rhoncus. Aliquam dapibus ac lorem sit amet porttitor.<\\/p>\\r\\n<p>Sed imperdiet velit arcu, rhoncus auctor tellus volutpat eget. Curabitur enim ipsum, consectetur nec erat a, rutrum congue lectus. Nulla volutpat diam arcu, ac viverra ante rhoncus nec. In imperdiet, nisl vitae imperdiet convallis, arcu nisl euismod tellus, ut consequat sem elit et mauris. Cras tristique mauris dolor, sit amet lacinia mauris auctor eu. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut eu purus vitae ipsum eleifend scelerisque in vel neque<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-03-16 19:51:22","created_by":"502","created_by_alias":"","modified":"2016-03-16 19:51:22","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-03-16 19:51:22","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(38, 12, 1, '', '2016-03-16 19:54:17', 502, 3075, '3213a3b44df6a0ab8c72c41cb25a2c4b79ea62a3', '{"id":12,"asset_id":80,"title":"APL","alias":"apl","introtext":"<ul>\\r\\n<li>Nunc molestie sapien a ex tincidunt finibus.<\\/li>\\r\\n<li>Sed pulvinar arcu ut lorem semper sagittis.<\\/li>\\r\\n<li>Morbi lobortis dolor ac commodo molestie.<\\/li>\\r\\n<\\/ul>\\r\\n<p>\\u00a0<\\/p>\\r\\n<ul>\\r\\n<li>Quisque vel elit tincidunt, mattis dolor vitae, pellentesque libero.<\\/li>\\r\\n<li>Curabitur facilisis purus et justo mollis fermentum.<\\/li>\\r\\n<li>Donec vel metus feugiat, suscipit mi at, consectetur lorem.<\\/li>\\r\\n<\\/ul>\\r\\n<p>\\u00a0<\\/p>\\r\\n<ul>\\r\\n<li>Mauris eget justo sit amet nibh elementum bibendum at eu ipsum.<\\/li>\\r\\n<li>Nam vulputate velit eget erat consequat, quis malesuada ex commodo.<\\/li>\\r\\n<\\/ul>\\r\\n<p>\\u00a0<\\/p>\\r\\n<ul>\\r\\n<li>Sed non augue non sapien interdum hendrerit quis vitae magna.<\\/li>\\r\\n<li>Aliquam blandit tellus a erat porttitor cursus vel sit amet ligula.<\\/li>\\r\\n<li>Quisque ac nisi sit amet orci suscipit sagittis.<\\/li>\\r\\n<li>Nullam dapibus mi sit amet est ultrices, et rutrum nulla lobortis.<\\/li>\\r\\n<li>Curabitur ullamcorper lorem id urna facilisis, in vehicula ligula lacinia.<\\/li>\\r\\n<\\/ul>\\r\\n<p>\\u00a0<\\/p>\\r\\n<ul>\\r\\n<li>Nunc eu nibh vestibulum sem laoreet egestas sit amet vel sem.<\\/li>\\r\\n<li>Aenean vulputate enim vel tempor commodo.<\\/li>\\r\\n<li>Nullam vestibulum tellus vitae tortor rutrum auctor.<\\/li>\\r\\n<li>Aliquam eget metus posuere, malesuada ipsum vel, eleifend odio.<\\/li>\\r\\n<li>Cras vestibulum arcu vitae pulvinar condimentum.<\\/li>\\r\\n<\\/ul>","fulltext":"","state":1,"catid":"2","created":"2016-03-16 19:54:17","created_by":"502","created_by_alias":"","modified":"2016-03-16 19:54:17","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-03-16 19:54:17","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(39, 13, 1, '', '2016-03-16 19:55:13', 502, 6480, '30f52d3377c6cbacc246625edc6acc623a85b523', '{"id":13,"asset_id":81,"title":"R\\u00e8glement int\\u00e9rieur","alias":"reglement-interieur","introtext":"<div id=\\"lipsum\\">\\r\\n<p>Curabitur eget urna viverra, lacinia sem eleifend, tincidunt tortor. Aliquam fringilla ipsum turpis. Donec congue semper nisi sed scelerisque. Sed fringilla quis augue ac consequat. Vestibulum viverra at mauris eget sagittis. Nulla fringilla sollicitudin libero, eu consequat ante vulputate ac. Aenean nec mauris nec eros faucibus cursus eget nec eros. Nunc a neque et odio accumsan consectetur. Etiam volutpat sapien arcu, ultrices ullamcorper turpis ullamcorper pharetra. Morbi interdum ultrices lorem in egestas. Pellentesque dignissim, dui id vulputate euismod, nulla diam sodales libero, vel tincidunt lectus ligula vel nisi. Suspendisse a dignissim felis. Donec ac augue sed libero elementum vestibulum eu ut lorem. Nullam ac semper quam, et egestas nulla. Duis posuere maximus arcu scelerisque accumsan.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et enim sed lorem suscipit euismod. Morbi faucibus orci tortor, eu condimentum elit posuere non. Duis aliquet nisi vel ex mattis scelerisque. Aliquam erat volutpat. Mauris porta dui nisl, sed dapibus ante hendrerit id. Etiam rhoncus eget mauris et imperdiet. Etiam varius aliquam diam, quis placerat magna. Curabitur id ultricies est, vitae facilisis erat. Aenean vitae arcu non est faucibus convallis vitae eget erat. Donec consequat turpis eu auctor elementum. Fusce vitae ligula id est congue feugiat a in purus. Quisque in condimentum odio. Praesent pellentesque ante vitae sapien laoreet semper.<\\/p>\\r\\n<p>In id posuere dui. Morbi ac porta felis, ac gravida nunc. Nullam at metus eleifend, sagittis sem aliquet, dignissim sapien. In euismod non ipsum vel sagittis. Nam auctor leo elit, at lacinia tellus semper in. Etiam tempus turpis eu dui bibendum dignissim. Quisque sed odio libero. Maecenas maximus, ante sit amet fermentum aliquet, tellus mi eleifend nulla, quis tincidunt lectus arcu ut odio. Praesent malesuada imperdiet nibh nec porta. Etiam rhoncus, elit sit amet viverra consequat, dui lacus commodo augue, suscipit tincidunt magna justo sit amet erat. Aliquam vehicula sapien convallis luctus tristique.<\\/p>\\r\\n<p>Duis mollis ac elit et porttitor. Curabitur augue sapien, pulvinar in arcu porttitor, condimentum bibendum mauris. Morbi hendrerit orci sed quam porttitor, quis egestas sem convallis. Donec iaculis felis eu turpis fringilla, et maximus quam posuere. Quisque diam tortor, faucibus eget lorem non, aliquet viverra tortor. Proin tincidunt in mauris vitae eleifend. Donec varius ullamcorper nisl quis blandit. Duis vitae ipsum nec odio placerat faucibus. Curabitur gravida neque a metus viverra, sit amet finibus ex ultricies. Curabitur accumsan nulla sed ex hendrerit, eget faucibus nisl volutpat. Aenean eleifend id dui at faucibus. Phasellus lobortis dignissim tempus. Aenean massa nisl, pretium non sollicitudin non, finibus quis metus. Proin ultrices lacus nisl. Curabitur porttitor pretium urna, ut dictum sapien blandit ac. Cras vel sapien vulputate risus laoreet ullamcorper ut vitae elit.<\\/p>\\r\\n<p>Quisque ut dui eget dolor faucibus consequat tempor vel nisl. Aenean odio justo, rutrum egestas sapien quis, viverra efficitur elit. Donec dui leo, ornare a erat eget, egestas varius lectus. Sed auctor, tortor eu venenatis auctor, neque purus accumsan ex, eget volutpat ex risus ut ipsum. Donec in sapien ut ex pharetra mattis ut vel lectus. Vivamus vitae ipsum scelerisque, cursus augue non, lobortis erat. Cras justo diam, placerat in massa quis, lobortis tempus sem. Mauris tempus, mauris vitae ultrices posuere, purus leo aliquam velit, non tincidunt sapien lectus eu sapien. Nam quis eros vitae diam varius eleifend. Aliquam dapibus erat augue, non volutpat dui tempus sit amet. Donec ac justo tellus. Etiam volutpat ligula sit amet neque pharetra viverra. Integer ac mi tincidunt, eleifend sapien nec, mattis nulla.<\\/p>\\r\\n<p>In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque in purus volutpat, aliquam turpis nec, finibus mi. Aliquam libero lectus, euismod id dignissim ut, feugiat vel lacus. Vestibulum condimentum ut leo dignissim faucibus. Vestibulum mattis nisl nibh, et imperdiet urna consequat nec. Morbi vitae maximus lectus, condimentum tincidunt neque. Nulla pellentesque ex nulla, non consectetur nisl ullamcorper dignissim. Integer porta interdum massa et lacinia. Nullam mollis libero eget facilisis lobortis. Pellentesque vitae vehicula nisi. In sagittis lacus id nulla molestie, eu aliquam felis accumsan. Vivamus id sem purus. Nulla non blandit mauris. Nullam id molestie nisi, a scelerisque sapien. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.<\\/p>\\r\\n<\\/div>","fulltext":"","state":1,"catid":"2","created":"2016-03-16 19:55:13","created_by":"502","created_by_alias":"","modified":"2016-03-16 19:55:13","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-03-16 19:55:13","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(40, 14, 1, '', '2016-03-16 19:58:05', 502, 5204, '720463d4aab436d47d65b061d2ec391e07f95788', '{"id":14,"asset_id":82,"title":"Coordonn\\u00e9es des gardiens \\/ astreinte","alias":"coordonnees-des-gardiens-astreinte","introtext":"<h3>Le passage de Lorem Ipsum standard, utilis\\u00e9 depuis 1500<\\/h3>\\r\\n<p>\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\"<\\/p>\\r\\n<h3>Section 1.10.32 du \\"De Finibus Bonorum et Malorum\\" de Ciceron (45 av. J.-C.)<\\/h3>\\r\\n<p>\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\\"<\\/p>\\r\\n<h3>Traduction de H. Rackham (1914)<\\/h3>\\r\\n<p>\\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\\"<\\/p>\\r\\n<h3>Section 1.10.33 du \\"De Finibus Bonorum et Malorum\\" de Ciceron (45 av. J.-C.)<\\/h3>\\r\\n<p>\\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\\"<\\/p>","fulltext":"","state":1,"catid":"2","created":"2016-03-16 19:58:05","created_by":"502","created_by_alias":"","modified":"2016-03-16 19:58:05","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-03-16 19:58:05","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(41, 14, 1, '', '2016-03-16 20:02:06', 502, 1883, '155beea39aa508fbe6de2a3589032fd8553c08f1', '{"id":14,"asset_id":"82","title":"Coordonn\\u00e9es des gardiens \\/ astreinte","alias":"coordonnees-des-gardiens-astreinte","introtext":"<select>\\r\\n<option>gardien 1<\\/option>\\r\\n<option>gardien 2<\\/option>\\r\\n<option>gardien 3<\\/option>\\r\\n<option>gardien 4<\\/option>\\r\\n<\\/select>","fulltext":"","state":1,"catid":"13","created":"2016-03-16 19:58:05","created_by":"502","created_by_alias":"","modified":"2016-03-16 20:02:06","modified_by":"502","checked_out":"502","checked_out_time":"2016-03-16 20:01:30","publish_up":"2016-03-16 19:58:05","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0);
INSERT INTO `joo_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(42, 13, 1, '', '2016-03-16 20:05:21', 502, 8427, '0728a20aa5a9e8fd6d390a86d71d1e7c04d64aae', '{"id":13,"asset_id":"81","title":"Droits et oblgations","alias":"droits-et-oblgations","introtext":"<div id=\\"lipsum\\">\\r\\n<h2><span style=\\"text-decoration: underline;\\"><strong>APL<\\/strong><\\/span><\\/h2>\\r\\n<p>Quisque ut dui eget dolor faucibus consequat tempor vel nisl. Aenean odio justo, rutrum egestas sapien quis, viverra efficitur elit. Donec dui leo, ornare a erat eget, egestas varius lectus. Sed auctor, tortor eu venenatis auctor, neque purus accumsan ex, eget volutpat ex risus ut ipsum. Donec in sapien ut ex pharetra mattis ut vel lectus. Vivamus vitae ipsum scelerisque, cursus augue non, lobortis erat. Cras justo diam, placerat in massa quis, lobortis tempus sem. Mauris tempus, mauris vitae ultrices posuere, purus leo aliquam velit, non tincidunt sapien lectus eu sapien. Nam quis eros vitae diam varius eleifend. Aliquam dapibus erat augue, non volutpat dui tempus sit amet. Donec ac justo tellus. Etiam volutpat ligula sit amet neque pharetra viverra. Integer ac mi tincidunt, eleifend sapien nec, mattis nulla.<\\/p>\\r\\nIn hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque in purus volutpat, aliquam turpis nec, finibus mi. Aliquam libero lectus, euismod id dignissim ut, feugiat vel lacus. Vestibulum condi.\\r\\n<h2>\\u00a0<\\/h2>\\r\\n<p>In id posuere dui. Morbi ac porta felis, ac gravida nunc. Nullam at metus eleifend, sagittis sem aliquet, dignissim sapien. In euismod non ipsum vel sagittis. Nam auctor leo elit, at lacinia tellus semper in. Etiam tempus turpis eu dui bibendum dignissim. Quisque sed odio libero. Maecenas maximus, ante sit amet fermentum aliquet, tellus mi eleifend nulla, quis tincidunt lectus arcu ut odio. Praesent malesuada imperdiet nibh nec porta. Etiam rhoncus, elit sit amet viverra consequat, dui lacus commodo augue, suscipit tincidunt magna justo sit amet erat. Aliquam vehicula sapien convallis luctus tristique.<\\/p>\\r\\n<p>\\u00a0<\\/p>\\r\\n<h2><span style=\\"text-decoration: underline;\\"><strong>R\\u00e8glement int\\u00e9rieur<\\/strong><\\/span><\\/h2>\\r\\n<p>Curabitur eget urna viverra, lacinia sem eleifend, tincidunt tortor. Aliquam fringilla ipsum turpis. Donec congue semper nisi sed scelerisque. Sed fringilla quis augue ac consequat. Vestibulum viverra at mauris eget sagittis. Nulla fringilla sollicitudin libero, eu consequat ante vulputate ac. Aenean nec mauris nec eros faucibus cursus eget nec eros. Nunc a neque et odio accumsan consectetur. Etiam volutpat sapien arcu, ultrices ullamcorper turpis ullamcorper pharetra. Morbi interdum ultrices lorem in egestas. Pellentesque dignissim, dui id vulputate euismod, nulla diam sodales libero, vel tincidunt lectus ligula vel nisi. Suspendisse a dignissim felis. Donec ac augue sed libero elementum vestibulum eu ut lorem. Nullam ac semper quam, et egestas nulla. Duis posuere maximus arcu scelerisque accumsan.<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris et enim sed lorem suscipit euismod. Morbi faucibus orci tortor, eu condimentum elit posuere non. Duis aliquet nisi vel ex mattis scelerisque. Aliquam erat volutpat. Mauris porta dui nisl, sed dapibus ante hendrerit id. Etiam rhoncus eget mauris et imperdiet. Etiam varius aliquam diam, quis placerat magna. Curabitur id ultricies est, vitae facilisis erat. Aenean vitae arcu non est faucibus convallis vitae eget erat. Donec consequat turpis eu auctor elementum. Fusce vitae ligula id est congue feugiat a in purus. Quisque in condimentum odio. Praesent pellentesque ante vitae sapien laoreet semper.<\\/p>\\r\\n<p>In id posuere dui. Morbi ac porta felis, ac gravida nunc. Nullam at metus eleifend, sagittis sem aliquet, dignissim sapien. In euismod non ipsum vel sagittis. Nam auctor leo elit, at lacinia tellus semper in. Etiam tempus turpis eu dui bibendum dignissim. Quisque sed odio libero. Maecenas maximus, ante sit amet fermentum aliquet, tellus mi eleifend nulla, quis tincidunt lectus arcu ut odio. Praesent malesuada imperdiet nibh nec porta. Etiam rhoncus, elit sit amet viverra consequat, dui lacus commodo augue, suscipit tincidunt magna justo sit amet erat. Aliquam vehicula sapien convallis luctus tristique.<\\/p>\\r\\n<p>Duis mollis ac elit et porttitor. Curabitur augue sapien, pulvinar in arcu porttitor, condimentum bibendum mauris. Morbi hendrerit orci sed quam porttitor, quis egestas sem convallis. Donec iaculis felis eu turpis fringilla, et maximus quam posuere. Quisque diam tortor, faucibus eget lorem non, aliquet viverra tortor. Proin tincidunt in mauris vitae eleifend. Donec varius ullamcorper nisl quis blandit. Duis vitae ipsum nec odio placerat faucibus. Curabitur gravida neque a metus viverra, sit amet finibus ex ultricies. Curabitur accumsan nulla sed ex hendrerit, eget faucibus nisl volutpat. Aenean eleifend id dui at faucibus. Phasellus lobortis dignissim tempus. Aenean massa nisl, pretium non sollicitudin non, finibus quis metus. Proin ultrices lacus nisl. Curabitur porttitor pretium urna, ut dictum sapien blandit ac. Cras vel sapien vulputate risus laoreet ullamcorper ut vitae elit.<\\/p>\\r\\n<p>Quisque ut dui eget dolor faucibus consequat tempor vel nisl. Aenean odio justo, rutrum egestas sapien quis, viverra efficitur elit. Donec dui leo, ornare a erat eget, egestas varius lectus. Sed auctor, tortor eu venenatis auctor, neque purus accumsan ex, eget volutpat ex risus ut ipsum. Donec in sapien ut ex pharetra mattis ut vel lectus. Vivamus vitae ipsum scelerisque, cursus augue non, lobortis erat. Cras justo diam, placerat in massa quis, lobortis tempus sem. Mauris tempus, mauris vitae ultrices posuere, purus leo aliquam velit, non tincidunt sapien lectus eu sapien. Nam quis eros vitae diam varius eleifend. Aliquam dapibus erat augue, non volutpat dui tempus sit amet. Donec ac justo tellus. Etiam volutpat ligula sit amet neque pharetra viverra. Integer ac mi tincidunt, eleifend sapien nec, mattis nulla.<\\/p>\\r\\n<p>In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque in purus volutpat, aliquam turpis nec, finibus mi. Aliquam libero lectus, euismod id dignissim ut, feugiat vel lacus. Vestibulum condimentum ut leo dignissim faucibus. Vestibulum mattis nisl nibh, et imperdiet urna consequat nec. Morbi vitae maximus lectus, condimentum tincidunt neque. Nulla pellentesque ex nulla, non consectetur nisl ullamcorper dignissim. Integer porta interdum massa et lacinia. Nullam mollis libero eget facilisis lobortis. Pellentesque vitae vehicula nisi. In sagittis lacus id nulla molestie, eu aliquam felis accumsan. Vivamus id sem purus. Nulla non blandit mauris. Nullam id molestie nisi, a scelerisque sapien. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.<\\/p>\\r\\n<\\/div>","fulltext":"","state":1,"catid":"15","created":"2016-03-16 19:55:13","created_by":"502","created_by_alias":"","modified":"2016-03-16 20:05:21","modified_by":"502","checked_out":"502","checked_out_time":"2016-03-16 20:02:20","publish_up":"2016-03-16 19:55:13","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(43, 11, 1, '', '2016-03-16 20:05:58', 502, 5335, '73b4ffaab3b47402212748cd8d839787bf1aab8e', '{"id":11,"asset_id":"79","title":"Plafonds et textes de loi","alias":"plafonds-et-textes-de-loi","introtext":"<p>\\u00a0<\\/p>\\r\\n<ul>\\r\\n<li>Duis ornare libero pellentesque massa tincidunt egestas.<\\/li>\\r\\n<li>Etiam eu quam vitae mi dictum dapibus.<\\/li>\\r\\n<li>Etiam at enim vel felis commodo tincidunt ac ultrices purus.<\\/li>\\r\\n<\\/ul>\\r\\n<p>\\u00a0<\\/p>\\r\\n<ul>\\r\\n<li>Phasellus tempor purus sit amet mauris tincidunt dignissim.<\\/li>\\r\\n<li>Vestibulum sodales leo ac lectus pulvinar accumsan.<\\/li>\\r\\n<\\/ul>\\r\\n<p>\\u00a0<\\/p>\\r\\n<ul>\\r\\n<li>Nam posuere lacus sit amet tortor ullamcorper convallis.<\\/li>\\r\\n<li>In aliquet tortor a diam efficitur, ut placerat nisl sagittis.<\\/li>\\r\\n<li>Ut non metus mollis, ornare massa ut, iaculis urna.<\\/li>\\r\\n<li>Duis pulvinar felis quis molestie mattis.<\\/li>\\r\\n<\\/ul>\\r\\n<p>\\u00a0<\\/p>\\r\\n<ul>\\r\\n<li>Suspendisse dapibus mauris sit amet purus eleifend sagittis.<\\/li>\\r\\n<li>Praesent placerat arcu in eleifend ultricies.<\\/li>\\r\\n<li>Sed consectetur odio id elit vulputate aliquet.<\\/li>\\r\\n<li>Morbi imperdiet tellus luctus scelerisque bibendum.<\\/li>\\r\\n<li>In molestie dui id velit viverra auctor.<\\/li>\\r\\n<\\/ul>\\r\\n<p>\\u00a0<\\/p>\\r\\n<ul>\\r\\n<li>Nam bibendum nulla sed justo consectetur, non malesuada nisi ornare.<\\/li>\\r\\n<li>Donec rutrum tellus id nibh cursus, quis condimentum ante mattis.<\\/li>\\r\\n<li>Mauris in velit finibus, pharetra sapien a, blandit nulla.<\\/li>\\r\\n<\\/ul>\\r\\n<p>Praesent eget diam molestie neque tincidunt sodales. Praesent a consectetur ligula, in congue ligula. Nam sed ipsum suscipit orci pretium semper in id sem. Vivamus ligula nunc, dignissim eget felis nec, condimentum semper sapien. Donec diam nibh, laoreet at egestas at, tempor a ligula. Sed nec dictum dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam tincidunt nulla in dolor sollicitudin elementum.<\\/p>\\r\\n<p>Nulla facilisi. Morbi ut fermentum dui, et imperdiet leo. Vestibulum consectetur erat ligula, ac sollicitudin ipsum varius non. Sed congue eleifend vulputate. Proin varius ligula sed velit imperdiet lobortis. Sed eget consequat dui, eu lacinia massa. In faucibus in augue nec vehicula. Duis sed nulla in nibh mattis faucibus ut in lectus. Integer accumsan tempus tincidunt. Donec id massa sit amet diam gravida pellentesque tempor a est. Duis hendrerit purus in sapien ornare venenatis. Curabitur eleifend accumsan lacus, ac eleifend risus aliquet sit amet.<\\/p>\\r\\n<p>Proin pretium sapien libero, vitae interdum ante vehicula eget. Nunc at arcu ac mauris ultrices dignissim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec varius, sapien ut vehicula eleifend, magna tortor bibendum massa, sit amet dapibus odio magna in diam. Duis nec luctus purus. Proin rhoncus metus ac justo egestas, in laoreet augue luctus. Duis ullamcorper feugiat eros pharetra accumsan.<\\/p>\\r\\n<p>Maecenas tristique augue ac mi vestibulum, ut iaculis sem rutrum. Maecenas id augue ex. Duis lobortis tincidunt lobortis. Fusce convallis convallis dui nec luctus. Mauris in malesuada justo, in euismod diam. Donec sed nisi in erat consequat rhoncus. Aliquam dapibus ac lorem sit amet porttitor.<\\/p>\\r\\n<p>Sed imperdiet velit arcu, rhoncus auctor tellus volutpat eget. Curabitur enim ipsum, consectetur nec erat a, rutrum congue lectus. Nulla volutpat diam arcu, ac viverra ante rhoncus nec. In imperdiet, nisl vitae imperdiet convallis, arcu nisl euismod tellus, ut consequat sem elit et mauris. Cras tristique mauris dolor, sit amet lacinia mauris auctor eu. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut eu purus vitae ipsum eleifend scelerisque in vel neque<\\/p>","fulltext":"","state":1,"catid":"15","created":"2016-03-16 19:51:22","created_by":"502","created_by_alias":"","modified":"2016-03-16 20:05:58","modified_by":"502","checked_out":"502","checked_out_time":"2016-03-16 20:05:48","publish_up":"2016-03-16 19:51:22","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"3","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(44, 15, 1, '', '2016-03-16 20:06:46', 502, 5190, '2f1572639ae2d6ecbac5e999c1c441801eb6d650', '{"id":15,"asset_id":83,"title":"Modalit\\u00e9s et Infos pratiques","alias":"modalites-et-infos-pratiques","introtext":"<h3>Le passage de Lorem Ipsum standard, utilis\\u00e9 depuis 1500<\\/h3>\\r\\n<p>\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\"<\\/p>\\r\\n<h3>Section 1.10.32 du \\"De Finibus Bonorum et Malorum\\" de Ciceron (45 av. J.-C.)<\\/h3>\\r\\n<p>\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\\"<\\/p>\\r\\n<h3>Traduction de H. Rackham (1914)<\\/h3>\\r\\n<p>\\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\\"<\\/p>\\r\\n<h3>Section 1.10.33 du \\"De Finibus Bonorum et Malorum\\" de Ciceron (45 av. J.-C.)<\\/h3>\\r\\n<p>\\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\\"<\\/p>","fulltext":"","state":1,"catid":"15","created":"2016-03-16 20:06:46","created_by":"502","created_by_alias":"","modified":"2016-03-16 20:06:46","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-03-16 20:06:46","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(45, 16, 1, '', '2016-03-16 20:07:36', 502, 4202, '33fd9371a880cd71d13a3698c4f49e6d4406ec4e', '{"id":16,"asset_id":84,"title":"Conditions de ressources","alias":"conditions-de-ressources","introtext":"<div id=\\"lipsum\\">\\r\\n<p>Praesent ut accumsan leo. Praesent ac diam a nisl imperdiet bibendum. Morbi ipsum dolor, ultricies quis purus et, accumsan posuere metus. Donec ultrices, lorem vel maximus vulputate, odio ipsum euismod nisl, ut efficitur odio nisl feugiat justo. Vestibulum laoreet massa at blandit semper. Phasellus fringilla porta metus, quis placerat magna rutrum non. Integer elementum ipsum eget nulla faucibus, et finibus arcu finibus. Aenean at tellus sit amet risus pretium tincidunt. In mauris magna, vestibulum in pulvinar in, pharetra ac neque. Phasellus eu odio eget nulla sollicitudin ullamcorper non non ipsum. Nulla facilisi. Sed tincidunt velit ut odio tempus interdum. Integer interdum erat nibh, nec facilisis elit mollis ac. Praesent bibendum massa eget quam pulvinar ultrices. Nulla tempus nunc nec posuere consequat. Mauris turpis mi, congue nec leo id, interdum congue dui.<\\/p>\\r\\n<p>Proin eu dolor tellus. Ut dignissim, augue sit amet pretium cursus, massa felis mattis nunc, vitae mollis justo lacus et diam. Suspendisse dictum augue ac metus aliquet, non posuere orci vestibulum. Nam condimentum neque orci, eu volutpat diam porta eget. Etiam vitae lacus at urna bibendum fermentum. In pellentesque ut dui eget egestas. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus at risus nulla. Curabitur cursus magna purus. Nunc gravida nulla eget nunc interdum ornare. Sed imperdiet ex ac leo pharetra, at rhoncus enim luctus.<\\/p>\\r\\n<p>Nulla vel nisl nec velit condimentum tempor. Aliquam et eleifend purus, sed varius nisl. Mauris aliquet sapien in scelerisque ultricies. Sed rutrum dolor id mauris condimentum facilisis. Vivamus turpis magna, cursus quis erat et, fringilla sodales orci. Cras venenatis velit sapien, nec varius sapien sodales ut. Duis ac ex sapien. In malesuada felis et tempor euismod. Pellentesque pharetra nulla vitae volutpat aliquet. Ut condimentum velit ut velit feugiat tempus. Vivamus a blandit arcu, nec malesuada quam. Donec bibendum arcu vel ex porttitor pellentesque.<\\/p>\\r\\n<p>In aliquet, enim quis lacinia venenatis, odio dui suscipit est, id pretium sapien mi id leo. Curabitur mattis leo id maximus suscipit. Morbi urna velit, tempor id feugiat in, efficitur id turpis. Sed a nisi vestibulum, fermentum ante aliquam, semper turpis. Vestibulum pulvinar dui lectus, ac ornare risus vulputate id. Proin luctus condimentum volutpat. Duis scelerisque sem eu lorem vestibulum laoreet.<\\/p>\\r\\n<\\/div>","fulltext":"","state":1,"catid":"15","created":"2016-03-16 20:07:36","created_by":"502","created_by_alias":"","modified":"2016-03-16 20:07:36","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2016-03-16 20:07:36","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(46, 9, 1, '', '2016-03-17 09:29:10', 502, 2387, '4540325fc827e2c8e33a300c94bb94025175b7b4', '{"id":9,"asset_id":"67","title":"Contact","alias":"contact","introtext":"<p>{mosmap width=''250''|height=''300''|Largeur=''250''|Hauteur=''300''|zoom=''16''|mapType=''Normal''|text=''<strong>Presqu''\\u00eele Habitat<\\/strong>''|tooltip=''<strong>Presqu''\\u00eele Habitat<\\/strong>&lt;br&gt;<br \\/> 1 rue de Nancy - CS 30122&lt;br&gt;<br \\/> 50101 CHERBOURG OCTEVILLE Cedex&lt;br&gt;<\\/p>\\r\\n<p>Tel : 02 33 87 84 00&lt;br&gt;<br \\/> Fax : 02 33 08 03 67''|marker=''0''|align=''center''|address=''Presqu''\\u00eele Habitat, 1 rue de Nancy, 50101, CHERBOURG OCTEVILLE''}<\\/p>\\r\\n<p><strong>Presqu''\\u00eele Habitat<\\/strong><br \\/> 1 rue de Nancy - CS 30122<br \\/> 50101 CHERBOURG OCTEVILLE Cedex<\\/p>\\r\\n<p>Tel : 02 33 87 84 00<br \\/> Fax : 02 33 08 03 67<\\/p>\\r\\n<p>\\u00a0<\\/p>\\r\\n<p>{loadposition position-7}<\\/p>","fulltext":"","state":1,"catid":"10","created":"2016-03-16 18:16:10","created_by":"502","created_by_alias":"","modified":"2016-03-17 09:29:10","modified_by":"502","checked_out":"502","checked_out_time":"2016-03-17 09:18:14","publish_up":"2016-03-16 18:16:10","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"4","metakey":"","metadesc":"","access":"1","hits":"5","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(47, 9, 1, '', '2016-03-17 09:59:30', 502, 2405, '98ca16fe825eb33390105f9201c61c4946517f64', '{"id":9,"asset_id":"67","title":"Contact","alias":"contact","introtext":"<p>{mosmap width=''250''|height=''300''|Largeur=''250''|Hauteur=''300''|zoom=''16''|mapType=''Normal''|text=''<strong>Presqu''\\u00eele Habitat<\\/strong>''|tooltip=''<strong>Presqu''\\u00eele Habitat<\\/strong>&lt;br&gt;<br \\/> 1 rue de Nancy - CS 30122&lt;br&gt;<br \\/> 50101 CHERBOURG OCTEVILLE Cedex&lt;br&gt;<\\/p>\\r\\n<p>Tel : 02 33 87 84 00&lt;br&gt;<br \\/> Fax : 02 33 08 03 67''|marker=''0''|align=''center''|address=''Presqu''\\u00eele Habitat, 1 rue de Nancy, 50101, CHERBOURG OCTEVILLE''}<\\/p>\\r\\n<p><strong>Presqu''\\u00eele Habitat<\\/strong><br \\/> 1 rue de Nancy - CS 30122<br \\/> 50101 CHERBOURG OCTEVILLE Cedex<\\/p>\\r\\n<p>Tel : 02 33 87 84 00<br \\/> Fax : 02 33 08 03 67<\\/p>\\r\\n<p>\\u00a0<\\/p>\\r\\n<pre>{module [90|rounded]}<\\/pre>\\r\\n<p>\\u00a0<\\/p>","fulltext":"","state":1,"catid":"10","created":"2016-03-16 18:16:10","created_by":"502","created_by_alias":"","modified":"2016-03-17 09:59:30","modified_by":"502","checked_out":"502","checked_out_time":"2016-03-17 09:35:45","publish_up":"2016-03-16 18:16:10","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":4,"ordering":"4","metakey":"","metadesc":"","access":"1","hits":"6","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(48, 9, 1, '', '2016-03-17 10:00:06', 502, 2368, 'd98d90b369898532990b28630bb3febca5e6c269', '{"id":9,"asset_id":"67","title":"Contact","alias":"contact","introtext":"<p>{mosmap width=''250''|height=''300''|Largeur=''250''|Hauteur=''300''|zoom=''16''|mapType=''Normal''|text=''<strong>Presqu''\\u00eele Habitat<\\/strong>''|tooltip=''<strong>Presqu''\\u00eele Habitat<\\/strong>&lt;br&gt;<br \\/> 1 rue de Nancy - CS 30122&lt;br&gt;<br \\/> 50101 CHERBOURG OCTEVILLE Cedex&lt;br&gt;<\\/p>\\r\\n<p>Tel : 02 33 87 84 00&lt;br&gt;<br \\/> Fax : 02 33 08 03 67''|marker=''0''|align=''center''|address=''Presqu''\\u00eele Habitat, 1 rue de Nancy, 50101, CHERBOURG OCTEVILLE''}<\\/p>\\r\\n<p><strong>Presqu''\\u00eele Habitat<\\/strong><br \\/> 1 rue de Nancy - CS 30122<br \\/> 50101 CHERBOURG OCTEVILLE Cedex<\\/p>\\r\\n<p>Tel : 02 33 87 84 00<br \\/> Fax : 02 33 08 03 67<\\/p>\\r\\n<p>\\u00a0<\\/p>\\r\\n<p>\\u00a0<\\/p>","fulltext":"","state":1,"catid":"10","created":"2016-03-16 18:16:10","created_by":"502","created_by_alias":"","modified":"2016-03-17 10:00:06","modified_by":"502","checked_out":"502","checked_out_time":"2016-03-17 09:59:30","publish_up":"2016-03-16 18:16:10","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":5,"ordering":"4","metakey":"","metadesc":"","access":"1","hits":"7","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(49, 9, 1, '', '2016-03-17 10:08:58', 502, 2356, 'ab730ecbbbfbcc10a689b71bbba5cc85984d0285', '{"id":9,"asset_id":"67","title":"Contact","alias":"contact","introtext":"<p>{mosmap width=''250''|height=''300''|Largeur=''250''|Hauteur=''300''|zoom=''16''|mapType=''Normal''|text=''<strong>Presqu''\\u00eele Habitat<\\/strong>&lt;br&gt;<br \\/> 1 rue de Nancy - CS 30122&lt;br&gt;<br \\/> 50101 CHERBOURG OCTEVILLE Cedex&lt;br&gt;Tel : 02 33 87 84 00&lt;br&gt;<br \\/> Fax : 02 33 08 03 67''|tooltip=''<strong>Presqu''\\u00eele Habitat<\\/strong>''|marker=''0''|align=''center''|address=''Presqu''\\u00eele Habitat, 1 rue de Nancy, 50101, CHERBOURG OCTEVILLE''}<\\/p>\\r\\n<p><strong>Presqu''\\u00eele Habitat<\\/strong><br \\/> 1 rue de Nancy - CS 30122<br \\/> 50101 CHERBOURG OCTEVILLE Cedex<\\/p>\\r\\n<p>Tel : 02 33 87 84 00<br \\/> Fax : 02 33 08 03 67<\\/p>\\r\\n<p>\\u00a0<\\/p>\\r\\n<p>\\u00a0<\\/p>","fulltext":"","state":1,"catid":"10","created":"2016-03-16 18:16:10","created_by":"502","created_by_alias":"","modified":"2016-03-17 10:08:58","modified_by":"502","checked_out":"502","checked_out_time":"2016-03-17 10:00:06","publish_up":"2016-03-16 18:16:10","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":6,"ordering":"4","metakey":"","metadesc":"","access":"1","hits":"8","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(50, 9, 1, '', '2016-03-17 10:11:18', 502, 2359, 'c7396bf2ee2336d6d30b2140211513c3a03acc27', '{"id":9,"asset_id":"67","title":"Contact","alias":"contact","introtext":"<p>{mosmap width=''250''|height=''300''|Largeur=''250''|Hauteur=''300''|zoom=''16''|mapType=''Normal''|text=''<\\/p>\\r\\n<div align=\\"left\\"><strong>Presqu''\\u00eele Habitat<\\/strong><br \\/> 1 rue de Nancy - CS 30122 50101 CHERBOURG OCTEVILLE Cedex<br \\/> Tel : 02 33 87 84 00<br \\/>Fax : 02 33 08 03 67<\\/div>\\r\\n<p>''|tooltip=''<strong>Presqu''\\u00eele Habitat<\\/strong>''|marker=''0''|align=''center''|address=''Presqu''\\u00eele Habitat, 1 rue de Nancy, 50101, CHERBOURG OCTEVILLE''}<\\/p>\\r\\n<p><strong>Presqu''\\u00eele Habitat<\\/strong><br \\/> 1 rue de Nancy - CS 30122<br \\/> 50101 CHERBOURG OCTEVILLE Cedex<\\/p>\\r\\n<p>Tel : 02 33 87 84 00<br \\/> Fax : 02 33 08 03 67<\\/p>\\r\\n<p>\\u00a0<\\/p>\\r\\n<p>\\u00a0<\\/p>","fulltext":"","state":1,"catid":"10","created":"2016-03-16 18:16:10","created_by":"502","created_by_alias":"","modified":"2016-03-17 10:11:18","modified_by":"502","checked_out":"502","checked_out_time":"2016-03-17 10:08:58","publish_up":"2016-03-16 18:16:10","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":7,"ordering":"4","metakey":"","metadesc":"","access":"1","hits":"9","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(51, 9, 1, '', '2016-03-17 10:51:36', 502, 2426, '6ca68348d010fb6e07e0c99f22bb3fc54da355b1', '{"id":9,"asset_id":"67","title":"Contact","alias":"contact","introtext":"<p>{mosmap width=''250''|height=''300''|Largeur=''250''|Hauteur=''300''|zoom=''16''|mapType=''Normal''|text=''<\\/p>\\r\\n<div align=\\"left\\"><strong>Presqu''\\u00eele Habitat<\\/strong><br \\/> 1 rue de Nancy - CS 30122 50101 CHERBOURG OCTEVILLE Cedex<br \\/> Tel : 02 33 87 84 00<br \\/>Fax : 02 33 08 03 67<\\/div>\\r\\n<p>''|tooltip=''<strong>Presqu''\\u00eele Habitat<\\/strong>''|marker=''0''|align=''center''|address=''Presqu''\\u00eele Habitat, 1 rue de Nancy, 50101, CHERBOURG OCTEVILLE''}<\\/p>\\r\\n<p><strong>Presqu''\\u00eele Habitat<\\/strong><br \\/> 1 rue de Nancy - CS 30122<br \\/> 50101 CHERBOURG OCTEVILLE Cedex<\\/p>\\r\\n<p>Tel : 02 33 87 84 00<br \\/> Fax : 02 33 08 03 67<\\/p>\\r\\n<p>{component index.php?com_alfcontact}<\\/p>\\r\\n<p>\\u00a0<\\/p>\\r\\n<p>\\u00a0<\\/p>\\r\\n<p>\\u00a0<\\/p>","fulltext":"","state":1,"catid":"10","created":"2016-03-16 18:16:10","created_by":"502","created_by_alias":"","modified":"2016-03-17 10:51:36","modified_by":"502","checked_out":"502","checked_out_time":"2016-03-17 10:43:45","publish_up":"2016-03-16 18:16:10","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":8,"ordering":"4","metakey":"","metadesc":"","access":"1","hits":"10","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(52, 9, 1, '', '2016-03-17 11:00:34', 502, 2454, '2dc18974019de39b89c08e19251f2adcd969cf1b', '{"id":9,"asset_id":"67","title":"Contact","alias":"contact","introtext":"<p>{mosmap width=''250''|height=''300''|Largeur=''250''|Hauteur=''300''|zoom=''16''|mapType=''Normal''|text=''<\\/p>\\r\\n<div align=\\"left\\"><strong>Presqu''\\u00eele Habitat<\\/strong><br \\/> 1 rue de Nancy - CS 30122 50101 CHERBOURG OCTEVILLE Cedex<br \\/> Tel : 02 33 87 84 00<br \\/>Fax : 02 33 08 03 67<\\/div>\\r\\n<p>''|tooltip=''<strong>Presqu''\\u00eele Habitat<\\/strong>''|marker=''0''|align=''center''|address=''Presqu''\\u00eele Habitat, 1 rue de Nancy, 50101, CHERBOURG OCTEVILLE''}<\\/p>\\r\\n<p><strong>Presqu''\\u00eele Habitat<\\/strong><br \\/> 1 rue de Nancy - CS 30122<br \\/> 50101 CHERBOURG OCTEVILLE Cedex<\\/p>\\r\\n<p>Tel : 02 33 87 84 00<br \\/> Fax : 02 33 08 03 67<\\/p>\\r\\n<p>{component index.php?option=com_alfcontact&amp;view=alfcontact}<\\/p>\\r\\n<p>\\u00a0<\\/p>\\r\\n<p>\\u00a0<\\/p>\\r\\n<p>\\u00a0<\\/p>","fulltext":"","state":1,"catid":"10","created":"2016-03-16 18:16:10","created_by":"502","created_by_alias":"","modified":"2016-03-17 11:00:34","modified_by":"502","checked_out":"502","checked_out_time":"2016-03-17 11:00:17","publish_up":"2016-03-16 18:16:10","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":9,"ordering":"4","metakey":"","metadesc":"","access":"1","hits":"690","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(53, 16, 1, '', '2016-03-17 12:59:55', 502, 4271, '25dd0d474e26cef31ff1b3a31073ca02a74f0bfe', '{"id":16,"asset_id":"84","title":"Conditions de ressources","alias":"conditions-de-ressources","introtext":"<div id=\\"lipsum\\">\\r\\n<p>{module Comment obtenir un logement ?}<\\/p>\\r\\n<p>Praesent ut accumsan leo. Praesent ac diam a nisl imperdiet bibendum. Morbi ipsum dolor, ultricies quis purus et, accumsan posuere metus. Donec ultrices, lorem vel maximus vulputate, odio ipsum euismod nisl, ut efficitur odio nisl feugiat justo. Vestibulum laoreet massa at blandit semper. Phasellus fringilla porta metus, quis placerat magna rutrum non. Integer elementum ipsum eget nulla faucibus, et finibus arcu finibus. Aenean at tellus sit amet risus pretium tincidunt. In mauris magna, vestibulum in pulvinar in, pharetra ac neque. Phasellus eu odio eget nulla sollicitudin ullamcorper non non ipsum. Nulla facilisi. Sed tincidunt velit ut odio tempus interdum. Integer interdum erat nibh, nec facilisis elit mollis ac. Praesent bibendum massa eget quam pulvinar ultrices. Nulla tempus nunc nec posuere consequat. Mauris turpis mi, congue nec leo id, interdum congue dui.<\\/p>\\r\\n<p>Proin eu dolor tellus. Ut dignissim, augue sit amet pretium cursus, massa felis mattis nunc, vitae mollis justo lacus et diam. Suspendisse dictum augue ac metus aliquet, non posuere orci vestibulum. Nam condimentum neque orci, eu volutpat diam porta eget. Etiam vitae lacus at urna bibendum fermentum. In pellentesque ut dui eget egestas. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus at risus nulla. Curabitur cursus magna purus. Nunc gravida nulla eget nunc interdum ornare. Sed imperdiet ex ac leo pharetra, at rhoncus enim luctus.<\\/p>\\r\\n<p>Nulla vel nisl nec velit condimentum tempor. Aliquam et eleifend purus, sed varius nisl. Mauris aliquet sapien in scelerisque ultricies. Sed rutrum dolor id mauris condimentum facilisis. Vivamus turpis magna, cursus quis erat et, fringilla sodales orci. Cras venenatis velit sapien, nec varius sapien sodales ut. Duis ac ex sapien. In malesuada felis et tempor euismod. Pellentesque pharetra nulla vitae volutpat aliquet. Ut condimentum velit ut velit feugiat tempus. Vivamus a blandit arcu, nec malesuada quam. Donec bibendum arcu vel ex porttitor pellentesque.<\\/p>\\r\\n<p>In aliquet, enim quis lacinia venenatis, odio dui suscipit est, id pretium sapien mi id leo. Curabitur mattis leo id maximus suscipit. Morbi urna velit, tempor id feugiat in, efficitur id turpis. Sed a nisi vestibulum, fermentum ante aliquam, semper turpis. Vestibulum pulvinar dui lectus, ac ornare risus vulputate id. Proin luctus condimentum volutpat. Duis scelerisque sem eu lorem vestibulum laoreet.<\\/p>\\r\\n<\\/div>","fulltext":"","state":1,"catid":"15","created":"2016-03-16 20:07:36","created_by":"502","created_by_alias":"","modified":"2016-03-17 12:59:55","modified_by":"502","checked_out":"502","checked_out_time":"2016-03-17 12:56:40","publish_up":"2016-03-16 20:07:36","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(54, 21, 5, '', '2016-03-18 09:50:27', 502, 593, '8d6c45c0a9e57cb6482a0eda5dbda66558ff89f5', '{"id":21,"asset_id":94,"parent_id":"15","lft":"26","rgt":27,"level":2,"path":null,"extension":"com_content","title":"Comment obtenir un logement","alias":"comment-obtenir-un-logement","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 09:50:27","modified_user_id":null,"modified_time":"2016-03-18 09:50:27","hits":"0","language":"*","version":null}', 0),
(55, 22, 5, '', '2016-03-18 09:51:02', 502, 589, '81f7a69326fd5d8bef365c273b84d58b1f4b67ee', '{"id":22,"asset_id":95,"parent_id":"15","lft":"28","rgt":29,"level":2,"path":null,"extension":"com_content","title":"Recherche garage-parcking","alias":"recherche-garage-parcking","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 09:51:02","modified_user_id":null,"modified_time":"2016-03-18 09:51:02","hits":"0","language":"*","version":null}', 0);
INSERT INTO `joo_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(56, 23, 5, '', '2016-03-18 09:51:33', 502, 588, '532c709917cc1111bcc3c641e0d3642243de0670', '{"id":23,"asset_id":96,"parent_id":"1","lft":"41","rgt":42,"level":1,"path":null,"extension":"com_content","title":"Recherche local - commerce","alias":"recherche-local-commerce","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 09:51:33","modified_user_id":null,"modified_time":"2016-03-18 09:51:33","hits":"0","language":"*","version":null}', 0),
(57, 24, 5, '', '2016-03-18 09:52:16', 502, 585, '231130c2c27b00af649a1b1209b86887ab05a173', '{"id":24,"asset_id":97,"parent_id":"15","lft":"30","rgt":31,"level":2,"path":null,"extension":"com_content","title":"Vous \\u00eates \\u00e9tudiant","alias":"vous-etes-etudiant","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 09:52:16","modified_user_id":null,"modified_time":"2016-03-18 09:52:16","hits":"0","language":"*","version":null}', 0),
(58, 23, 5, '', '2016-03-18 09:52:34', 502, 631, '4d7cc56c9dbc4e62438bfc52ffc3dd453f74c478', '{"id":23,"asset_id":"96","parent_id":"15","lft":"32","rgt":33,"level":2,"path":"recherche-local-commerce","extension":"com_content","title":"Recherche local - commerce","alias":"recherche-local-commerce","note":"","description":"","published":"1","checked_out":"502","checked_out_time":"2016-03-18 09:52:22","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 09:51:33","modified_user_id":"502","modified_time":"2016-03-18 09:52:34","hits":"0","language":"*","version":"1"}', 0),
(59, 25, 5, '', '2016-03-18 09:53:54', 502, 612, '7d9e696f866302d550e5d8bc931edbea7f52abd8', '{"id":25,"asset_id":98,"parent_id":"13","lft":"22","rgt":23,"level":2,"path":null,"extension":"com_content","title":"acc\\u00e8s au compte et dossier locatif","alias":"acces-au-compte-et-dossier-locatif","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 09:53:54","modified_user_id":null,"modified_time":"2016-03-18 09:53:54","hits":"0","language":"*","version":null}', 0),
(60, 18, 5, '', '2016-03-18 09:54:33', 502, 608, 'c215135f2d30e2aea195b4bfc96b8827fe1240cb', '{"id":18,"asset_id":"76","parent_id":"13","lft":"24","rgt":25,"level":2,"path":"payez-votre-loyer","extension":"com_content","title":"payez votre loyer","alias":"payez-votre-loyer","note":"","description":"","published":"1","checked_out":"502","checked_out_time":"2016-03-18 09:54:22","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-16 19:35:20","modified_user_id":"502","modified_time":"2016-03-18 09:54:33","hits":"0","language":"*","version":"1"}', 0),
(61, 26, 5, '', '2016-03-18 09:55:49', 502, 611, 'c8679b1bfd6101d5998b5a2cbb16e2a2a669fe15', '{"id":26,"asset_id":99,"parent_id":"13","lft":"26","rgt":27,"level":2,"path":null,"extension":"com_content","title":"Infos utiles - Occupation du logement","alias":"infos-utiles-occupation-du-logement","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 09:55:49","modified_user_id":null,"modified_time":"2016-03-18 09:55:49","hits":"0","language":"*","version":null}', 0),
(62, 25, 5, '', '2016-03-18 09:56:23', 502, 686, '523329b9339a67205790d54d5fbee06852a89928', '{"id":25,"asset_id":"98","parent_id":"13","lft":"22","rgt":"23","level":"2","path":"espace-locataire\\/acces-au-compte-et-dossier-locatif","extension":"com_content","title":"acc\\u00e8s au compte et dossier locatif","alias":"acces-au-compte-et-dossier-locatif","note":"","description":"","published":"1","checked_out":"502","checked_out_time":"2016-03-18 09:56:00","access":"2","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 09:53:54","modified_user_id":"502","modified_time":"2016-03-18 09:56:23","hits":"0","language":"*","version":"1"}', 0),
(63, 27, 5, '', '2016-03-18 09:57:10', 502, 599, 'fefa2ac15e1777a8759828ee50c409b0864421c4', '{"id":27,"asset_id":100,"parent_id":"13","lft":"28","rgt":29,"level":2,"path":null,"extension":"com_content","title":"faire une demande d''\\u00e9change","alias":"faire-une-demande-d-echange","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 09:57:10","modified_user_id":null,"modified_time":"2016-03-18 09:57:10","hits":"0","language":"*","version":null}', 0),
(64, 28, 5, '', '2016-03-18 09:57:50', 502, 584, '1f8cdc05538a7643eca79a2e7221698a09c1acb6', '{"id":28,"asset_id":101,"parent_id":"13","lft":"30","rgt":31,"level":2,"path":null,"extension":"com_content","title":"quitter votre logement","alias":"quitter-votre-logement","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 09:57:50","modified_user_id":null,"modified_time":"2016-03-18 09:57:50","hits":"0","language":"*","version":null}', 0),
(65, 29, 5, '', '2016-03-18 09:59:56', 502, 579, 'cba2ec6cb811a2f12688abab21492bd12883b4d7', '{"id":29,"asset_id":102,"parent_id":"12","lft":"20","rgt":21,"level":2,"path":null,"extension":"com_content","title":"Liste des march\\u00e9s","alias":"liste-des-marches","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 09:59:56","modified_user_id":null,"modified_time":"2016-03-18 09:59:56","hits":"0","language":"*","version":null}', 0),
(66, 30, 5, '', '2016-03-18 10:00:24', 502, 584, '7a85d58876cdcb415c9db789d688dc26c9a78da7', '{"id":30,"asset_id":103,"parent_id":"12","lft":"22","rgt":23,"level":2,"path":null,"extension":"com_content","title":"consultations en cours","alias":"consultations-en-cours","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 10:00:24","modified_user_id":null,"modified_time":"2016-03-18 10:00:24","hits":"0","language":"*","version":null}', 0),
(67, 31, 5, '', '2016-03-18 10:00:35', 502, 562, '04f1128c88560a7a744963aa3a7b349d54c9afe5', '{"id":31,"asset_id":104,"parent_id":"1","lft":"57","rgt":58,"level":1,"path":null,"extension":"com_content","title":"proc\\u00e9dure","alias":"procedure","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 10:00:35","modified_user_id":null,"modified_time":"2016-03-18 10:00:35","hits":"0","language":"*","version":null}', 0),
(68, 31, 5, '', '2016-03-18 10:01:34', 502, 590, '723b63ec25875ad1a8c42f93031f69d4d1fb814e', '{"id":31,"asset_id":"104","parent_id":"12","lft":"24","rgt":25,"level":2,"path":"procedure","extension":"com_content","title":"proc\\u00e9dure","alias":"procedure","note":"","description":"","published":"1","checked_out":"502","checked_out_time":"2016-03-18 10:01:23","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 10:00:35","modified_user_id":"502","modified_time":"2016-03-18 10:01:34","hits":"0","language":"*","version":"1"}', 0),
(69, 32, 5, '', '2016-03-18 10:02:48', 502, 572, '17e3d2dca81d4a405594891cab7e39c3401479f0', '{"id":32,"asset_id":105,"parent_id":"11","lft":"18","rgt":19,"level":2,"path":null,"extension":"com_content","title":"Travaux en cours","alias":"travaux-en-cours","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 10:02:48","modified_user_id":null,"modified_time":"2016-03-18 10:02:48","hits":"0","language":"*","version":null}', 0),
(70, 33, 5, '', '2016-03-18 10:03:03', 502, 583, '43c2ff4bf40d893fcff9d083a43472776f676e30', '{"id":33,"asset_id":106,"parent_id":"1","lft":"61","rgt":62,"level":1,"path":null,"extension":"com_content","title":"Constructions en cours","alias":"constructions-en-cours","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 10:03:03","modified_user_id":null,"modified_time":"2016-03-18 10:03:03","hits":"0","language":"*","version":null}', 0),
(71, 34, 5, '', '2016-03-18 10:03:57', 502, 597, '1518e2bf9ee70a58ffc20d65040dde3b448992ac', '{"id":34,"asset_id":107,"parent_id":"11","lft":"20","rgt":21,"level":2,"path":null,"extension":"com_content","title":"A vendre \\/ Location-accession","alias":"a-vendre-location-accession","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 10:03:57","modified_user_id":null,"modified_time":"2016-03-18 10:03:57","hits":"0","language":"*","version":null}', 0),
(72, 35, 5, '', '2016-03-18 10:04:15', 502, 576, '8e41e8c434e8ea197bd9af8b10e03409f65c3ce5', '{"id":35,"asset_id":108,"parent_id":"11","lft":"22","rgt":23,"level":2,"path":null,"extension":"com_content","title":"Info g\\u00e9n\\u00e9rale","alias":"info-generale","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 10:04:15","modified_user_id":null,"modified_time":"2016-03-18 10:04:15","hits":"0","language":"*","version":null}', 0),
(73, 33, 5, '', '2016-03-18 10:04:39', 502, 624, '837c7b9ecdd752f7199de85f475ae45446ab7c2e', '{"id":33,"asset_id":"106","parent_id":"11","lft":"24","rgt":25,"level":2,"path":"constructions-en-cours","extension":"com_content","title":"Constructions en cours","alias":"constructions-en-cours","note":"","description":"","published":"1","checked_out":"502","checked_out_time":"2016-03-18 10:04:30","access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 10:03:03","modified_user_id":"502","modified_time":"2016-03-18 10:04:39","hits":"0","language":"*","version":"1"}', 0),
(74, 36, 5, '', '2016-03-18 10:09:03', 502, 581, '6d1d7a2d41f134f608d5a653375ee67796b93a01', '{"id":36,"asset_id":109,"parent_id":"9","lft":"14","rgt":15,"level":2,"path":null,"extension":"com_content","title":"logements disponibles","alias":"logements-disponibles","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 10:09:03","modified_user_id":null,"modified_time":"2016-03-18 10:09:03","hits":"0","language":"*","version":null}', 0),
(75, 37, 5, '', '2016-03-18 10:12:29', 502, 569, '7aa6814c58fad6669fbd079b25acb592e06c01be', '{"id":37,"asset_id":110,"parent_id":"1","lft":"69","rgt":70,"level":1,"path":null,"extension":"com_content","title":"Offres d''emploi","alias":"offres-d-emploi","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"502","created_time":"2016-03-18 10:12:29","modified_user_id":null,"modified_time":"2016-03-18 10:12:29","hits":"0","language":"*","version":null}', 0);

-- --------------------------------------------------------

--
-- Structure de la table `joo_updates`
--

CREATE TABLE IF NOT EXISTS `joo_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=2 ;

--
-- Contenu de la table `joo_updates`
--

INSERT INTO `joo_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `extra_query`) VALUES
(1, 7, 0, 'Content - Load Module in Article', 'Plugin to display a module into an article.', 'moduleinarticle', 'plugin', 'content', 0, '3.1.0', '', 'http://www.pages-and-items.com/updateserver.php?ext=loadmoduleinarticle&', 'http://www.pages-and-items.com/extensions/load-module-into-article', '');

-- --------------------------------------------------------

--
-- Structure de la table `joo_update_sites`
--

CREATE TABLE IF NOT EXISTS `joo_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=10 ;

--
-- Contenu de la table `joo_update_sites`
--

INSERT INTO `joo_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
(1, 'Joomla! Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 1458294001, ''),
(2, 'Joomla! Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1, 1458294001, ''),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist_3.xml', 1, 0, ''),
(4, 'Joomla! Update Component Update Site', 'extension', 'http://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 0, ''),
(5, 'Plugin Googlemap Update Site', 'extension', 'http://tech.reumer.net/update/plugin_googlemap3/extension.xml', 1, 1458293998, ''),
(6, 'ALFContact Updates', 'extension', 'http://updates.alfsoft.com/alfcontact.xml', 1, 1458293998, ''),
(7, 'plg_loadmoduleinarticle', 'extension', 'http://www.pages-and-items.com/updateserver.php?ext=loadmoduleinarticle&', 1, 1458293998, ''),
(8, 'NoNumber Modules Anywhere', 'extension', 'http://download.nonumber.nl/updates.xml?e=modulesanywhere&type=.xml', 1, 1458293998, ''),
(9, 'NoNumber Components Anywhere', 'extension', 'http://download.nonumber.nl/updates.xml?e=componentsanywhere&type=.xml', 1, 1458293998, '');

-- --------------------------------------------------------

--
-- Structure de la table `joo_update_sites_extensions`
--

CREATE TABLE IF NOT EXISTS `joo_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Contenu de la table `joo_update_sites_extensions`
--

INSERT INTO `joo_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600),
(3, 10002),
(4, 28),
(5, 10006),
(6, 10007),
(7, 10010),
(8, 10014),
(9, 10016);

-- --------------------------------------------------------

--
-- Structure de la table `joo_usergroups`
--

CREATE TABLE IF NOT EXISTS `joo_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `joo_usergroups`
--

INSERT INTO `joo_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

-- --------------------------------------------------------

--
-- Structure de la table `joo_users`
--

CREATE TABLE IF NOT EXISTS `joo_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=503 ;

--
-- Contenu de la table `joo_users`
--

INSERT INTO `joo_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`) VALUES
(502, 'Super User', 'admin', 'maxime.siffer@viacesi.fr', '$2y$10$rkkaPD4sjSM8uAZnWiZCv.MBkTIxzCRiHZw8//Te1B/3yfBjvIfOq', 0, 1, '2016-01-27 13:02:12', '2016-03-18 15:14:07', '0', '', '0000-00-00 00:00:00', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `joo_user_keys`
--

CREATE TABLE IF NOT EXISTS `joo_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `series` varchar(255) NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) NOT NULL,
  `uastring` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  UNIQUE KEY `series_2` (`series`),
  UNIQUE KEY `series_3` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `joo_user_keys`
--

INSERT INTO `joo_user_keys` (`id`, `user_id`, `token`, `series`, `invalid`, `time`, `uastring`) VALUES
(1, 'admin', '$2y$10$0FRDWi1S.9yyyRFRPeG/9.tbri65OXWNl5gBZfI/R3Bqn0onwPPgW', 'V7qYkA09xJxuSI3aKw6p', 0, '1459084348', '5a439a262db66e5e4d578849f016d899');

-- --------------------------------------------------------

--
-- Structure de la table `joo_user_notes`
--

CREATE TABLE IF NOT EXISTS `joo_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `joo_user_profiles`
--

CREATE TABLE IF NOT EXISTS `joo_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Structure de la table `joo_user_usergroup_map`
--

CREATE TABLE IF NOT EXISTS `joo_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `joo_user_usergroup_map`
--

INSERT INTO `joo_user_usergroup_map` (`user_id`, `group_id`) VALUES
(502, 8);

-- --------------------------------------------------------

--
-- Structure de la table `joo_viewlevels`
--

CREATE TABLE IF NOT EXISTS `joo_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `joo_viewlevels`
--

INSERT INTO `joo_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
