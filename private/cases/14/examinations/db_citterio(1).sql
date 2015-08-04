-- phpMyAdmin SQL Dump
-- version 4.3.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 21, 2015 at 12:14 PM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_citterio`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE IF NOT EXISTS `attachment` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `file` varchar(100) NOT NULL,
  `notes` text,
  `insertion_date` datetime NOT NULL,
  `last_edit_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attachment`
--

INSERT INTO `attachment` (`id`, `category`, `file`, `notes`, `insertion_date`, `last_edit_date`) VALUES
(1, 1, 'lamp.jpg', NULL, '2013-04-03 16:20:37', '2013-04-03 16:20:37'),
(2, 1, 'OSI_logo.jpg', NULL, '2013-04-03 16:20:37', '2013-04-03 16:20:37'),
(3, 1, 'brightness_controller.png', '', '2013-04-03 16:20:37', '2013-12-06 16:51:55'),
(4, 1, 'plugin.jpg', NULL, '2013-04-03 16:20:37', '2013-04-03 16:20:37'),
(5, 1, 'github.jpg', 'Logo GitHub', '2014-12-01 16:20:17', '2014-12-01 16:20:17'),
(6, 2, 'italy.png', NULL, '2015-01-22 11:48:03', '2015-01-22 11:48:03'),
(7, 3, 'menu_salami.svg', NULL, '2015-02-10 12:55:06', '2015-02-10 12:55:06'),
(8, 3, 'cotto.png', NULL, '2015-02-13 09:31:07', '2015-02-13 09:31:07'),
(9, 3, 'salumi.svg', NULL, '2015-02-16 10:14:45', '2015-02-16 10:14:45'),
(10, 3, 'grancottovignola.png', NULL, '2015-02-17 14:43:16', '2015-02-17 14:43:16'),
(11, 3, 'salumi-crudo.png', NULL, '2015-02-24 12:37:49', '2015-02-24 12:37:49'),
(12, 3, 'salumi-mortadella.png', NULL, '2015-02-24 12:37:56', '2015-02-24 12:37:56'),
(13, 3, 'salumi-spek.png', NULL, '2015-02-24 12:38:05', '2015-02-24 12:38:05'),
(14, 3, 'salumi-cotto.png', NULL, '2015-02-24 12:38:13', '2015-02-24 12:38:13'),
(15, 3, 'salumi-coppa.png', NULL, '2015-02-24 12:38:23', '2015-02-24 12:38:23'),
(16, 3, 'salumi-salame.png', NULL, '2015-02-24 12:38:31', '2015-02-24 12:38:31'),
(17, 3, 'salumi-bresaola.png', NULL, '2015-02-24 12:38:40', '2015-02-24 12:38:40'),
(18, 4, 'affettati-sofficette-grancottovignola.png', NULL, '2015-02-24 15:44:26', '2015-02-24 15:44:26'),
(19, 4, 'cotto-marmo.jpg', NULL, '2015-02-26 16:22:30', '2015-02-26 16:22:30'),
(21, 2, 'sfondo_luoghi_produzione.jpg', NULL, '2015-02-27 14:39:09', '2015-02-27 14:39:09'),
(22, 2, 'Luoghi_produzione.svg', NULL, '2015-02-27 14:44:26', '2015-02-27 14:44:26'),
(23, 2, 'VIVAIO.svg', NULL, '2015-03-24 10:03:12', '2015-03-24 10:03:12'),
(24, 3, 'salumi-pancetta.jpg', NULL, '2015-04-14 14:05:36', '2015-04-14 14:05:36'),
(25, 5, 'Vignola_small.jpg', NULL, '2015-04-15 11:34:57', '2015-04-15 11:34:57'),
(26, 5, 'Valtellina_small.jpg', NULL, '2015-04-15 11:35:06', '2015-04-15 11:35:06'),
(27, 5, 'San_Daniele_small.jpg', NULL, '2015-04-15 11:35:15', '2015-04-15 11:35:15'),
(28, 5, 'Parma_small.jpg', NULL, '2015-04-15 11:35:25', '2015-04-15 11:35:25'),
(29, 5, 'Milano_small.jpg', NULL, '2015-04-15 11:35:34', '2015-04-15 11:35:34'),
(30, 5, 'Bologna_small.jpg', NULL, '2015-04-15 11:35:45', '2015-04-15 11:35:45'),
(31, 5, 'Alto_Adige_small.jpg', NULL, '2015-04-15 11:35:59', '2015-04-15 11:35:59');

-- --------------------------------------------------------

--
-- Table structure for table `attachment_ctg`
--

CREATE TABLE IF NOT EXISTS `attachment_ctg` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `directory` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attachment_ctg`
--

INSERT INTO `attachment_ctg` (`id`, `name`, `directory`) VALUES
(1, 'gino', 'gino'),
(2, 'Accademia', 'accademia'),
(3, 'Catalogo Salumi', 'catalogo-salumi'),
(4, 'Catalogo Affettati', 'catalogo-affettati'),
(5, 'Terre di origine', 'Terre_di_origin');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_perm`
--

CREATE TABLE IF NOT EXISTS `auth_group_perm` (
  `instance` int(11) NOT NULL,
  `group_id` smallint(6) NOT NULL,
  `perm_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_opt`
--

CREATE TABLE IF NOT EXISTS `auth_opt` (
  `id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `users_for_page` smallint(3) NOT NULL,
  `user_more_info` tinyint(1) NOT NULL,
  `user_card_view` tinyint(1) NOT NULL,
  `self_registration` tinyint(1) NOT NULL,
  `self_registration_active` tinyint(1) NOT NULL,
  `username_as_email` tinyint(1) NOT NULL,
  `aut_pwd` tinyint(1) NOT NULL,
  `aut_pwd_length` smallint(2) NOT NULL,
  `pwd_min_length` smallint(2) NOT NULL,
  `pwd_max_length` smallint(2) NOT NULL,
  `pwd_numeric_number` int(10) NOT NULL,
  `ldap_auth` tinyint(1) NOT NULL,
  `ldap_auth_only` tinyint(1) NOT NULL,
  `ldap_single_user` varchar(50) DEFAULT NULL,
  `ldap_auth_password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_opt`
--

INSERT INTO `auth_opt` (`id`, `instance`, `users_for_page`, `user_more_info`, `user_card_view`, `self_registration`, `self_registration_active`, `username_as_email`, `aut_pwd`, `aut_pwd_length`, `pwd_min_length`, `pwd_max_length`, `pwd_numeric_number`, `ldap_auth`, `ldap_auth_only`, `ldap_single_user`, `ldap_auth_password`) VALUES
(1, 0, 10, 0, 1, 0, 0, 0, 0, 10, 6, 14, 2, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL,
  `class` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` text,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `class`, `code`, `label`, `description`, `admin`) VALUES
(1, 'core', 'is_logged', 'login effettuato', 'Utente che ha effettuato il login', 0),
(2, 'core', 'is_staff', 'appartenenza allo staff', 'Possibilità di accedere all''area amministrativa', 1),
(3, 'attachment', 'can_admin', 'amministrazione', 'amministrazione completa del modulo', 1),
(4, 'auth', 'can_admin', 'amministrazione', 'amministrazione completa del modulo', 1),
(5, 'auth', 'can_manage', 'gestione utenti', 'gestione gli utenti. Inserimento e modifica di utenti. Impossibilità di eliminare utenti.', 1),
(6, 'instruments', 'can_admin', 'amministrazione', 'amministrazione completa del modulo', 1),
(7, 'instruments', 'can_view', 'visualizzazione', 'visualizzazione degli strumenti', 1),
(8, 'language', 'can_admin', 'amministrazione', 'amministrazione completa del modulo', 1),
(9, 'page', 'can_admin', 'amministrazione', 'amministrazione completa del modulo', 1),
(10, 'page', 'can_publish', 'pubblicazione', 'Pubblicazione di pagine e commenti e redazione contenuti', 1),
(11, 'page', 'can_edit', 'redazione', 'redazione dei contenuti', 1),
(12, 'page', 'can_view_private', 'visualizzazione pagine private', 'visualizzazione di pagine che sono state salvate come private', 0),
(13, 'phpModuleView', 'can_admin', 'amministrazione', 'amministrazione completa del modulo', 1),
(14, 'searchSite', 'can_admin', 'amministrazione', 'amministrazione completa del modulo', 1),
(15, 'sysConf', 'can_admin', 'amministrazione', 'amministrazione completa del modulo', 1),
(16, 'graphics', 'can_admin', 'amministrazione', 'amministrazione completa del modulo', 1),
(17, 'layout', 'can_admin', 'amministrazione', 'amministrazione completa del modulo', 1),
(18, 'menu', 'can_admin', 'amministrazione', 'amministrazione completa del modulo', 1),
(19, 'menu', 'can_edit', 'redazione', 'inserimento modifica ed eliminazione di voci di menu.', 1),
(20, 'statistics', 'can_admin', 'amministrazione', 'amministrazione completa del modulo', 1),
(21, 'gmaps', 'can_admin', 'amministrazione', 'Amministrazione completa del modulo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL,
  `userpwd` varchar(100) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `address` varchar(200) DEFAULT NULL,
  `cap` int(5) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `nation` smallint(4) DEFAULT NULL,
  `text` text,
  `photo` varchar(50) DEFAULT NULL,
  `publication` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `ldap` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `firstname`, `lastname`, `company`, `phone`, `fax`, `email`, `username`, `userpwd`, `is_admin`, `address`, `cap`, `city`, `nation`, `text`, `photo`, `publication`, `date`, `active`, `ldap`) VALUES
(1, 'utente', 'amministratore', 'otto srl', '+39 011 8987553', '', 'support@otto.to.it', 'amministratore', '1844156d4166d94387f1a4ad031ca5fa', 1, 'piazza Gran Madre di Dio, 7', 10131, 'Torino', 83, '', '', 2, '2011-10-10 01:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_add`
--

CREATE TABLE IF NOT EXISTS `auth_user_add` (
  `user_id` int(11) NOT NULL,
  `field1` tinyint(1) NOT NULL DEFAULT '0',
  `field2` tinyint(1) NOT NULL DEFAULT '0',
  `field3` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_group`
--

CREATE TABLE IF NOT EXISTS `auth_user_group` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_perm`
--

CREATE TABLE IF NOT EXISTS `auth_user_perm` (
  `instance` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `perm_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_registration`
--

CREATE TABLE IF NOT EXISTS `auth_user_registration` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `session` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `catalogue_node`
--

CREATE TABLE IF NOT EXISTS `catalogue_node` (
  `id` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `content` tinyint(1) NOT NULL,
  `content_html` text,
  `content_php` text,
  `show_recipes` tinyint(1) NOT NULL,
  `show_children` tinyint(1) NOT NULL,
  `position` tinyint(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=384 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalogue_node`
--

INSERT INTO `catalogue_node` (`id`, `parent`, `name`, `slug`, `thumb`, `content`, `content_html`, `content_php`, `show_recipes`, `show_children`, `position`) VALUES
(34, 0, 'Salumi', 'salumi', NULL, 1, NULL, '$session = \\Gino\\Session::instance();\r\n$node_obj = \\Gino\\App\\Catalogue\\Node::getFromIdSlug();\r\n$children = $node_obj->children();\r\n// SVG\r\n$b = ''<div id="svgdata-container"></div>'';\r\n// salame\r\n$b .= ''<div class="hidden svg-item" id="id-35">'';\r\n$b .= "<p>Ai piedi delle dolci colline<br />dell''Appennino emiliano,<br />Citterio produce i suoi salami di<br />qualità superiore e gusto saporito</p>";\r\n$b .= "<p>Sono utilizzate solo le migliori cosce di allevamenti selezionati,<br />preparate dagli specialisti di Casa Citterio<br />in forni a vapore con un costante<br />controllo di temperature, umidità e tempi.</p>";\r\n$b .= ''<p><a class="svg-button" href="#">''._(''entra'').''</a></p>'';\r\n$b .= ''</div>'';\r\n// cotto\r\n$b .= ''<div class="hidden svg-item" id="id-73">'';\r\n$b .= "<p>Ai piedi delle dolci colline<br />dell''Appennino emiliano,<br />Citterio produce i suoi prosciutti Cotti di<br />qualità superiore e gusto saporito</p>";\r\n$b .= ''<p><a class="svg-button" href="catalogue/node/73-prosciutto-cotto/">''._(''entra'').''</a></p>'';\r\n$b .= ''</div>'';\r\n\r\n// NO SVG\r\n$b .= ''\r\n<div id="fallback" class="row visible-sm visible-xs">'';\r\n$child = new \\Gino\\App\\Catalogue\\Node(74);\r\nif($child->isVisible($session->geoip_country)) {\r\n$b .= ''\r\n    <div class="col-md-4 col-sm-6 col-xs-12">\r\n         <figure class="catalogue-figure" onclick="location.href=$$(\\''base\\'')[0].get(\\''href\\'') + \\''#\\''">\r\n            <img class="img-responsive" src="contents/attachment/catalogo-salumi/salumi-crudo.png" alt="''._(''Prosciutto Crudo'').''">\r\n            <figcaption>''._(''Prosciutto crudo'').''</figcaption>\r\n        </figure> \r\n    </div>\r\n    '';\r\n}\r\n$child = new \\Gino\\App\\Catalogue\\Node(109);\r\nif($child->isVisible($session->geoip_country)) {\r\n$b .= ''\r\n    <div class="col-md-4 col-sm-6 col-xs-12">\r\n         <figure class="catalogue-figure" onclick="location.href=$$(\\''base\\'')[0].get(\\''href\\'') + \\''#\\''">\r\n            <img class="img-responsive" src="contents/attachment/catalogo-salumi/salumi-mortadella.png" alt="''._(''Mortadella'').''">\r\n            <figcaption>''._(''Mortadella'').''</figcaption>\r\n        </figure> \r\n    </div>\r\n'';\r\n}\r\n$child = new \\Gino\\App\\Catalogue\\Node(73);\r\nif($child->isVisible($session->geoip_country)) {\r\n$b .= ''\r\n    <div class="col-md-4 col-sm-6 col-xs-12">\r\n         <figure class="catalogue-figure" onclick="location.href=$$(\\''base\\'')[0].get(\\''href\\'') + \\''catalogue/node/73-prosciutto-cotto/\\''">\r\n            <img class="img-responsive" src="contents/attachment/catalogo-salumi/salumi-cotto.png" alt="''._(''Prosciutto Cotto'').''">\r\n            <figcaption>''._(''Prosciutto Cotto'').''</figcaption>\r\n        </figure> \r\n    </div>\r\n'';\r\n}\r\n$child = new \\Gino\\App\\Catalogue\\Node(35);\r\nif($child->isVisible($session->geoip_country)) {\r\n$b .= ''\r\n    <div class="col-md-4 col-sm-6 col-xs-12">\r\n         <figure class="catalogue-figure" onclick="location.href=$$(\\''base\\'')[0].get(\\''href\\'') + \\''#\\''">\r\n            <img class="img-responsive" src="contents/attachment/catalogo-salumi/salumi-salame.png" alt="''._(''Salame'').''">\r\n            <figcaption>''._(''Salame'').''</figcaption>\r\n        </figure> \r\n    </div>\r\n</div>\r\n'';\r\n}\r\n\r\n$b .= "<script>";\r\n$b .= "var dict = {};\\n";\r\nforeach($children as $child) {\r\n    $b .= "dict[".$child->id."] = {\r\n               label: ''".\\Gino\\jsVar($child->ml(''name''))."'',\r\n               visible: ".($child->isVisible($session->geoip_country) ? ''true'' : ''false'')."\r\n           };\\n";\r\n}\r\n$b .= "\r\n    if(Modernizr.svg) {\r\n        var svg_dict = {\r\n		    // text : id-text, mask: id-mask, img: id\r\n            ''35'': { id: ''salame''},\r\n            ''73'': { id: ''cotto''},\r\n            ''109'': { id: ''mortadella''},\r\n            ''121'': { id: ''spek''},\r\n            ''130'': { id: ''pancetta''},\r\n            ''126'': { id: ''coppa''},\r\n            ''117'': { id: ''bresaola''},\r\n            ''74'': { id: ''crudo''},\r\n			''136'': {id: ''cotechino''}\r\n        };\r\n        var svg_controller = new catalogue.Svg(''svgdata-container'', ''contents/attachment/catalogo-salumi/salumi.svg'', dict, svg_dict);\r\n    }\r\n    else {\r\n        $(''fallback'').removeClass(''visible-sm'').removeClass(''visible-xs'');\r\n    }\r\n";\r\n\r\n$b .= "</script>";\r\necho $b;', 0, 0, 0),
(35, 34, 'Salame', 'salame', NULL, 0, '<p>\r\n	2aa</p>', NULL, 0, 0, 1),
(36, 35, 'Salame di Milano', 'salame-milano', 'logo.jpg', 0, NULL, '', 0, 0, 1),
(37, 35, 'Salame del Contadino', 'salame-contadino', NULL, 0, '<p>\r\n	meow a</p>', '', 0, 0, 2),
(55, 35, 'Salame Campagnolo', 'salame-campagnolo', NULL, 0, NULL, '', 0, 0, 3),
(56, 35, 'Salame Tipo Felino', 'salame-tipo-felino', NULL, 0, NULL, '', 0, 0, 4),
(57, 35, 'Spianata Romana', 'spianata-romana', NULL, 0, NULL, '', 0, 0, 5),
(59, 35, 'Salame Napoli', 'salame-napoli', NULL, 0, NULL, '', 0, 0, 6),
(60, 35, 'Salame Sardo', 'salame-sardo', NULL, 0, NULL, '', 0, 0, 7),
(61, 35, 'Ventricina', 'ventricina', NULL, 0, NULL, '', 0, 0, 8),
(62, 35, 'Salame Ungherese', 'salame-ungherese', NULL, 0, NULL, '', 0, 0, 9),
(63, 35, 'Salame Granfetta', 'salame-granfetta', NULL, 0, NULL, '', 0, 0, 10),
(64, 35, 'Salame Schiacciatino', 'salame-schiacciatino', NULL, 0, NULL, '', 0, 0, 11),
(65, 35, 'Salame Corallina', 'salame-corallina', NULL, 0, NULL, '', 0, 0, 12),
(66, 35, 'Salame Toscano', 'salame-toscano', NULL, 0, NULL, '', 0, 0, 13),
(67, 35, 'Citterino', 'citterino', NULL, 0, NULL, '', 0, 0, 14),
(68, 35, 'Cacciatore DOP', 'cacciatore-dop', NULL, 0, NULL, '', 0, 0, 15),
(69, 35, 'Bocconcini', 'bocconcini', NULL, 0, NULL, '', 0, 0, 16),
(70, 35, 'Salsiccia Napoli', 'salsiccia-napoli', NULL, 0, NULL, '', 0, 0, 17),
(71, 35, 'Salame Strafino', 'salame-strafino', NULL, 0, NULL, '', 0, 0, 18),
(72, 35, 'Grappolo', 'grappolo', NULL, 0, NULL, '', 0, 0, 19),
(73, 34, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 1, '<p style="text-align: center;">\r\n	<img class="img-responsive" src="contents/attachment/catalogo-affettati/cotto-marmo.jpg" style="margin: auto;" /></p>', '', 1, 1, 2),
(74, 34, 'Prosciutto Crudo', 'prosciutto-crudo', NULL, 0, NULL, '', 0, 0, 3),
(78, 74, 'Prosciutto di Parma disossato', 'prosciutto-di-parma-disossato', NULL, 0, NULL, '', 0, 0, 1),
(80, 74, 'Prosciutto di Parma con osso', 'prosciutto-di-parma-con-osso', NULL, 0, NULL, '', 0, 0, 2),
(81, 74, 'Prosciutto di San Daniele con osso', 'prosciutto-di-san-daniele-con-osso', NULL, 0, NULL, '', 0, 0, 3),
(82, 74, 'Prosciutto di San Daniele disossato', 'prosciutto-di-san-daniele-disossato', NULL, 0, NULL, '', 0, 0, 4),
(83, 74, 'Prosciutto Carnia con osso', 'prosciutto-carnia-con-osso', NULL, 0, NULL, '', 0, 0, 5),
(84, 74, 'Prosciutto Carnia disossato', 'prosciutto-carnia-disossato', NULL, 0, NULL, '', 0, 0, 6),
(85, 74, 'Prosciutto Crudo il Poggio disossato', 'prosciutto-crudo-il-poggio-disossato', NULL, 0, NULL, '', 0, 0, 7),
(86, 74, 'Fiocco di Prosciutto Crudo', 'fiocco-di-prosciutto-crudo', NULL, 0, NULL, '', 0, 0, 8),
(87, 73, 'Il Piccolo', 'il-piccolo', 'grancastello.png', 0, NULL, '', 0, 0, 1),
(88, 73, 'Grangusto', 'grangusto', 'grangusto.png', 0, NULL, '', 0, 0, 2),
(89, 73, 'Granfiocco', 'granfiocco', 'granfiocco.png', 0, NULL, '', 0, 0, 3),
(90, 73, 'Grancotto di Vignola', 'grancotto-di-vignola', 'grancotto_vignola.png', 1, '<p>\r\n	<img class="img-responsive" src="contents/attachment/catalogo-salumi/grancottovignola.png" style="margin:auto" /></p>', '', 0, 0, 4),
(91, 73, 'Europa', 'europa', 'europa.png', 0, NULL, '', 0, 0, 5),
(92, 73, 'Più Cotto', 'piu-cotto', 'piucotto.png', 0, NULL, '', 0, 0, 6),
(100, 34, 'Arrosti', 'arrosti', NULL, 0, NULL, '', 0, 0, 4),
(101, 100, 'Il Tartufo', 'il-tartufo', NULL, 0, NULL, '', 0, 0, 1),
(102, 100, 'Prosciutto Cotto Grigliato', 'prosciutto-cotto-grigliato', NULL, 0, NULL, '', 0, 0, 2),
(103, 100, 'Prosciutto Cotto Praga', 'prosciutto-cotto-praga', NULL, 0, NULL, '', 0, 0, 3),
(104, 100, 'Porchetta Romana', 'porchetta-romana', NULL, 0, NULL, '', 0, 0, 4),
(105, 100, 'Arista', 'arista', NULL, 0, NULL, '', 0, 0, 5),
(106, 100, 'Fesa di Tacchino', 'fesa-di-tacchino', NULL, 0, NULL, '', 0, 0, 6),
(109, 34, 'Mortadella', 'mortadella', NULL, 0, NULL, '', 0, 0, 5),
(110, 109, 'Regina', 'regina', NULL, 0, NULL, '', 0, 0, 1),
(111, 109, 'Vecchia Emilia', 'vecchia-emilia', NULL, 0, NULL, '', 0, 0, 2),
(112, 109, 'Emilia', 'emilia', NULL, 0, NULL, '', 0, 0, 3),
(113, 109, 'Romagnola', 'romagnola', NULL, 0, NULL, '', 0, 0, 4),
(114, 109, 'Reginetta', 'reginetta', NULL, 0, NULL, '', 0, 0, 5),
(115, 109, 'Castello', 'castello', NULL, 0, NULL, '', 0, 0, 6),
(116, 109, 'Sforzesca', 'sforzesca', NULL, 0, NULL, '', 0, 0, 7),
(117, 34, 'La Bresaola', 'la-bresaola', NULL, 0, NULL, '', 0, 0, 6),
(118, 117, 'Punta d''Anca', 'punta-d-anca', NULL, 0, NULL, '', 0, 0, 1),
(119, 117, 'Sottofesa', 'sottofesa', NULL, 0, NULL, '', 0, 0, 2),
(120, 117, 'Bresaola della Valtellina IGP', 'bresaola-della-valtellina-igp', NULL, 0, NULL, '', 0, 0, 3),
(121, 34, 'Speck', 'speck', NULL, 0, NULL, '', 0, 0, 7),
(122, 121, 'Speck "Golden"', 'speck-golden', NULL, 0, NULL, '', 0, 0, 1),
(123, 121, 'Speck Alto Adige', 'speck-alto-adige', NULL, 0, NULL, '', 0, 0, 2),
(124, 121, 'Speck Alto', 'speck-alto', NULL, 0, NULL, '', 0, 0, 3),
(125, 121, 'Speck di Prosciutto', 'speck-di-prosciutto', NULL, 0, NULL, '', 0, 0, 4),
(126, 34, 'Coppa e Lonza', 'coppa-e-lonza', NULL, 0, NULL, '', 0, 0, 8),
(127, 126, 'Coppa Parma', 'coppa-parma', NULL, 0, NULL, '', 0, 0, 1),
(128, 126, 'Capocollo', 'capocollo', NULL, 0, NULL, '', 0, 0, 2),
(129, 126, 'Lonza', 'lonza', NULL, 0, NULL, '', 0, 0, 3),
(130, 34, 'La Pancetta', 'la-pancetta', NULL, 0, NULL, '', 0, 0, 9),
(131, 130, 'Coppata', 'coppata', NULL, 0, NULL, '', 0, 0, 1),
(132, 130, 'Arrotolata', 'arrotolata', NULL, 0, NULL, '', 0, 0, 2),
(133, 130, 'Steccata', 'steccata', NULL, 0, NULL, '', 0, 0, 3),
(134, 130, 'Tesa Affumicata "Bacon"', 'tesa-affumicata-bacon', NULL, 0, NULL, '', 0, 0, 4),
(135, 130, 'Tesa Salata', 'tesa-salata', NULL, 0, NULL, '', 0, 0, 5),
(136, 34, 'Cotechino e Zampone', 'cotechino-e-zampone', NULL, 0, NULL, '', 0, 0, 10),
(137, 136, 'Cotechino Gole', 'cotechino-gole', NULL, 0, NULL, '', 0, 0, 1),
(138, 136, 'Cotechino Dritto', 'cotechino-dritto', NULL, 0, NULL, '', 0, 0, 2),
(139, 136, 'Cotechino Modena IGP', 'cotechino-modena-igp', NULL, 0, NULL, '', 0, 0, 3),
(140, 136, 'Zampone Modena IGP', 'zampone-modena-igp', NULL, 0, NULL, '', 0, 0, 4),
(141, 136, 'Zampone', 'zampone', NULL, 0, NULL, '', 0, 0, 5),
(142, 0, 'Affettati', 'affettati', NULL, 1, '<p>\r\n	<img alt="" class="img-responsive center" src="/citterio/contents/attachment/catalogo-salumi/grancottovignola.png" style="width: 590px; height: 434px;" /></p>', '', 0, 1, 2),
(143, 142, 'Il Tagliafresco', 'il-tagliafresco', NULL, 0, NULL, '', 0, 0, 1),
(144, 143, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 1),
(145, 144, 'Grancotto di "Vignola"', 'grancotto-di-vignola', '', 0, NULL, '', 0, 0, 1),
(146, 144, 'Prosciutto Cotto "Grangusto"', 'prosciutto-cotto-grangusto', NULL, 0, NULL, '', 0, 0, 2),
(147, 144, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 3),
(148, 143, 'Salame', 'salame', NULL, 0, NULL, '', 0, 0, 2),
(149, 148, 'Salame di Milano', 'salame-di-milano', NULL, 0, NULL, '', 0, 0, 1),
(150, 148, 'Salame Napoli', 'salame-napoli', NULL, 0, NULL, '', 0, 0, 2),
(151, 148, 'Salame Toscano', 'salame-toscano', NULL, 0, NULL, '', 0, 0, 3),
(152, 148, 'Salame Tipo Felino', 'salame-tipo-felino', NULL, 0, NULL, '', 0, 0, 4),
(153, 148, 'Salame Ungherese', 'salame-ungherese', NULL, 0, NULL, '', 0, 0, 5),
(154, 148, 'Salame Rustico', 'salame-rustico', NULL, 0, NULL, '', 0, 0, 6),
(155, 143, 'Prosciutto Crudo', 'prosciutto-crudo', NULL, 0, NULL, '', 0, 0, 3),
(156, 155, 'Prosciutto di Parma', 'prosciutto-di-parma', NULL, 0, NULL, '', 0, 0, 1),
(157, 155, 'Prosciutto di San Daniele', 'prosciutto-di-san-daniele', NULL, 0, NULL, '', 0, 0, 2),
(158, 155, 'Prosciutto Crudo del "Poggio"', 'prosciutto-crudo-del-poggio', NULL, 0, NULL, '', 0, 0, 3),
(159, 155, 'Gambetto di Prosciutto Crudo', 'gambetto-di-prosciutto-crudo', NULL, 0, NULL, '', 0, 0, 4),
(160, 143, 'Antipasto Italiano', 'antipasto-italiano', NULL, 0, NULL, '', 0, 0, 4),
(161, 160, 'Antipasto Italiano', 'antipasto-italiano', NULL, 0, NULL, '', 0, 0, 1),
(162, 143, 'Bresaola', 'bresaola', NULL, 0, NULL, '', 0, 0, 5),
(163, 162, 'Bresaola della Valtellina IGP', 'bresaola-della-valtellina-igp', NULL, 0, NULL, '', 0, 0, 1),
(164, 143, 'Speck', 'speck', NULL, 0, NULL, '', 0, 0, 6),
(165, 164, 'Speck Alto Adige IGP', 'speck-alto-adige-igp', NULL, 0, NULL, '', 0, 0, 1),
(166, 143, 'Coppa', 'coppa', NULL, 0, NULL, '', 0, 0, 7),
(167, 166, 'Coppa', 'coppa', NULL, 0, NULL, '', 0, 0, 1),
(168, 143, 'Lombo', 'lombo', NULL, 0, NULL, '', 0, 0, 8),
(169, 168, 'Carpaccio di Lombo', 'carpaccio-di-lombo', NULL, 0, NULL, '', 0, 0, 1),
(170, 143, 'Mortadella', 'mortadella', NULL, 0, NULL, '', 0, 0, 9),
(171, 170, 'Mortadella Bologna IGP', 'mortadella-bologna-igp', NULL, 0, NULL, '', 0, 0, 1),
(172, 143, 'Arrosti', 'arrosti', NULL, 0, NULL, '', 0, 0, 10),
(173, 172, 'Prosciutto Arrosto alle Erbe', 'prosciutto-arrosto-alle-erbe', NULL, 0, NULL, '', 0, 0, 1),
(174, 172, 'Arista', 'arista', NULL, 0, NULL, '', 0, 0, 2),
(175, 143, 'Lardo', 'lardo', NULL, 0, NULL, '', 0, 0, 11),
(176, 175, 'Lardo Stagionato', 'lardo-stagionato', NULL, 0, NULL, '', 0, 0, 1),
(177, 143, 'Pancetta', 'pancetta', NULL, 0, NULL, '', 0, 0, 12),
(178, 177, 'Pancetta', 'pancetta', NULL, 0, NULL, '', 0, 0, 1),
(179, 143, 'Avicoli', 'avicoli', NULL, 0, NULL, '', 0, 0, 13),
(180, 179, 'Petto di Tacchino', 'petto-di-tacchino', NULL, 0, NULL, '', 0, 0, 1),
(181, 179, 'Petto di Pollo', 'petto-di-pollo', NULL, 0, NULL, '', 0, 0, 2),
(182, 142, 'Le Vaschette Classiche', 'le-vaschette-classiche', NULL, 0, NULL, '', 0, 0, 2),
(183, 182, 'Salame', 'salame', NULL, 0, NULL, '', 0, 0, 1),
(184, 183, 'Salame di Milano', 'salame-di-milano', NULL, 0, NULL, '', 0, 0, 1),
(185, 183, 'Salame Ungherese', 'salame-ungherese', NULL, 0, NULL, '', 0, 0, 2),
(186, 183, 'Salsiccia Napoli', 'salsiccia-napoli', NULL, 0, NULL, '', 0, 0, 3),
(187, 183, 'Salame Tipo Felino', 'salame-tipo-felino', NULL, 0, NULL, '', 0, 0, 4),
(188, 183, 'Salame Rustico', 'salame-rustico', NULL, 0, NULL, '', 0, 0, 5),
(189, 183, 'Citterino', 'citterino', NULL, 0, NULL, '', 0, 0, 6),
(190, 182, 'Prosciutto Crudo', 'prosciutto-crudo', NULL, 0, NULL, '', 0, 0, 2),
(191, 190, 'Prosciutto di Parma', 'prosciutto-di-parma', NULL, 0, NULL, '', 0, 0, 1),
(192, 190, 'Prosciutto di San Daniele', 'prosciutto-di-san-daniele', NULL, 0, NULL, '', 0, 0, 2),
(193, 190, 'Prosciutto Crudo del Poggio', 'prosciutto-crudo-del-poggio', NULL, 0, NULL, '', 0, 0, 3),
(194, 182, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 3),
(195, 194, 'Prosciutto Cotto Toast', 'prosciutto-cotto-toast', NULL, 0, NULL, '', 0, 0, 1),
(196, 182, 'Bresaola', 'bresaola', NULL, 0, NULL, '', 0, 0, 4),
(197, 196, 'Bresaola della Valtellina IGP', 'bresaola-della-valtellina-igp', NULL, 0, NULL, '', 0, 0, 1),
(198, 182, 'Speck', 'speck', NULL, 0, NULL, '', 0, 0, 5),
(199, 198, 'Speck Alto Adige', 'speck-alto-adige', NULL, 0, NULL, '', 0, 0, 1),
(200, 182, 'Coppa', 'coppa', NULL, 0, NULL, '', 0, 0, 6),
(201, 200, 'Coppa', 'coppa', NULL, 0, NULL, '', 0, 0, 1),
(202, 142, 'Riassunto', 'riassunto', NULL, 0, NULL, '', 0, 0, 3),
(203, 202, 'Salame', 'salame', NULL, 0, NULL, '', 0, 0, 1),
(204, 203, 'Citterino', 'citterino', NULL, 0, NULL, '', 0, 0, 1),
(207, 203, 'Salame di Milano', 'salame-di-milano', NULL, 0, NULL, '', 0, 0, 2),
(208, 203, 'Salame Tipo Felino', 'salame-tipo-felino', NULL, 0, NULL, '', 0, 0, 3),
(209, 203, 'Salame Ungherese', 'salame-ungherese', NULL, 0, NULL, '', 0, 0, 4),
(210, 203, 'Salsiccia Napoli', 'salsiccia-napoli', NULL, 0, NULL, '', 0, 0, 5),
(211, 203, 'Bocconcini', 'bocconcini', NULL, 0, NULL, '', 0, 0, 6),
(212, 142, 'Le Perfette', 'le-perfette', NULL, 0, NULL, '', 0, 0, 4),
(213, 212, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 1),
(214, 213, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 1),
(215, 212, 'Prosciutto Crudo', 'prosciutto-crudo', NULL, 0, NULL, '', 0, 0, 2),
(216, 215, 'Prosciutto Crudo', 'prosciutto-crudo', NULL, 0, NULL, '', 0, 0, 1),
(217, 212, 'Avicoli', 'avicoli', NULL, 0, NULL, '', 0, 0, 3),
(218, 217, 'Petto di Pollo', 'petto-di-pollo', NULL, 0, NULL, '', 0, 0, 1),
(219, 217, 'Petto di Tacchino', 'petto-di-tacchino', NULL, 0, NULL, '', 0, 0, 2),
(220, 142, 'Le Sofficette', 'le-sofficette', NULL, 0, NULL, '', 0, 0, 5),
(221, 220, 'Prosciutto Crudo', 'prosciutto-crudo', NULL, 0, NULL, '', 0, 0, 1),
(222, 221, 'Prosciutto Crudo', 'prosciutto-crudo', NULL, 0, NULL, '', 0, 0, 1),
(223, 221, 'Prosciutto di Parma', 'prosciutto-di-parma', NULL, 0, NULL, '', 0, 0, 2),
(224, 220, 'Speck', 'speck', NULL, 0, NULL, '', 0, 0, 2),
(225, 224, 'Speck Alto Adige IGP', 'speck-alto-adige-igp', NULL, 0, NULL, '', 0, 0, 1),
(226, 220, 'Coppa', 'coppa', NULL, 0, NULL, '', 0, 0, 3),
(228, 226, 'Coppa', 'coppa', NULL, 0, NULL, '', 0, 0, 1),
(229, 220, 'Bresaola', 'bresaola', NULL, 0, NULL, '', 0, 0, 4),
(230, 229, 'Bresaola della Valtellina IGP', 'bresaola-della-valtellina-igp', NULL, 0, NULL, '', 0, 0, 1),
(231, 220, 'Salame', 'salame', NULL, 0, NULL, '', 0, 0, 5),
(232, 220, 'Pancetta', 'pancetta', NULL, 0, NULL, '', 0, 0, 6),
(233, 220, 'Avicoli', 'avicoli', NULL, 0, NULL, '', 0, 0, 7),
(234, 220, 'Würstel', 'wuerstel', NULL, 0, NULL, '', 0, 0, 8),
(235, 220, 'Mortadella', 'mortadella', NULL, 0, NULL, '', 0, 0, 9),
(236, 220, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 10),
(237, 236, 'Prosciutto Cotto', 'prosciutto-cotto', 'sofficette-grancottovignola.png', 1, '<p>\r\n	<img class="img-responsive" src="contents/attachment/catalogo-affettati/affettati-sofficette-grancottovignola.png" /></p>', '', 0, 0, 1),
(238, 235, 'Mortadella Regina', 'mortadella-regina', NULL, 0, NULL, '', 0, 0, 1),
(239, 234, 'Würstel', 'wuerstel', NULL, 0, NULL, '', 0, 0, 1),
(241, 233, 'Petto di Tacchino', 'petto-di-tacchino', NULL, 0, NULL, '', 0, 0, 1),
(242, 233, 'Petto di Pollo', 'petto-di-pollo', NULL, 0, NULL, '', 0, 0, 2),
(243, 232, 'Pancetta', 'pancetta', NULL, 0, NULL, '', 0, 0, 1),
(244, 231, 'Salame Ungherese', 'salame-ungherese', NULL, 0, NULL, '', 0, 0, 1),
(245, 231, 'Salame di Milano', 'salame-di-milano', NULL, 0, NULL, '', 0, 0, 2),
(246, 231, 'Salame Rustico', 'salame-rustico', NULL, 0, NULL, '', 0, 0, 3),
(247, 142, 'La Merenda', 'la-merenda', NULL, 0, NULL, '', 0, 0, 6),
(248, 247, 'Speck', 'speck', NULL, 0, NULL, '', 0, 0, 1),
(249, 247, 'Salame', 'salame', NULL, 0, NULL, '', 0, 0, 2),
(250, 247, 'Prosciutto Crudo', 'prosciutto-crudo', NULL, 0, NULL, '', 0, 0, 3),
(251, 247, 'Bresaola', 'bresaola', NULL, 0, NULL, '', 0, 0, 4),
(252, 247, 'Pancetta', 'pancetta', NULL, 0, NULL, '', 0, 0, 5),
(253, 247, 'Coppa', 'coppa', NULL, 0, NULL, '', 0, 0, 6),
(254, 247, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 7),
(255, 247, 'Avicoli', 'avicoli', NULL, 0, NULL, '', 0, 0, 8),
(256, 247, 'Mortadella', 'mortadella', NULL, 0, NULL, '', 0, 0, 9),
(258, 142, 'Alta Gastronomia', 'alta-gastronomia', NULL, 0, NULL, '', 0, 0, 7),
(259, 248, 'Speck di Prosciutto', 'speck-di-prosciutto', NULL, 0, NULL, '', 0, 0, 1),
(260, 249, 'Salame Rustico', 'salame-rustico', NULL, 0, NULL, '', 0, 0, 1),
(261, 249, 'Salame di Milano', 'salame-di-milano', NULL, 0, NULL, '', 0, 0, 2),
(262, 249, 'Salame Tipo Felino', 'salame-tipo-felino', NULL, 0, NULL, '', 0, 0, 3),
(263, 249, 'Salame Ungherese', 'salame-ungherese', NULL, 0, NULL, '', 0, 0, 4),
(264, 250, 'Prosciutto Crudo', 'prosciutto-crudo', NULL, 0, NULL, '', 0, 0, 1),
(265, 251, 'Bresaola della Valtellina IGP', 'bresaola-della-valtellina-igp', NULL, 0, NULL, '', 0, 0, 1),
(266, 252, 'Pancetta Arrotolata', 'pancetta-arrotolata', NULL, 0, NULL, '', 0, 0, 1),
(267, 253, 'Coppa', 'coppa', NULL, 0, NULL, '', 0, 0, 1),
(268, 254, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 1),
(269, 255, 'Petto di Tacchino', 'petto-di-tacchino', NULL, 0, NULL, '', 0, 0, 1),
(270, 256, 'Mortadella Regina', 'mortadella-regina', NULL, 0, NULL, '', 0, 0, 1),
(271, 258, 'Prosciutto Crudo', 'prosciutto-crudo', NULL, 0, NULL, '', 0, 0, 1),
(272, 258, 'Bresaola', 'bresaola', NULL, 0, NULL, '', 0, 0, 2),
(273, 258, 'Speck', 'speck', NULL, 0, NULL, '', 0, 0, 3),
(274, 258, 'Prosciutto Cotto', 'prosciutto_cotto', NULL, 0, NULL, '', 0, 0, 4),
(275, 271, 'Prosciutto Crudo del "Poggio"', 'prosciutto-crudo-del-poggio', NULL, 0, NULL, '', 0, 0, 1),
(276, 271, 'Prosciutto di Parma', 'prosciutto-di-parma', NULL, 0, NULL, '', 0, 0, 2),
(277, 272, 'Bresaola', 'bresaola', NULL, 0, NULL, '', 0, 0, 1),
(278, 273, 'Speck di Prosciutto', 'speck-di-prosciutto', NULL, 0, NULL, '', 0, 0, 1),
(279, 274, 'Grancotto di "Vignola"', 'grancotto-di-vignola', NULL, 0, NULL, '', 0, 0, 1),
(280, 0, 'Snack', 'snack', NULL, 0, NULL, '', 0, 0, 3),
(281, 0, 'Cubetti', 'cubetti', NULL, 0, NULL, '', 0, 0, 4),
(282, 0, 'Würstel', 'wuerstel', NULL, 0, NULL, '', 0, 0, 5),
(283, 0, 'Bio', 'bio', NULL, 0, NULL, '', 0, 0, 6),
(284, 0, 'Avicoli', 'avicoli', NULL, 0, NULL, '', 0, 0, 7),
(285, 0, 'Bovino', 'bovino', NULL, 0, NULL, '', 0, 0, 8),
(286, 280, 'Un Due Tris', 'un-due-tris', NULL, 0, NULL, '', 0, 0, 1),
(287, 280, 'Gli Irresistibili', 'gli-irresistibili', NULL, 0, NULL, '', 0, 0, 2),
(288, 280, 'Gli Irresistibili Snack', 'gli-irresistibili-snack', NULL, 0, NULL, '', 0, 0, 3),
(289, 281, 'I Cubetti', 'i-cubetti', NULL, 0, NULL, '', 0, 0, 1),
(290, 281, 'Il Simpaticotto', 'il-simpaticotto', NULL, 0, NULL, '', 0, 0, 2),
(291, 282, 'Wuoi?', 'wuoi', NULL, 0, NULL, '', 0, 0, 1),
(292, 282, 'Delicatessen', 'delicatessen', NULL, 0, NULL, '', 0, 0, 2),
(293, 283, 'Vaschette', 'vaschette', NULL, 0, NULL, '', 0, 0, 1),
(294, 284, 'Affettati', 'affettati', NULL, 0, NULL, '', 0, 0, 1),
(295, 284, 'Bio', 'bio', NULL, 0, NULL, '', 0, 0, 2),
(297, 284, 'Würstel', 'wuerstel', NULL, 0, NULL, '', 0, 0, 3),
(298, 284, 'Snack', 'snack', NULL, 0, NULL, '', 0, 0, 4),
(299, 285, 'Salumi', 'salumi', NULL, 0, NULL, '', 0, 0, 1),
(300, 285, 'Affettati', 'affettati', NULL, 0, NULL, '', 0, 0, 2),
(301, 285, 'Bio', 'bio', NULL, 0, NULL, '', 0, 0, 3),
(303, 286, 'Salame', 'salame', NULL, 0, NULL, '', 0, 0, 1),
(304, 303, 'Salame', 'salame', NULL, 0, NULL, '', 0, 0, 1),
(305, 286, 'Avicoli', 'avicoli', NULL, 0, NULL, '', 0, 0, 2),
(306, 305, 'Petto di Tacchino', 'petto-di-tacchino', NULL, 0, NULL, '', 0, 0, 1),
(307, 286, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 3),
(308, 307, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 1),
(309, 287, 'Salame', 'salame', NULL, 0, NULL, '', 0, 0, 1),
(310, 309, 'Salamini', 'salamini', NULL, 0, NULL, '', 0, 0, 1),
(311, 309, 'Fettine di Salame', 'fettine-di-salame', NULL, 0, NULL, '', 0, 0, 2),
(312, 309, 'Bastoncini di Salame', 'bastoncini-di-salame', NULL, 0, NULL, '', 0, 0, 3),
(313, 287, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 2),
(314, 313, 'Bastoncini di Cotto', 'bastoncini-di-cotto', NULL, 0, NULL, '', 0, 0, 1),
(315, 288, 'Prosciutto Crudo', 'prosciutto-crudo', NULL, 0, NULL, '', 0, 0, 1),
(316, 288, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 2),
(317, 288, 'Salame', 'salame', NULL, 0, NULL, '', 0, 0, 3),
(318, 315, 'Irresistibili Prosciutto Crudo', 'irresistibili-prosciutto-crudo', NULL, 0, NULL, '', 0, 0, 1),
(319, 316, 'Irresistibili Prosciutto Cotto', 'irresistibili-prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 1),
(320, 317, 'Irresistibili Salame Milano', 'irresistibili-salame-milano', NULL, 0, NULL, '', 0, 0, 1),
(321, 317, 'Irresistibili Bastoncini Salame', 'irresistibili-bastoncini-salame', NULL, 0, NULL, '', 0, 0, 2),
(322, 317, 'Irresistibili Salamini', 'irresistibili-salamini', NULL, 0, NULL, '', 0, 0, 3),
(323, 289, 'Pancetta', 'pancetta', NULL, 0, NULL, '', 0, 0, 1),
(324, 323, 'Pancetta Dolce', 'pancetta-dolce', NULL, 0, NULL, '', 0, 0, 1),
(325, 323, 'Pancetta Affumicata', 'pancetta-affumicata', NULL, 0, NULL, '', 0, 0, 2),
(326, 289, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 2),
(327, 289, 'Speck', 'speck', NULL, 0, NULL, '', 0, 0, 3),
(328, 326, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 1),
(329, 327, 'Speck di Prosciutto', 'speck-di-prosciutto', NULL, 0, NULL, '', 0, 0, 1),
(330, 290, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 1),
(331, 291, 'Classico', 'classico', NULL, 0, NULL, '', 0, 0, 1),
(332, 291, 'Avicoli', 'avicoli', NULL, 0, NULL, '', 0, 0, 2),
(333, 331, 'Wuoi?', 'wuoi', NULL, 0, NULL, '', 0, 0, 1),
(334, 331, 'Wuoi? Cocktail Baby', 'wuoi-cocktail-baby', NULL, 0, NULL, '', 0, 0, 2),
(335, 331, 'Wuoi? Maxi', 'wuoi-maxi', NULL, 0, NULL, '', 0, 0, 3),
(336, 332, 'Wuoi?', 'wuoi', NULL, 0, NULL, '', 0, 0, 1),
(337, 332, 'Wuoi? Maxi', 'wuoi-maxi', NULL, 0, NULL, '', 0, 0, 2),
(338, 293, 'Prosciutto Crudo', 'prosciutto-crudo', NULL, 0, NULL, '', 0, 0, 1),
(339, 293, 'Bresaola', 'bresaola', NULL, 0, NULL, '', 0, 0, 2),
(340, 293, 'Speck', 'speck', NULL, 0, NULL, '', 0, 0, 3),
(341, 293, 'Avicoli', 'avicoli', NULL, 0, NULL, '', 0, 0, 4),
(342, 293, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 5),
(343, 338, 'Prosciutto di Parma DOP', 'prosciutto-di-parma-dop', NULL, 0, NULL, '', 0, 0, 1),
(344, 338, 'Prosciutto Crudo', 'prosciutto-crudo', NULL, 0, NULL, '', 0, 0, 2),
(345, 339, 'Bresaola della Valtellina IGP', 'bresaola-della-valtellina-igp', NULL, 0, NULL, '', 0, 0, 1),
(346, 340, 'Speck di Prosciutto', 'speck-di-prosciutto', NULL, 0, NULL, '', 0, 0, 1),
(347, 341, 'Petto di Tacchino', 'petto-di-tacchino', NULL, 0, NULL, '', 0, 0, 1),
(348, 342, 'Prosciutto Cotto', 'prosciutto-cotto', NULL, 0, NULL, '', 0, 0, 1),
(349, 294, 'Il Tagliafresco', 'il-tagliafresco', NULL, 0, NULL, '', 0, 0, 1),
(350, 294, 'La Merenda', 'la-merenda', NULL, 0, NULL, '', 0, 0, 2),
(351, 294, 'Le Sofficette', 'le-sofficette', NULL, 0, NULL, '', 0, 0, 3),
(352, 294, 'Le Perfette', 'le-perfette', NULL, 0, NULL, '', 0, 0, 4),
(353, 349, 'Petto di Tacchino', 'petto-di-tacchino', NULL, 0, NULL, '', 0, 0, 1),
(354, 349, 'Petto di Pollo', 'petto-di-pollo', NULL, 0, NULL, '', 0, 0, 2),
(355, 350, 'Petto di Tacchino', 'petto-di-tacchino', NULL, 0, NULL, '', 0, 0, 1),
(356, 351, 'Petto di Tacchino', 'petto-di-tacchino', NULL, 0, NULL, '', 0, 0, 1),
(357, 351, 'Petto di Pollo', 'petto-di-pollo', NULL, 0, NULL, '', 0, 0, 2),
(358, 352, 'Petto di Pollo', 'petto-di-pollo', NULL, 0, NULL, '', 0, 0, 1),
(359, 352, 'Petto di Tacchino', 'petto-di-tacchino', NULL, 0, NULL, '', 0, 0, 2),
(360, 295, 'Vaschette', 'vaschette', NULL, 0, NULL, '', 0, 0, 1),
(361, 360, 'Petto di Tacchino', 'petto-di-tacchino', NULL, 0, NULL, '', 0, 0, 1),
(362, 297, 'Wuoi?', 'wuoi', NULL, 0, NULL, '', 0, 0, 1),
(363, 362, 'Wuoi?', 'wuoi', NULL, 0, NULL, '', 0, 0, 1),
(364, 362, 'Wuoi? Maxi', 'wuoi-maxi', NULL, 0, NULL, '', 0, 0, 2),
(365, 298, 'Un Due Tris', 'un-due-tris', NULL, 0, NULL, '', 0, 0, 1),
(366, 365, 'Petto di Tacchino', 'petto-di-tacchino', NULL, 0, NULL, '', 0, 0, 1),
(367, 299, 'La Bresaola', 'la-bresaola', NULL, 0, NULL, '', 0, 0, 1),
(368, 367, 'Punta d''Anca', 'punta-d-anca', NULL, 0, NULL, '', 0, 0, 1),
(369, 367, 'Sottofesa', 'sottofesa', NULL, 0, NULL, '', 0, 0, 2),
(370, 367, 'Bresaola della Valtellina IGP', 'bresaola-della-valtellina-igp', NULL, 0, NULL, '', 0, 0, 3),
(371, 300, 'Il Tagliafresco', 'il-tagliafresco', NULL, 0, NULL, '', 0, 0, 1),
(372, 300, 'Le Vaschette Classiche', 'le-vaschette-classiche', NULL, 0, NULL, '', 0, 0, 2),
(373, 300, 'La Merenda', 'la-merenda', NULL, 0, NULL, '', 0, 0, 3),
(374, 300, 'Le Sofficette', 'le-sofficette', NULL, 0, NULL, '', 0, 0, 4),
(375, 300, 'Alta Gastronomia', 'alta-gastronomia', NULL, 0, NULL, '', 0, 0, 5),
(376, 371, 'Bresaola della Valtellina IGP', 'bresaola-della-valtellina-igp', NULL, 0, NULL, '', 0, 0, 1),
(377, 372, 'Bresaola della Valtellina IGP', 'bresaola-della-valtellina-igp', NULL, 0, NULL, '', 0, 0, 1),
(378, 373, 'Bresaola della Valtellina IGP', 'bresaola-della-valtellina-igp', NULL, 0, NULL, '', 0, 0, 1),
(379, 374, 'Bresaola della Valtellina IGP', 'bresaola-della-valtellina-igp', NULL, 0, NULL, '', 0, 0, 1),
(380, 375, 'Bresaola', 'bresaola', NULL, 0, NULL, '', 0, 0, 1),
(382, 301, 'Vaschette', 'vaschette', NULL, 0, NULL, '', 0, 0, 1),
(383, 382, 'Bresaola della Valtellina IGP', 'bresaola-della-valtellina-igp', NULL, 0, NULL, '', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalogue_product`
--

CREATE TABLE IF NOT EXISTS `catalogue_product` (
  `id` int(11) NOT NULL,
  `sector` varchar(64) NOT NULL,
  `node` int(11) NOT NULL,
  `node2` int(11) DEFAULT NULL,
  `code` varchar(16) NOT NULL,
  `sap_name` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `weight` varchar(128) NOT NULL,
  `raw_material` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=888 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalogue_product`
--

INSERT INTO `catalogue_product` (`id`, `sector`, `node`, `node2`, `code`, `sap_name`, `description`, `slug`, `weight`, `raw_material`, `active`) VALUES
(11, 'Salami crudi LS', 36, NULL, '13011', 'SALAME DI MILANO BINDONE g 400', 'Puro suino budello naturale macinatura fine', 'salame-di-milano-bindone', '0.425', 0, 1),
(13, 'Salami crudi BT', 36, NULL, '14011', 'SAL.MILANO BINDONE kg1', 'Legato a mano puro suino budello naturale macinatura fine', 'salame-di-milano-bindone', '1.05', 0, 1),
(14, 'Salami crudi BT', 36, NULL, '14051', 'SAL.DI MILANO BINDONEkg1,7/2,2 CH', 'legato a mano puro suino budello naturale macinatura fine', 'salame-di-milano-bindone', '1.7', 1, 1),
(15, 'Prosciutti Cotti', 90, NULL, '48411', 'PR.COTTO GRANCOTTO BOTTICELLA', '', 'coscia-nazionale-senza-geretto-botticella', '9', 6, 1),
(16, 'SOFFICETTE TEST', 237, NULL, '6631', 'SOFFICETTEGRANCOTTO', '', 'prosciutto-cotto-alta-qualita', '80g', 6, 1),
(41, 'Salami crudi BT', 0, NULL, '10031', 'SAL.DI MILANO GIGANTE', '', '', '8.5', 0, 1),
(42, 'Salami crudi BT', 0, NULL, '10041', 'SALAME DI MILANO GIGANTE CH', '', '', '8', 0, 1),
(43, 'Salami crudi BT', 0, NULL, '10611', 'SAL. SPIANATA PICCANTE CALABRA', '', '', '2.05', 0, 1),
(44, 'Salami crudi BT', 0, NULL, '10811', 'SALAME SCHIACCIATINO', '', '', '1.75', 0, 1),
(45, 'Salami crudi BT', 0, NULL, '10911', 'SALAME CORALLINA CORTA', '', '', '0.675', 0, 1),
(46, 'Salami crudi BT', 0, NULL, '10921', 'SALAME CORALLINA LUNGA', '', '', '1.2', 0, 1),
(116, 'Salami crudi BT', 0, NULL, '11111', 'SAL. SPIANATA DOLCE ROMANA', '', '', '1.65', 0, 1),
(117, 'Salami crudi BT', 0, NULL, '11112', 'SAL. SPIANATA DOLCE ROMANA RU', '', '', '1.65', 0, 1),
(118, 'Salami crudi BT', 0, NULL, '11113', 'SALAME SPIANATA DOLCE ROMANA CH', '', '', '2.1', 0, 1),
(119, 'Salami crudi BT', 0, NULL, '11711', 'SAL.MILANO CRESPONE RETE', '', '', '4', 0, 1),
(120, 'Salami crudi BT', 0, NULL, '11721', 'SALAME DI MILANO CRESPONE RETE CH', '', '', '4', 0, 1),
(121, 'Salami crudi BT', 0, NULL, '11811', 'SALAME DEL CONTADINO', '', '', '1.8', 0, 1),
(122, 'Salami crudi BT', 0, NULL, '11812', 'SALAME DEL CONTADINO RU', '', '', '1.8', 0, 1),
(123, 'Salami crudi BT', 0, NULL, '12111', 'SALAME TOSCANO', '', '', '3.75', 0, 1),
(124, 'Salami crudi BT', 0, NULL, '12311', 'SALAME UNGHERESE PER FETTEkg4,7CH', '', '', '4.75', 0, 1),
(125, 'Salami crudi BT', 0, NULL, '12341', 'SAL. UNGHERESE FETTE CH(MARNA A RENDERE)', '', '', '4.75', 0, 1),
(126, 'Salami crudi BT', 0, NULL, '12931', 'SAL. CAMPAGNOLO META'' SV', '', '', '1.65', 0, 1),
(127, 'Salami crudi BT', 0, NULL, '13111', 'SALAME UNGHERESE', '', '', '3', 0, 1),
(128, 'Salami crudi BT', 0, NULL, '13113', 'SALAME UNGHERESE PZ1', '', '', '3', 0, 1),
(129, 'Salami crudi BT', 0, NULL, '13121', 'SALAME UNGHERESE META'' SV', '', '', '1.55', 0, 1),
(130, 'Salami crudi BT', 0, NULL, '13122', 'SAL.UNGHERESE 1/2 SV X METRO', '', '', '1.7', 0, 1),
(131, 'Salami crudi BT', 0, NULL, '13182', 'SALAME UNGHERESE SV', '', '', '3', 0, 1),
(132, 'Salami crudi BT', 0, NULL, '13211', 'SALAME STRAFINO kg 1,3 PZ4', '', '', '1.45', 0, 1),
(133, 'Salami crudi BT', 0, NULL, '13212', 'SALAME STRAFINO kg 1,3 PZ2', '', '', '1.45', 0, 1),
(134, 'Salami crudi BT', 0, NULL, '13213', 'SALAME STRAFINO kg 1,3 BAC', '', '', '1.45', 0, 1),
(135, 'Salami crudi BT', 0, NULL, '14015', 'SALAME DI MILANO BINDONE kg 1 UK', '', '', '1.05', 0, 1),
(136, 'Salami crudi BT', 0, NULL, '14021', 'SALAME DI MILANO BINDONE kg 1 CH', '', '', '1.05', 0, 1),
(137, 'Salami crudi BT', 0, NULL, '14022', 'SALAME DI MILANO BINDONE kg 1 CH', '', '', '1.05', 0, 1),
(138, 'Salami crudi BT', 0, NULL, '14041', 'SAL.MILANO ''BINDONE'' g 700 FESTA CH', '', '', '0.65', 0, 1),
(139, 'Salami crudi BT', 0, NULL, '14111', 'SALAME SARDO', '', '', '1.1', 0, 1),
(140, 'Salami crudi BT', 0, NULL, '14211', 'SALAME NAPOLI  g 700', '', '', '0.75', 0, 1),
(141, 'Salami crudi BT', 0, NULL, '14212', 'SALAME NAPOLI g 700', '', '', '0.75', 0, 1),
(142, 'Salami crudi BT', 0, NULL, '14213', 'SALAME NAPOLI g700 UK', '', '', '0.75', 0, 1),
(143, 'Salami crudi BT', 0, NULL, '14531', 'SALAME GENTILE (TIPO FELINO) LUNGO', '', '', '3.5', 0, 1),
(144, 'Salami crudi BT', 0, NULL, '14541', 'SALAME GENTILE 1 METRO CH', '', '', '3.4', 0, 1),
(145, 'Salami crudi BT', 0, NULL, '14551', 'SALAME GENTILE (TIPO FELINO) g800', '', '', '0.9', 0, 1),
(146, 'Salami crudi BT', 0, NULL, '14552', 'SALAME GENTILE g 800 CH', '', '', '0.9', 0, 1),
(147, 'Salami crudi BT', 0, NULL, '14561', 'SALAME GENTILE (TIPO FELINO) g800 BAC D', '', '', '0.9', 0, 1),
(148, 'Salami crudi BT', 0, NULL, '14811', 'SALAME GRANFETTA', '', '', '2.5', 0, 1),
(149, 'Salami crudi BT', 0, NULL, '14813', 'SALAME GRANFETTA RU', '', '', '2.5', 0, 1),
(150, 'Salami crudi BT', 0, NULL, '14821', 'SALAME GRANFETTA BAC D', '', '', '2.5', 0, 1),
(151, 'Salami crudi BT', 0, NULL, '17811', 'SALAME VENTRICINA', '', '', '2.9', 0, 1),
(152, 'Salami crudi BT', 0, NULL, '18021', 'SAL.MILANO META'' SV', '', '', '2.75', 0, 1),
(153, 'Salami crudi BT', 0, NULL, '18022', 'SAL. MILANO 1/2 SV X METRO', '', '', '1.75', 0, 1),
(154, 'Salami crudi BT', 0, NULL, '18031', 'SAL.MILANO CASTELLO', '', '', '3.45', 0, 1),
(155, 'Salami crudi BT', 0, NULL, '18032', 'SALAME DI MILANO CASTELLO X ES', '', '', '3.3', 0, 1),
(156, 'Salami crudi BT', 0, NULL, '18033', 'SAL.MILANO CASTELLO PZ01', '', '', '3.45', 0, 1),
(157, 'Salami crudi BT', 0, NULL, '18034', 'SAL.MILANO CASTELLO SMA', '', '', '3.45', 0, 1),
(158, 'Salami crudi BT', 0, NULL, '18035', 'SAL.MILANO CASTELLO PENNY', '', '', '3.45', 0, 1),
(159, 'Salami crudi BT', 0, NULL, '18041', 'SALAME DI MILANO META'' SV D', '', '', '1.75', 0, 1),
(160, 'Salami crudi BT', 0, NULL, '18051', 'SAL.MILANO CASTELLO CANARIE', '', '', '1.5', 0, 1),
(161, 'Salami crudi BT', 0, NULL, '18061', 'SALAME DI MILANO META'' SV D', '', '', '1.75', 0, 1),
(162, 'Salami crudi BT', 0, NULL, '18072', 'SAL.MILANO CASTELLO SV 4 PZ', '', '', '3.6', 0, 1),
(163, 'Salami crudi BT', 0, NULL, '18073', 'SAL.MILANO CASTELLO SV RU', '', '', '3.45', 0, 1),
(164, 'Salami crudi BT', 0, NULL, '18421', 'SALAME RUSTICO PER FETTEkg4,7 CH', '', '', '4.75', 0, 1),
(165, 'Salami crudi BT', 0, NULL, '18441', 'SALAME RUSTICO FETTE CH(MARNA A RENDERE)', '', '', '4.75', 0, 1),
(166, 'Salami crudi BT', 0, NULL, '18511', 'SALAME VENTRICINA PICCANTE', '', '', '2.35', 0, 1),
(167, 'Salami crudi BT', 0, NULL, '18811', 'SALAME NAPOLI kg 1,7', '', '', '1.5', 0, 1),
(168, 'Salami crudi BT', 0, NULL, '18812', 'SALAME NAPOLI kg 1,7 RU', '', '', '1.5', 0, 1),
(169, 'Salami crudi BT', 0, NULL, '18821', 'SALAME NAPOLI SOTTOVUOTO UK', '', '', '3', 0, 1),
(170, 'Salami crudi BT', 0, NULL, '18831', 'SALAME NAPOLI SOTTOVUOTO kg 1,8', '', '', '1.8', 0, 1),
(171, 'Salami crudi BT', 0, NULL, '19211', 'SALAME DI MILANO METZGER kg 2,5', '', '', '2.5', 0, 1),
(172, 'Salami crudi BT', 0, NULL, '19221', 'SALAME DI MILANO METZGER kg 1,5', '', '', '1.5', 0, 1),
(173, 'Salami crudi BT', 0, NULL, '19231', 'SALAME DI MILANOPER FETTECH SV META', '', '', '2.4', 0, 1),
(174, 'Salami crudi BT', 0, NULL, '19241', 'SAL.MILANO FETTE SV CH(MARNA A RENDERE)', '', '', '4.5', 0, 1),
(175, 'Salami crudi BT', 0, NULL, '19251', 'SALAME DI MILANO META'' METZGER CH', '', '', '1.45', 0, 1),
(176, 'Salami crudi BT', 0, NULL, '19261', 'SAL.DI MILANO PER FETTESV kg4,7CH', '', '', '4.5', 0, 1),
(177, 'Salami crudi BT', 0, NULL, '93440', 'SALAME DI MILANO CRESPONE RETE', '', '', '4', 0, 1),
(178, 'Salami crudi BT', 0, NULL, '93450', 'SALAME GENTILE g 800 BE CH', '', '', '0.85', 0, 1),
(179, 'Salami crudi BT', 0, NULL, '93452', 'SALAME GENTILE 1 METRO BE CH', '', '', '2.9', 0, 1),
(180, 'Salami crudi BT', 0, NULL, '93453', 'SALAME GENTILE 800g', '', '', '0.85', 0, 1),
(181, 'Salami crudi BT', 0, NULL, '93461', 'SALAME NAPOLI KG.1,5', '', '', '1.5', 0, 1),
(182, 'Salami crudi BT', 0, NULL, '93462', 'VENTRICINA PICCANTE', '', '', '2.8', 0, 1),
(183, 'Salami crudi BT', 0, NULL, '93470', 'SALAME CAMPAGNOLO', '', '', '3.5', 0, 1),
(184, 'Salami crudi BT', 0, NULL, '93480', 'SALAME GRANFETTA', '', '', '2.75', 0, 1),
(185, 'Salami crudi BT', 0, NULL, '08100BI', 'IRRESISTIBILI SALAMINI-SACCHI', '', '', '0.007', 0, 1),
(186, 'Salami crudi BT', 0, NULL, '08200BI', 'IRRESISTIBILI BASTONCINI-SACCHI', '', '', '0.038', 0, 1),
(187, 'Salami crudi BT', 0, NULL, '08300AC', 'IRRESISTIBILI PETALI S-SACCHI (ACQ)', '', '', '0.94', 0, 1),
(188, 'Salami crudi BT', 0, NULL, '08300BI', 'IRRESISTIBILI PETALI S-SACCHI', '', '', '0.94', 0, 1),
(189, 'Salami crudi BT', 0, NULL, '08300ST', 'IRRESISTIBILI PETALI S-STAGIONATO', '', '', '1.047', 0, 1),
(190, 'Salami crudi BT', 0, NULL, '08400BI', 'IRRESISTIBILI PETALI B-SACCHI', '', '', '1.05', 0, 1),
(191, 'Salami crudi BT', 0, NULL, '11701ST', 'CRESPONI-STAGIONATO', '', '', '4.357', 0, 1),
(192, 'Salami crudi BT', 0, NULL, '11800ST', 'CONTADINO-STAGIONATO', '', '', '1.725', 0, 1),
(193, 'Salami crudi BT', 0, NULL, '12501BI', 'CASTELLO 110 SOTTOVUOTO-INTERO', '', '', '3.4', 0, 1),
(194, 'Salami crudi BT', 0, NULL, '13101BI', 'UNGHERESE 100 SOTTOVUOTO-INTERO', '', '', '3.4', 0, 1),
(195, 'Salami crudi BT', 0, NULL, '14600BI', 'GENTILE FETTE SOTTOVUOTO INT', '', '', '2.7', 0, 1),
(196, 'Salami crudi BT', 0, NULL, '15200ST', 'CITTERINO-STAGIONATO', '', '', '0.252', 0, 1),
(197, 'Salami crudi BT', 0, NULL, '15208BI', 'CITTERINO FETTE SOTTOVUOTO-INTERO', '', '', '2.054', 0, 1),
(198, 'Salami crudi BT', 0, NULL, '15208ST', 'CITTERINO FETTE-STAGIONATO', '', '', '2.115', 0, 1),
(199, 'Salami crudi BT', 0, NULL, '17702BI', 'PIZZA NAPOLI SOTTOVUOTO-INTERO', '', '', '2.7', 0, 1),
(200, 'Salami crudi BT', 0, NULL, '17703BI', 'Pizza Napoli Londra Sottovuoto - Intero', '', '', '1.97', 0, 1),
(201, 'Salami crudi BT', 0, NULL, '18304BI', 'VARZI FETTE SOTTOVUOTO-INTERO', '', '', '4.76', 0, 1),
(202, 'Salami crudi BT', 0, NULL, '19104BI', 'UNGHERESE FETTE SOTTOVUOTO INTERO', '', '', '4.75', 0, 1),
(203, 'Salami crudi BT', 0, NULL, '19204BI', 'MILANO FETTE SOTTOVUOTO INTERO', '', '', '4.9', 0, 1),
(204, 'Prosciutti crudi', 0, NULL, '22011', 'PR.PARMA 13MESI DOP DIS. PRESS.', '', '', '7.5', 0, 1),
(205, 'Prosciutti crudi', 0, NULL, '22021', 'PR.PARMA 14MESI DOP DIS. PERA', '', '', '8', 0, 1),
(206, 'Prosciutti crudi', 0, NULL, '22051', 'PR.PARMA 13MESI DOP DIS. PRESS. ES', '', '', '7.5', 0, 1),
(207, 'Prosciutti crudi', 0, NULL, '22211', 'PR.PARMA PELATELLO DOP 3 PARTI', '', '', '6', 0, 1),
(208, 'Prosciutti crudi', 0, NULL, '22212', 'PR.PARMA PELATELLO DOP 3PARTI BAC', '', '', '6', 0, 1),
(209, 'Prosciutti crudi', 0, NULL, '22511', 'PR.CRUDO ''IL POGGIO'' 8m DIS.PRESS.', '', '', '6', 0, 1),
(210, 'Prosciutti crudi', 0, NULL, '22512', 'PR.CRUDO ''IL POGGIO'' 8m DIS.PREPICC', '', '', '6', 0, 1),
(211, 'Prosciutti crudi', 0, NULL, '22521', 'PR.CRUDO ''IL POGGIO'' 8m DIS.PERA', '', '', '6', 0, 1),
(212, 'Prosciutti crudi', 0, NULL, '22911', 'PR.PARMA DOP DISOSS. PRESS. CND', '', '', '7.5', 0, 1),
(213, 'Prosciutti crudi', 0, NULL, '22931', 'PR.PARMA 24MESI DOP DIS.PRESS.1157L', '', '', '7.5', 0, 1),
(214, 'Prosciutti crudi', 0, NULL, '22941', 'PR.PARMA DOP DISOSS. PRESS. JAP', '', '', '7.5', 0, 1),
(215, 'Prosciutti crudi', 0, NULL, '23011', 'PR.PARMA PELATELLO DOP DIS.', '', '', '6', 0, 1),
(216, 'Prosciutti crudi', 0, NULL, '23021', 'PR.PARMA PELATELLO DOP DIS. BAC D', '', '', '6', 0, 1),
(217, 'Prosciutti crudi', 0, NULL, '23112', 'PR.PARMA 13MESI DOP DIS. PRESS.', '', '', '7.5', 0, 1),
(218, 'Prosciutti crudi', 0, NULL, '23421', 'PR.CRUDO STAG. DISOSSATO USA', '', '', '6', 0, 1),
(219, 'Prosciutti crudi', 0, NULL, '23431', 'PR.CRUDO STAG. DISOSSATO USA', '', '', '6', 0, 1),
(220, 'Prosciutti crudi', 0, NULL, '24411', 'FIOCCO DI PROSCIUTTO CRUDO', '', '', '3.5', 0, 1),
(221, 'Prosciutti crudi', 0, NULL, '24511', 'PR.SAN DANIELE DOP DIS.PRESS. USA', '', '', '7', 0, 1),
(222, 'Prosciutti crudi', 0, NULL, '24521', 'PR.SAN DANIELE 18M DOP DIS.PRES.USA', '', '', '6.5', 0, 1),
(223, 'Prosciutti crudi', 0, NULL, '24711', 'PR.CRUDO ''IL POGGIO'' 11MESI DIS.PERA', '', '', '6', 0, 1),
(224, 'Prosciutti crudi', 0, NULL, '24741', 'PR.CRUDO SCOTENNATO VASCONE x RANA', '', '', '300', 0, 1),
(225, 'Prosciutti crudi', 0, NULL, '25011', 'PR.PARMA 14MESI DOP C/O', '', '', '9.86', 0, 1),
(226, 'Prosciutti crudi', 0, NULL, '25611', 'PR.PARMA 18MESI DOP DIS. PERA', '', '', '8', 0, 1),
(227, 'Prosciutti crudi', 0, NULL, '25711', 'PR.PARMA 16MESI DOP DIS. PERA', '', '', '8', 0, 1),
(228, 'Prosciutti crudi', 0, NULL, '25721', 'PR.PARMA 16MESI DOP DIS. PRESS.', '', '', '7.5', 0, 1),
(229, 'Prosciutti crudi', 0, NULL, '25811', 'PR.PARMA 15MESI DOP DIS. PERA', '', '', '8', 0, 1),
(230, 'Prosciutti crudi', 0, NULL, '26011', 'PR.PARMA 16MESI C/O DOP kg9/10', '', '', '9.27', 0, 1),
(231, 'Prosciutti crudi', 0, NULL, '26111', 'PR.PARMA 18MESI C/O DOP', '', '', '9.61', 0, 1),
(232, 'Prosciutti crudi', 0, NULL, '26411', 'PR.PARMA 24MESI DOP DIS. PERA', '', '', '8', 0, 1),
(233, 'Prosciutti crudi', 0, NULL, '26432', 'PR.PARMA 24MESI DOP DISOSS. USA', '', '', '7.5', 0, 1),
(234, 'Prosciutti crudi', 0, NULL, '26511', 'PR.PARMA 24MESI C/O DOP', '', '', '10', 0, 1),
(235, 'Prosciutti crudi', 0, NULL, '26512', 'PR.PARMA 24MESI C/O DOP ES', '', '', '10', 0, 1),
(236, 'Prosciutti crudi', 0, NULL, '26611', 'PR.PARMA 36MESI DOP DIS. PERA', '', '', '8', 0, 1),
(237, 'Prosciutti crudi', 0, NULL, '26911', 'PR.SAN DANIELE 16MESI C/O DOP', '', '', '10', 0, 1),
(238, 'Prosciutti crudi', 0, NULL, '27011', 'PR.SAN DANIELE 14MESI C/O DOP', '', '', '9.75', 0, 1),
(239, 'Prosciutti crudi', 0, NULL, '27111', 'PR.SAN DANIELE 13MESI DOP DIS.PRESS', '', '', '7.5', 0, 1),
(240, 'Prosciutti crudi', 0, NULL, '27121', 'PR.SAN DANIELE 14MESI DOP DIS. PERA', '', '', '7', 0, 1),
(241, 'Prosciutti crudi', 0, NULL, '27131', 'PR.SAN DANIELE 16MESI DOPPRESSUK1/2', '', '', '7.5', 0, 1),
(242, 'Prosciutti crudi', 0, NULL, '27141', 'PR.SAN DANIELE 16MESI DOP DIS.PRESS', '', '', '7.5', 0, 1),
(243, 'Prosciutti crudi', 0, NULL, '27161', 'PR.SAN DANIELE 20MESI DOP DIS.PRESS', '', '', '7.25', 0, 1),
(244, 'Prosciutti crudi', 0, NULL, '27171', 'PR.SAN DANIELE 18MESI DOP DIS.PRESS', '', '', '8.5', 0, 1),
(245, 'Prosciutti crudi', 0, NULL, '27181', 'PR.SAN DANIELE 18MESI DOP DIS.PERA', '', '', '8', 0, 1),
(246, 'Prosciutti crudi', 0, NULL, '27211', 'PR.SAN DANIELE DOP DIS. PELATELLO D', '', '', '5.5', 0, 1),
(247, 'Prosciutti crudi', 0, NULL, '27212', 'PR.SAN DANIELE DOP DIS.PELATELLO CH', '', '', '6', 0, 1),
(248, 'Prosciutti crudi', 0, NULL, '27221', 'PR.SAN DANIELE DOP DIS.PELAT.16mBAC', '', '', '5.75', 0, 1),
(249, 'Prosciutti crudi', 0, NULL, '27411', 'PR.SAN DANIELE C/O 20MESI DOP', '', '', '11.5', 0, 1),
(250, 'Prosciutti crudi', 0, NULL, '27811', 'PR. CRUDO CARNIA C/G', '', '', '10', 0, 1),
(251, 'Prosciutti crudi', 0, NULL, '28141', 'PR.PARMA DOP USA DIS. PRESS.', '', '', '7.5', 0, 1),
(252, 'Prosciutti crudi', 0, NULL, '28151', 'PR.PARMA DOP USA DIS. PRESS.', '', '', '7.5', 0, 1),
(253, 'Prosciutti crudi', 0, NULL, '28161', 'PR.PARMA DOP USA DIS. PRESS.', '', '', '7.5', 0, 1),
(254, 'Prosciutti crudi', 0, NULL, '28211', 'PR.CRUDO CARNIA DIS.', '', '', '7', 0, 1),
(255, 'Prosciutti crudi', 0, NULL, '93300', 'PR.PARMA CON OSSO 16M.', '', '', '9.27', 0, 1),
(256, 'Prosciutti crudi', 0, NULL, '93310', 'PR.DIS.PARMA N/PRES. CL.', '', '', '8', 0, 1),
(257, 'Prosciutti crudi', 0, NULL, '93320', 'PELATELLO DOP S/O parma', '', '', '6', 0, 1),
(258, 'Prosciutti crudi', 0, NULL, '93321', 'PELATELLO DOP S/O PARMA', '', '', '6', 0, 1),
(259, 'Prosciutti crudi', 0, NULL, '93322', 'PELATELLO DOP S/O PARMA 1/2', '', '', '3', 0, 1),
(260, 'Prosciutti crudi', 0, NULL, '93330', 'PR.PARMA DISOSS.PRESSATO', '', '', '7.5', 0, 1),
(261, 'Prosciutti crudi', 0, NULL, '1200PEL3', 'Prosciutto Stag Pelatello Parma 16 mesi', '', '', '6', 0, 1),
(262, 'Prosciutti crudi', 0, NULL, '1200ST16', 'Prosciutto Stagionato Estero 10 Mesi LEO', '', '', '7.6', 0, 1),
(263, 'Prosciutti crudi', 0, NULL, '1200ST5', 'Prosciutto Stagionato Parma 14 mesi', '', '', '9.86', 0, 1),
(264, 'Prosciutti crudi', 0, NULL, '1200STDPER13', 'Prosciutto Stag DIS PERA Estero 11 mesi', '', '', '6', 0, 1),
(265, 'Prosciutti crudi', 0, NULL, '1200STDPRS39', 'Prosciutto disossato x USA c/balia Leon.', '', '', '6', 0, 1),
(266, 'Prosciutti crudi', 0, NULL, '1200STDPRS6', 'Prosciutto Stag DIS PRESParma 16 mesi', '', '', '7.5', 0, 1),
(267, 'Bresaole', 0, NULL, '21011', 'BRESAOLA TRADIZIONALE P.ANCA', '', '', '3.2', 0, 1),
(268, 'Bresaole', 0, NULL, '21012', 'BRESAOLA TRADIZIONALE P.ANCA D', '', '', '3.2', 0, 1),
(269, 'Bresaole', 0, NULL, '21411', 'BRESAOLA ALLUMINIO PUNTA A. C/P SV', '', '', '2.9', 0, 1),
(270, 'Bresaole', 0, NULL, '21412', 'BRESAOLA ALLUMINIO PZ1', '', '', '2.9', 0, 1),
(271, 'Bresaole', 0, NULL, '21421', 'BRESAOLA SV PUNTA ANCA', '', '', '2.9', 0, 1),
(272, 'Bresaole', 0, NULL, '21424', 'BRESAOLA SV PUNTA ANCA', '', '', '2.9', 0, 1),
(273, 'Bresaole', 0, NULL, '21431', 'BRESAOLA D.VALTELLINA IGP META'' SV', '', '', '1.5', 0, 1),
(274, 'Bresaole', 0, NULL, '21441', 'BRESAOLA D.VALTELLINA IGP META''SVCH', '', '', '1.5', 0, 1),
(275, 'Bresaole', 0, NULL, '21451', 'BRESAOLA 1/2 PUNTA ANCA PER LIBANO', '', '', '1.45', 0, 1),
(276, 'Bresaole', 0, NULL, '21911', 'BRESAOLA DELLA VALTELLINA SOTTOF.SV', '', '', '2.5', 0, 1),
(277, 'Speck', 0, NULL, '23211', 'SPECK SUDTIROL GOLDEN', '', '', '5.47', 0, 1),
(278, 'Speck', 0, NULL, '23311', 'SPECK SUDTIROL ALPEN', '', '', '5.29', 0, 1),
(279, 'Speck', 0, NULL, '23321', 'SPECK SUDTIROL ALPEN META''', '', '', '2.645', 0, 1),
(280, 'Speck', 0, NULL, '24211', 'SPECK IGP SUDTIROLERSPECK', '', '', '5.29', 0, 1),
(281, 'Speck', 0, NULL, '24221', 'SPECK IGP SUDTIROLERSPECK 1/2', '', '', '2.645', 0, 1),
(282, 'Speck', 0, NULL, '27911', 'SPECK DI PROSCIUTTO ALTOSPECK', '', '', '6.036', 0, 1),
(283, 'Speck', 0, NULL, '27921', 'SPECK ALTOSPECK META''', '', '', '3.018', 0, 1),
(284, 'Speck', 0, NULL, '27922', 'SPECK ALTOSPECK META'' SCOT.', '', '', '3.018', 0, 1),
(285, 'Speck', 0, NULL, '29011', 'SPECK DI PROSCIUTTO SV', '', '', '5.29', 0, 1),
(286, 'Speck', 0, NULL, '29021', 'SPECK DI PROSCIUTTO META''SV', '', '', '2.645', 0, 1),
(287, 'Speck', 0, NULL, '29041', 'SPECK DI PROSCIUTTO SCOT. SV', '', '', '5.29', 0, 1),
(288, 'Speck', 0, NULL, '29711', 'SPECK ALTO ADIGE GOLDEN', '', '', '5.47', 0, 1),
(289, 'Speck', 0, NULL, '29721', 'SPECK ALTO ADIGE GOLDEN SCUDO', '', '', '7.296', 0, 1),
(290, 'Speck', 0, NULL, '29811', 'SPECK ALTO ADIGE IGP', '', '', '5.29', 0, 1),
(291, 'Speck', 0, NULL, '29812', 'SPECK ALTO ADIGE IGP PZ 1', '', '', '5.29', 0, 1),
(292, 'Speck', 0, NULL, '29821', 'SPECK ALTO ADIGE IGP 1/2', '', '', '2.645', 0, 1),
(293, 'Speck', 0, NULL, '29822', 'SPECK ALTO ADIGE IGP CASCINA VERDE SOLE', '', '', '2.45', 0, 1),
(294, 'Speck', 0, NULL, '29831', 'SPECK ALTO ADIGE IGP 1/2 PZ 4', '', '', '2.645', 0, 1),
(295, 'Speck', 0, NULL, '29841', 'SPECK A.A.IGP META''SVTAVOLABONTA''', '', '', '2.6', 0, 1),
(296, 'Coppe e Lonze', 0, NULL, '20111', 'CAPOCOLLO PICCANTE CON CANNA', '', '', '1.95', 0, 1),
(297, 'Coppe e Lonze', 0, NULL, '20211', 'COPPA PARMA STAG. 3 MESI', '', '', '1.85', 0, 1),
(298, 'Coppe e Lonze', 0, NULL, '20231', 'COPPA PARMA STAG.3 MESI SV', '', '', '1.7', 0, 1),
(299, 'Coppe e Lonze', 0, NULL, '20611', 'LONZA DOLCE STAGIONATA SV', '', '', '1.2', 0, 1),
(300, 'Coppe e Lonze', 0, NULL, '20911', 'COPPA MAGRETTA META'' SV', '', '', '1', 0, 1),
(301, 'Coppe e Lonze', 0, NULL, '21512', 'COPPA META'' SV', '', '', '1', 0, 1),
(302, 'Coppe e Lonze', 0, NULL, '21513', 'COPPA PARMA META'' SV CH', '', '', '1', 0, 1),
(303, 'Pancette e lardo', 0, NULL, '50211', 'PANCETTA STECCATA C/COTENNA', '', '', '4', 0, 1),
(304, 'Pancette e lardo', 0, NULL, '50511', 'PANCETTA COPPATA SGRASS.S/COTENNA', '', '', '5.3', 0, 1),
(305, 'Pancette e lardo', 0, NULL, '50521', 'PANCETTA COPPATA SGR.META''S/C', '', '', '2.75', 0, 1),
(306, 'Pancette e lardo', 0, NULL, '51011', 'PANCETTA TESA AFFUMICATA BACON', '', '', '1.2', 0, 1),
(307, 'Pancette e lardo', 0, NULL, '51211', 'PANCETTA ARROTOLATA S/COTENNA LEG.', '', '', '4.5', 0, 1),
(308, 'Pancette e lardo', 0, NULL, '51411', 'PANCETTA ARROTOLATA S/COT. NON LEG.', '', '', '2.05', 0, 1),
(309, 'Pancette e lardo', 0, NULL, '52011', 'PANCETTA TESA SALATA', '', '', '1.15', 0, 1),
(310, 'Prosciutti Cotti', 0, NULL, '45712', 'PR.COTTO NUOVA MATTONELLA X C.C.', '', '', '7.82', 0, 1),
(311, 'Prosciutti Cotti', 0, NULL, '45811', 'PR.COTTO MATTONELLA', '', '', '4.7', 0, 1),
(312, 'Prosciutti Cotti', 0, NULL, '45831', 'PR.COTTO MATTONELLA JAP', '', '', '4', 0, 1),
(313, 'Prosciutti Cotti', 0, NULL, '46911', 'PR.COTTO EUROPA BAULETTO', '', '', '7.5', 0, 1),
(314, 'Prosciutti Cotti', 0, NULL, '46921', 'PR.COTTO EUROPA PRESSATO', '', '', '7.5', 0, 1),
(315, 'Prosciutti Cotti', 0, NULL, '46931', 'COTTO EUROPA CORTO PRESSATO', '', '', '7.5', 0, 1),
(316, 'Prosciutti Cotti', 0, NULL, '47411', 'PROSC.COTTO PIU''COTTO', '', '', '8', 0, 1),
(317, 'Prosciutti Cotti', 0, NULL, '47412', 'PROSC.COTTO PIU''COTTO AQ', '', '', '8', 0, 1),
(318, 'Prosciutti Cotti', 0, NULL, '48421', 'PR.COTTO GRANCOTTO NOCE', '', '', '8.1', 0, 1),
(319, 'Prosciutti Cotti', 0, NULL, '48711', 'PR.COTTO GRANCASTELLO NOCE', '', '', '7.75', 0, 1),
(320, 'Prosciutti Cotti', 0, NULL, '48811', 'PR.COTTO GRANFIOCCO NOCE', '', '', '8.25', 0, 1),
(321, 'Prosciutti Cotti', 0, NULL, '48821', 'PR.COTTO GRANFIOCCO PRESSATO', '', '', '9.25', 0, 1),
(322, 'Prosciutti Cotti', 0, NULL, '49611', 'PROSCIUTTO COTTO IL PICCOLO', '', '', '3', 0, 1),
(323, 'Prosciutti Cotti', 0, NULL, '49621', 'PROSCIUTTO COTTO IL PICCOLO USA', '', '', '3', 0, 1),
(324, 'Prosciutti Cotti', 0, NULL, '49631', 'PROSCIUTTO COTTO IL PICCOLO C/TARTUFO', '', '', '3', 0, 1),
(325, 'Prosciutti Cotti', 0, NULL, '49711', 'PR.COTTO GRANGUSTO OVALE', '', '', '7.2', 0, 1),
(326, 'Prosciutti Cotti', 0, NULL, '49712', 'PR.COTTO GRANGUSTO OVALE D', '', '', '6.75', 0, 1),
(327, 'Prosciutti Cotti', 0, NULL, '49713', 'MEZZO COTTO ''GRANGUSTO''', '', '', '3.5', 0, 1),
(328, 'Prosciutti Cotti', 0, NULL, '49721', 'PR.COTTO GRANGUSTO OVALE BAC D', '', '', '6.5', 0, 1),
(329, 'Prosc cotti al forno', 0, NULL, '45511', 'PR.COTTO IL TARTUFO', '', '', '6.8', 0, 1),
(330, 'Prosc cotti al forno', 0, NULL, '45513', 'MEZZO COTTO ''IL TARTUFO''', '', '', '3.4', 0, 1),
(331, 'Prosc cotti al forno', 0, NULL, '45911', 'PR.COTTO GRIGLIATO', '', '', '7.2', 0, 1),
(332, 'Prosc cotti al forno', 0, NULL, '45912', 'PR.COTTO GRIGLIATO CH', '', '', '6.75', 0, 1),
(333, 'Prosc cotti al forno', 0, NULL, '45913', 'MEZZO COTTO ''GRIGLIATO''', '', '', '3.6', 0, 1),
(334, 'Prosc cotti al forno', 0, NULL, '45923', 'MEZZO COTTO ''GRIGLIATO'' USA', '', '', '3.25', 0, 1),
(335, 'Prosc cotti al forno', 0, NULL, '49011', 'PR.COTTO PRAGA AFFUMICATO', '', '', '6.75', 0, 1),
(336, 'Arrosti', 0, NULL, '45611', 'PORCHETTA ROMANA', '', '', '3.6', 0, 1),
(337, 'Arrosti', 0, NULL, '45631', 'PORCHETTA ROMANA CANADA', '', '', '3.75', 0, 1),
(338, 'Arrosti', 0, NULL, '45641', 'PORCHETTA ROMANA 1/2', '', '', '1.88', 0, 1),
(339, 'Arrosti', 0, NULL, '46011', 'ARISTA AL FORNO', '', '', '2.9', 0, 1),
(340, 'Arrosti', 0, NULL, '47511', 'TACCHINO ARROSTO FESA INTERA SV', '', '', '3.25', 0, 1),
(341, 'Mortadelle', 0, NULL, '29911', 'MOR. REGINA NAT. CAL.23/28', '', '', '18', 0, 1),
(342, 'Mortadelle', 0, NULL, '29931', 'MOR. REGINA NAT. CAL.23/28 LEGATA', '', '', '25', 0, 1),
(343, 'Mortadelle', 0, NULL, '30011', 'MOR. REGINA C/P GIG. kg40+ CIL.', '', '', '75', 0, 1),
(344, 'Mortadelle', 0, NULL, '30021', 'MOR. REGINA C/P GIG. META'' CIL.', '', '', '32.5', 0, 1),
(345, 'Mortadelle', 0, NULL, '30111', 'MORTADELLA REGINA kg8', '', '', '9.5', 0, 1),
(346, 'Mortadelle', 0, NULL, '30211', 'MOR.REGINA C/P OVALE kg 11', '', '', '11', 0, 1),
(347, 'Mortadelle', 0, NULL, '30411', 'MORTADELLA DE MILAN C/P 1/2 OVALE', '', '', '6', 0, 1),
(348, 'Mortadelle', 0, NULL, '30541', 'MOR. SFORZESCA SLOVENIA META'' kg3', '', '', '3.75', 0, 1),
(349, 'Mortadelle', 0, NULL, '30611', 'MOR. REGINA GIG. kg40+ CIL.', '', '', '76', 0, 1),
(350, 'Mortadelle', 0, NULL, '30621', 'MOR. REGINA GIG. META'' CIL.', '', '', '39', 0, 1),
(351, 'Mortadelle', 0, NULL, '30711', 'MOR. REGINA C/P CIL. 1/2 kg 15', '', '', '13.5', 0, 1),
(352, 'Mortadelle', 0, NULL, '30811', 'MORTADELLA REGINA kg 4 CIL.', '', '', '4.5', 0, 1),
(353, 'Mortadelle', 0, NULL, '31011', 'MORTADELLA USA C/P META''', '', '', '3.5', 0, 1),
(354, 'Mortadelle', 0, NULL, '31111', 'MORTADELLA PER INDUSTRIA', '', '', '5', 0, 1),
(355, 'Mortadelle', 0, NULL, '31411', 'MORTADELLA REGINA OV kg 6/7 CNR', '', '', '7', 0, 1),
(356, 'Mortadelle', 0, NULL, '31612', 'MOR.SFORZESCA C/P CAL.20 kg5', '', '', '5', 0, 1),
(357, 'Mortadelle', 0, NULL, '31711', 'MORTADELLA REGINA kg 90', '', '', '92.5', 0, 1),
(358, 'Mortadelle', 0, NULL, '31811', 'MOR.REGINA OVALE kg 11', '', '', '10.75', 0, 1),
(359, 'Mortadelle', 0, NULL, '31821', 'MOR. REGINA OVALE META''', '', '', '5.5', 0, 1),
(360, 'Mortadelle', 0, NULL, '31831', 'MOR. REGINA OVALE META''', '', '', '5.5', 0, 1),
(361, 'Mortadelle', 0, NULL, '31841', 'MOR. REGINA C/P OVALE META''', '', '', '5.5', 0, 1),
(362, 'Mortadelle', 0, NULL, '31851', 'MORTADELLA CILINDRICA kg 10 JS', '', '', '10', 0, 1),
(363, 'Mortadelle', 0, NULL, '31931', 'MORTADELLA SFORZESCA FETTE 27PZ', '', '', '10', 0, 1),
(364, 'Mortadelle', 0, NULL, '32011', 'MOR.REGINA NAT. CAL. 21/24', '', '', '14', 0, 1),
(365, 'Mortadelle', 0, NULL, '32012', 'MOR.REGINA NAT. CAL. 21/24 CH', '', '', '11', 0, 1),
(366, 'Mortadelle', 0, NULL, '32111', 'MOR. REGINA 1/2 OV C/P kg3 CH', '', '', '3', 0, 1),
(367, 'Mortadelle', 0, NULL, '32211', 'MORTADELLA REGINA CND kg6', '', '', '6', 0, 1),
(368, 'Mortadelle', 0, NULL, '32511', 'MORTADELLA REGINA OV kg 6/7 GR', '', '', '6.5', 0, 1),
(369, 'Mortadelle', 0, NULL, '32611', 'MORTADELLA REGINA kg 5/6 OV', '', '', '6', 0, 1),
(370, 'Mortadelle', 0, NULL, '32631', 'MORTADELLA REGINA kg 4 OV', '', '', '4', 0, 1),
(371, 'Mortadelle', 0, NULL, '33011', 'MOR.ROMAGNOLA OVALE C/P kg 9,5', '', '', '9.5', 0, 1),
(372, 'Mortadelle', 0, NULL, '33031', 'MOR. ROMAGNOLA OVALE C/P META''', '', '', '5', 0, 1),
(373, 'Mortadelle', 0, NULL, '33032', 'MOR. ROMAGNOLA OVALE C/P META'' GR', '', '', '5.75', 0, 1),
(374, 'Mortadelle', 0, NULL, '33111', 'MOR. ROMAGNOLA OVALE META''', '', '', '5', 0, 1),
(375, 'Mortadelle', 0, NULL, '33121', 'MORTADELLA PER INDUSTRIA C/L', '', '', '5', 0, 1),
(376, 'Mortadelle', 0, NULL, '33122', 'MORTADELLA PER INDUSTRIA C/L META''', '', '', '2.5', 0, 1),
(377, 'Mortadelle', 0, NULL, '33133', 'MORTADELLA PER INDUSTRIA C/L c95', '', '', '5', 0, 1),
(378, 'Mortadelle', 0, NULL, '33211', 'MOR.CASTELLO GIG.c240 SV kg25 D', '', '', '25', 0, 1),
(379, 'Mortadelle', 0, NULL, '33231', 'MOR.CASTELLO GIG.c240 SV META''D', '', '', '12.5', 0, 1),
(380, 'Mortadelle', 0, NULL, '33411', 'MOR.VECCHIA EMILIA NAT. kg 14', '', '', '15', 0, 1),
(381, 'Mortadelle', 0, NULL, '33421', 'MOR.VECCHIA EMILIA C/P Kg14', '', '', '15', 0, 1),
(382, 'Mortadelle', 0, NULL, '33521', 'MOR.EMILIA OVALE META''', '', '', '5.5', 0, 1),
(383, 'Mortadelle', 0, NULL, '33811', 'MOR.EMILIA META'' CIL. kg15', '', '', '13.5', 0, 1),
(384, 'Mortadelle', 0, NULL, '33831', 'MOR.EMILIA META'' CIL. kg5 (Slovenia)', '', '', '5', 0, 1),
(385, 'Mortadelle', 0, NULL, '33911', 'MORTADELLA PER INDUSTRIA C/P', '', '', '4', 0, 1),
(386, 'Mortadelle', 0, NULL, '34111', 'MOR.VECCHIA EMILIA ''La leggera''', '', '', '15', 0, 1),
(387, 'Mortadelle', 0, NULL, '34211', 'MOR.VECCHIA EMILIA 1/2 CIL. kg15', '', '', '14.5', 0, 1),
(388, 'Mortadelle', 0, NULL, '34311', 'MOR.VECCHIA EMILIA C/P 1/2 CIL.', '', '', '16', 0, 1),
(389, 'Mortadelle', 0, NULL, '34421', 'MOR.SFORZESCA OV kg 6/7 CANARIE', '', '', '7', 0, 1),
(390, 'Mortadelle', 0, NULL, '34521', 'MOR.SFORZESCA CILINDRICA kg5,2', '', '', '5.5', 0, 1),
(391, 'Mortadelle', 0, NULL, '34522', 'MOR.SFORZESCA CILINDRICA kg5,2', '', '', '5.5', 0, 1),
(392, 'Mortadelle', 0, NULL, '34525', 'MOR.SFORZESCA CILINDRICA kg5,2', '', '', '5.5', 0, 1),
(393, 'Mortadelle', 0, NULL, '34535', 'MOR.SFORZESCA CILINDRICA kg2,5', '', '', '3', 0, 1),
(394, 'Mortadelle', 0, NULL, '34541', 'MOR.SFORZESCA CILINDRICA kg2,5', '', '', '3', 0, 1),
(395, 'Mortadelle', 0, NULL, '34712', 'MORTADELLA CASTELLO 1/2 kg3 C/P', '', '', '3', 0, 1),
(396, 'Mortadelle', 0, NULL, '34713', 'MORTADELLA CASTELLO 1/2 kg3 C/P', '', '', '3', 0, 1),
(397, 'Mortadelle', 0, NULL, '34714', 'MORTADELLA CASTELLO 1/2 kg3 C/P', '', '', '3', 0, 1),
(398, 'Mortadelle', 0, NULL, '34721', 'MORTADELLA CASTELLO 1/2 kg3 C/P BAC', '', '', '3', 0, 1),
(399, 'Mortadelle', 0, NULL, '34722', 'MORTADELLA CASTELLO 1/2 kg3 C/P BAC', '', '', '3', 0, 1),
(400, 'Mortadelle', 0, NULL, '34732', 'MORTADELLA CASTELLO 1/2 kg3 C/P RU', '', '', '3', 0, 1),
(401, 'Mortadelle', 0, NULL, '34811', 'MOR.SFORZESCA g800 PZ12', '', '', '0.8', 0, 1),
(402, 'Mortadelle', 0, NULL, '34821', 'MOR.SFORZESCA g800', '', '', '0.8', 0, 1),
(403, 'Mortadelle', 0, NULL, '35011', 'MORTADELLA CASTELLO kg5 E', '', '', '5.5', 0, 1),
(404, 'Mortadelle', 0, NULL, '35111', 'MOR.ROMAGNOLA C/P 1/2 CIL. kg15', '', '', '13.75', 0, 1),
(405, 'Mortadelle', 0, NULL, '35131', 'MOR.ROMAGNOLA C/P 1/2 CIL. kg5', '', '', '5', 0, 1),
(406, 'Mortadelle', 0, NULL, '35411', 'MOR.EMILIA C/P META'' CIL. kg15+', '', '', '16', 0, 1),
(407, 'Mortadelle', 0, NULL, '35431', 'MOR.EMILIA C/P META'' CIL. kg5 (Slovenia)', '', '', '5', 0, 1),
(408, 'Mortadelle', 0, NULL, '35511', 'MOR.REGINA META'' CILIND.', '', '', '14', 0, 1),
(409, 'Mortadelle', 0, NULL, '35711', 'MOR.EMILIA C/P OVALE kg10', '', '', '10.75', 0, 1),
(410, 'Mortadelle', 0, NULL, '36211', 'MORTADELLA REGINA OV kg7/8 X EST', '', '', '8.25', 0, 1),
(411, 'Mortadelle', 0, NULL, '36311', 'MOR.CASTELLO C/P META'' D CAL 140', '', '', '2.5', 0, 1),
(412, 'Mortadelle', 0, NULL, '36321', 'MOR.CASTELLO C/P META'' c140 BAC D', '', '', '2.5', 0, 1),
(413, 'Mortadelle', 0, NULL, '36712', 'MOR. DE MILAN kg 7 CIL C/P 1/2 (2PZ) LIB', '', '', '8', 0, 1),
(414, 'Mortadelle', 0, NULL, '36721', 'MOR. EMILIA kg10 CIL C/P 1/2 LIB', '', '', '10.5', 0, 1),
(415, 'Mortadelle', 0, NULL, '36741', 'MOR. DE MILAN KG 5 CIL C/P 1/2 LIB', '', '', '5', 0, 1),
(416, 'Mortadelle', 0, NULL, '36811', 'MORTADELLA REGINA kg 9 OV CH', '', '', '10', 0, 1),
(417, 'Mortadelle', 0, NULL, '36821', 'MORTADELLA REGINA META''kg4/5 CH OV', '', '', '4.75', 0, 1),
(418, 'Mortadelle', 0, NULL, '38321', 'MORTADELLA REGINA kg20 X FETTE CH', '', '', '20', 0, 1),
(419, 'Mortadelle', 0, NULL, '38341', 'MORTAD.REGINA FETTE CH (MARNA A RENDERE)', '', '', '20', 0, 1),
(420, 'Mortadelle', 0, NULL, '39011', 'MORTADELLA REGINA 1/2 kg3 X EST', '', '', '5.5', 0, 1),
(421, 'Mortadelle', 0, NULL, '39821', 'MOR.CASTELLO OVALE kg6 GR 2PZ', '', '', '6', 0, 1),
(422, 'Mortadelle', 0, NULL, '93400', 'MORTAD.GHIRLANDINA 6 KG.', '', '', '6.9', 0, 1),
(423, 'Mortadelle', 0, NULL, '31800BI', 'REGINA S FETTE 8 Kg SINTETICA', '', '', '8', 0, 1),
(424, 'Bio intero', 0, NULL, '22111', 'PR.PARMA BIO 16MESI DOP DIS.PRESS.', '', '', '7.5', 0, 1),
(425, 'Bio intero', 0, NULL, '28931', 'SPECK ALTO ADIGE I.G.P. BIO', '', '', '2.317', 0, 1),
(426, 'Bio intero', 0, NULL, '28932', 'SPECK ALTO ADIGE BIO I.G.P. BRIO', '', '', '2.317', 0, 1),
(427, 'Cotech/Zamp freschi', 0, NULL, '40021', 'COTECHINO GOLE g 600/700', '', '', '0.6', 0, 1),
(428, 'Cotech/Zamp freschi', 0, NULL, '40022', 'COTECHINO GOLE g 600/700 (6pz)', '', '', '0.6', 0, 1),
(429, 'Cotech/Zamp freschi', 0, NULL, '40211', 'COTECHINO DRITTO', '', '', '0.55', 0, 1),
(430, 'Cotech/Zamp freschi', 0, NULL, '40213', 'COTECHINO DRITTO PZ6', '', '', '0.55', 0, 1),
(431, 'Cotech/Zamp freschi', 0, NULL, '41013', 'ZAMPONE PZ4', '', '', '1.25', 0, 1),
(432, 'Bencotti/freschi&pro', 0, NULL, '40612', 'ESPOS.COTECHINO&ZAMPONE MO IGP BENCOTT', '', '', '22', 0, 1),
(433, 'Bencotti/freschi&pro', 0, NULL, '40711', 'COTECHINO MO IGP BENC.G500 24PZ', '', '', '0.5', 0, 1),
(434, 'Bencotti/freschi&pro', 0, NULL, '40721', 'COTECHINO MO IGP BENC. G500 12PZ', '', '', '0.5', 0, 1),
(435, 'Bencotti/freschi&pro', 0, NULL, '40731', 'ESPOS.COTECHINI MO IGP 96PZ BENCOTTI', '', '', '48', 0, 1),
(436, 'Bencotti/freschi&pro', 0, NULL, '41711', 'ZAMPONE MO IGP BENCOTTI g1000 12PZ', '', '', '1', 0, 1),
(437, 'Bencotti/freschi&pro', 0, NULL, '41721', 'ZAMPONE MO IGP BENC.G1000 6PZ', '', '', '1', 0, 1),
(438, 'Bencotti/freschi&pro', 0, NULL, '64511', 'ZAMPONE A FETTE 2 FETTE', '', '', '0.14', 0, 1),
(439, 'Bencotti/freschi&pro', 0, NULL, '65711', 'COTECHINO A FETTE 3 FETTE', '', '', '0.15', 0, 1),
(440, 'Bencotti/freschi&pro', 0, NULL, '93800', 'COTECH. MODENA IGP BELL''E PRONTO 24PZ', '', '', '0.5', 0, 1),
(441, 'Bencotti/freschi&pro', 0, NULL, '93810', 'ZAMPONE MODENA IGP BELL''E PRONTO 6PZ', '', '', '1', 0, 1),
(442, 'Salami crudi LS', 0, NULL, '10111', 'SALAMETTO DEL MASTRO', '', '', '0.23', 0, 1),
(443, 'Salami crudi LS', 0, NULL, '10211', 'SALAME CACCIATORE MI DOP F.P.PF', '', '', '0.15', 0, 1),
(444, 'Salami crudi LS', 0, NULL, '10212', 'SALAME CACCIATORE MI DOP F.P.PF', '', '', '0.15', 0, 1),
(445, 'Salami crudi LS', 0, NULL, '10213', 'SALAME CACCIATORE MI DOP F.P.PF', '', '', '0.15', 0, 1),
(446, 'Salami crudi LS', 0, NULL, '10214', 'SALAME CACCIATORE MI DOP F.P.PF (10pz)', '', '', '0.15', 0, 1),
(447, 'Salami crudi LS', 0, NULL, '10215', 'SALAMETTO ITALIANO F.P.PF', '', '', '0.15', 0, 1),
(448, 'Salami crudi LS', 0, NULL, '10261', 'SALAME CACCIATORE MI DOP F.P.PF DK', '', '', '0.15', 0, 1),
(449, 'Salami crudi LS', 0, NULL, '10311', 'SALAMETTO NAPOLI F.P. PF', '', '', '0.15', 0, 1),
(450, 'Salami crudi LS', 0, NULL, '10341', 'SALAMETTO NAPOLI F.P. PF DK', '', '', '0.15', 0, 1),
(451, 'Salami crudi LS', 0, NULL, '13021', 'SALAME DI MILANO BINDONE g 400 CH', '', '', '0.425', 0, 1),
(452, 'Salami crudi LS', 0, NULL, '13022', 'SALAME DI MILANO BINDONE g 400 CH', '', '', '0.425', 0, 1),
(453, 'Salami crudi LS', 0, NULL, '13411', 'SAL.UNGHERESE g250', '', '', '0.28', 0, 1),
(454, 'Salami crudi LS', 0, NULL, '13412', 'SAL.UNGHERESE g250 PREZZATO', '', '', '0.28', 0, 1),
(455, 'Salami crudi LS', 0, NULL, '13421', 'SALAME STRAFINO g250 MICROF. D PZ12', '', '', '0.25', 0, 1),
(456, 'Salami crudi LS', 0, NULL, '13451', 'SALAME STRAFINO g250 MICROF. D PZ12', '', '', '0.25', 0, 1),
(457, 'Salami crudi LS', 0, NULL, '13452', 'SALAME STRAFINO g250 MICR.NOEANPZ12', '', '', '0.25', 0, 1),
(458, 'Salami crudi LS', 0, NULL, '13471', 'SALAME STRAFINO g250 MICROF.D PZ120', '', '', '0.25', 0, 1),
(459, 'Salami crudi LS', 0, NULL, '13481', 'SALAME STRAFINO g250 MICROF.D PZ48', '', '', '0.25', 0, 1),
(460, 'Salami crudi LS', 0, NULL, '14511', 'SALAME GENTILE (TIPO FELINO)  g400', '', '', '0.475', 0, 1),
(461, 'Salami crudi LS', 0, NULL, '14512', 'SALAME GENTILE 400g RU', '', '', '0.475', 0, 1),
(462, 'Salami crudi LS', 0, NULL, '14521', 'SALAME GENTILE g 400 CH', '', '', '0.475', 0, 1),
(463, 'Salami crudi LS', 0, NULL, '14522', 'SALAME GENTILE g 400 CH PZ.20', '', '', '0.475', 0, 1),
(464, 'Salami crudi LS', 0, NULL, '14523', 'SALAME GENTILE(TIPO FELINO) g450CH PZ.24', '', '', '0.45', 0, 1),
(465, 'Salami crudi LS', 0, NULL, '15211', 'SALAME CITTERINO ESPOSITORE 6 PZ.', '', '', '0.275', 0, 1),
(466, 'Salami crudi LS', 0, NULL, '15221', 'CITTERINO SCATOLA 12PZ', '', '', '0.275', 0, 1),
(467, 'Salami crudi LS', 0, NULL, '15222', 'CITTERINOPREZZATO SCATO.12PZ', '', '', '0.275', 0, 1),
(468, 'Salami crudi LS', 0, NULL, '15231', 'SALAME CITTERINO CASSETTA LEGNO12PZ', '', '', '0.275', 0, 1),
(469, 'Salami crudi LS', 0, NULL, '15232', 'SALAME CITTERINO CASSETTA LEGNO12PZ RU', '', '', '0.275', 0, 1),
(470, 'Salami crudi LS', 0, NULL, '15241', 'SALAME CITTERINO SCATOLA 12 PZ CH', '', '', '0.275', 0, 1),
(471, 'Salami crudi LS', 0, NULL, '15242', 'SALAME CITTERINO SCATOLA 45 PZ.CH', '', '', '0.275', 0, 1),
(472, 'Salami crudi LS', 0, NULL, '15711', 'BOCC. MI GRAPPOLO 30PZ.', '', '', '1.5', 0, 1),
(473, 'Salami crudi LS', 0, NULL, '15712', 'BOCC. SAL.MILANO GRAPPOLO 30PZ. XES', '', '', '1.5', 0, 1),
(474, 'Salami crudi LS', 0, NULL, '15713', 'BOCC. SAL.MILANO GRAPPOLO 30PZ.2CZ', '', '', '1.475', 0, 1),
(475, 'Salami crudi LS', 0, NULL, '15741', 'BOCC. SAL. MILANO FILZA 10PZ', '', '', '0.225', 0, 1),
(476, 'Salami crudi LS', 0, NULL, '16311', 'SALSICCIA NAPOLI PICCANTE', '', '', '0.4', 0, 1),
(477, 'Salami crudi LS', 0, NULL, '16313', 'SALSICCIA NAPOLI PICCANTE', '', '', '0.3', 0, 1),
(478, 'Salami crudi LS', 0, NULL, '17411', 'BOCC. SAL. MILANO F.P. 4 PZ. PF', '', '', '0.15', 0, 1),
(479, 'Salami crudi LS', 0, NULL, '19731', 'SALAME CACCIATORE MILANO DOP', '', '', '0.215', 0, 1),
(480, 'Salami crudi LS', 0, NULL, '19732', 'SALAME CACCIATORE MILANO DOP UK', '', '', '0.225', 0, 1),
(481, 'Salami crudi LS', 0, NULL, '19733', 'SALAME CACCIATORE MILANO DOP ''A''', '', '', '0.215', 0, 1),
(482, 'Salami crudi LS', 0, NULL, '19821', 'SALAMINO ESSELUNGA', '', '', '0.205', 0, 1),
(483, 'Salami crudi LS', 0, NULL, '93451', 'SALAME GENTILE g 400 BE CH', '', '', '0.45', 0, 1),
(484, 'Salami crudi LS', 0, NULL, '93490', 'CACCIATORE FLOW PACK', '', '', '0.15', 0, 1),
(485, 'Salami crudi LS', 0, NULL, '93491', 'BOCCONCINI FLOW PACK', '', '', '0.15', 0, 1),
(486, 'Tranci&Mortadelline', 0, NULL, '23611', 'TRANCIO S.DANIELE 4PZ', '', '', '1.75', 0, 1),
(487, 'Tranci&Mortadelline', 0, NULL, '23711', 'TRANCIO PARMA 4PZ', '', '', '1.5', 0, 1),
(488, 'Tranci&Mortadelline', 0, NULL, '23712', 'TRANCIO PARMA 5PZ (Penny)', '', '', '1', 0, 1),
(489, 'Tranci&Mortadelline', 0, NULL, '23811', 'TRANCIO PROSCIUTTO CRUDO CUORE 4PZ.', '', '', '1.5', 0, 1),
(490, 'Tranci&Mortadelline', 0, NULL, '24811', 'TRANCIO BRESAOLA D.VALTELLINA IGP', '', '', '0.5', 0, 1),
(491, 'Tranci&Mortadelline', 0, NULL, '25511', 'GAMBETTO PR.CRUDO S/COTENNA 6PZ.', '', '', '0.8', 0, 1),
(492, 'Tranci&Mortadelline', 0, NULL, '32311', 'MORTADELLINA REGINETTA g 400', '', '', '0.4', 0, 1),
(493, 'Tranci&Mortadelline', 0, NULL, '32321', 'MORTADELLINA REGINETTA g400 PZ12', '', '', '0.4', 0, 1),
(494, 'Tranci&Mortadelline', 0, NULL, '32911', 'MORTADELLINA REGINETTA g 150', '', '', '0.15', 0, 1),
(495, 'Wurstel', 0, NULL, '34011', 'WURSTEL WUOI?POLLO&TACCHINO 4PZg100', '', '', '0.1', 0, 1),
(496, 'Wurstel', 0, NULL, '36911', 'WURSTEL WUOI?4 PZ. g 100', '', '', '0.1', 0, 1),
(497, 'Wurstel', 0, NULL, '36917', 'WUOI?4PZ 3x2', '', '', '0.1', 0, 1),
(498, 'Wurstel', 0, NULL, '36931', 'WUOI 4PZ CONF.MULT.', '', '', '0.4', 0, 1),
(499, 'Wurstel', 0, NULL, '36941', 'WIP 4PZ CONF.MULTIPLA (x4) UK', '', '', '0.4', 0, 1),
(500, 'Wurstel', 0, NULL, '37011', 'WURSTEL WUOI?COCKTAIL BABY g 180', '', '', '0.18', 0, 1),
(501, 'Wurstel', 0, NULL, '37021', 'CONF.SPEC. COCKT.BABY 2X4', '', '', '0.18', 0, 1),
(502, 'Wurstel', 0, NULL, '37111', 'WURSTEL 10x35g FRANKFURTERS', '', '', '0.35', 0, 1),
(503, 'Wurstel', 0, NULL, '37131', 'WURSTEL 4 JUMBO FRANKFURTERS', '', '', '0.3', 0, 1),
(504, 'Wurstel', 0, NULL, '37141', 'WURSTEL MINI FRANKFURTERS FLOWPACK', '', '', '0.4', 0, 1),
(505, 'Wurstel', 0, NULL, '37211', 'WURSTEL FRANKFURTHER 10x35g Waitrose', '', '', '0.35', 0, 1),
(506, 'Wurstel', 0, NULL, '37221', 'WURSTEL FRANKFURTHER 4x35g Waitrose', '', '', '0.14', 0, 1),
(507, 'Wurstel', 0, NULL, '37711', 'WURSTEL WUOI?LUNGO cm 60', '', '', '23', 0, 1),
(508, 'Wurstel', 0, NULL, '37741', 'WURSTEL WUOI?STESO cm 30', '', '', '14', 0, 1),
(509, 'Wurstel', 0, NULL, '38211', 'WURSTEL WUOI?GRIGLIA 3 PZ.', '', '', '0.15', 0, 1),
(510, 'Wurstel', 0, NULL, '38411', 'WURSTEL WUOI?MAXI 2 PZ. g 150', '', '', '0.15', 0, 1),
(511, 'Wurstel', 0, NULL, '38421', 'WURSTEL WUOI?MAXI 3 PZ. g 225', '', '', '0.225', 0, 1),
(512, 'Wurstel', 0, NULL, '38431', 'WURSTEL WUOI?MAXI 4 PZ. g 300', '', '', '0.3', 0, 1),
(513, 'Wurstel', 0, NULL, '38441', 'WURSTEL WUOI?MAXI STESO', '', '', '13', 0, 1),
(514, 'Wurstel', 0, NULL, '38511', 'WURSTEL FRANKFURTHER 2x75g', '', '', '0.15', 0, 1),
(515, 'Wurstel', 0, NULL, '38521', 'WURSTEL FRANKFURTHER 4x35g', '', '', '0.14', 0, 1),
(516, 'Wurstel', 0, NULL, '38711', 'FEIN WURST 3 PZ.', '', '', '0.4', 0, 1),
(517, 'Wurstel', 0, NULL, '38721', 'FEIN WURST X2 pz 250gr', '', '', '0.25', 0, 1),
(518, 'Wurstel', 0, NULL, '38731', 'WURSTEL WUOI?SPECIAL 18 PZ.', '', '', '2.5', 0, 1),
(519, 'Wurstel', 0, NULL, '38732', 'WURSTEL WUOI?SPECIAL 18 PZ.', '', '', '2.5', 0, 1),
(520, 'Wurstel', 0, NULL, '38751', 'WIENER 3PZ 200g', '', '', '0.2', 0, 1),
(521, 'Wurstel', 0, NULL, '39211', 'WURSTEL SALUME'' 4PZ g100', '', '', '0.1', 0, 1),
(522, 'Wurstel', 0, NULL, '39221', 'WURSTEL SALUME'' 3PZ g250', '', '', '0.25', 0, 1),
(523, 'Wurstel', 0, NULL, '39411', 'MAXI SALCHICAS 3 PZ g 225', '', '', '0.225', 0, 1),
(524, 'Wurstel', 0, NULL, '39511', 'WURSTEL TOBIAS 4PZ g100', '', '', '0.1', 0, 1),
(525, 'Wurstel', 0, NULL, '39521', 'WURSTEL TOBIAS 3PZ g250', '', '', '0.25', 0, 1),
(526, 'Wurstel', 0, NULL, '39911', 'WURSTEL WUOI?MAXI POLLO&TACCHINO2PZ', '', '', '0.15', 0, 1),
(527, 'Wurstel', 0, NULL, '40311', 'WURSTEL GUSTEL 3 PZ g250', '', '', '0.25', 0, 1),
(528, 'Wurstel', 0, NULL, '40321', 'WURSTEL GUSTEL 3PZ g250 PZ22', '', '', '0.25', 0, 1),
(529, 'Wurstel', 0, NULL, '40411', 'WURSTEL GUSTEL g100', '', '', '0.1', 0, 1),
(530, 'Wurstel', 0, NULL, '40421', 'WURSTEL GUSTEL g100 PZ48', '', '', '0.1', 0, 1),
(531, 'Wurstel', 0, NULL, '97536', 'WURSTEL GROSS WIP 3 PZ. g 225', '', '', '0.225', 0, 1),
(532, 'Alta Gastronomia', 0, NULL, '51511', 'VS PR. CRUDO DEL POGGIO 18 M "ALTA GASTR', '', '', '0.1', 0, 1),
(533, 'Alta Gastronomia', 0, NULL, '52221', 'VS PR. DI PARMA 24 MESI ALTA GASTRONOMIA', '', '', '0.1', 0, 1),
(534, 'Alta Gastronomia', 0, NULL, '52231', 'VS PARMA ATTIMIFESTA 3ANNI', '', '', '0.1', 0, 1),
(535, 'Alta Gastronomia', 0, NULL, '52232', 'VS PARMA ATTIMIFESTA 3ANNI 45P', '', '', '0.1', 0, 1),
(536, 'Alta Gastronomia', 0, NULL, '52233', 'VS PR.DI PARMA AttimiFesta 3Anni CH', '', '', '0.1', 0, 1),
(537, 'Alta Gastronomia', 0, NULL, '52241', 'VS PR. PARMA 24mesi 70g ALTA GASTRONOMIA', '', '', '0.07', 0, 1),
(538, 'Alta Gastronomia', 0, NULL, '53111', 'VS BRESAOLA TRADIZION. ALTA GASTRONOMIA', '', '', '0.1', 0, 1),
(539, 'Alta Gastronomia', 0, NULL, '53211', 'VS SPECK DI PROSC. ALTA GASTRONOMIA', '', '', '0.1', 0, 1),
(540, 'Tagliofresco', 0, NULL, '53611', 'VS SPECK ALTO ADIGE IGPg120t.fresco', '', '', '0.12', 0, 1),
(541, 'Tagliofresco', 0, NULL, '53612', 'VS SPECK A.A. IGP g120 t.fresco', '', '', '0.12', 0, 1),
(542, 'Tagliofresco', 0, NULL, '53621', 'VASCH.SPECK IGP g70 Tagliofresco', '', '', '0.07', 0, 1),
(543, 'Tagliofresco', 0, NULL, '53623', 'VASCH.SPECK IGP g70 T.f. PZ06', '', '', '0.07', 0, 1),
(544, 'Tagliofresco', 0, NULL, '53624', 'VASCH.SPECK IGP g70 T.frescoPZ100', '', '', '0.07', 0, 1),
(545, 'Tagliofresco', 0, NULL, '53643', 'VASCH.SPECK IGP g70 tf PZ100 CS CH', '', '', '0.07', 0, 1),
(546, 'Tagliofresco', 0, NULL, '53723', 'VASCH.PETTO DI TACCHINOg80''t.fresco', '', '', '0.08', 0, 1),
(547, 'Tagliofresco', 0, NULL, '53731', 'VASCH. TACCHINO g100 tfresco', '', '', '0.1', 0, 1),
(548, 'Tagliofresco', 0, NULL, '54021', 'VASCH.PETTO POLLO AL FORNO T/F 80g', '', '', '0.08', 0, 1),
(549, 'Tagliofresco', 0, NULL, '54811', 'VS PANCETTA ARR.g120taglio fresco', '', '', '0.12', 0, 1),
(550, 'Tagliofresco', 0, NULL, '54821', 'VASCH.PANCETTA ARR.g70 T.fresco', '', '', '0.07', 0, 1),
(551, 'Tagliofresco', 0, NULL, '54855', 'VASCH.PANCETTA ARR.g70 T.frescoCH PZ100', '', '', '0.07', 0, 1),
(552, 'Tagliofresco', 0, NULL, '55521', 'VASCH.PR.DI PARMA TAGLIO FRESCO g60 UK', '', '', '0.06', 0, 1),
(553, 'Tagliofresco', 0, NULL, '55711', 'VASCHETTA COPPA g120 T. fresco', '', '', '0.12', 0, 1),
(554, 'Tagliofresco', 0, NULL, '55721', 'VASCHETTA COPPA g70 Taglio fresco', '', '', '0.07', 0, 1),
(555, 'Tagliofresco', 0, NULL, '55722', 'VASCH. COPPA g70 T. fresco BAC D', '', '', '0.07', 0, 1),
(556, 'Tagliofresco', 0, NULL, '55723', 'VASCHETTA COPPA g70 Taglio fresco RU', '', '', '0.07', 0, 1),
(557, 'Tagliofresco', 0, NULL, '55725', 'VASCHETTA COPPA g70 T.f. PZ06', '', '', '0.07', 0, 1),
(558, 'Tagliofresco', 0, NULL, '55753', 'VS COPPA g70 t.fresco P100 CSCH', '', '', '0.07', 0, 1),
(559, 'Tagliofresco', 0, NULL, '55761', 'VASCHETTA COPPA g70 Tfresco 6X3', '', '', '0.07', 0, 1),
(560, 'Tagliofresco', 0, NULL, '55811', 'VASCH. PR.DI PARMAg120 T.fresco', '', '', '0.12', 0, 1),
(561, 'Tagliofresco', 0, NULL, '55812', 'VASCH.PR.DI PARMAg120t.frescoP120', '', '', '0.12', 0, 1),
(562, 'Tagliofresco', 0, NULL, '55813', 'VASCH. PR.DI PARMAg120 T.F. UK', '', '', '0.12', 0, 1),
(563, 'Tagliofresco', 0, NULL, '55823', 'VASCH.PR.DI PARMAg70 T.f. PZ08', '', '', '0.07', 0, 1),
(564, 'Tagliofresco', 0, NULL, '55824', 'VASCH.PR.DI PARMAg70t.f.LV BAC D', '', '', '0.07', 0, 1),
(565, 'Tagliofresco', 0, NULL, '55825', 'VASCH.PR.DI PARMA g70 ''t.fresco''', '', '', '0.07', 0, 1),
(566, 'Tagliofresco', 0, NULL, '55834', 'VASC.PR.DI PARMAg70 T.F. PZ160 BBS', '', '', '0.07', 0, 1),
(567, 'Tagliofresco', 0, NULL, '55835', 'VASCH.PR.DI PARMAg70 T.F. PZ160CF', '', '', '0.07', 0, 1),
(568, 'Tagliofresco', 0, NULL, '55844', 'VASCH.PR.DI PARMAg70 T.F PZ160 ABZ', '', '', '0.07', 0, 1),
(569, 'Tagliofresco', 0, NULL, '55845', 'VASCH.PR.DI PARMA g70 ''t.fresco'' PZ6', '', '', '0.07', 0, 1),
(570, 'Tagliofresco', 0, NULL, '55852', 'VASCH.PR.DI PARMAg70 ''tfresco'' 4X5', '', '', '0.07', 0, 1),
(571, 'Tagliofresco', 0, NULL, '55862', 'VASCH. PR.DI PARMAg120 T.fresco (pz60)', '', '', '0.12', 0, 1),
(572, 'Tagliofresco', 0, NULL, '55893', 'VASCH.PR.PARMA F.MOSSA ''t.fresco''', '', '', '0.07', 0, 1),
(573, 'Tagliofresco', 0, NULL, '55895', 'VASCH.PR.PARMA F.MOSSA ''t.fresco'' PZ6', '', '', '0.07', 0, 1),
(574, 'Tagliofresco', 0, NULL, '55921', 'VASCH. PR.DI PARMAg100 T.fresco', '', '', '0.1', 0, 1),
(575, 'Tagliofresco', 0, NULL, '55922', 'VASCH. PR.DI PARMAg100 T.fresco (15pz)', '', '', '0.1', 0, 1),
(576, 'Tagliofresco', 0, NULL, '55931', 'VASCH. PR.DI PARMA g80 T.fresco', '', '', '0.08', 0, 1),
(577, 'Tagliofresco', 0, NULL, '56811', 'VASCH.PR.PARMA g70''T.Fresco''vert.(12vs)', '', '', '0.07', 0, 1),
(578, 'Tagliofresco', 0, NULL, '56812', 'Vasc.Parma ''T.Fresco'' g70 vert.(6vs)', '', '', '0.07', 0, 1),
(579, 'Tagliofresco', 0, NULL, '57021', 'VASC.SAL.RUSTICO g70 Tagliofresco', '', '', '0.07', 0, 1),
(580, 'Tagliofresco', 0, NULL, '57022', 'VASC.SAL.RUSTICO g70 Tagliofresco RU', '', '', '0.07', 0, 1),
(581, 'Tagliofresco', 0, NULL, '57023', 'VS RUSTICO g70 t.fresco P250CSCH', '', '', '0.07', 0, 1),
(582, 'Tagliofresco', 0, NULL, '57051', 'VASC.SAL.RUSTICO g70 Tfresco 4X5', '', '', '0.07', 0, 1),
(583, 'Tagliofresco', 0, NULL, '58011', 'VS BRESAOLA D.VALT.g120 T. fresco', '', '', '0.12', 0, 1),
(584, 'Tagliofresco', 0, NULL, '58021', 'VASCH.BRESAOLA D.VALT.g70t.fresco', '', '', '0.07', 0, 1),
(585, 'Tagliofresco', 0, NULL, '58023', 'VASCH.BRESAOLA D.VALT.g70t.f.PZ06', '', '', '0.07', 0, 1),
(586, 'Tagliofresco', 0, NULL, '58025', 'VASCH.BRESAOLA D.VALT.g70t.f.PZ100', '', '', '0.07', 0, 1),
(587, 'Tagliofresco', 0, NULL, '58041', 'VS BRESAOLA D.VALT.g110 t.frescoP45', '', '', '0.11', 0, 1),
(588, 'Tagliofresco', 0, NULL, '58053', 'VS BRESAOLA D.VALT.g70tfrescoPZ90', '', '', '0.07', 0, 1),
(589, 'Tagliofresco', 0, NULL, '58061', 'VASCH.BRESAOLA D.VALT.g70t.f.P6LV', '', '', '0.07', 0, 1),
(590, 'Tagliofresco', 0, NULL, '58062', 'VS BRESAOLA D.VALT.g70tfrescoPZ100', '', '', '0.07', 0, 1),
(591, 'Tagliofresco', 0, NULL, '58063', 'Vasc.Bresaola IGP ''T.F.'' g70 vert.(12vs)', '', '', '0.07', 0, 1),
(592, 'Tagliofresco', 0, NULL, '58064', 'Vasc.Bresaola IGP ''T.F.'' g70 vert.(6vs)', '', '', '0.07', 0, 1),
(593, 'Tagliofresco', 0, NULL, '58071', 'VS BRESAOLA D.VALT.g70tfresco 6X4', '', '', '0.07', 0, 1),
(594, 'Tagliofresco', 0, NULL, '58091', 'VASCH.BRESAOLA D.VALTg70tf BAC LV D', '', '', '0.07', 0, 1),
(595, 'Tagliofresco', 0, NULL, '58111', 'VS GAMBETTO PR.CRUDOg120 t.fresco', '', '', '0.12', 0, 1),
(596, 'Tagliofresco', 0, NULL, '58211', 'VASCHETTA PR.CRUDO g120 T. fresco', '', '', '0.12', 0, 1),
(597, 'Tagliofresco', 0, NULL, '58212', 'VASCHETTA PR.CRUDO g120 T.f.PZ06', '', '', '0.12', 0, 1),
(598, 'Tagliofresco', 0, NULL, '58213', 'VASCHETTA PR.CRUDO g120 T. fresco PZ60', '', '', '0.12', 0, 1),
(599, 'Tagliofresco', 0, NULL, '58221', 'VASCH.PR.CRUDO g70 T.fresco', '', '', '0.07', 0, 1),
(600, 'Tagliofresco', 0, NULL, '58223', 'VASCHETTA PR.CRUDO g70 T.F PZ06', '', '', '0.07', 0, 1),
(601, 'Tagliofresco', 0, NULL, '58224', 'VASCHETTA PR.CRUDO g70 ''t. fresco''', '', '', '0.07', 0, 1),
(602, 'Tagliofresco', 0, NULL, '58252', 'VASCH.PR.CRUDOg70 ''tfresco'' 6X3', '', '', '0.07', 0, 1),
(603, 'Tagliofresco', 0, NULL, '58262', 'VASC.PR.CRUDO g70 t.fresco BAC D 48Pz', '', '', '0.07', 0, 1),
(604, 'Tagliofresco', 0, NULL, '58422', 'VASCH.ARISTA g80 ''tagliofresco''', '', '', '0.08', 0, 1),
(605, 'Tagliofresco', 0, NULL, '58721', 'VASC.SPIANATAROMANAg70 T.fresco (F)', '', '', '0.07', 0, 1),
(606, 'Tagliofresco', 0, NULL, '58731', 'VASC.SPIANATAROMANAg70 T.frescoLV', '', '', '0.07', 0, 1),
(607, 'Tagliofresco', 0, NULL, '58732', 'VASC.SPIANATAROMANAg70 T.frescoLV', '', '', '0.07', 0, 1),
(608, 'Tagliofresco', 0, NULL, '58831', 'VASCH.SAL.MILANOg100 Tfresco 4X4', '', '', '0.1', 0, 1),
(609, 'Tagliofresco', 0, NULL, '59331', 'VASCH.GRANGUSTO g110 T.f.10x3', '', '', '0.11', 0, 1),
(610, 'Tagliofresco', 0, NULL, '59381', 'VASCH.GRANGUSTO g110 T. fresco', '', '', '0.11', 0, 1),
(611, 'Tagliofresco', 0, NULL, '59521', 'VASCH.SAL.NAPOLI g70 t.fresco', '', '', '0.07', 0, 1),
(612, 'Tagliofresco', 0, NULL, '59522', 'VASCH.SAL.NAPOLI g70 t.fresco RU', '', '', '0.07', 0, 1),
(613, 'Tagliofresco', 0, NULL, '59621', 'VASCH. SAL.MILANO g70 T. fresco', '', '', '0.07', 0, 1),
(614, 'Tagliofresco', 0, NULL, '59622', 'VASCH. SAL.MILANOg70t.frescoBAC D', '', '', '0.07', 0, 1),
(615, 'Tagliofresco', 0, NULL, '59623', 'VS MILANO g70 tf PZ250 CSCH', '', '', '0.07', 0, 1),
(616, 'Tagliofresco', 0, NULL, '59624', 'VASCH. SAL.MILANO g70 T. fresco RU', '', '', '0.07', 0, 1),
(617, 'Tagliofresco', 0, NULL, '59631', 'VASCH. SAL.MI g70 T.fresco D LV', '', '', '0.07', 0, 1),
(618, 'Tagliofresco', 0, NULL, '59632', 'VASCH. SAL.MI g70 T.fresco D BAC', '', '', '0.07', 0, 1),
(619, 'Tagliofresco', 0, NULL, '59641', 'VASCH.SAL.MILANO g70 T.fresco 4X5', '', '', '0.07', 0, 1),
(620, 'Tagliofresco', 0, NULL, '59661', 'VASCH. SAL.MILANO g70 T. fresco F', '', '', '0.07', 0, 1),
(621, 'Tagliofresco', 0, NULL, '59662', 'VASCH. SAL.MILANO g70 T.F PZ06', '', '', '0.07', 0, 1),
(622, 'Tagliofresco', 0, NULL, '59663', 'VASCH. SAL.MILANO g70 T. fresco PZ6', '', '', '0.07', 0, 1),
(623, 'Tagliofresco', 0, NULL, '59664', 'Vasc.Sal.Milano ''T.Fresco'' g70 vert(6vs)', '', '', '0.07', 0, 1),
(624, 'Tagliofresco', 0, NULL, '59665', 'Vasc.Sal.Milano''T.Fresco'' g70 vert(12vs)', '', '', '0.07', 0, 1),
(625, 'Tagliofresco', 0, NULL, '59681', 'VASCH. SAL.MILANO g100 T.fresco', '', '', '0.1', 0, 1),
(626, 'Tagliofresco', 0, NULL, '60121', 'VS PR.S.DANIELE g120 t.fresco PZ45', '', '', '0.12', 0, 1),
(627, 'Tagliofresco', 0, NULL, '60221', 'VASCH.SAL.UNGHERESE g70 T. fresco', '', '', '0.07', 0, 1),
(628, 'Tagliofresco', 0, NULL, '60222', 'VASCH.SAL.UNGHERESE g70 T. fresco RU', '', '', '0.07', 0, 1);
INSERT INTO `catalogue_product` (`id`, `sector`, `node`, `node2`, `code`, `sap_name`, `description`, `slug`, `weight`, `raw_material`, `active`) VALUES
(629, 'Tagliofresco', 0, NULL, '60223', 'VASCH.SAL.UNGHERESE g70 tf BAC D', '', '', '0.07', 0, 1),
(630, 'Tagliofresco', 0, NULL, '60224', 'VS UNGHERESE g70 tf PZ250 CSCH', '', '', '0.07', 0, 1),
(631, 'Tagliofresco', 0, NULL, '60251', 'VASCH.SAL.UNGHERESEg70 Tfresco4X5', '', '', '0.07', 0, 1),
(632, 'Tagliofresco', 0, NULL, '60261', 'VASC.SAL. STRAFINO g70 tfresco LV D', '', '', '0.07', 0, 1),
(633, 'Tagliofresco', 0, NULL, '60511', 'VASCH.PR.S.DANIELE g90 T.fresco', '', '', '0.09', 0, 1),
(634, 'Tagliofresco', 0, NULL, '60512', 'VASCH.PR.S.DANIELE g90 T.fresco PZ6', '', '', '0.09', 0, 1),
(635, 'Tagliofresco', 0, NULL, '60524', 'VASCH.PR.S.DANIELE g70 ''t.fresco''', '', '', '0.07', 0, 1),
(636, 'Tagliofresco', 0, NULL, '60525', 'VASCH.PR.S.DANIELE g70 T.f. PZ06', '', '', '0.07', 0, 1),
(637, 'Tagliofresco', 0, NULL, '60533', 'VS PR.S.DANIELE g70 T.frescoPZ120', '', '', '0.07', 0, 1),
(638, 'Tagliofresco', 0, NULL, '60534', 'VS PR.S.DANIELE g70 T.frescoPZ120', '', '', '0.07', 0, 1),
(639, 'Tagliofresco', 0, NULL, '60536', 'VS PR.S.DANIELE g70 T.frescoPZ120x10', '', '', '0.07', 0, 1),
(640, 'Tagliofresco', 0, NULL, '60541', 'VS PR.S.DANIELE F.MOSSA t.fresco', '', '', '0.09', 0, 1),
(641, 'Tagliofresco', 0, NULL, '60551', 'VASCH.PR.S.DANIELE g100 T.FRESCO', '', '', '0.1', 0, 1),
(642, 'Tagliofresco', 0, NULL, '60562', 'VASCH.PR.S.DANIELEg70t.f.PZ06', '', '', '0.07', 0, 1),
(643, 'Tagliofresco', 0, NULL, '60572', 'VASCH.PR.S.DANIELEg70 ''tfresco''4X5', '', '', '0.07', 0, 1),
(644, 'Tagliofresco', 0, NULL, '60581', 'VASCH.PR.S.DANIELE g80 T.fresco', '', '', '0.08', 0, 1),
(645, 'Tagliofresco', 0, NULL, '62311', 'VASCH.COTTO IL TARTUFO tfresco', '', '', '0.1', 0, 1),
(646, 'Tagliofresco', 0, NULL, '62312', 'VASCH.COTTO IL TARTUFO tfresco CG', '', '', '0.1', 0, 1),
(647, 'Tagliofresco', 0, NULL, '62321', 'VASCH.COTTO IL TARTUFO TaglioFresco 100g', '', '', '0.1', 0, 1),
(648, 'Tagliofresco', 0, NULL, '62521', 'VS LARDO g70 Tagliofresco', '', '', '0.07', 0, 1),
(649, 'Tagliofresco', 0, NULL, '62611', 'VASCH.COTTO IL BASILICO tfresco', '', '', '0.11', 0, 1),
(650, 'Tagliofresco', 0, NULL, '67011', 'VASC.PROSC.ALLE ERBE g130 t.fresco', '', '', '0.13', 0, 1),
(651, 'Tagliofresco', 0, NULL, '67012', 'VASC.PROSC.ALLE ERBE g130 T.f.P06', '', '', '0.13', 0, 1),
(652, 'Tagliofresco', 0, NULL, '67015', 'VASC.PROSC.ALLE ERBE g130 T.f.P75', '', '', '0.13', 0, 1),
(653, 'Tagliofresco', 0, NULL, '69711', 'VASCH.GRANCOTTO g150 T. fresco', '', '', '0.15', 0, 1),
(654, 'Tagliofresco', 0, NULL, '69713', 'VASCH.GRANCOTTO g150 T. fresco UK', '', '', '0.15', 0, 1),
(655, 'Tagliofresco', 0, NULL, '69723', 'Vasc. Prosc. cotto T.Fresco g70 PZ06 F', '', '', '0.07', 0, 1),
(656, 'Tagliofresco', 0, NULL, '69724', 'Vasc. Prosc. cotto T.Fresco g70 PZ12 F', '', '', '0.07', 0, 1),
(657, 'Tagliofresco', 0, NULL, '69731', 'VASCH. GRANCOTTO g100 T.fresco D', '', '', '0.1', 0, 1),
(658, 'Tagliofresco', 0, NULL, '69741', 'VASCH.PR.COTTO g80 Taglio fresco', '', '', '0.08', 0, 1),
(659, 'Tagliofresco', 0, NULL, '69743', 'VASCH.PR.COTTO 80g TAGLIO FRESCO D (8PZ)', '', '', '0.08', 0, 1),
(660, 'Tagliofresco', 0, NULL, '69744', 'VASCH.PR.COTTO g80 ''taglio fresco''', '', '', '0.08', 0, 1),
(661, 'Tagliofresco', 0, NULL, '69745', 'VASCH.PR.COTTO g80''t.fresco'' BAC D', '', '', '0.08', 0, 1),
(662, 'Tagliofresco', 0, NULL, '69747', 'VASCH.PR.COTTO g80 ''taglio fresco'' PZ6', '', '', '0.08', 0, 1),
(663, 'Tagliofresco', 0, NULL, '69753', 'VASCH. PR.COTTOg150 T.fresco PZ60', '', '', '0.15', 0, 1),
(664, 'Tagliofresco', 0, NULL, '69771', 'VS GRANCOTTO EMILIANOg150 T.fresco', '', '', '0.15', 0, 1),
(665, 'Tagliofresco', 0, NULL, '69772', 'VS GRANCOTTO EMILIANOg150t.f.PZ06', '', '', '0.15', 0, 1),
(666, 'Tagliofresco', 0, NULL, '69781', 'VASCH.GRANCOTTO g110 T. fresco', '', '', '0.11', 0, 1),
(667, 'Tagliofresco', 0, NULL, '69782', 'VASCH.GRANCOTTO g110 T. fresco (pz60)', '', '', '0.11', 0, 1),
(668, 'Tagliofresco', 0, NULL, '69792', 'VASCH.PR.COTTO g80 ''tfresco'' 6X3', '', '', '0.08', 0, 1),
(669, 'Tagliofresco', 0, NULL, '69811', 'VASCH.MOR.BOLOGNA IGPg150t.fresco', '', '', '0.15', 0, 1),
(670, 'Tagliofresco', 0, NULL, '69812', 'VASCH.MOR.BOLOGNA IGPg150t.FPZ06', '', '', '0.15', 0, 1),
(671, 'Tagliofresco', 0, NULL, '69813', 'VASC. MORTADELLA ITALIANA g150 TF RU', '', '', '0.15', 0, 1),
(672, 'Tagliofresco', 0, NULL, '69821', 'VASCH.MOR.BOLOGNA g70 T.fresco', '', '', '0.07', 0, 1),
(673, 'Tagliofresco', 0, NULL, '69822', 'VASCH.MOR.BOLOGNA g70 T.fresco F', '', '', '0.07', 0, 1),
(674, 'Tagliofresco', 0, NULL, '69823', 'Vasc.Mortadella IGP ''T.F.''g70 vert(12vs)', '', '', '0.07', 0, 1),
(675, 'Tagliofresco', 0, NULL, '69824', 'Vasc.Mortadella IGP ''T.F.''g70 vert(6vs)', '', '', '0.07', 0, 1),
(676, 'Tagliofresco', 0, NULL, '69843', 'VS BOLOGNA IGPg150t.fresco PZ60 H', '', '', '0.15', 0, 1),
(677, 'Tagliofresco', 0, NULL, '69851', 'VS MOR.BOLOGNA IGPg70t.fresco ABZ', '', '', '0.07', 0, 1),
(678, 'Tagliofresco', 0, NULL, '69854', 'VS MOR.BOLOGNA IGPg70t.frescoPZ90', '', '', '0.07', 0, 1),
(679, 'Tagliofresco', 0, NULL, '69881', 'VASCH.MOR.BOLOGNA IGPg110t.fresco', '', '', '0.11', 0, 1),
(680, 'Tagliofresco', 0, NULL, '69891', 'VASCH.MOR.BOLOGNAg110tfresco 4X4', '', '', '0.11', 0, 1),
(681, 'Tagliofresco', 0, NULL, '74321', 'VASCH.MOR.BOLOGNA ggAg70t.frescoD', '', '', '0.07', 0, 1),
(682, 'Tagliofresco', 0, NULL, '74322', 'VS MOR.BOLOGNAggA70t.fresco BAC D', '', '', '0.07', 0, 1),
(683, 'Tagliofresco', 0, NULL, '74331', 'VS MOR.BOLOGNA LV ggAg70t.frescoD', '', '', '0.07', 0, 1),
(684, 'Tagliofresco', 0, NULL, '74332', 'VS MOR.BOLOGNA LV ggAg70t.frescoD BAC', '', '', '0.07', 0, 1),
(685, 'Tagliofresco', 0, NULL, '74521', 'VASCH.PR.DI PARMAg85 T.fresco USA', '', '', '0.085', 0, 1),
(686, 'Tagliofresco', 0, NULL, '74541', 'VASCH.PR.DI PARMA g114 T.fresco USA', '', '', '0.114', 0, 1),
(687, 'Tagliofresco', 0, NULL, '74551', 'VASCH.PR.DI PARMA g170 T.fresco USA', '', '', '0.17', 0, 1),
(688, 'Tagliofresco', 0, NULL, '74811', 'VS ANTIPASTO ITALIANOg140t.fresco', '', '', '0.14', 0, 1),
(689, 'Tagliofresco', 0, NULL, '75121', 'VS CARPACCIO DI LOMBO g70 tf', '', '', '0.07', 0, 1),
(690, 'Tagliofresco', 0, NULL, '75411', 'Vs.Tagliofresco mini prosc. Crudo 60g', '', '', '0.06', 0, 1),
(691, 'Tagliofresco', 0, NULL, '75811', 'Vs.Tagliofresco mini salame Milano 60g', '', '', '0.06', 0, 1),
(692, 'Tagliofresco', 0, NULL, '75911', 'VS Tagliofresco-mini PETTOdiTACCHINO 60g', '', '', '0.06', 0, 1),
(693, 'Tagliofresco', 0, NULL, '77021', 'VASCH. PANCETTA AFF.g70 T. fresco', '', '', '0.07', 0, 1),
(694, 'Tagliofresco', 0, NULL, '77121', 'VASCH.SAL.GENTILE g70 T. fresco', '', '', '0.07', 0, 1),
(695, 'Tagliofresco', 0, NULL, '77122', 'VASCHETTA SAL.GENTILE 70g T.FRESCO RU', '', '', '0.07', 0, 1),
(696, 'Tagliofresco', 0, NULL, '77123', 'VASCH.SAL.GENTILE g70t.frescoPZ250', '', '', '0.07', 0, 1),
(697, 'Tagliofresco', 0, NULL, '77124', 'VASCH.SAL.GENTILE g70 T.frescoPZ06', '', '', '0.07', 0, 1),
(698, 'Tagliofresco', 0, NULL, '77125', 'VASCH.SAL.GENTILE g70 T.fresco BAC D', '', '', '0.07', 0, 1),
(699, 'Tagliofresco', 0, NULL, '77143', 'VS SAL.GENTILE g70 t.fresco P250CSCH', '', '', '0.07', 0, 1),
(700, 'Tagliofresco', 0, NULL, '77221', 'VS SALAME TOSCANO g70 t.fresco', '', '', '0.07', 0, 1),
(701, 'Tagliofresco', 0, NULL, '77222', 'VS SALAME TOSCANO g70 t.fresco RU', '', '', '0.07', 0, 1),
(702, 'Vaschette classiche', 0, NULL, '61111', 'VASCHETTA SALAME GENTILE (TIPO FELINO)', '', '', '0.08', 0, 1),
(703, 'Vaschette classiche', 0, NULL, '61112', 'VASCHETTA SALAME GENTILE 80g', '', '', '0.08', 0, 1),
(704, 'Vaschette classiche', 0, NULL, '61311', 'VASCHETTA COPPA', '', '', '0.08', 0, 1),
(705, 'Vaschette classiche', 0, NULL, '61321', 'CONF.SPEC. VS COPPA 4X5', '', '', '0.08', 0, 1),
(706, 'Vaschette classiche', 0, NULL, '61411', 'VASCHETTA SALAME RUSTICO', '', '', '0.08', 0, 1),
(707, 'Vaschette classiche', 0, NULL, '61412', 'VASCHETTA SALAME RUSTICO gr80', '', '', '0.08', 0, 1),
(708, 'Vaschette classiche', 0, NULL, '61611', 'VASCHETTA SALAME DI MILANO', '', '', '0.08', 0, 1),
(709, 'Vaschette classiche', 0, NULL, '61612', 'VASCHETTA SALAME DI MILANO gr80', '', '', '0.08', 0, 1),
(710, 'Vaschette classiche', 0, NULL, '61621', 'CONF.SPEC. VS MILANO 4X5', '', '', '0.08', 0, 1),
(711, 'Vaschette classiche', 0, NULL, '61631', 'VASCHETTA SALAME DI MILANO JP 80g', '', '', '0.08', 0, 1),
(712, 'Vaschette classiche', 0, NULL, '61711', 'VASCHETTA SALAME TIPO UNGHERESE', '', '', '0.08', 0, 1),
(713, 'Vaschette classiche', 0, NULL, '62111', 'VASCHETTA SPECK ALTO ADIGE IGP', '', '', '0.08', 0, 1),
(714, 'Vaschette classiche', 0, NULL, '62121', 'CONF.SPEC. VS SPECK 4X5', '', '', '0.08', 0, 1),
(715, 'Vaschette classiche', 0, NULL, '64711', 'VASCHETTA BRESAOLA D.VALTELLINA IGP', '', '', '0.07', 0, 1),
(716, 'Vaschette classiche', 0, NULL, '64721', 'CONF.SPEC. VS BRESAOLA 4X5', '', '', '0.07', 0, 1),
(717, 'Vaschette classiche', 0, NULL, '67112', 'VASCHETTA PR. DI S.DANIELE DOP', '', '', '0.07', 0, 1),
(718, 'Vaschette classiche', 0, NULL, '67121', 'CONF.SPEC. VS S.DANIELE 4X5', '', '', '0.07', 0, 1),
(719, 'Vaschette classiche', 0, NULL, '67812', 'VASCHETTA PR.CRUDO', '', '', '0.07', 0, 1),
(720, 'Vaschette classiche', 0, NULL, '68612', 'VASCHETTA PR. DI PARMA g.70', '', '', '0.07', 0, 1),
(721, 'Vaschette classiche', 0, NULL, '68621', 'CONF.SPEC. VS PARMA 4X5', '', '', '0.07', 0, 1),
(722, 'Vaschette classiche', 0, NULL, '69511', 'VS.PROSCIUTTO COTTO GR.130 BE', '', '', '0.13', 0, 1),
(723, 'Vaschette classiche', 0, NULL, '76211', 'VASCH.GRANDE PR.DI PARMA DOP g341', '', '', '0.341', 0, 1),
(724, 'Vaschette classiche', 0, NULL, '93610', 'VS.PROSCIUTTO COTTO GR.130', '', '', '0.13', 0, 1),
(725, 'Vaschette classiche', 0, NULL, '93750', 'VS.PROSCIUTTO PARMA GR. 250', '', '', '0.25', 0, 1),
(726, 'Vaschette classiche', 0, NULL, '93760', 'VS.PROSCIUTTO PARMA GR.110', '', '', '0.11', 0, 1),
(727, 'Sofficette', 0, NULL, '65512', 'SOFFICETTE PR.COTTO ''FETTA GRANDE''', '', '', '0.1', 0, 1),
(728, 'Sofficette', 0, NULL, '66311', 'SOFFICETTE PROSCIUTTO COTTO', '', '', '0.08', 0, 1),
(729, 'Sofficette', 0, NULL, '66321', 'CONF.SPEC. SOFF.COTTO 3X4', '', '', '0.08', 0, 1),
(730, 'Sofficette', 0, NULL, '66411', 'SOFFICETTE MORTADELLA REGINA', '', '', '0.08', 0, 1),
(731, 'Sofficette', 0, NULL, '66421', 'CONF.SPEC. SOFF.REGINA 3X4', '', '', '0.08', 0, 1),
(732, 'Sofficette', 0, NULL, '66611', 'SOFFICETTE PR.DI PARMA', '', '', '0.06', 0, 1),
(733, 'Sofficette', 0, NULL, '66621', 'SOFFICETTE PR.DI PARMA 3X4', '', '', '0.06', 0, 1),
(734, 'Sofficette', 0, NULL, '66711', 'SOFFICETTE PETTO DI POLLO AL FORNO', '', '', '0.06', 0, 1),
(735, 'Sofficette', 0, NULL, '68311', 'SOFFICETTE PETTO TACCHINO AL FORNO', '', '', '0.08', 0, 1),
(736, 'Sofficette', 0, NULL, '70211', 'SOFFICETTE DI WURSTEL', '', '', '0.06', 0, 1),
(737, 'Sofficette', 0, NULL, '72131', 'SOFFICETTE COTTO g70 PENNY (PZ12)', '', '', '0.07', 0, 1),
(738, 'Sofficette', 0, NULL, '72141', 'SOFFICETTE COTTO g70 PENNY', '', '', '0.07', 0, 1),
(739, 'Sofficette', 0, NULL, '74211', 'SOFFICETTE SALAME RUSTICO', '', '', '0.06', 0, 1),
(740, 'Sofficette', 0, NULL, '76611', 'SOFFICETTE BRESAOLA D.VALTELLINAIGP', '', '', '0.06', 0, 1),
(741, 'Sofficette', 0, NULL, '76621', 'SOFFICETTE BRESAOLA D.VALT. IGP g50', '', '', '0.05', 0, 1),
(742, 'Sofficette', 0, NULL, '76641', 'SOFFICETTE BRESAOLA 3x4', '', '', '0.06', 0, 1),
(743, 'Sofficette', 0, NULL, '76711', 'SOFFICETTE PR.CRUDO', '', '', '0.06', 0, 1),
(744, 'Sofficette', 0, NULL, '76721', 'CONF.SPEC. SOFF.CRUDO 3X4', '', '', '0.06', 0, 1),
(745, 'Sofficette', 0, NULL, '76811', 'SOFFICETTE SPECK ALTO ADIGE IGP', '', '', '0.06', 0, 1),
(746, 'Sofficette', 0, NULL, '76911', 'SOFFICETTE COPPA', '', '', '0.06', 0, 1),
(747, 'Sofficette', 0, NULL, '76921', 'CONF.SPEC. SOFF.COPPA 3X4', '', '', '0.06', 0, 1),
(748, 'Sofficette', 0, NULL, '77411', 'SOFFICETTE UNGHERESE', '', '', '0.06', 0, 1),
(749, 'Sofficette', 0, NULL, '77412', 'SOFFICETTE UNGHERESE gr60', '', '', '0.06', 0, 1),
(750, 'Sofficette', 0, NULL, '77511', 'SOFFICETTE SALAME DI MILANO', '', '', '0.06', 0, 1),
(751, 'Sofficette', 0, NULL, '77512', 'SOFFICETTE SALAME DI MILANO gr60', '', '', '0.06', 0, 1),
(752, 'Sofficette', 0, NULL, '77521', 'CONF.SPEC. SOFF.MILANO 3X4', '', '', '0.06', 0, 1),
(753, 'Sofficette', 0, NULL, '78011', 'SOFFICETTE PANCETTA ARROTOLATA', '', '', '0.08', 0, 1),
(754, 'Sofficette', 0, NULL, '78021', 'CONF.SPEC. SOFF.PANCETTA 3X4', '', '', '0.08', 0, 1),
(755, 'Merenda', 0, NULL, '70111', 'MERENDA SALAME GENTILE (TIPO FELINO)', '', '', '0.03', 0, 1),
(756, 'Merenda', 0, NULL, '70311', 'MERENDA SPECK', '', '', '0.03', 0, 1),
(757, 'Merenda', 0, NULL, '70611', 'MERENDA PROSCIUTTO COTTO', '', '', '0.04', 0, 1),
(758, 'Merenda', 0, NULL, '70641', 'MERENDA PR.COTTO CONF.MULT. X 3', '', '', '0.12', 0, 1),
(759, 'Merenda', 0, NULL, '70711', 'MERENDA MORTADELLA REGINA', '', '', '0.03', 0, 1),
(760, 'Merenda', 0, NULL, '70731', 'MERENDA MOR.REGINA CONF.MULT. X 3', '', '', '0.09', 0, 1),
(761, 'Merenda', 0, NULL, '70751', 'CONF.SPEC. MERENDA REGINA 8X5 METRO', '', '', '0.03', 0, 1),
(762, 'Merenda', 0, NULL, '70911', 'MERENDA PROSCIUTTO CRUDO', '', '', '0.03', 0, 1),
(763, 'Merenda', 0, NULL, '70921', 'CONF.SPEC. MERENDA CRUDO 8X5', '', '', '0.03', 0, 1),
(764, 'Merenda', 0, NULL, '70941', 'MERENDA PR.CRUDO CONF.MULT. X 3', '', '', '0.09', 0, 1),
(765, 'Merenda', 0, NULL, '71021', 'CONF.SPEC. MERENDA COTTO 8X5', '', '', '0.04', 0, 1),
(766, 'Merenda', 0, NULL, '71111', 'MERENDA SALAME DI MILANO', '', '', '0.03', 0, 1),
(767, 'Merenda', 0, NULL, '71112', 'MERENDA SALAME DI MILANO CH', '', '', '0.03', 0, 1),
(768, 'Merenda', 0, NULL, '71121', 'CONF.SPEC. MERENDA MILANO 8X5', '', '', '0.03', 0, 1),
(769, 'Merenda', 0, NULL, '71131', 'MERENDA MILANO MULTIPLA TRIS', '', '', '0.09', 0, 1),
(770, 'Merenda', 0, NULL, '71141', 'MERENDA MILANO MULTIPLA TRIS (3x30g) CH', '', '', '0.09', 0, 1),
(771, 'Merenda', 0, NULL, '71211', 'MERENDA SALAME RUSTICO', '', '', '0.03', 0, 1),
(772, 'Merenda', 0, NULL, '71212', 'MERENDA SALAME RUSTICO CH', '', '', '0.03', 0, 1),
(773, 'Merenda', 0, NULL, '71213', 'MERENDA SALAME RUSTICO CH', '', '', '0.03', 0, 1),
(774, 'Merenda', 0, NULL, '71221', 'MERENDA SALAME RUSTICO B', '', '', '0.03', 0, 1),
(775, 'Merenda', 0, NULL, '71311', 'MERENDA SALAME TIPO UNGHERESE', '', '', '0.03', 0, 1),
(776, 'Merenda', 0, NULL, '71312', 'MERENDA SALAME TIPO UNGHERESE CH', '', '', '0.03', 0, 1),
(777, 'Merenda', 0, NULL, '71331', 'CONF.SPEC. MERENDA UNGHER.8X5', '', '', '0.03', 0, 1),
(778, 'Merenda', 0, NULL, '71431', 'MERENDA COPPA CONF.MULT. X 3', '', '', '0.09', 0, 1),
(779, 'Merenda', 0, NULL, '71441', 'CONF.SPEC. MERENDA COPPA 8X5', '', '', '0.03', 0, 1),
(780, 'Merenda', 0, NULL, '71721', 'MERENDA PANCETTA CONF.MULT.X3', '', '', '0.09', 0, 1),
(781, 'Merenda', 0, NULL, '71841', 'CONF.SPEC. MERENDA REGINA 8X5 DOCKS', '', '', '0.03', 0, 1),
(782, 'Merenda', 0, NULL, '72411', 'MERENDA BRESAOLA D.VALT.', '', '', '0.03', 0, 1),
(783, 'Merenda', 0, NULL, '72421', 'MERENDA BRESAOLA CONF.MULT. X 3', '', '', '0.09', 0, 1),
(784, 'Merenda', 0, NULL, '72511', 'MERENDA COPPA', '', '', '0.03', 0, 1),
(785, 'Merenda', 0, NULL, '72611', 'MERENDA PANCETTA ARROTOLATA', '', '', '0.03', 0, 1),
(786, 'Merenda', 0, NULL, '73311', 'MERENDA PETTO TACCHINO', '', '', '0.04', 0, 1),
(787, 'Merenda', 0, NULL, '73321', 'MERENDA PETTO TACCHINO CONF.MULT. X 3', '', '', '0.12', 0, 1),
(788, 'Irresistibili Snack', 0, NULL, '72811', 'IRRESISTIBILI SNACK COTTO', '', '', '0.05', 0, 1),
(789, 'Irresistibili Snack', 0, NULL, '72911', 'IRRESISTIBILI SNACK SALAME', '', '', '0.04', 0, 1),
(790, 'Irresistibili Snack', 0, NULL, '73011', 'IRRESISTIBILI SNACK CRUDO', '', '', '0.04', 0, 1),
(791, 'Irresistibili Snack', 0, NULL, '73112', 'IRRESISTIBILI SNACK BASTONCINI 40g 12PZ', '', '', '0.04', 0, 1),
(792, 'Irresistibili Snack', 0, NULL, '73211', 'IRRESISTIBILI SNACK SALAMINI 55g', '', '', '0.055', 0, 1),
(793, 'Unduetris', 0, NULL, '60311', 'VASCH. UNDUETRIS! PR.COTTO', '', '', '0.1', 0, 1),
(794, 'Unduetris', 0, NULL, '60711', 'VASCH. UNDUETRIS! SALAME', '', '', '0.1', 0, 1),
(795, 'Unduetris', 0, NULL, '61911', 'VASCH.UNDUETRIS! PR.PETTO TACCH.AL FORNO', '', '', '0.1', 0, 1),
(796, 'Irresistibili', 0, NULL, '67311', 'IRRESISTIBILI BASTONCINI DI COTTO 60g', '', '', '0.06', 0, 1),
(797, 'Irresistibili', 0, NULL, '68911', 'IRRESISTIBILI SALAMINI', '', '', '0.1', 0, 1),
(798, 'Irresistibili', 0, NULL, '68913', 'IRRESISTIBILI SALAMINI (RU)', '', '', '0.1', 0, 1),
(799, 'Irresistibili', 0, NULL, '68931', 'IRRESISTIBILI SALAMINI 3X4', '', '', '0.1', 0, 1),
(800, 'Irresistibili', 0, NULL, '69011', 'IRRESISTperTreBASTONCINI', '', '', '0.08', 0, 1),
(801, 'Irresistibili', 0, NULL, '69021', 'IRRESISTperTreBASTONCINI CH', '', '', '0.08', 0, 1),
(802, 'Irresistibili', 0, NULL, '69022', 'IRRESISTperTreBASTONCINI CH MIGROS', '', '', '0.08', 0, 1),
(803, 'Irresistibili', 0, NULL, '69025', 'IRR.perTreBASTONCINIclas60DUO-PACK 2x80g', '', '', '0.16', 0, 1),
(804, 'Irresistibili', 0, NULL, '69031', 'IRRESIS.BASTONCINI SALAME SINGOLO 30g', '', '', '0.03', 0, 1),
(805, 'Irresistibili', 0, NULL, '69111', 'IRRESISTIBILI BASTONC.SAL.PICCANTI', '', '', '0.06', 0, 1),
(806, 'Irresistibili', 0, NULL, '69151', 'IRRESISTIBILI BASTONC.PICCANTI DELHAIZE', '', '', '0.06', 0, 1),
(807, 'Irresistibili', 0, NULL, '69211', 'IRRESISTIBILI FETTINE DI SALAME', '', '', '0.06', 0, 1),
(808, 'Irresistibili', 0, NULL, '69212', 'IRRESISTIBILI FETTINE DI SALAME', '', '', '0.06', 0, 1),
(809, 'Irresistibili', 0, NULL, '69221', 'IRRESISTIBILI FETTINE SALAME 4X4', '', '', '0.06', 0, 1),
(810, 'Irresistibili', 0, NULL, '69231', 'IRRESISTIBILI FETTINE DI SALAME 190', '', '', '0.06', 0, 1),
(811, 'Irresistibili', 0, NULL, '69312', 'IRRESISTIBILI BASTONCINI DI SALAME', '', '', '0.06', 0, 1),
(812, 'Irresistibili', 0, NULL, '69313', 'IRRESISTIBILI BASTONCINI DI SALAME (RU)', '', '', '0.06', 0, 1),
(813, 'Irresistibili', 0, NULL, '69351', 'IRRESISTIBILI BASTONCINI PZ200', '', '', '0.06', 0, 1),
(814, 'Irresistibili', 0, NULL, '69352', 'IRRESIST.BASTONCINI CS PZ200', '', '', '0.06', 0, 1),
(815, 'Irresistibili', 0, NULL, '69361', 'IRRESISTIBILI BASTONCINI SALAME 5X4', '', '', '0.06', 0, 1),
(816, 'Irresistibili', 0, NULL, '69371', 'IRRESISTIB.BASTONCINI SALAME PZ12 D', '', '', '0.06', 0, 1),
(817, 'Irresistibili', 0, NULL, '69372', 'IRRESIS.BASTONCINI SALAME 60g AH(Olanda)', '', '', '0.06', 0, 1),
(818, 'Irresistibili', 0, NULL, '69411', 'IRRESISTperTreBASTONC.PICC.', '', '', '0.08', 0, 1),
(819, 'Irresistibili', 0, NULL, '69421', 'IRRESISTperTreBASTONC.PICC.CH', '', '', '0.08', 0, 1),
(820, 'Irresistibili', 0, NULL, '69425', 'IRR.perTreBASTONCINIpicc60DUO-PACK 2x80g', '', '', '0.16', 0, 1),
(821, 'Irresistibili', 0, NULL, '93710', 'BASTONCINI DI SALAME', '', '', '0.04', 0, 1),
(822, 'Irresistibili', 0, NULL, '93720', 'IRRESISTIBILI SALAMINI', '', '', '0.09', 0, 1),
(823, 'Riassunto', 0, NULL, '60411', 'VASCH.SAL.NAPOLI PICCANTE RIASSUNTO', '', '', '0.06', 0, 1),
(824, 'Riassunto', 0, NULL, '60431', 'VASCH.SAL.NAPOLI RIASSUNTO JS', '', '', '0.06', 0, 1),
(825, 'Riassunto', 0, NULL, '60921', 'VS SAL.CITTERINO RIASSUNTOESPOS.', '', '', '0.06', 0, 1),
(826, 'Riassunto', 0, NULL, '60931', 'CONF.SPEC.CITTER.RIASS.5X4', '', '', '0.06', 0, 1),
(827, 'Riassunto', 0, NULL, '63711', 'VASCH.SAL.UNGHERESE RIASSUNTO', '', '', '0.06', 0, 1),
(828, 'Riassunto', 0, NULL, '64911', 'VASC.SAL.GENTILE(TIPO FELINO) RIASSUNTO', '', '', '0.06', 0, 1),
(829, 'Riassunto', 0, NULL, '65411', 'VASC. BOCC. DI SALAME RIASSUNTO', '', '', '0.06', 0, 1),
(830, 'Riassunto', 0, NULL, '65911', 'VASC. SAL.DI MILANO RIASSUNTO', '', '', '0.06', 0, 1),
(831, 'Riassunto', 0, NULL, '65912', 'VASC.SAL.DI MILANO RIASSUNTO g60 (CH)', '', '', '0.06', 0, 1),
(832, 'Riassunto', 0, NULL, '65913', 'VASC.SAL.MILANO RIASSUNTO DUOPACK', '', '', '0.12', 0, 1),
(833, 'Bio libero servizio', 0, NULL, '60611', 'PACCHETTO PR.PARMA BIO USA', '', '', '0.07', 0, 1),
(834, 'Bio libero servizio', 0, NULL, '61811', 'VASCHETTA BIO SPECK DI PROSCIUTTO', '', '', '0.08', 0, 1),
(835, 'Bio libero servizio', 0, NULL, '61815', 'VAS. BIO SPECK DI PROSCIUTTO 80g ORGANIC', '', '', '0.08', 0, 1),
(836, 'Bio libero servizio', 0, NULL, '61822', 'VS SPECK IGP BIO BONNETERRE', '', '', '0.07', 0, 1),
(837, 'Bio libero servizio', 0, NULL, '62011', 'VS BRESAOLA D.VALT. IGP BIO g70 MDD', '', '', '0.07', 0, 1),
(838, 'Bio libero servizio', 0, NULL, '62413', 'VASCHETTA BIO PR. DI PARMA', '', '', '0.08', 0, 1),
(839, 'Bio libero servizio', 0, NULL, '62414', 'VASCHETTA BIO PR. DI PARMA (c/i)', '', '', '0.08', 0, 1),
(840, 'Bio libero servizio', 0, NULL, '62415', 'VASCHETTA BIO PR.DI PARMA (C/I) 80g(8PZ)', '', '', '0.08', 0, 1),
(841, 'Bio libero servizio', 0, NULL, '62432', 'VASCHETTA BIO PR. DI PARMA CH PZ120', '', '', '0.07', 0, 1),
(842, 'Bio libero servizio', 0, NULL, '62441', 'VASCHETTA BIO PR. DI PARMA BONNETERRE', '', '', '0.07', 0, 1),
(843, 'Bio libero servizio', 0, NULL, '64411', 'VASCHETTA PR.CRUDO BIO', '', '', '0.08', 0, 1),
(844, 'Bio libero servizio', 0, NULL, '64413', 'VASCHETTA PR.CRUDO BIO', '', '', '0.08', 0, 1),
(845, 'Bio libero servizio', 0, NULL, '64415', 'VASCHETTA PR.CRUDO 80g ORGANIC', '', '', '0.08', 0, 1),
(846, 'Bio libero servizio', 0, NULL, '65811', 'VASCHETTA PETTO DI TACCHINO AL FORNO BIO', '', '', '0.08', 0, 1),
(847, 'Bio libero servizio', 0, NULL, '67611', 'VASCH.BRESAOLA BIO CG', '', '', '0.08', 0, 1),
(848, 'Bio libero servizio', 0, NULL, '68411', 'VS. BRESAOLA DELLA VALTELLINA I.G.P BIO', '', '', '0.08', 0, 1),
(849, 'Bio libero servizio', 0, NULL, '68415', 'VS. BRESAOLA VALTELLINA PGI 80g ORGANIC', '', '', '0.08', 0, 1),
(850, 'Bio libero servizio', 0, NULL, '69613', 'VASCHETTA PR. COTTO BIO', '', '', '0.1', 0, 1),
(851, 'Bio libero servizio', 0, NULL, '78311', 'VASCH.ARROSTO ERBE BIO g100 BONNETERRE', '', '', '0.1', 0, 1),
(852, 'Cubetti', 0, NULL, '53311', 'CUBETTI PANC.AFFUM.BACONG200 BRE', '', '', '0.2', 0, 1),
(853, 'Cubetti', 0, NULL, '53411', 'CUBETTI PANCETTA DOLCE g200 BREN', '', '', '0.2', 0, 1),
(854, 'Cubetti', 0, NULL, '53911', 'CUBETTI PANCETT.AFFUM.ASACCOkg10', '', '', '10', 0, 1),
(855, 'Cubetti', 0, NULL, '53921', 'CUBETTI PANCETT.AFFUM.ASACCOkg2', '', '', '2', 0, 1),
(856, 'Cubetti', 0, NULL, '53922', 'CUBETTI PANCETT.AFFUM.ASACCOkg2 JS', '', '', '2', 0, 1),
(857, 'Cubetti', 0, NULL, '53931', 'CUBETTI PANCETT.AFFUM.ASACCOkg5', '', '', '5', 0, 1),
(858, 'Cubetti', 0, NULL, '53932', 'CUBETTI PANCETT.AFFUM.ASACCOkg5 LA DORIA', '', '', '5', 0, 1),
(859, 'Cubetti', 0, NULL, '53933', 'CUBETTI PANCETT.AFFUM.ASACCOkg5 10x10x10', '', '', '5', 0, 1),
(860, 'Cubetti', 0, NULL, '53934', 'CUBETTI PANC.AFFUM.SACCOkg5 LA DORIA NEW', '', '', '5', 0, 1),
(861, 'Cubetti', 0, NULL, '54211', 'CUBETTI PANCETTA DOLCE VASCHETTA', '', '', '0.13', 0, 1),
(862, 'Cubetti', 0, NULL, '54311', 'CUBETTI PROSCIUTTO COTTO VASCHETTA', '', '', '0.13', 0, 1),
(863, 'Cubetti', 0, NULL, '54511', 'CUBETTI PANCETT.DOLCE ASACCOkg10', '', '', '10', 0, 1),
(864, 'Cubetti', 0, NULL, '54521', 'CUBETTI PANCETT.DOLCE ASACCOkg2', '', '', '2', 0, 1),
(865, 'Cubetti', 0, NULL, '54611', 'CUBETTI PANC.AFFUM.BACONVASCHETTA', '', '', '0.13', 0, 1),
(866, 'Cubetti', 0, NULL, '54631', 'CUBETTI PANC.AFF.BAC.g140 COOP UK', '', '', '0.14', 0, 1),
(867, 'Cubetti', 0, NULL, '54651', 'CUBETTI PANCETTA AFFUMICATA 130gr', '', '', '0.13', 0, 1),
(868, 'Cubetti', 0, NULL, '54911', 'CUBETTI PR.COTTO vasch g200 SALUME''', '', '', '0.2', 0, 1),
(869, 'Cubetti', 0, NULL, '54912', 'CUBETTI PR.COTTO vasch g200 SALUME'' pz12', '', '', '0.2', 0, 1),
(870, 'Cubetti', 0, NULL, '55011', 'CUBETTI PR.COTTO vasch. g200', '', '', '0.2', 0, 1),
(871, 'Cubetti', 0, NULL, '55012', 'CUBETTI PR.COTTO vasch. g200 (PZ 15)', '', '', '0.2', 0, 1),
(872, 'Cubetti', 0, NULL, '55013', 'CUBETTI PR.COTTO vasch. g200 (PZ 12)', '', '', '0.2', 0, 1),
(873, 'Cubetti', 0, NULL, '55111', 'CUBETTI PR.COTTO A SACCO KG 10', '', '', '10', 0, 1),
(874, 'Cubetti', 0, NULL, '55121', 'CUBETTI PR.COTTO A SACCO KG 2', '', '', '2', 0, 1),
(875, 'Cubetti', 0, NULL, '55211', 'CUBETTI PR.COTTO vasch g200 IPER', '', '', '0.2', 0, 1),
(876, 'Cubetti', 0, NULL, '55611', 'CUBETTI DI SPECK VASCHETTA', '', '', '0.13', 0, 1),
(877, 'Cubetti', 0, NULL, '55621', 'CUBETTI SPECK DI PROSCIUTTO 130gr', '', '', '0.13', 0, 1),
(878, 'Cubetti', 0, NULL, '56011', 'CUBETTI PANC.AFFUM. g260', '', '', '0.26', 0, 1),
(879, 'Cubetti', 0, NULL, '56111', 'CUBETTI PANCETTA DOLCE g260', '', '', '0.26', 0, 1),
(880, 'Cubetti', 0, NULL, '56621', 'CUBETTI PANC.AFFUM. ESSELUNGA', '', '', '0.14', 0, 1),
(881, 'Cubetti', 0, NULL, '96607', 'CUBETTI PR.COTTO vasch. g200 BNT', '', '', '0.2', 0, 1),
(882, 'Simpaticotto', 0, NULL, '62811', 'VASCHETTA IL SIMPATICOTTO', '', '', '0.075', 0, 1),
(883, 'Simpaticotto', 0, NULL, '62815', 'SIMPATICOTTO BOLLINO E 1,00', '', '', '0.075', 0, 1),
(884, 'Perfette', 0, NULL, '52311', 'VS PR. COTTO g100 ''PERFETTE''', '', '', '0.1', 0, 1),
(885, 'Perfette', 0, NULL, '52411', 'VS PR. CRUDO g70 ''PERFETTE''', '', '', '0.07', 0, 1),
(886, 'Perfette', 0, NULL, '52511', 'VS TACCHINO g80 ''PERFETTE''', '', '', '0.08', 0, 1),
(887, 'Perfette', 56, 62, '52611', 'VS POLLO g80 ''PERFETTE''', NULL, 'sasa', '0.08', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalogue_product_country`
--

CREATE TABLE IF NOT EXISTS `catalogue_product_country` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=59344 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalogue_product_country`
--

INSERT INTO `catalogue_product_country` (`id`, `product_id`, `country_id`) VALUES
(15, 7, 76),
(16, 7, 83),
(17, 7, 110),
(19, 8, 110),
(48, 10, 110),
(49, 9, 15),
(50, 9, 40),
(51, 9, 76),
(52, 9, 83),
(53, 9, 100),
(54, 9, 103),
(55, 9, 110),
(56, 9, 138),
(57, 9, 178),
(58, 9, 200),
(59, 9, 209),
(60, 9, 215),
(61, 9, 216),
(62, 9, 235),
(93, 12, 15),
(94, 12, 76),
(95, 12, 83),
(96, 12, 86),
(97, 12, 110),
(98, 12, 182),
(47679, 41, 83),
(47680, 41, 76),
(47681, 41, 110),
(47683, 42, 216),
(47684, 42, 110),
(47685, 43, 110),
(47686, 44, 110),
(47687, 45, 110),
(47688, 46, 110),
(47755, 116, 234),
(47756, 116, 15),
(47757, 116, 59),
(47758, 116, 83),
(47759, 116, 61),
(47760, 116, 209),
(47761, 116, 76),
(47762, 116, 110),
(47763, 116, 142),
(47764, 116, 157),
(47765, 116, 178),
(47766, 116, 200),
(47767, 117, 183),
(47768, 118, 216),
(47790, 119, 83),
(47791, 119, 209),
(47792, 119, 76),
(47793, 119, 110),
(47794, 119, 146),
(47795, 119, 175),
(47796, 119, 206),
(47797, 120, 216),
(47804, 121, 216),
(47805, 121, 83),
(47806, 121, 101),
(47807, 121, 110),
(47808, 122, 183),
(47812, 123, 83),
(47813, 123, 101),
(47814, 123, 110),
(47815, 124, 216),
(47816, 125, 216),
(47818, 126, 234),
(47819, 126, 110),
(47841, 127, 234),
(47842, 127, 15),
(47843, 127, 83),
(47844, 127, 76),
(47845, 127, 100),
(47846, 127, 110),
(47847, 127, 175),
(47848, 128, 110),
(47850, 129, 110),
(47851, 129, 146),
(47852, 130, 110),
(47853, 131, 183),
(47857, 132, 83),
(47858, 132, 76),
(47859, 132, 101),
(47860, 133, 83),
(47861, 134, 83),
(47890, 13, 83),
(47891, 13, 61),
(47892, 13, 209),
(47893, 13, 86),
(47894, 13, 110),
(47895, 13, 124),
(47896, 13, 146),
(47897, 13, 175),
(47898, 135, 235),
(47899, 136, 216),
(47900, 137, 216),
(47902, 138, 216),
(47903, 138, 110),
(47914, 14, 15),
(47915, 14, 216),
(47916, 14, 209),
(47917, 14, 110),
(47918, 14, 215),
(47919, 139, 110),
(47941, 140, 15),
(47942, 140, 76),
(47943, 140, 100),
(47944, 140, 110),
(47945, 140, 157),
(47946, 140, 175),
(47947, 140, 221),
(47948, 141, 83),
(47949, 142, 235),
(47978, 143, 15),
(47979, 143, 59),
(47980, 143, 83),
(47981, 143, 76),
(47982, 143, 110),
(47983, 143, 147),
(47984, 143, 157),
(47985, 143, 200),
(47987, 144, 216),
(47988, 144, 110),
(48034, 145, 15),
(48035, 145, 216),
(48036, 145, 83),
(48037, 145, 209),
(48038, 145, 76),
(48039, 145, 110),
(48040, 145, 123),
(48041, 145, 178),
(48042, 145, 215),
(48043, 145, 193),
(48044, 146, 216),
(48045, 147, 83),
(48091, 148, 15),
(48092, 148, 83),
(48093, 148, 209),
(48094, 148, 76),
(48095, 148, 100),
(48096, 148, 101),
(48097, 148, 110),
(48098, 148, 146),
(48099, 148, 200),
(48100, 148, 193),
(48101, 149, 183),
(48102, 150, 83),
(48113, 151, 83),
(48114, 151, 76),
(48115, 151, 100),
(48116, 151, 110),
(48117, 151, 157),
(48133, 152, 70),
(48134, 152, 209),
(48135, 152, 76),
(48136, 152, 86),
(48137, 152, 110),
(48138, 152, 178),
(48139, 153, 110),
(48276, 154, 234),
(48277, 154, 15),
(48278, 154, 59),
(48279, 154, 83),
(48280, 154, 209),
(48281, 154, 76),
(48282, 154, 235),
(48283, 154, 100),
(48284, 154, 101),
(48285, 154, 110),
(48286, 154, 147),
(48287, 154, 166),
(48288, 154, 175),
(48289, 154, 178),
(48290, 154, 215),
(48291, 154, 200),
(48292, 154, 206),
(48293, 155, 86),
(48315, 156, 234),
(48316, 156, 70),
(48317, 156, 110),
(48318, 156, 147),
(48319, 156, 138),
(48320, 156, 215),
(48321, 156, 193),
(48322, 157, 110),
(48323, 158, 110),
(48324, 159, 83),
(48325, 160, 209),
(48326, 161, 83),
(48328, 162, 40),
(48329, 162, 112),
(48330, 163, 183),
(48331, 164, 216),
(48332, 165, 216),
(48399, 166, 234),
(48400, 166, 15),
(48401, 166, 22),
(48402, 166, 83),
(48403, 166, 61),
(48404, 166, 209),
(48405, 166, 76),
(48406, 166, 101),
(48407, 166, 110),
(48408, 166, 146),
(48409, 166, 138),
(48410, 166, 178),
(48456, 167, 234),
(48457, 167, 59),
(48458, 167, 83),
(48459, 167, 209),
(48460, 167, 76),
(48461, 167, 110),
(48462, 167, 138),
(48463, 167, 215),
(48464, 167, 200),
(48465, 167, 206),
(48466, 168, 183),
(48467, 169, 235),
(48469, 170, 110),
(48470, 170, 112),
(48471, 171, 216),
(48472, 172, 216),
(48473, 173, 216),
(48474, 174, 216),
(48475, 175, 216),
(48476, 176, 216),
(48477, 177, 110),
(48478, 178, 110),
(48479, 179, 110),
(48480, 180, 110),
(48481, 181, 110),
(48482, 182, 110),
(48483, 183, 110),
(48484, 184, 110),
(48485, 185, 110),
(48486, 186, 110),
(48487, 187, 110),
(48488, 188, 110),
(48489, 189, 110),
(48490, 190, 110),
(48491, 191, 110),
(48492, 192, 110),
(48493, 193, 110),
(48494, 194, 110),
(48495, 195, 110),
(48496, 196, 110),
(48497, 197, 110),
(48498, 198, 110),
(48499, 199, 110),
(48500, 200, 110),
(48501, 201, 110),
(48502, 202, 110),
(48503, 203, 110),
(48532, 204, 59),
(48533, 204, 209),
(48534, 204, 76),
(48535, 204, 86),
(48536, 204, 110),
(48537, 204, 124),
(48538, 204, 146),
(48539, 204, 206),
(48555, 205, 15),
(48556, 205, 76),
(48557, 205, 101),
(48558, 205, 110),
(48559, 205, 119),
(48560, 205, 157),
(48606, 206, 234),
(48607, 206, 15),
(48608, 206, 216),
(48609, 206, 209),
(48610, 206, 100),
(48611, 206, 110),
(48612, 206, 175),
(48613, 206, 178),
(48614, 206, 183),
(48615, 206, 200),
(48619, 207, 216),
(48620, 207, 83),
(48621, 207, 86),
(48622, 208, 83),
(48759, 209, 234),
(48760, 209, 22),
(48761, 209, 59),
(48762, 209, 83),
(48763, 209, 64),
(48764, 209, 209),
(48765, 209, 76),
(48766, 209, 86),
(48767, 209, 100),
(48768, 209, 101),
(48769, 209, 110),
(48770, 209, 138),
(48771, 209, 175),
(48772, 209, 178),
(48773, 209, 183),
(48774, 209, 221),
(48775, 209, 241),
(48776, 210, 110),
(48777, 211, 110),
(48778, 212, 40),
(48779, 213, 40),
(48780, 214, 112),
(48787, 215, 234),
(48788, 215, 216),
(48789, 215, 83),
(48790, 215, 200),
(48791, 216, 83),
(48793, 217, 22),
(48794, 217, 76),
(48795, 218, 236),
(48796, 219, 236),
(48803, 220, 83),
(48804, 220, 86),
(48805, 220, 101),
(48806, 220, 110),
(48807, 221, 236),
(48808, 222, 40),
(48809, 223, 110),
(48810, 224, 110),
(48811, 225, 110),
(48827, 226, 83),
(48828, 226, 64),
(48829, 226, 76),
(48830, 226, 110),
(48831, 226, 142),
(48832, 226, 178),
(48834, 227, 76),
(48835, 227, 110),
(48891, 228, 14),
(48892, 228, 46),
(48893, 228, 83),
(48894, 228, 76),
(48895, 228, 235),
(48896, 228, 101),
(48897, 228, 110),
(48898, 228, 112),
(48899, 228, 119),
(48900, 228, 200),
(48901, 228, 206),
(48902, 229, 110),
(48906, 230, 216),
(48907, 230, 110),
(48908, 230, 206),
(48909, 231, 110),
(48925, 232, 216),
(48926, 232, 83),
(48927, 232, 76),
(48928, 232, 235),
(48929, 232, 110),
(48930, 232, 166),
(48932, 233, 40),
(48933, 233, 236),
(48937, 234, 209),
(48938, 234, 101),
(48939, 234, 110),
(48940, 235, 76),
(48941, 236, 83),
(48952, 237, 216),
(48953, 237, 209),
(48954, 237, 76),
(48955, 237, 110),
(48956, 237, 202),
(48958, 238, 110),
(48959, 238, 183),
(49015, 239, 234),
(49016, 239, 15),
(49017, 239, 14),
(49018, 239, 209),
(49019, 239, 76),
(49020, 239, 86),
(49021, 239, 100),
(49022, 239, 110),
(49023, 239, 138),
(49024, 239, 183),
(49025, 239, 206),
(49041, 240, 15),
(49042, 240, 216),
(49043, 240, 76),
(49044, 240, 101),
(49045, 240, 110),
(49046, 240, 157),
(49047, 241, 235),
(49126, 242, 216),
(49127, 242, 46),
(49128, 242, 83),
(49129, 242, 64),
(49130, 242, 76),
(49131, 242, 110),
(49132, 242, 112),
(49133, 242, 119),
(49134, 242, 147),
(49135, 242, 166),
(49136, 242, 175),
(49137, 242, 200),
(49138, 242, 202),
(49140, 243, 110),
(49141, 243, 124),
(49148, 244, 76),
(49149, 244, 101),
(49150, 244, 110),
(49151, 244, 147),
(49152, 245, 110),
(49154, 246, 83),
(49155, 246, 110),
(49156, 247, 216),
(49157, 248, 83),
(49164, 249, 216),
(49165, 249, 101),
(49166, 249, 110),
(49167, 249, 193),
(49168, 250, 110),
(49169, 251, 236),
(49170, 252, 236),
(49171, 253, 236),
(49173, 254, 110),
(49174, 254, 166),
(49175, 255, 110),
(49176, 256, 110),
(49177, 257, 110),
(49178, 258, 110),
(49179, 259, 110),
(49180, 260, 110),
(49181, 261, 110),
(49182, 262, 110),
(49183, 263, 110),
(49184, 264, 110),
(49185, 265, 110),
(49186, 266, 110),
(49202, 267, 216),
(49203, 267, 76),
(49204, 267, 101),
(49205, 267, 110),
(49206, 267, 124),
(49207, 267, 193),
(49209, 268, 83),
(49210, 268, 110),
(49212, 269, 110),
(49213, 269, 146),
(49215, 270, 76),
(49216, 270, 110),
(49223, 271, 76),
(49224, 271, 100),
(49225, 271, 110),
(49226, 271, 157),
(49227, 272, 235),
(49319, 273, 234),
(49320, 273, 15),
(49321, 273, 83),
(49322, 273, 209),
(49323, 273, 76),
(49324, 273, 235),
(49325, 273, 110),
(49326, 273, 124),
(49327, 273, 166),
(49328, 273, 175),
(49329, 273, 178),
(49330, 273, 183),
(49331, 273, 200),
(49332, 273, 202),
(49333, 274, 216),
(49334, 275, 124),
(49341, 276, 209),
(49342, 276, 76),
(49343, 276, 86),
(49344, 276, 110),
(49346, 277, 110),
(49347, 277, 193),
(49348, 278, 110),
(49349, 279, 110),
(49350, 280, 110),
(49351, 281, 110),
(49352, 282, 110),
(49353, 283, 110),
(49354, 284, 110),
(49365, 285, 64),
(49366, 285, 209),
(49367, 285, 110),
(49368, 285, 175),
(49369, 285, 200),
(49380, 286, 209),
(49381, 286, 235),
(49382, 286, 110),
(49383, 286, 175),
(49384, 286, 178),
(49386, 287, 76),
(49387, 287, 110),
(49416, 288, 15),
(49417, 288, 216),
(49418, 288, 76),
(49419, 288, 101),
(49420, 288, 110),
(49421, 288, 124),
(49422, 288, 193),
(49423, 288, 206),
(49424, 289, 110),
(49428, 290, 76),
(49429, 290, 110),
(49430, 290, 146),
(49432, 291, 76),
(49433, 291, 110),
(49512, 292, 234),
(49513, 292, 15),
(49514, 292, 216),
(49515, 292, 209),
(49516, 292, 76),
(49517, 292, 235),
(49518, 292, 100),
(49519, 292, 101),
(49520, 292, 110),
(49521, 292, 157),
(49522, 292, 166),
(49523, 292, 178),
(49524, 292, 202),
(49525, 293, 110),
(49526, 294, 110),
(49527, 295, 110),
(49529, 296, 83),
(49530, 296, 110),
(49552, 297, 76),
(49553, 297, 100),
(49554, 297, 110),
(49555, 297, 146),
(49556, 297, 138),
(49557, 297, 157),
(49558, 297, 200),
(49580, 298, 209),
(49581, 298, 76),
(49582, 298, 86),
(49583, 298, 110),
(49584, 298, 178),
(49585, 298, 241),
(49586, 298, 206),
(49602, 299, 76),
(49603, 299, 100),
(49604, 299, 110),
(49605, 299, 124),
(49606, 299, 123),
(49607, 299, 146),
(49608, 300, 183),
(49624, 301, 15),
(49625, 301, 83),
(49626, 301, 209),
(49627, 301, 76),
(49628, 301, 110),
(49629, 301, 202),
(49630, 302, 216),
(49634, 303, 15),
(49635, 303, 83),
(49636, 303, 110),
(49652, 304, 209),
(49653, 304, 76),
(49654, 304, 86),
(49655, 304, 110),
(49656, 304, 157),
(49657, 304, 166),
(49661, 305, 83),
(49662, 305, 76),
(49663, 305, 110),
(49685, 306, 209),
(49686, 306, 76),
(49687, 306, 86),
(49688, 306, 100),
(49689, 306, 110),
(49690, 306, 175),
(49691, 306, 178),
(49707, 307, 209),
(49708, 307, 76),
(49709, 307, 110),
(49710, 307, 175),
(49711, 307, 178),
(49712, 307, 200),
(49728, 308, 15),
(49729, 308, 83),
(49730, 308, 76),
(49731, 308, 101),
(49732, 308, 110),
(49733, 308, 178),
(49740, 309, 86),
(49741, 309, 110),
(49742, 309, 123),
(49743, 309, 157),
(49744, 310, 110),
(49751, 311, 209),
(49752, 311, 76),
(49753, 311, 110),
(49754, 311, 178),
(49755, 312, 112),
(49759, 313, 209),
(49760, 313, 235),
(49761, 313, 110),
(49772, 314, 234),
(49773, 314, 83),
(49774, 314, 103),
(49775, 314, 110),
(49776, 314, 138),
(49778, 315, 76),
(49779, 315, 110),
(49781, 316, 15),
(49782, 316, 110),
(49783, 317, 110),
(49784, 15, 110),
(49876, 318, 15),
(49877, 318, 40),
(49878, 318, 216),
(49879, 318, 83),
(49880, 318, 209),
(49881, 318, 76),
(49882, 318, 235),
(49883, 318, 100),
(49884, 318, 103),
(49885, 318, 110),
(49886, 318, 138),
(49887, 318, 178),
(49888, 318, 215),
(49889, 318, 200),
(49890, 319, 110),
(49894, 320, 76),
(49895, 320, 110),
(49896, 320, 124),
(49898, 321, 76),
(49899, 321, 110),
(49903, 322, 15),
(49904, 322, 110),
(49905, 322, 202),
(49906, 323, 236),
(49907, 324, 236),
(49953, 325, 216),
(49954, 325, 209),
(49955, 325, 76),
(49956, 325, 235),
(49957, 325, 86),
(49958, 325, 103),
(49959, 325, 110),
(49960, 325, 124),
(49961, 325, 138),
(49962, 325, 166),
(49963, 326, 83),
(49964, 327, 83),
(49965, 328, 83),
(49987, 329, 216),
(49988, 329, 83),
(49989, 329, 209),
(49990, 329, 76),
(49991, 329, 101),
(49992, 329, 110),
(49993, 329, 124),
(49994, 330, 83),
(50061, 331, 15),
(50062, 331, 40),
(50063, 331, 83),
(50064, 331, 70),
(50065, 331, 76),
(50066, 331, 235),
(50067, 331, 86),
(50068, 331, 100),
(50069, 331, 110),
(50070, 331, 124),
(50071, 331, 138),
(50072, 331, 166),
(50073, 332, 216),
(50077, 333, 83),
(50078, 333, 235),
(50079, 333, 110),
(50080, 334, 236),
(50091, 335, 209),
(50092, 335, 100),
(50093, 335, 110),
(50094, 335, 183),
(50095, 335, 203),
(50141, 336, 15),
(50142, 336, 83),
(50143, 336, 209),
(50144, 336, 76),
(50145, 336, 235),
(50146, 336, 86),
(50147, 336, 100),
(50148, 336, 101),
(50149, 336, 110),
(50150, 336, 138),
(50151, 337, 40),
(50152, 338, 236),
(50168, 339, 15),
(50169, 339, 76),
(50170, 339, 235),
(50171, 339, 100),
(50172, 339, 110),
(50173, 339, 157),
(50174, 340, 110),
(50175, 341, 110),
(50176, 342, 110),
(50177, 343, 110),
(50178, 344, 110),
(50179, 345, 216),
(50181, 346, 76),
(50182, 346, 110),
(50183, 347, 76),
(50190, 348, 209),
(50191, 348, 132),
(50192, 348, 157),
(50193, 348, 203),
(50194, 349, 110),
(50198, 350, 209),
(50199, 350, 110),
(50200, 350, 166),
(50204, 351, 216),
(50205, 351, 76),
(50206, 351, 110),
(50207, 352, 216),
(50208, 353, 236),
(50209, 354, 110),
(50210, 355, 209),
(50211, 356, 202),
(50212, 357, 216),
(50219, 358, 209),
(50220, 358, 110),
(50221, 358, 166),
(50222, 358, 206),
(50233, 359, 209),
(50234, 359, 110),
(50235, 359, 124),
(50236, 359, 166),
(50237, 359, 203),
(50238, 360, 235),
(50239, 361, 203),
(50240, 362, 235),
(50241, 363, 209),
(50243, 364, 209),
(50244, 364, 110),
(50245, 365, 216),
(50246, 366, 216),
(50247, 367, 40),
(50248, 368, 86),
(50249, 369, 216),
(50251, 370, 216),
(50252, 370, 110),
(50254, 371, 76),
(50255, 371, 110),
(50259, 372, 76),
(50260, 372, 110),
(50261, 372, 200),
(50262, 373, 86),
(50263, 374, 110),
(50264, 375, 110),
(50265, 376, 110),
(50267, 377, 209),
(50268, 377, 76),
(50269, 378, 83),
(50270, 379, 83),
(50274, 380, 209),
(50275, 380, 110),
(50276, 380, 124),
(50277, 381, 110),
(50278, 382, 110),
(50279, 383, 110),
(50280, 384, 203),
(50281, 385, 112),
(50282, 386, 110),
(50283, 387, 110),
(50285, 388, 76),
(50286, 388, 110),
(50287, 389, 209),
(50288, 390, 138),
(50292, 391, 59),
(50293, 391, 209),
(50294, 391, 110),
(50296, 392, 209),
(50297, 392, 202),
(50298, 393, 209),
(50300, 394, 209),
(50301, 394, 110),
(50407, 395, 234),
(50408, 395, 15),
(50409, 395, 59),
(50410, 395, 83),
(50411, 395, 61),
(50412, 395, 64),
(50413, 395, 70),
(50414, 395, 209),
(50415, 395, 76),
(50416, 395, 101),
(50417, 395, 110),
(50418, 395, 138),
(50419, 395, 157),
(50420, 395, 175),
(50421, 395, 178),
(50422, 396, 234),
(50423, 397, 83),
(50424, 398, 83),
(50425, 399, 83),
(50426, 400, 183),
(50427, 401, 209),
(50438, 402, 209),
(50439, 402, 84),
(50440, 402, 110),
(50441, 402, 200),
(50442, 402, 202),
(50443, 403, 209),
(50445, 404, 76),
(50446, 404, 110),
(50447, 405, 110),
(50448, 406, 110),
(50449, 407, 203),
(50453, 408, 216),
(50454, 408, 76),
(50455, 408, 110),
(50456, 409, 110),
(50457, 410, 76),
(50458, 411, 83),
(50459, 412, 83),
(50460, 413, 124),
(50461, 414, 124),
(50462, 415, 124),
(50463, 416, 216),
(50464, 417, 216),
(50465, 418, 216),
(50466, 419, 216),
(50467, 420, 76),
(50471, 421, 86),
(50472, 421, 101),
(50473, 421, 241),
(50474, 422, 110),
(50475, 423, 110),
(50476, 424, 100),
(50477, 425, 110),
(50478, 426, 110),
(50479, 427, 110),
(50480, 428, 110),
(50482, 429, 86),
(50483, 429, 110),
(50484, 430, 110),
(50485, 431, 110),
(50486, 432, 110),
(50490, 433, 209),
(50491, 433, 76),
(50492, 433, 110),
(50521, 434, 14),
(50522, 434, 40),
(50523, 434, 216),
(50524, 434, 76),
(50525, 434, 100),
(50526, 434, 110),
(50527, 434, 138),
(50528, 434, 175),
(50529, 435, 110),
(50540, 436, 216),
(50541, 436, 209),
(50542, 436, 76),
(50543, 436, 100),
(50544, 436, 110),
(50566, 437, 14),
(50567, 437, 40),
(50568, 437, 216),
(50569, 437, 209),
(50570, 437, 76),
(50571, 437, 110),
(50572, 437, 138),
(50579, 438, 216),
(50580, 438, 86),
(50581, 438, 110),
(50582, 438, 142),
(50586, 439, 216),
(50587, 439, 86),
(50588, 439, 110),
(50589, 440, 110),
(50590, 441, 110),
(50591, 442, 110),
(50728, 443, 234),
(50729, 443, 15),
(50730, 443, 83),
(50731, 443, 70),
(50732, 443, 76),
(50733, 443, 235),
(50734, 443, 84),
(50735, 443, 86),
(50736, 443, 110),
(50737, 443, 123),
(50738, 443, 138),
(50739, 443, 142),
(50740, 443, 134),
(50741, 443, 166),
(50742, 443, 200),
(50743, 443, 202),
(50744, 443, 221),
(50745, 444, 235),
(50752, 445, 234),
(50753, 445, 15),
(50754, 445, 61),
(50755, 445, 76),
(50757, 446, 22),
(50758, 446, 157),
(50759, 447, 183),
(50760, 448, 61),
(50932, 449, 234),
(50933, 449, 15),
(50934, 449, 22),
(50935, 449, 59),
(50936, 449, 83),
(50937, 449, 76),
(50938, 449, 84),
(50939, 449, 86),
(50940, 449, 110),
(50941, 449, 116),
(50942, 449, 123),
(50943, 449, 142),
(50944, 449, 157),
(50945, 449, 166),
(50946, 449, 182),
(50947, 449, 183),
(50948, 449, 200),
(50949, 449, 241),
(50950, 449, 206),
(50951, 450, 61),
(50967, 11, 83),
(50968, 11, 86),
(50969, 11, 100),
(50970, 11, 110),
(50971, 11, 146),
(50972, 11, 221),
(50974, 451, 216),
(50975, 451, 175),
(50976, 452, 216),
(50987, 453, 76),
(50988, 453, 86),
(50989, 453, 101),
(50990, 453, 110),
(50991, 453, 200),
(50992, 454, 110),
(50996, 455, 61),
(50997, 455, 84),
(50998, 455, 203),
(51000, 456, 83),
(51001, 456, 110),
(51002, 457, 83),
(51003, 458, 83),
(51004, 459, 83),
(51020, 460, 15),
(51021, 460, 83),
(51022, 460, 76),
(51023, 460, 86),
(51024, 460, 110),
(51025, 460, 182),
(51026, 461, 183),
(51027, 462, 216),
(51028, 463, 216),
(51029, 464, 216),
(51031, 465, 83),
(51032, 465, 110),
(51039, 466, 101),
(51040, 466, 110),
(51041, 466, 157),
(51042, 466, 193),
(51043, 467, 110),
(51297, 468, 234),
(51298, 468, 15),
(51299, 468, 22),
(51300, 468, 59),
(51301, 468, 83),
(51302, 468, 209),
(51303, 468, 76),
(51304, 468, 235),
(51305, 468, 86),
(51306, 468, 100),
(51307, 468, 101),
(51308, 468, 102),
(51309, 468, 110),
(51310, 468, 146),
(51311, 468, 138),
(51312, 468, 157),
(51313, 468, 166),
(51314, 468, 175),
(51315, 468, 178),
(51316, 468, 215),
(51317, 468, 202),
(51318, 468, 241),
(51319, 468, 206),
(51320, 469, 183),
(51321, 470, 216),
(51322, 471, 216),
(51389, 472, 15),
(51390, 472, 22),
(51391, 472, 83),
(51392, 472, 61),
(51393, 472, 76),
(51394, 472, 86),
(51395, 472, 101),
(51396, 472, 110),
(51397, 472, 130),
(51398, 472, 138),
(51399, 472, 178),
(51400, 472, 193),
(51401, 473, 216),
(51402, 474, 110),
(51418, 475, 15),
(51419, 475, 216),
(51420, 475, 83),
(51421, 475, 76),
(51422, 475, 86),
(51423, 475, 110),
(51434, 476, 22),
(51435, 476, 209),
(51436, 476, 76),
(51437, 476, 100),
(51438, 476, 175),
(51475, 477, 15),
(51476, 477, 83),
(51477, 477, 209),
(51478, 477, 86),
(51479, 477, 101),
(51480, 477, 110),
(51481, 477, 166),
(51482, 477, 202),
(51483, 477, 193),
(51674, 478, 234),
(51675, 478, 15),
(51676, 478, 22),
(51677, 478, 216),
(51678, 478, 83),
(51679, 478, 61),
(51680, 478, 70),
(51681, 478, 76),
(51682, 478, 235),
(51683, 478, 86),
(51684, 478, 110),
(51685, 478, 116),
(51686, 478, 138),
(51687, 478, 142),
(51688, 478, 134),
(51689, 478, 157),
(51690, 478, 182),
(51691, 478, 183),
(51692, 478, 200),
(51693, 478, 241),
(51749, 479, 234),
(51750, 479, 15),
(51751, 479, 83),
(51752, 479, 235),
(51753, 479, 86),
(51754, 479, 101),
(51755, 479, 110),
(51756, 479, 124),
(51757, 479, 157),
(51758, 479, 175),
(51759, 479, 193),
(51760, 480, 235),
(51761, 481, 15),
(51762, 482, 110),
(51763, 483, 110),
(51764, 484, 110),
(51765, 485, 110),
(51769, 486, 14),
(51770, 486, 183),
(51771, 486, 202),
(51778, 487, 15),
(51779, 487, 110),
(51780, 487, 183),
(51781, 487, 200),
(51782, 488, 110),
(51793, 489, 86),
(51794, 489, 110),
(51795, 489, 166),
(51796, 489, 183),
(51797, 489, 241),
(51801, 490, 76),
(51802, 490, 110),
(51803, 490, 175),
(51804, 491, 110),
(51833, 492, 216),
(51834, 492, 61),
(51835, 492, 209),
(51836, 492, 76),
(51837, 492, 86),
(51838, 492, 110),
(51839, 492, 130),
(51840, 492, 175),
(51841, 493, 209),
(51908, 494, 15),
(51909, 494, 22),
(51910, 494, 216),
(51911, 494, 209),
(51912, 494, 76),
(51913, 494, 86),
(51914, 494, 110),
(51915, 494, 130),
(51916, 494, 138),
(51917, 494, 157),
(51918, 494, 166),
(51919, 494, 193),
(51921, 495, 110),
(51922, 495, 142),
(51924, 496, 110),
(51925, 496, 142),
(51926, 497, 110),
(51927, 498, 110),
(51928, 499, 235),
(51995, 500, 234),
(51996, 500, 61),
(51997, 500, 209),
(51998, 500, 86),
(51999, 500, 100),
(52000, 500, 110),
(52001, 500, 124),
(52002, 500, 147),
(52003, 500, 138),
(52004, 500, 142),
(52005, 500, 134),
(52006, 500, 182),
(52007, 501, 110),
(52008, 502, 235),
(52009, 503, 235),
(52010, 504, 235),
(52011, 505, 235),
(52012, 506, 235),
(52013, 507, 110),
(52014, 508, 110),
(52015, 509, 110),
(52022, 510, 110),
(52023, 510, 138),
(52024, 510, 142),
(52025, 510, 182),
(52032, 511, 86),
(52033, 511, 110),
(52034, 511, 124),
(52035, 511, 142),
(52042, 512, 86),
(52043, 512, 110),
(52044, 512, 124),
(52045, 512, 142),
(52046, 513, 110),
(52047, 514, 235),
(52048, 515, 235),
(52064, 516, 76),
(52065, 516, 86),
(52066, 516, 110),
(52067, 516, 124),
(52068, 516, 142),
(52069, 516, 193),
(52071, 517, 76),
(52072, 517, 110),
(52074, 518, 110),
(52075, 518, 193),
(52076, 519, 110),
(52092, 520, 209),
(52093, 520, 76),
(52094, 520, 86),
(52095, 520, 110),
(52096, 520, 124),
(52097, 520, 142),
(52098, 521, 110),
(52099, 522, 110),
(52100, 523, 209),
(52101, 524, 110),
(52102, 525, 110),
(52103, 526, 110),
(52105, 527, 110),
(52106, 527, 124),
(52107, 528, 110),
(52109, 529, 110),
(52110, 529, 124),
(52111, 530, 110),
(52112, 531, 110),
(52123, 532, 234),
(52124, 532, 83),
(52125, 532, 61),
(52126, 532, 101),
(52127, 532, 110),
(52183, 533, 234),
(52184, 533, 216),
(52185, 533, 83),
(52186, 533, 61),
(52187, 533, 235),
(52188, 533, 101),
(52189, 533, 102),
(52190, 533, 110),
(52191, 533, 166),
(52192, 533, 215),
(52193, 533, 203),
(52194, 534, 110),
(52195, 535, 216),
(52196, 536, 216),
(52197, 537, 61),
(52219, 538, 216),
(52220, 538, 83),
(52221, 538, 61),
(52222, 538, 235),
(52223, 538, 110),
(52224, 538, 166),
(52225, 538, 215),
(52247, 539, 234),
(52248, 539, 216),
(52249, 539, 83),
(52250, 539, 235),
(52251, 539, 101),
(52252, 539, 110),
(52253, 539, 215),
(52257, 540, 64),
(52258, 540, 76),
(52259, 540, 110),
(52260, 541, 216),
(52397, 542, 234),
(52398, 542, 216),
(52399, 542, 59),
(52400, 542, 83),
(52401, 542, 61),
(52402, 542, 209),
(52403, 542, 75),
(52404, 542, 76),
(52405, 542, 84),
(52406, 542, 101),
(52407, 542, 110),
(52408, 542, 146),
(52409, 542, 138),
(52410, 542, 142),
(52411, 542, 134),
(52412, 542, 183),
(52413, 542, 206),
(52414, 543, 76),
(52415, 544, 216),
(52416, 545, 216),
(52427, 546, 216),
(52428, 546, 59),
(52429, 546, 86),
(52430, 546, 101),
(52431, 546, 110),
(52447, 547, 76),
(52448, 547, 86),
(52449, 547, 110),
(52450, 547, 124),
(52451, 547, 142),
(52452, 547, 182),
(52468, 548, 59),
(52469, 548, 61),
(52470, 548, 86),
(52471, 548, 110),
(52472, 548, 124),
(52473, 548, 142),
(52477, 549, 76),
(52478, 549, 86),
(52479, 549, 110),
(52535, 550, 234),
(52536, 550, 15),
(52537, 550, 216),
(52538, 550, 83),
(52539, 550, 61),
(52540, 550, 76),
(52541, 550, 86),
(52542, 550, 110),
(52543, 550, 138),
(52544, 550, 182),
(52545, 550, 203),
(52546, 551, 216),
(52547, 552, 235),
(52554, 553, 15),
(52555, 553, 83),
(52556, 553, 86),
(52557, 553, 110),
(52768, 554, 234),
(52769, 554, 15),
(52770, 554, 216),
(52771, 554, 83),
(52772, 554, 61),
(52773, 554, 209),
(52774, 554, 75),
(52775, 554, 76),
(52776, 554, 86),
(52777, 554, 100),
(52778, 554, 110),
(52779, 554, 116),
(52780, 554, 124),
(52781, 554, 142),
(52782, 554, 134),
(52783, 554, 182),
(52784, 554, 183),
(52785, 554, 215),
(52786, 554, 202),
(52787, 554, 221),
(52788, 554, 206),
(52789, 555, 83),
(52790, 556, 183),
(52791, 557, 76),
(52792, 558, 216),
(52793, 559, 110),
(52839, 560, 234),
(52840, 560, 15),
(52841, 560, 22),
(52842, 560, 61),
(52843, 560, 64),
(52844, 560, 76),
(52845, 560, 110),
(52846, 560, 215),
(52847, 560, 203),
(52848, 560, 202),
(52849, 561, 216),
(52850, 562, 235),
(52851, 563, 83),
(52852, 564, 83),
(53414, 565, 234),
(53415, 565, 15),
(53416, 565, 46),
(53417, 565, 59),
(53418, 565, 83),
(53419, 565, 61),
(53420, 565, 70),
(53421, 565, 209),
(53422, 565, 75),
(53423, 565, 76),
(53424, 565, 235),
(53425, 565, 84),
(53426, 565, 86),
(53427, 565, 100),
(53428, 565, 101),
(53429, 565, 102),
(53430, 565, 110),
(53431, 565, 116),
(53432, 565, 124),
(53433, 565, 123),
(53434, 565, 146),
(53435, 565, 132),
(53436, 565, 138),
(53437, 565, 142),
(53438, 565, 134),
(53439, 565, 166),
(53440, 565, 182),
(53441, 565, 183),
(53442, 565, 215),
(53443, 565, 200),
(53444, 565, 203),
(53445, 565, 202),
(53446, 565, 221),
(53447, 565, 206),
(53448, 566, 216),
(53449, 567, 216),
(53450, 568, 216),
(53451, 569, 76),
(53452, 570, 110),
(53453, 571, 22),
(53455, 572, 15),
(53456, 572, 110),
(53457, 573, 15),
(53458, 574, 14),
(53459, 575, 14),
(53460, 576, 14),
(53462, 577, 76),
(53463, 577, 235),
(53464, 578, 76),
(53570, 579, 234),
(53571, 579, 15),
(53572, 579, 83),
(53573, 579, 84),
(53574, 579, 86),
(53575, 579, 100),
(53576, 579, 102),
(53577, 579, 110),
(53578, 579, 146),
(53579, 579, 138),
(53580, 579, 142),
(53581, 579, 134),
(53582, 579, 182),
(53583, 579, 200),
(53584, 579, 206),
(53585, 580, 183),
(53586, 581, 216),
(53587, 582, 110),
(53589, 583, 76),
(53590, 583, 110),
(53801, 584, 15),
(53802, 584, 59),
(53803, 584, 61),
(53804, 584, 209),
(53805, 584, 76),
(53806, 584, 84),
(53807, 584, 86),
(53808, 584, 100),
(53809, 584, 101),
(53810, 584, 102),
(53811, 584, 110),
(53812, 584, 116),
(53813, 584, 124),
(53814, 584, 123),
(53815, 584, 132),
(53816, 584, 182),
(53817, 584, 183),
(53818, 584, 215),
(53819, 584, 203),
(53820, 584, 202),
(53821, 584, 221),
(53823, 585, 15),
(53824, 585, 76),
(53825, 586, 216),
(53826, 587, 216),
(53827, 588, 22),
(53828, 589, 83),
(53829, 590, 216),
(53831, 591, 76),
(53832, 591, 235),
(53833, 592, 76),
(53835, 593, 209),
(53836, 593, 110),
(53837, 594, 83),
(53841, 595, 83),
(53842, 595, 110),
(53843, 595, 124),
(53865, 596, 15),
(53866, 596, 22),
(53867, 596, 64),
(53868, 596, 76),
(53869, 596, 110),
(53870, 596, 142),
(53871, 596, 202),
(53872, 597, 76),
(53873, 598, 22),
(53874, 599, 110),
(53875, 600, 76),
(54341, 601, 234),
(54342, 601, 59),
(54343, 601, 83),
(54344, 601, 61),
(54345, 601, 64),
(54346, 601, 70),
(54347, 601, 209),
(54348, 601, 75),
(54349, 601, 76),
(54350, 601, 84),
(54351, 601, 86),
(54352, 601, 100),
(54353, 601, 101),
(54354, 601, 102),
(54355, 601, 110),
(54356, 601, 116),
(54357, 601, 124),
(54358, 601, 123),
(54359, 601, 132),
(54360, 601, 138),
(54361, 601, 142),
(54362, 601, 134),
(54363, 601, 157),
(54364, 601, 175),
(54365, 601, 182),
(54366, 601, 183),
(54367, 601, 215),
(54368, 601, 200),
(54369, 601, 202),
(54370, 601, 221),
(54371, 601, 206),
(54372, 602, 110),
(54373, 603, 83),
(54389, 604, 235),
(54390, 604, 86),
(54391, 604, 102),
(54392, 604, 110),
(54393, 604, 123),
(54394, 604, 146),
(54395, 605, 76),
(54396, 606, 83),
(54397, 607, 235),
(54399, 608, 209),
(54400, 608, 110),
(54401, 609, 110),
(54408, 610, 234),
(54409, 610, 61),
(54410, 610, 76),
(54411, 610, 110),
(54548, 611, 234),
(54549, 611, 15),
(54550, 611, 59),
(54551, 611, 75),
(54552, 611, 76),
(54553, 611, 84),
(54554, 611, 86),
(54555, 611, 110),
(54556, 611, 116),
(54557, 611, 124),
(54558, 611, 123),
(54559, 611, 138),
(54560, 611, 142),
(54561, 611, 134),
(54562, 611, 182),
(54563, 611, 221),
(54564, 611, 206),
(54565, 612, 183),
(55031, 613, 234),
(55032, 613, 15),
(55033, 613, 22),
(55034, 613, 59),
(55035, 613, 83),
(55036, 613, 61),
(55037, 613, 70),
(55038, 613, 209),
(55039, 613, 75),
(55040, 613, 235),
(55041, 613, 84),
(55042, 613, 100),
(55043, 613, 101),
(55044, 613, 102),
(55045, 613, 110),
(55046, 613, 116),
(55047, 613, 124),
(55048, 613, 123),
(55049, 613, 146),
(55050, 613, 132),
(55051, 613, 138),
(55052, 613, 142),
(55053, 613, 134),
(55054, 613, 157),
(55055, 613, 182),
(55056, 613, 215),
(55057, 613, 200),
(55058, 613, 203),
(55059, 613, 202),
(55060, 613, 221),
(55061, 613, 206),
(55062, 614, 83),
(55063, 615, 216),
(55064, 616, 183),
(55065, 617, 83),
(55066, 618, 83),
(55067, 619, 110),
(55068, 620, 76),
(55069, 621, 76),
(55070, 622, 15),
(55071, 623, 76),
(55072, 624, 235),
(55079, 625, 64),
(55080, 625, 76),
(55081, 625, 110),
(55082, 625, 175),
(55083, 626, 216),
(55274, 627, 234),
(55275, 627, 59),
(55276, 627, 83),
(55277, 627, 70),
(55278, 627, 76),
(55279, 627, 84),
(55280, 627, 86),
(55281, 627, 100),
(55282, 627, 102),
(55283, 627, 110),
(55284, 627, 124),
(55285, 627, 123),
(55286, 627, 146),
(55287, 627, 132),
(55288, 627, 138),
(55289, 627, 142),
(55290, 627, 182),
(55291, 627, 203),
(55292, 627, 221),
(55293, 627, 206),
(55294, 628, 183),
(55295, 629, 83),
(55296, 630, 216),
(55297, 631, 110),
(55298, 632, 83),
(55314, 633, 15),
(55315, 633, 216),
(55316, 633, 83),
(55317, 633, 61),
(55318, 633, 64),
(55319, 633, 110),
(55320, 634, 15),
(55621, 635, 234),
(55622, 635, 15),
(55623, 635, 46),
(55624, 635, 59),
(55625, 635, 75),
(55626, 635, 76),
(55627, 635, 84),
(55628, 635, 86),
(55629, 635, 100),
(55630, 635, 101),
(55631, 635, 110),
(55632, 635, 124),
(55633, 635, 138),
(55634, 635, 142),
(55635, 635, 134),
(55636, 635, 166),
(55637, 635, 175),
(55638, 635, 182),
(55639, 635, 183),
(55640, 635, 215),
(55641, 635, 200),
(55642, 635, 203),
(55643, 635, 202),
(55644, 635, 221),
(55645, 635, 206),
(55646, 636, 76),
(55647, 637, 22),
(55648, 638, 216),
(55649, 639, 216),
(55651, 640, 76),
(55652, 640, 110),
(55653, 641, 14),
(55654, 642, 83),
(55655, 643, 110),
(55656, 644, 14),
(55667, 645, 15),
(55668, 645, 83),
(55669, 645, 61),
(55670, 645, 76),
(55671, 645, 110),
(55672, 646, 216),
(55673, 647, 76),
(55674, 648, 110),
(55681, 649, 83),
(55682, 649, 61),
(55683, 649, 76),
(55684, 649, 110),
(55706, 650, 216),
(55707, 650, 59),
(55708, 650, 83),
(55709, 650, 61),
(55710, 650, 76),
(55711, 650, 110),
(55712, 650, 138),
(55713, 651, 76),
(55714, 652, 216),
(55718, 653, 22),
(55719, 653, 110),
(55720, 653, 183),
(55721, 654, 235),
(55722, 655, 76),
(55723, 656, 76),
(55724, 657, 83),
(55726, 658, 123),
(55727, 658, 142),
(55728, 659, 83),
(55774, 660, 15),
(55775, 660, 59),
(55776, 660, 83),
(55777, 660, 209),
(55778, 660, 235),
(55779, 660, 100),
(55780, 660, 101),
(55781, 660, 110),
(55782, 660, 138),
(55783, 660, 202),
(55784, 661, 83),
(55785, 662, 15),
(55786, 663, 216),
(55787, 664, 76),
(55788, 665, 76),
(55795, 666, 22),
(55796, 666, 61),
(55797, 666, 86),
(55798, 666, 110),
(55799, 667, 22),
(55800, 668, 110),
(55807, 669, 76),
(55808, 669, 86),
(55809, 669, 110),
(55810, 669, 203),
(55811, 670, 76),
(55813, 671, 110),
(55814, 671, 183),
(55881, 672, 234),
(55882, 672, 15),
(55883, 672, 59),
(55884, 672, 61),
(55885, 672, 209),
(55886, 672, 75),
(55887, 672, 76),
(55888, 672, 86),
(55889, 672, 110),
(55890, 672, 138),
(55891, 672, 215),
(55892, 672, 202),
(55893, 673, 76),
(55895, 674, 76),
(55896, 674, 235),
(55897, 675, 76),
(55898, 676, 216),
(55899, 677, 216),
(55900, 678, 22),
(55904, 679, 76),
(55905, 679, 86),
(55906, 679, 110),
(55908, 680, 209),
(55909, 680, 110),
(55910, 681, 83),
(55911, 682, 83),
(55912, 683, 83),
(55913, 684, 83),
(55914, 685, 236),
(55915, 686, 236),
(55916, 687, 236),
(56008, 688, 234),
(56009, 688, 15),
(56010, 688, 61),
(56011, 688, 70),
(56012, 688, 86),
(56013, 688, 102),
(56014, 688, 110),
(56015, 688, 116),
(56016, 688, 138),
(56017, 688, 142),
(56018, 688, 166),
(56019, 688, 183),
(56020, 688, 215),
(56021, 688, 206),
(56100, 689, 83),
(56101, 689, 61),
(56102, 689, 76),
(56103, 689, 84),
(56104, 689, 100),
(56105, 689, 110),
(56106, 689, 124),
(56107, 689, 132),
(56108, 689, 142),
(56109, 689, 134),
(56110, 689, 166),
(56111, 689, 203),
(56112, 689, 206),
(56113, 690, 83),
(56115, 691, 83),
(56116, 691, 110),
(56117, 692, 83),
(56154, 693, 61),
(56155, 693, 209),
(56156, 693, 86),
(56157, 693, 110),
(56158, 693, 123),
(56159, 693, 146),
(56160, 693, 138),
(56161, 693, 166),
(56162, 693, 182),
(56353, 694, 234),
(56354, 694, 15),
(56355, 694, 83),
(56356, 694, 61),
(56357, 694, 76),
(56358, 694, 84),
(56359, 694, 86),
(56360, 694, 100),
(56361, 694, 110),
(56362, 694, 124),
(56363, 694, 146),
(56364, 694, 132),
(56365, 694, 142),
(56366, 694, 134),
(56367, 694, 182),
(56368, 694, 215),
(56369, 694, 203),
(56370, 694, 202),
(56371, 694, 221),
(56372, 694, 206),
(56373, 695, 183),
(56374, 696, 216),
(56375, 697, 76),
(56376, 698, 83),
(56377, 699, 216),
(56444, 700, 22),
(56445, 700, 83),
(56446, 700, 61),
(56447, 700, 76),
(56448, 700, 84),
(56449, 700, 86),
(56450, 700, 110),
(56451, 700, 124),
(56452, 700, 142),
(56453, 700, 134),
(56454, 700, 182),
(56455, 700, 200),
(56456, 701, 183),
(56478, 702, 234),
(56479, 702, 76),
(56480, 702, 86),
(56481, 702, 110),
(56482, 702, 146),
(56483, 702, 142),
(56484, 702, 134),
(56485, 703, 183),
(56501, 704, 234),
(56502, 704, 76),
(56503, 704, 86),
(56504, 704, 100),
(56505, 704, 110),
(56506, 704, 183),
(56507, 705, 110),
(56518, 706, 234),
(56519, 706, 76),
(56520, 706, 100),
(56521, 706, 110),
(56522, 706, 142),
(56523, 707, 183),
(56560, 708, 234),
(56561, 708, 59),
(56562, 708, 76),
(56563, 708, 235),
(56564, 708, 86),
(56565, 708, 100),
(56566, 708, 110),
(56567, 708, 146),
(56568, 708, 142),
(56569, 709, 183),
(56570, 710, 110),
(56571, 711, 112),
(56587, 712, 234),
(56588, 712, 235),
(56589, 712, 86),
(56590, 712, 100),
(56591, 712, 110),
(56592, 712, 142),
(56614, 713, 234),
(56615, 713, 59),
(56616, 713, 76),
(56617, 713, 86),
(56618, 713, 100),
(56619, 713, 110),
(56620, 713, 142),
(56621, 714, 110),
(56637, 715, 76),
(56638, 715, 235),
(56639, 715, 86),
(56640, 715, 100),
(56641, 715, 110),
(56642, 715, 142),
(56643, 716, 110),
(56672, 717, 234),
(56673, 717, 59),
(56674, 717, 76),
(56675, 717, 86),
(56676, 717, 100),
(56677, 717, 110),
(56678, 717, 142),
(56679, 717, 183),
(56680, 718, 110),
(56717, 719, 234),
(56718, 719, 76),
(56719, 719, 235),
(56720, 719, 86),
(56721, 719, 100),
(56722, 719, 110),
(56723, 719, 142),
(56724, 719, 134),
(56725, 719, 183),
(56762, 720, 234),
(56763, 720, 59),
(56764, 720, 76),
(56765, 720, 86),
(56766, 720, 100),
(56767, 720, 110),
(56768, 720, 112),
(56769, 720, 142),
(56770, 720, 183),
(56771, 721, 110),
(56772, 722, 110),
(56774, 723, 110),
(56775, 723, 236),
(56776, 724, 110),
(56777, 725, 110),
(56778, 726, 110),
(56780, 727, 86),
(56781, 727, 110),
(56788, 728, 83),
(56789, 728, 61),
(56790, 728, 76),
(56791, 728, 110),
(56792, 729, 110),
(56799, 730, 83),
(56800, 730, 76),
(56801, 730, 235),
(56802, 730, 110),
(56803, 731, 110),
(56807, 732, 83),
(56808, 732, 86),
(56809, 732, 110),
(56810, 733, 110),
(56817, 734, 83),
(56818, 734, 86),
(56819, 734, 110),
(56820, 734, 182),
(56822, 735, 76),
(56823, 735, 110),
(56824, 736, 110),
(56825, 737, 110),
(56826, 738, 110),
(56828, 739, 83),
(56829, 739, 110),
(56851, 740, 83),
(56852, 740, 76),
(56853, 740, 86),
(56854, 740, 100),
(56855, 740, 110),
(56856, 740, 146),
(56857, 740, 183),
(56858, 741, 110),
(56859, 742, 110),
(56870, 743, 83),
(56871, 743, 100),
(56872, 743, 110),
(56873, 743, 146),
(56874, 743, 183),
(56875, 744, 110),
(56897, 745, 83),
(56898, 745, 76),
(56899, 745, 86),
(56900, 745, 100),
(56901, 745, 110),
(56902, 745, 146),
(56903, 745, 183),
(56914, 746, 83),
(56915, 746, 86),
(56916, 746, 100),
(56917, 746, 110),
(56918, 746, 183),
(56919, 747, 110),
(56921, 748, 83),
(56922, 748, 110),
(56923, 749, 183),
(56927, 750, 83),
(56928, 750, 100),
(56929, 750, 110),
(56930, 751, 183),
(56931, 752, 110),
(56935, 753, 83),
(56936, 753, 86),
(56937, 753, 110),
(56938, 754, 110),
(56940, 755, 86),
(56941, 755, 110),
(56943, 756, 110),
(56944, 756, 221),
(56960, 757, 15),
(56961, 757, 216),
(56962, 757, 235),
(56963, 757, 86),
(56964, 757, 110),
(56965, 757, 142),
(56966, 758, 110),
(56977, 759, 216),
(56978, 759, 235),
(56979, 759, 86),
(56980, 759, 110),
(56981, 759, 221),
(56982, 760, 110),
(56983, 761, 110),
(57005, 762, 15),
(57006, 762, 216),
(57007, 762, 235),
(57008, 762, 100),
(57009, 762, 110),
(57010, 762, 142),
(57011, 762, 221),
(57012, 763, 110),
(57013, 764, 110),
(57014, 765, 110),
(57030, 766, 15),
(57031, 766, 216),
(57032, 766, 235),
(57033, 766, 100),
(57034, 766, 110),
(57035, 766, 142),
(57036, 767, 216),
(57037, 768, 110),
(57038, 769, 110),
(57039, 770, 216),
(57046, 771, 216),
(57047, 771, 100),
(57048, 771, 110),
(57049, 771, 142),
(57050, 772, 216),
(57051, 773, 216),
(57052, 774, 22),
(57056, 775, 100),
(57057, 775, 110),
(57058, 775, 142),
(57059, 776, 216),
(57060, 777, 110),
(57061, 778, 110),
(57062, 779, 110),
(57063, 780, 110),
(57064, 781, 110),
(57075, 782, 15),
(57076, 782, 235),
(57077, 782, 86),
(57078, 782, 100),
(57079, 782, 110),
(57080, 783, 110),
(57087, 784, 15),
(57088, 784, 216),
(57089, 784, 100),
(57090, 784, 110),
(57092, 785, 86),
(57093, 785, 110),
(57094, 786, 110),
(57095, 787, 110),
(57111, 788, 234),
(57112, 788, 86),
(57113, 788, 110),
(57114, 788, 142),
(57115, 788, 182),
(57116, 788, 221),
(57162, 789, 234),
(57163, 789, 15),
(57164, 789, 216),
(57165, 789, 86),
(57166, 789, 101),
(57167, 789, 110),
(57168, 789, 116),
(57169, 789, 142),
(57170, 789, 182),
(57171, 789, 221),
(57200, 790, 234),
(57201, 790, 15),
(57202, 790, 86),
(57203, 790, 101),
(57204, 790, 110),
(57205, 790, 116),
(57206, 790, 182),
(57207, 790, 221),
(57244, 791, 234),
(57245, 791, 216),
(57246, 791, 86),
(57247, 791, 101),
(57248, 791, 110),
(57249, 791, 138),
(57250, 791, 166),
(57251, 791, 182),
(57252, 791, 215),
(57281, 792, 234),
(57282, 792, 216),
(57283, 792, 86),
(57284, 792, 101),
(57285, 792, 110),
(57286, 792, 166),
(57287, 792, 182),
(57288, 792, 215),
(57317, 793, 234),
(57318, 793, 22),
(57319, 793, 61),
(57320, 793, 86),
(57321, 793, 100),
(57322, 793, 110),
(57323, 793, 142),
(57324, 793, 157),
(57346, 794, 234),
(57347, 794, 22),
(57348, 794, 61),
(57349, 794, 86),
(57350, 794, 110),
(57351, 794, 142),
(57352, 794, 157),
(57359, 795, 234),
(57360, 795, 86),
(57361, 795, 110),
(57362, 795, 142),
(57364, 796, 216),
(57365, 796, 110),
(57556, 797, 234),
(57557, 797, 15),
(57558, 797, 216),
(57559, 797, 59),
(57560, 797, 83),
(57561, 797, 61),
(57562, 797, 64),
(57563, 797, 84),
(57564, 797, 86),
(57565, 797, 100),
(57566, 797, 102),
(57567, 797, 110),
(57568, 797, 146),
(57569, 797, 138),
(57570, 797, 142),
(57571, 797, 134),
(57572, 797, 200),
(57573, 797, 221),
(57574, 797, 241),
(57575, 797, 206),
(57576, 798, 183),
(57577, 799, 110),
(57683, 800, 234),
(57684, 800, 15),
(57685, 800, 59),
(57686, 800, 83),
(57687, 800, 61),
(57688, 800, 64),
(57689, 800, 86),
(57690, 800, 110),
(57691, 800, 116),
(57692, 800, 123),
(57693, 800, 138),
(57694, 800, 142),
(57695, 800, 166),
(57696, 800, 200),
(57697, 800, 203),
(57698, 801, 216),
(57699, 802, 216),
(57700, 803, 216),
(57711, 804, 234),
(57712, 804, 83),
(57713, 804, 209),
(57714, 804, 86),
(57715, 804, 110),
(57794, 805, 59),
(57795, 805, 83),
(57796, 805, 84),
(57797, 805, 86),
(57798, 805, 100),
(57799, 805, 102),
(57800, 805, 110),
(57801, 805, 138),
(57802, 805, 142),
(57803, 805, 182),
(57804, 805, 215),
(57805, 805, 200),
(57806, 805, 206),
(57807, 806, 22),
(57809, 807, 83),
(57810, 807, 110),
(57931, 808, 234),
(57932, 808, 22),
(57933, 808, 83),
(57934, 808, 76),
(57935, 808, 84),
(57936, 808, 86),
(57937, 808, 100),
(57938, 808, 110),
(57939, 808, 142),
(57940, 808, 134),
(57941, 808, 157),
(57942, 808, 182),
(57943, 808, 183),
(57944, 808, 200),
(57945, 808, 221),
(57946, 808, 206),
(57947, 809, 110),
(57948, 810, 22),
(58249, 811, 234),
(58250, 811, 22),
(58251, 811, 216),
(58252, 811, 59),
(58253, 811, 76),
(58254, 811, 235),
(58255, 811, 84),
(58256, 811, 86),
(58257, 811, 100),
(58258, 811, 101),
(58259, 811, 102),
(58260, 811, 110),
(58261, 811, 124),
(58262, 811, 147),
(58263, 811, 146),
(58264, 811, 138),
(58265, 811, 142),
(58266, 811, 134),
(58267, 811, 157),
(58268, 811, 166),
(58269, 811, 182),
(58270, 811, 200),
(58271, 811, 221),
(58272, 811, 241),
(58273, 811, 206),
(58274, 812, 183),
(58275, 813, 22),
(58276, 814, 216),
(58277, 815, 110),
(58278, 816, 83),
(58280, 817, 22),
(58281, 817, 157),
(58360, 818, 234),
(58361, 818, 15),
(58362, 818, 59),
(58363, 818, 83),
(58364, 818, 61),
(58365, 818, 64),
(58366, 818, 86),
(58367, 818, 110),
(58368, 818, 116),
(58369, 818, 138),
(58370, 818, 142),
(58371, 818, 215),
(58372, 818, 200),
(58373, 819, 216),
(58374, 820, 216),
(58375, 821, 110),
(58376, 822, 110),
(58530, 823, 234),
(58531, 823, 15),
(58532, 823, 22),
(58533, 823, 216),
(58534, 823, 64),
(58535, 823, 76),
(58536, 823, 84),
(58537, 823, 86),
(58538, 823, 100),
(58539, 823, 110),
(58540, 823, 116),
(58541, 823, 138),
(58542, 823, 142),
(58543, 823, 157),
(58544, 823, 166),
(58545, 823, 182),
(58546, 823, 200),
(58547, 823, 202),
(58548, 824, 235),
(58669, 825, 234),
(58670, 825, 15),
(58671, 825, 216),
(58672, 825, 59),
(58673, 825, 64),
(58674, 825, 76),
(58675, 825, 84),
(58676, 825, 86),
(58677, 825, 100),
(58678, 825, 110),
(58679, 825, 138),
(58680, 825, 142),
(58681, 825, 134),
(58682, 825, 166),
(58683, 825, 182),
(58684, 825, 202),
(58685, 826, 110),
(58741, 827, 15),
(58742, 827, 83),
(58743, 827, 64),
(58744, 827, 84),
(58745, 827, 86),
(58746, 827, 100),
(58747, 827, 110),
(58748, 827, 142),
(58749, 827, 166),
(58750, 827, 182),
(58751, 827, 206),
(58788, 828, 15),
(58789, 828, 64),
(58790, 828, 76),
(58791, 828, 86),
(58792, 828, 100),
(58793, 828, 110),
(58794, 828, 138),
(58795, 828, 166),
(58796, 828, 202),
(58800, 829, 234),
(58801, 829, 83),
(58802, 829, 110),
(58809, 830, 15),
(58810, 830, 86),
(58811, 830, 110),
(58812, 830, 202),
(58813, 831, 216),
(58814, 832, 216),
(58815, 833, 236),
(58861, 834, 83),
(58862, 834, 61),
(58863, 834, 76),
(58864, 834, 86),
(58865, 834, 100),
(58866, 834, 110),
(58867, 834, 124),
(58868, 834, 182),
(58869, 834, 215),
(58870, 834, 203),
(58871, 835, 215),
(58872, 836, 76),
(58873, 837, 76),
(58880, 838, 234),
(58881, 838, 86),
(58882, 838, 110),
(58883, 838, 124),
(58989, 839, 234),
(58990, 839, 15),
(58991, 839, 216),
(58992, 839, 83),
(58993, 839, 61),
(58994, 839, 76),
(58995, 839, 100),
(58996, 839, 101),
(58997, 839, 110),
(58998, 839, 116),
(58999, 839, 123),
(59000, 839, 182),
(59001, 839, 183),
(59002, 839, 215),
(59003, 839, 203),
(59005, 840, 15),
(59006, 840, 215),
(59007, 841, 216),
(59008, 842, 76),
(59009, 843, 76),
(59031, 844, 61),
(59032, 844, 76),
(59033, 844, 86),
(59034, 844, 100),
(59035, 844, 110),
(59036, 844, 182),
(59037, 844, 215),
(59038, 845, 215),
(59040, 846, 110),
(59041, 846, 215),
(59042, 847, 216),
(59088, 848, 83),
(59089, 848, 61),
(59090, 848, 76),
(59091, 848, 86),
(59092, 848, 100),
(59093, 848, 110),
(59094, 848, 124),
(59095, 848, 182),
(59096, 848, 215),
(59097, 848, 203),
(59098, 849, 215),
(59127, 850, 216),
(59128, 850, 61),
(59129, 850, 76),
(59130, 850, 86),
(59131, 850, 110),
(59132, 850, 124),
(59133, 850, 182),
(59134, 850, 215),
(59135, 851, 76),
(59136, 852, 110),
(59137, 853, 110),
(59138, 854, 110),
(59139, 855, 235),
(59140, 856, 235),
(59141, 857, 110),
(59142, 858, 110),
(59143, 859, 110),
(59144, 860, 110),
(59173, 861, 234),
(59174, 861, 83),
(59175, 861, 86),
(59176, 861, 100),
(59177, 861, 110),
(59178, 861, 138),
(59179, 861, 142),
(59180, 861, 166),
(59191, 862, 234),
(59192, 862, 76),
(59193, 862, 110),
(59194, 862, 142),
(59195, 862, 221),
(59196, 863, 110),
(59197, 864, 235),
(59243, 865, 234),
(59244, 865, 61),
(59245, 865, 76),
(59246, 865, 86),
(59247, 865, 100),
(59248, 865, 110),
(59249, 865, 138),
(59250, 865, 142),
(59251, 865, 193),
(59252, 865, 221),
(59253, 866, 235),
(59254, 867, 76),
(59255, 868, 110),
(59256, 869, 110),
(59257, 870, 110),
(59258, 871, 110),
(59259, 872, 110),
(59260, 873, 110),
(59261, 874, 110),
(59262, 875, 110),
(59273, 876, 234),
(59274, 876, 76),
(59275, 876, 86),
(59276, 876, 110),
(59277, 876, 203),
(59278, 877, 76),
(59279, 878, 110),
(59281, 879, 110),
(59282, 879, 202),
(59283, 880, 110),
(59284, 881, 110),
(59286, 882, 86),
(59287, 882, 110),
(59288, 883, 110),
(59299, 884, 234),
(59300, 884, 83),
(59301, 884, 102),
(59302, 884, 110),
(59303, 884, 142),
(59314, 885, 234),
(59315, 885, 83),
(59316, 885, 102),
(59317, 885, 110),
(59318, 885, 142),
(59325, 886, 83),
(59326, 886, 102),
(59327, 886, 110),
(59328, 886, 142),
(59339, 16, 110),
(59340, 887, 83),
(59341, 887, 102),
(59342, 887, 110),
(59343, 887, 142);

-- --------------------------------------------------------

--
-- Table structure for table `catalogue_raw_material`
--

CREATE TABLE IF NOT EXISTS `catalogue_raw_material` (
  `id` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalogue_raw_material`
--

INSERT INTO `catalogue_raw_material` (`id`, `parent`, `name`) VALUES
(1, 0, 'Salame'),
(2, 0, 'Prosciutto Cotto'),
(3, 0, 'Prosciutto Crudo'),
(4, 0, 'Spek'),
(5, 0, 'Coppa'),
(6, 2, 'Grancotto di Vignola');

-- --------------------------------------------------------

--
-- Table structure for table `cookbook_category`
--

CREATE TABLE IF NOT EXISTS `cookbook_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cookbook_dish`
--

CREATE TABLE IF NOT EXISTS `cookbook_dish` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cookbook_ingredient`
--

CREATE TABLE IF NOT EXISTS `cookbook_ingredient` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cookbook_recipe`
--

CREATE TABLE IF NOT EXISTS `cookbook_recipe` (
  `id` int(11) NOT NULL,
  `dish` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `difficulty` int(1) NOT NULL,
  `realization_time` int(1) NOT NULL,
  `cooking` varchar(255) DEFAULT NULL,
  `raw_material` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cookbook_recipe_category`
--

CREATE TABLE IF NOT EXISTS `cookbook_recipe_category` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cookbook_recipe_country`
--

CREATE TABLE IF NOT EXISTS `cookbook_recipe_country` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cookbook_recipe_ingredient`
--

CREATE TABLE IF NOT EXISTS `cookbook_recipe_ingredient` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cookbook_recipe_season`
--

CREATE TABLE IF NOT EXISTS `cookbook_recipe_season` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `season_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cookbook_season`
--

CREATE TABLE IF NOT EXISTS `cookbook_season` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cookbook_season`
--

INSERT INTO `cookbook_season` (`id`, `name`) VALUES
(1, 'inverno'),
(2, 'primavera'),
(3, 'estate'),
(4, 'autunno');

-- --------------------------------------------------------

--
-- Table structure for table `geoip_country`
--

CREATE TABLE IF NOT EXISTS `geoip_country` (
  `id` int(10) unsigned NOT NULL,
  `short_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `alpha2_code` varchar(2) COLLATE utf8_bin NOT NULL,
  `alpha3_code` varchar(3) COLLATE utf8_bin NOT NULL,
  `numeric_code` smallint(6) NOT NULL,
  `active` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `geoip_country`
--

INSERT INTO `geoip_country` (`id`, `short_name`, `alpha2_code`, `alpha3_code`, `numeric_code`, `active`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', 4, 0),
(2, 'Åland Islands', 'AX', 'ALA', 248, 0),
(3, 'Albania', 'AL', 'ALB', 8, 0),
(4, 'Algeria', 'DZ', 'DZA', 12, 0),
(5, 'American Samoa', 'AS', 'ASM', 16, 0),
(6, 'Andorra', 'AD', 'AND', 20, 0),
(7, 'Angola', 'AO', 'AGO', 24, 0),
(8, 'Anguilla', 'AI', 'AIA', 660, 0),
(9, 'Antarctica', 'AQ', 'ATA', 10, 0),
(10, 'Antigua and Barbuda', 'AG', 'ATG', 28, 0),
(11, 'Argentina', 'AR', 'ARG', 32, 0),
(12, 'Armenia', 'AM', 'ARM', 51, 0),
(13, 'Aruba', 'AW', 'ABW', 533, 0),
(14, 'Australia', 'AU', 'AUS', 36, 1),
(15, 'Austria', 'AT', 'AUT', 40, 0),
(16, 'Azerbaijan', 'AZ', 'AZE', 31, 0),
(17, 'Bahamas', 'BS', 'BHS', 44, 0),
(18, 'Bahrain', 'BH', 'BHR', 48, 0),
(19, 'Bangladesh', 'BD', 'BGD', 50, 0),
(20, 'Barbados', 'BB', 'BRB', 52, 0),
(21, 'Belarus', 'BY', 'BLR', 112, 0),
(22, 'Belgium', 'BE', 'BEL', 56, 1),
(23, 'Belize', 'BZ', 'BLZ', 84, 0),
(24, 'Benin', 'BJ', 'BEN', 204, 0),
(25, 'Bermuda', 'BM', 'BMU', 60, 0),
(26, 'Bhutan', 'BT', 'BTN', 64, 0),
(27, 'Bolivia, Plurinational State of', 'BO', 'BOL', 68, 0),
(28, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', 535, 0),
(29, 'Bosnia and Herzegovina', 'BA', 'BIH', 70, 0),
(30, 'Botswana', 'BW', 'BWA', 72, 0),
(31, 'Bouvet Island', 'BV', 'BVT', 74, 0),
(32, 'Brazil', 'BR', 'BRA', 76, 0),
(33, 'British Indian Ocean Territory', 'IO', 'IOT', 86, 0),
(34, 'Brunei Darussalam', 'BN', 'BRN', 96, 0),
(35, 'Bulgaria', 'BG', 'BGR', 100, 0),
(36, 'Burkina Faso', 'BF', 'BFA', 854, 0),
(37, 'Burundi', 'BI', 'BDI', 108, 0),
(38, 'Cambodia', 'KH', 'KHM', 116, 0),
(39, 'Cameroon', 'CM', 'CMR', 120, 0),
(40, 'Canada', 'CA', 'CAN', 124, 1),
(41, 'Cape Verde', 'CV', 'CPV', 132, 0),
(42, 'Cayman Islands', 'KY', 'CYM', 136, 0),
(43, 'Central African Republic', 'CF', 'CAF', 140, 0),
(44, 'Chad', 'TD', 'TCD', 148, 0),
(45, 'Chile', 'CL', 'CHL', 152, 0),
(46, 'China', 'CN', 'CHN', 156, 1),
(47, 'Christmas Island', 'CX', 'CXR', 162, 0),
(48, 'Cocos (Keeling) Islands', 'CC', 'CCK', 166, 0),
(49, 'Colombia', 'CO', 'COL', 170, 0),
(50, 'Comoros', 'KM', 'COM', 174, 0),
(51, 'Congo', 'CG', 'COG', 178, 0),
(52, 'Congo, the Democratic Republic of the', 'CD', 'COD', 180, 0),
(53, 'Cook Islands', 'CK', 'COK', 184, 0),
(54, 'Costa Rica', 'CR', 'CRI', 188, 0),
(55, 'Côte d''Ivoire', 'CI', 'CIV', 384, 0),
(56, 'Croatia', 'HR', 'HRV', 191, 0),
(57, 'Cuba', 'CU', 'CUB', 192, 0),
(58, 'Cura', 'CW', 'CUW', 531, 0),
(59, 'Cyprus', 'CY', 'CYP', 196, 1),
(60, 'Czech Republic', 'CZ', 'CZE', 203, 0),
(61, 'Denmark', 'DK', 'DNK', 208, 1),
(62, 'Djibouti', 'DJ', 'DJI', 262, 0),
(63, 'Dominica', 'DM', 'DMA', 212, 0),
(64, 'Dominican Republic', 'DO', 'DOM', 214, 1),
(65, 'Ecuador', 'EC', 'ECU', 218, 0),
(66, 'Egypt', 'EG', 'EGY', 818, 0),
(67, 'El Salvador', 'SV', 'SLV', 222, 0),
(68, 'Equatorial Guinea', 'GQ', 'GNQ', 226, 0),
(69, 'Eritrea', 'ER', 'ERI', 232, 0),
(70, 'Estonia', 'EE', 'EST', 233, 1),
(71, 'Ethiopia', 'ET', 'ETH', 231, 0),
(72, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 238, 0),
(73, 'Faroe Islands', 'FO', 'FRO', 234, 0),
(74, 'Fiji', 'FJ', 'FJI', 242, 0),
(75, 'Finland', 'FI', 'FIN', 246, 1),
(76, 'France', 'FR', 'FRA', 250, 1),
(77, 'French Guiana', 'GF', 'GUF', 254, 0),
(78, 'French Polynesia', 'PF', 'PYF', 258, 0),
(79, 'French Southern Territories', 'TF', 'ATF', 260, 0),
(80, 'Gabon', 'GA', 'GAB', 266, 0),
(81, 'Gambia', 'GM', 'GMB', 270, 0),
(82, 'Georgia', 'GE', 'GEO', 268, 0),
(83, 'Germany', 'DE', 'DEU', 276, 1),
(84, 'Ghana', 'GH', 'GHA', 288, 1),
(85, 'Gibraltar', 'GI', 'GIB', 292, 0),
(86, 'Greece', 'GR', 'GRC', 300, 1),
(87, 'Greenland', 'GL', 'GRL', 304, 0),
(88, 'Grenada', 'GD', 'GRD', 308, 0),
(89, 'Guadeloupe', 'GP', 'GLP', 312, 0),
(90, 'Guam', 'GU', 'GUM', 316, 0),
(91, 'Guatemala', 'GT', 'GTM', 320, 0),
(92, 'Guernsey', 'GG', 'GGY', 831, 0),
(93, 'Guinea', 'GN', 'GIN', 324, 0),
(94, 'Guinea-Bissau', 'GW', 'GNB', 624, 0),
(95, 'Guyana', 'GY', 'GUY', 328, 0),
(96, 'Haiti', 'HT', 'HTI', 332, 0),
(97, 'Heard Island and McDonald Islands', 'HM', 'HMD', 334, 0),
(98, 'Holy See (Vatican City State)', 'VA', 'VAT', 336, 0),
(99, 'Honduras', 'HN', 'HND', 340, 0),
(100, 'Hong Kong', 'HK', 'HKG', 344, 1),
(101, 'Hungary', 'HU', 'HUN', 348, 1),
(102, 'Iceland', 'IS', 'ISL', 352, 1),
(103, 'India', 'IN', 'IND', 356, 1),
(104, 'Indonesia', 'ID', 'IDN', 360, 0),
(105, 'Iran, Islamic Republic of', 'IR', 'IRN', 364, 0),
(106, 'Iraq', 'IQ', 'IRQ', 368, 0),
(107, 'Ireland', 'IE', 'IRL', 372, 0),
(108, 'Isle of Man', 'IM', 'IMN', 833, 0),
(109, 'Israel', 'IL', 'ISR', 376, 0),
(110, 'Italy', 'IT', 'ITA', 380, 1),
(111, 'Jamaica', 'JM', 'JAM', 388, 0),
(112, 'Japan', 'JP', 'JPN', 392, 1),
(113, 'Jersey', 'JE', 'JEY', 832, 0),
(114, 'Jordan', 'JO', 'JOR', 400, 0),
(115, 'Kazakhstan', 'KZ', 'KAZ', 398, 0),
(116, 'Kenya', 'KE', 'KEN', 404, 1),
(117, 'Kiribati', 'KI', 'KIR', 296, 0),
(118, 'Korea, Democratic People''s Republic of', 'KP', 'PRK', 408, 0),
(119, 'Korea, Republic of', 'KR', 'KOR', 410, 1),
(120, 'Kuwait', 'KW', 'KWT', 414, 0),
(121, 'Kyrgyzstan', 'KG', 'KGZ', 417, 0),
(122, 'Lao People''s Democratic Republic', 'LA', 'LAO', 418, 0),
(123, 'Latvia', 'LV', 'LVA', 428, 1),
(124, 'Lebanon', 'LB', 'LBN', 422, 1),
(125, 'Lesotho', 'LS', 'LSO', 426, 0),
(126, 'Liberia', 'LR', 'LBR', 430, 0),
(127, 'Libya', 'LY', 'LBY', 434, 0),
(128, 'Liechtenstein', 'LI', 'LIE', 438, 0),
(129, 'Lithuania', 'LT', 'LTU', 440, 0),
(130, 'Luxembourg', 'LU', 'LUX', 442, 1),
(131, 'Macao', 'MO', 'MAC', 446, 0),
(132, 'Macedonia', 'MK', 'MKD', 807, 1),
(133, 'Madagascar', 'MG', 'MDG', 450, 0),
(134, 'Malawi', 'MW', 'MWI', 454, 1),
(135, 'Malaysia', 'MY', 'MYS', 458, 0),
(136, 'Maldives', 'MV', 'MDV', 462, 0),
(137, 'Mali', 'ML', 'MLI', 466, 0),
(138, 'Malta', 'MT', 'MLT', 470, 1),
(139, 'Marshall Islands', 'MH', 'MHL', 584, 0),
(140, 'Martinique', 'MQ', 'MTQ', 474, 0),
(141, 'Mauritania', 'MR', 'MRT', 478, 0),
(142, 'Mauritius', 'MU', 'MUS', 480, 1),
(143, 'Mayotte', 'YT', 'MYT', 175, 0),
(144, 'Mexico', 'MX', 'MEX', 484, 0),
(145, 'Micronesia, Federated States of', 'FM', 'FSM', 583, 0),
(146, 'Moldova, Republic of', 'MD', 'MDA', 498, 1),
(147, 'Monaco', 'MC', 'MCO', 492, 0),
(148, 'Mongolia', 'MN', 'MNG', 496, 0),
(149, 'Montenegro', 'ME', 'MNE', 499, 0),
(150, 'Montserrat', 'MS', 'MSR', 500, 0),
(151, 'Morocco', 'MA', 'MAR', 504, 0),
(152, 'Mozambique', 'MZ', 'MOZ', 508, 0),
(153, 'Myanmar', 'MM', 'MMR', 104, 0),
(154, 'Namibia', 'NA', 'NAM', 516, 0),
(155, 'Nauru', 'NR', 'NRU', 520, 0),
(156, 'Nepal', 'NP', 'NPL', 524, 0),
(157, 'Netherlands', 'NL', 'NLD', 528, 1),
(158, 'New Caledonia', 'NC', 'NCL', 540, 0),
(159, 'New Zealand', 'NZ', 'NZL', 554, 0),
(160, 'Nicaragua', 'NI', 'NIC', 558, 0),
(161, 'Niger', 'NE', 'NER', 562, 0),
(162, 'Nigeria', 'NG', 'NGA', 566, 0),
(163, 'Niue', 'NU', 'NIU', 570, 0),
(164, 'Norfolk Island', 'NF', 'NFK', 574, 0),
(165, 'Northern Mariana Islands', 'MP', 'MNP', 580, 0),
(166, 'Norway', 'NO', 'NOR', 578, 1),
(167, 'Oman', 'OM', 'OMN', 512, 0),
(168, 'Pakistan', 'PK', 'PAK', 586, 0),
(169, 'Palau', 'PW', 'PLW', 585, 0),
(170, 'Palestine, State of', 'PS', 'PSE', 275, 0),
(171, 'Panama', 'PA', 'PAN', 591, 0),
(172, 'Papua New Guinea', 'PG', 'PNG', 598, 0),
(173, 'Paraguay', 'PY', 'PRY', 600, 0),
(174, 'Peru', 'PE', 'PER', 604, 0),
(175, 'Philippines', 'PH', 'PHL', 608, 1),
(176, 'Pitcairn', 'PN', 'PCN', 612, 0),
(177, 'Poland', 'PL', 'POL', 616, 0),
(178, 'Portugal', 'PT', 'PRT', 620, 1),
(179, 'Puerto Rico', 'PR', 'PRI', 630, 0),
(180, 'Qatar', 'QA', 'QAT', 634, 0),
(181, 'Réunion', 'RE', 'REU', 638, 0),
(182, 'Romania', 'RO', 'ROU', 642, 1),
(183, 'Russian Federation', 'RU', 'RUS', 643, 1),
(184, 'Rwanda', 'RW', 'RWA', 646, 0),
(185, 'Saint Barthélemy', 'BL', 'BLM', 652, 0),
(186, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN', 654, 0),
(187, 'Saint Kitts and Nevis', 'KN', 'KNA', 659, 0),
(188, 'Saint Lucia', 'LC', 'LCA', 662, 0),
(189, 'Saint Martin (French part)', 'MF', 'MAF', 663, 0),
(190, 'Saint Pierre and Miquelon', 'PM', 'SPM', 666, 0),
(191, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 670, 0),
(192, 'Samoa', 'WS', 'WSM', 882, 0),
(193, 'San Marino', 'SM', 'SMR', 674, 1),
(194, 'Sao Tome and Principe', 'ST', 'STP', 678, 0),
(195, 'Saudi Arabia', 'SA', 'SAU', 682, 0),
(196, 'Senegal', 'SN', 'SEN', 686, 0),
(197, 'Serbia', 'RS', 'SRB', 688, 0),
(198, 'Seychelles', 'SC', 'SYC', 690, 0),
(199, 'Sierra Leone', 'SL', 'SLE', 694, 0),
(200, 'Singapore', 'SG', 'SGP', 702, 1),
(201, 'Sint Maarten (Dutch part)', 'SX', 'SXM', 534, 0),
(202, 'Slovakia', 'SK', 'SVK', 703, 1),
(203, 'Slovenia', 'SI', 'SVN', 705, 1),
(204, 'Solomon Islands', 'SB', 'SLB', 90, 0),
(205, 'Somalia', 'SO', 'SOM', 706, 0),
(206, 'South Africa', 'ZA', 'ZAF', 710, 1),
(207, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 239, 0),
(208, 'South Sudan', 'SS', 'SSD', 728, 0),
(209, 'Spain', 'ES', 'ESP', 724, 1),
(210, 'Sri Lanka', 'LK', 'LKA', 144, 0),
(211, 'Sudan', 'SD', 'SDN', 729, 0),
(212, 'Suriname', 'SR', 'SUR', 740, 0),
(213, 'Svalbard and Jan Mayen', 'SJ', 'SJM', 744, 0),
(214, 'Swaziland', 'SZ', 'SWZ', 748, 0),
(215, 'Sweden', 'SE', 'SWE', 752, 1),
(216, 'Switzerland', 'CH', 'CHE', 756, 1),
(217, 'Syrian Arab Republic', 'SY', 'SYR', 760, 0),
(218, 'Taiwan, Province of China', 'TW', 'TWN', 158, 0),
(219, 'Tajikistan', 'TJ', 'TJK', 762, 0),
(220, 'Tanzania, United Republic of', 'TZ', 'TZA', 834, 0),
(221, 'Thailand', 'TH', 'THA', 764, 1),
(222, 'Timor-Leste', 'TL', 'TLS', 626, 0),
(223, 'Togo', 'TG', 'TGO', 768, 0),
(224, 'Tokelau', 'TK', 'TKL', 772, 0),
(225, 'Tonga', 'TO', 'TON', 776, 0),
(226, 'Trinidad and Tobago', 'TT', 'TTO', 780, 0),
(227, 'Tunisia', 'TN', 'TUN', 788, 0),
(228, 'Turkey', 'TR', 'TUR', 792, 0),
(229, 'Turkmenistan', 'TM', 'TKM', 795, 0),
(230, 'Turks and Caicos Islands', 'TC', 'TCA', 796, 0),
(231, 'Tuvalu', 'TV', 'TUV', 798, 0),
(232, 'Uganda', 'UG', 'UGA', 800, 0),
(233, 'Ukraine', 'UA', 'UKR', 804, 0),
(234, 'United Arab Emirates', 'AE', 'ARE', 784, 1),
(235, 'United Kingdom', 'GB', 'GBR', 826, 1),
(236, 'United States', 'US', 'USA', 840, 1),
(237, 'United States Minor Outlying Islands', 'UM', 'UMI', 581, 0),
(238, 'Uruguay', 'UY', 'URY', 858, 0),
(239, 'Uzbekistan', 'UZ', 'UZB', 860, 0),
(240, 'Vanuatu', 'VU', 'VUT', 548, 0),
(241, 'Venezuela, Bolivarian Republic of', 'VE', 'VEN', 862, 0),
(242, 'Viet Nam', 'VN', 'VNM', 704, 0),
(243, 'Virgin Islands, British', 'VG', 'VGB', 92, 0),
(244, 'Virgin Islands, U.S.', 'VI', 'VIR', 850, 0),
(245, 'Wallis and Futuna', 'WF', 'WLF', 876, 0),
(246, 'Western Sahara', 'EH', 'ESH', 732, 0),
(247, 'Yemen', 'YE', 'YEM', 887, 0),
(248, 'Zambia', 'ZM', 'ZMB', 894, 0),
(249, 'Zimbabwe', 'ZW', 'ZWE', 716, 0);

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_area`
--

CREATE TABLE IF NOT EXISTS `gmaps_area` (
  `id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text,
  `lat` text NOT NULL,
  `lng` text NOT NULL,
  `color` varchar(64) DEFAULT NULL,
  `width` smallint(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_area_category`
--

CREATE TABLE IF NOT EXISTS `gmaps_area_category` (
  `id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_area_point`
--

CREATE TABLE IF NOT EXISTS `gmaps_area_point` (
  `id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `point_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_category`
--

CREATE TABLE IF NOT EXISTS `gmaps_category` (
  `id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `description` text
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gmaps_category`
--

INSERT INTO `gmaps_category` (`id`, `instance`, `name`, `slug`, `description`) VALUES
(1, 10, 'Sedi', 'sedi', NULL),
(2, 10, 'Stabilimenti', 'stabilimenti', NULL),
(3, 10, 'Importatori', 'importatori', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_map`
--

CREATE TABLE IF NOT EXISTS `gmaps_map` (
  `id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text,
  `width` varchar(32) NOT NULL,
  `height` varchar(32) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gmaps_map`
--

INSERT INTO `gmaps_map` (`id`, `instance`, `name`, `slug`, `description`, `width`, `height`) VALUES
(1, 10, 'Nel mondo', 'nel-mondo', '', '100%', '100%');

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_map_area`
--

CREATE TABLE IF NOT EXISTS `gmaps_map_area` (
  `id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_map_path`
--

CREATE TABLE IF NOT EXISTS `gmaps_map_path` (
  `id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_map_point`
--

CREATE TABLE IF NOT EXISTS `gmaps_map_point` (
  `id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `point_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gmaps_map_point`
--

INSERT INTO `gmaps_map_point` (`id`, `map_id`, `point_id`) VALUES
(4, 1, 2),
(3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_marker`
--

CREATE TABLE IF NOT EXISTS `gmaps_marker` (
  `id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `icon` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_opt`
--

CREATE TABLE IF NOT EXISTS `gmaps_opt` (
  `id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `default_map_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_path`
--

CREATE TABLE IF NOT EXISTS `gmaps_path` (
  `id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text,
  `lat` text NOT NULL,
  `lng` text NOT NULL,
  `color` varchar(64) DEFAULT NULL,
  `width` smallint(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_path_category`
--

CREATE TABLE IF NOT EXISTS `gmaps_path_category` (
  `id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_path_point`
--

CREATE TABLE IF NOT EXISTS `gmaps_path_point` (
  `id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `point_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_point`
--

CREATE TABLE IF NOT EXISTS `gmaps_point` (
  `id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cap` varchar(16) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `nation` smallint(6) DEFAULT NULL,
  `marker` smallint(6) DEFAULT NULL,
  `lat` varchar(255) NOT NULL,
  `lng` varchar(255) NOT NULL,
  `description` text,
  `phone` varchar(64) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `web` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gmaps_point`
--

INSERT INTO `gmaps_point` (`id`, `instance`, `name`, `slug`, `address`, `cap`, `city`, `nation`, `marker`, `lat`, `lng`, `description`, `phone`, `email`, `web`) VALUES
(1, 10, 'Citterio Brasile', 'citterio-brasile', 'Rua Belo Horizonte, 260', NULL, 'Aleixo - Manaus (AM)', 24, NULL, '-3.1066223', '-60.0111053', '', '(92) 3642-9633', 'mapel@vivax.com.br', NULL),
(2, 10, 'Citterio', 'citterio', 'Corso Europa 206', '20017', 'Rho', 83, NULL, '45.5333842', '9.04041589999997', '', '(+39) 02 935161', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_point_attachment`
--

CREATE TABLE IF NOT EXISTS `gmaps_point_attachment` (
  `id` int(11) NOT NULL,
  `point_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `file` varchar(255) NOT NULL,
  `filesize` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_point_category`
--

CREATE TABLE IF NOT EXISTS `gmaps_point_category` (
  `id` int(11) NOT NULL,
  `point_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gmaps_point_category`
--

INSERT INTO `gmaps_point_category` (`id`, `point_id`, `category_id`) VALUES
(1, 1, 2),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_point_image`
--

CREATE TABLE IF NOT EXISTS `gmaps_point_image` (
  `id` int(11) NOT NULL,
  `point_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_point_service`
--

CREATE TABLE IF NOT EXISTS `gmaps_point_service` (
  `id` int(11) NOT NULL,
  `point_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_point_video`
--

CREATE TABLE IF NOT EXISTS `gmaps_point_video` (
  `id` int(11) NOT NULL,
  `point_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `platform` smallint(6) NOT NULL,
  `code` varchar(64) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `thumb` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gmaps_service`
--

CREATE TABLE IF NOT EXISTS `gmaps_service` (
  `id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `instruments`
--

CREATE TABLE IF NOT EXISTS `instruments` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `order_list` smallint(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `instruments`
--

INSERT INTO `instruments` (`id`, `name`, `description`, `order_list`) VALUES
(1, 'Collegamenti', 'Elenco interfacce e pagine disponibili', 1),
(2, 'Mime-Type', 'Elenco dei mime type con le estensioni di riferimento', 2);

-- --------------------------------------------------------

--
-- Table structure for table `instruments_opt`
--

CREATE TABLE IF NOT EXISTS `instruments_opt` (
  `id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `title` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `id` int(2) NOT NULL,
  `label` varchar(10) NOT NULL,
  `language` varchar(50) NOT NULL DEFAULT '',
  `language_code` varchar(5) NOT NULL DEFAULT '',
  `country_code` varchar(5) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `label`, `language`, `language_code`, `country_code`, `active`) VALUES
(1, 'ITA', 'italiano', 'it', 'IT', 1),
(2, 'ENG', 'english', 'en', 'US', 1),
(3, 'ESP', 'espanol', 'es', 'ES', 1),
(4, 'FRA', 'français', 'fr', 'FR', 1),
(5, 'DEU', 'Tedesco', 'de', 'DE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `language_opt`
--

CREATE TABLE IF NOT EXISTS `language_opt` (
  `id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `opt_flag` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language_opt`
--

INSERT INTO `language_opt` (`id`, `instance`, `title`, `opt_flag`) VALUES
(1, 0, 'Lingue', 1);

-- --------------------------------------------------------

--
-- Table structure for table `language_translation`
--

CREATE TABLE IF NOT EXISTS `language_translation` (
  `tbl_id_value` int(11) DEFAULT NULL,
  `tbl` varchar(200) DEFAULT NULL,
  `field` varchar(200) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language_translation`
--

INSERT INTO `language_translation` (`tbl_id_value`, `tbl`, `field`, `language`, `text`) VALUES
(1, 'page_layout', 'name', 'en_US', 'visual editor'),
(2, 'page_layout', 'name', 'en_US', 'media (image/video)'),
(3, 'page_layout', 'name', 'en_US', 'media left - editor right'),
(4, 'page_layout', 'name', 'en_US', 'editor left - media right'),
(5, 'page_layout', 'name', 'en_US', 'link to file'),
(8, 'page_layout', 'name', 'en_US', 'by file'),
(9, 'page_layout', 'name', 'en_US', 'by html code'),
(1, 'sys_conf', 'head_title', 'en_US', 'GINO ENG'),
(1, 'sys_module_app', 'label', 'en_US', 'Settings'),
(1, 'sys_conf', 'head_title', 'es_ES', 'ESP'),
(1, 'sys_conf', 'head_title', 'fr_FR', 'FRENCH'),
(4, 'sys_module', 'label', 'en_US', 'Main menu'),
(10, 'sys_graphics', 'description', 'en_US', 'footer engli'),
(10, 'sys_graphics', 'html', 'en_US', 'textarea english f'),
(10, 'sys_graphics', 'html', 'en_US', 'textarea english f'),
(4, 'language_opt', 'title', 'en_US', 'Languages'),
(4, 'language_opt', 'title', 'es_ES', 'Idiomas'),
(34, 'catalogue_treeitem', 'name', 'it_IT', NULL),
(887, 'catalogue_product', 'sector', 'en_US', 'perfect'),
(887, 'catalogue_product', 'sector', 'fr_FR', 'te'),
(887, 'catalogue_product', 'sector', 'es_ES', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nation`
--

CREATE TABLE IF NOT EXISTS `nation` (
  `id` smallint(4) NOT NULL,
  `it_IT` varchar(100) NOT NULL,
  `en_US` varchar(100) NOT NULL,
  `fr_FR` varchar(100) NOT NULL,
  `onu` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nation`
--

INSERT INTO `nation` (`id`, `it_IT`, `en_US`, `fr_FR`, `onu`) VALUES
(1, 'Afghanistan', 'Afghanistan', 'Afghanistan', '1946-11-19'),
(2, 'Albania', 'Albania', 'Albanie', '1955-12-14'),
(3, 'Algeria', 'Algeria', 'Algérie', '1962-10-08'),
(4, 'Andorra', 'Andorra', 'Andorre', '1993-07-28'),
(5, 'Angola', 'Angola', 'Angola', '1976-12-01'),
(6, 'Antigua and Barbuda', 'Antigua and Barbuda', 'Antigua-et-Barbuda', '1981-11-11'),
(7, 'Argentina', 'Argentina', 'Argentine', '1945-10-24'),
(8, 'Armenia', 'Armenia', 'Arménie', '1992-03-02'),
(9, 'Australia', 'Australia', 'Australie', '1945-11-01'),
(10, 'Austria', 'Austria', 'Autriche', '1955-12-14'),
(11, 'Azerbaijan', 'Azerbaijan', 'Azerbaïdjan', '1992-03-02'),
(12, 'Bahamas', 'Bahamas', 'Bahamas', '1973-09-18'),
(13, 'Bahrein', 'Bahrain', 'Bahreïn', '1971-09-21'),
(14, 'Bangladesh', 'Bangladesh', 'Bangladesh', '1974-09-17'),
(15, 'Barbados', 'Barbados', 'Barbade', '1966-12-09'),
(16, 'Bielorussia', 'Belarus', 'Bélarus', '1945-10-24'),
(17, 'Belgio', 'Belgium', 'Belgique', '1945-12-27'),
(18, 'Belize', 'Belize', 'Belize', '1981-09-25'),
(19, 'Benin', 'Benin', 'Bénin', '1960-09-20'),
(20, 'Bhutan', 'Bhutan', 'Bhoutan', '1971-09-21'),
(21, 'Bolivia', 'Bolivia', 'Bolivie', '1945-11-14'),
(22, 'Bosnia Erzegovina', 'Bosnia and Herzegovina', 'Bosnie-Herzégovine', '1992-05-22'),
(23, 'Botswana', 'Botswana', 'Botswana', '1966-10-17'),
(24, 'Brasile', 'Brazil', 'Brésil', '1945-10-24'),
(25, 'Brunei Darussalam', 'Brunei Darussalam', 'Brunéi Darussalam', '1984-09-21'),
(26, 'Bulgaria', 'Bulgaria', 'Bulgarie', '1955-12-14'),
(27, 'Burkina Faso', 'Burkina Faso', 'Burkina Faso', '1960-09-20'),
(28, 'Burundi', 'Burundi', 'Burundi', '1962-09-18'),
(29, 'Cambogia', 'Cambodia', 'Cambodge', '1955-12-14'),
(30, 'Camerun', 'Cameroon', 'Cameroun', '1960-09-20'),
(31, 'Canada', 'Canada', 'Canada', '1945-11-09'),
(32, 'Capo Verde', 'Cape Verde', 'Cap-Vert', '1975-09-16'),
(33, 'Repubblica Centrafricana', 'Central African Republic', 'République centrafricaine', '1960-09-20'),
(34, 'Ciad', 'Chad', 'Tchad', '1960-09-20'),
(35, 'Cile', 'Chile', 'Chili', '1945-10-24'),
(36, 'Cina', 'China', 'Chine', '1945-10-24'),
(37, 'Colombia', 'Colombia', 'Colombie', '1945-11-05'),
(38, 'Comore', 'Comoros', 'Comores', '1975-11-12'),
(39, 'Congo', 'Congo (Republic of the)', 'Congo', '1960-09-20'),
(40, 'Costa Rica', 'Costa Rica', 'Costa Rica', '1945-11-02'),
(41, 'Costa d''Avorio', 'Côte d''Ivoire', 'Côte d''Ivoire', '1960-09-20'),
(42, 'Croazia', 'Croatia', 'Croatie', '1992-05-22'),
(43, 'Cuba', 'Cuba', 'Cuba', '1945-10-24'),
(44, 'Cipro', 'Cyprus', 'Chypre', '1960-09-20'),
(45, 'Repubblica Ceca', 'Czech Republic', 'République tchèque', '1993-01-19'),
(46, 'Repubblica Democratica Popolare di Corea', 'Democratic People''s Republic of Korea', 'République populaire démocratique de Corée', '1991-09-17'),
(47, 'Repubblica Democratica del Congo', 'Democratic Republic of the Congo', 'République démocratique du Congo', '1960-09-20'),
(48, 'Danimarca', 'Denmark', 'Danemark', '1945-10-24'),
(49, 'Gibuti', 'Djibouti', 'Djibouti', '1977-09-20'),
(50, 'Dominica', 'Dominica', 'Dominique', '1978-12-18'),
(51, 'Repubblica Dominicana', 'Dominican Republic', 'République dominicaine', '1945-10-24'),
(52, 'Ecuador', 'Ecuador', 'Equateur', '1945-12-21'),
(53, 'Egitto', 'Egypt', 'Égypte', '1945-10-24'),
(54, 'El Salvador', 'El Salvador', 'El Salvador', '1945-10-24'),
(55, 'Guinea Equatoriale', 'Equatorial Guinea', 'Guinée équatoriale', '1968-11-12'),
(56, 'Eritrea', 'Eritrea', 'Érythrée', '1993-05-28'),
(57, 'Estonia', 'Estonia', 'Estonie', '1991-09-17'),
(58, 'Etiopia', 'Ethiopia', 'Éthiopie', '1945-11-13'),
(59, 'Figi', 'Fiji', 'Fidji', '1970-10-13'),
(60, 'Finlandia', 'Finland', 'Finlande', '1955-12-14'),
(61, 'Francia', 'France', 'France', '1945-10-24'),
(62, 'Gabon', 'Gabon', 'Gabon', '1960-09-20'),
(63, 'Gambia', 'Gambia', 'Gambie', '1965-09-21'),
(64, 'Georgia', 'Georgia', 'Géorgie', '1992-07-31'),
(65, 'Germania', 'Germany', 'Allemagne', '1973-09-18'),
(66, 'Ghana', 'Ghana', 'Ghana', '1957-03-08'),
(67, 'Grecia', 'Greece', 'Grèce', '1945-10-25'),
(68, 'Grenada', 'Grenada', 'Grenade', '1974-09-17'),
(69, 'Guatemala', 'Guatemala', 'Guatemala', '1945-11-21'),
(70, 'Guinea', 'Guinea', 'Guineé', '1958-12-12'),
(71, 'Guinea-Bissau', 'Guinea-Bissau', 'Guinée-Bissau', '1974-09-17'),
(72, 'Guyana', 'Guyana', 'Guyana', '1966-09-20'),
(73, 'Haiti', 'Haiti', 'Haïti', '1945-10-24'),
(74, 'Honduras', 'Honduras', 'Honduras', '1945-12-17'),
(75, 'Ungheria', 'Hungary', 'Hongrie', '1955-12-14'),
(76, 'Islanda', 'Iceland', 'Islande', '1946-11-19'),
(77, 'India', 'India', 'Inde', '1945-10-30'),
(78, 'Indonesia', 'Indonesia', 'Indonésie', '1950-09-28'),
(79, 'Iran', 'Iran (Islamic Republic of)', 'Iran', '1945-10-24'),
(80, 'Iraq', 'Iraq', 'Iraq', '1945-12-21'),
(81, 'Irlanda', 'Ireland', 'Irlande', '1955-12-14'),
(82, 'Israele', 'Israel', 'Israël', '1949-05-11'),
(83, 'Italia', 'Italy', 'Italie', '1955-12-14'),
(84, 'Giamaica', 'Jamaica', 'Jamaïque', '1962-09-18'),
(85, 'Giappone', 'Japan', 'Japon', '1956-12-18'),
(86, 'Giordania', 'Jordan', 'Jordanie', '1955-12-14'),
(87, 'Kazakistan', 'Kazakhstan', 'Kazakhstan', '1992-03-02'),
(88, 'Kenya', 'Kenya', 'Kenya', '1963-12-16'),
(89, 'Kiribati', 'Kiribati', 'Kiribati', '1999-09-14'),
(90, 'Kuwait', 'Kuwait', 'Koweït', '1963-05-14'),
(91, 'Kirghizistan', 'Kyrgyzstan', 'Kirghizistan', '1992-03-02'),
(92, 'Repubblica Popolare Democratica del Laos', 'Lao People''s Democratic Republic', 'République démocratique populaire lao', '1955-12-14'),
(93, 'Lettonia', 'Latvia', 'Lettonie', '1991-09-17'),
(94, 'Libano', 'Lebanon', 'Liban', '1945-10-24'),
(95, 'Lesotho', 'Lesotho', 'Lesotho', '1966-10-17'),
(96, 'Liberia', 'Liberia', 'Libéria', '1945-11-02'),
(97, 'Jam_h_riyya Araba di Libia', 'Libyan Arab Jamahiriya', 'Jamahiriya arabe libyenne', '1955-12-14'),
(98, 'Liechtenstein', 'Liechtenstein', 'Liechtenstein', '1990-09-18'),
(99, 'Lituania', 'Lithuania', 'Lituanie', '1991-09-17'),
(100, 'Lussemburgo', 'Luxembourg', 'Luxembourg', '1945-10-24'),
(101, 'Madagascar', 'Madagascar', 'Madagascar', '1960-09-20'),
(102, 'Malawi', 'Malawi', 'Malawi', '1964-12-01'),
(103, 'Malesia', 'Malaysia', 'Malaisie', '1957-09-17'),
(104, 'Maldive', 'Maldives', 'Maldives', '1965-09-21'),
(105, 'Mali', 'Mali', 'Mali', '1960-09-28'),
(106, 'Malta', 'Malta', 'Malte', '1964-12-01'),
(107, 'Isole Marshall', 'Marshall Islands', 'Îles Marshall', '1991-09-17'),
(108, 'Mauritania', 'Mauritania', 'Mauritanie', '1961-10-27'),
(109, 'Mauritius', 'Mauritius', 'Maurice', '1968-04-24'),
(110, 'Messico', 'Mexico', 'Mexique', '1945-11-07'),
(111, 'Micronesia', 'Micronesia (Federated States of)', 'Micronésie', '1991-09-17'),
(112, 'Monaco', 'Monaco', 'Monaco', '1993-05-28'),
(113, 'Mongolia', 'Mongolia', 'Mongolie', '1961-10-27'),
(114, 'Montenegro', 'Montenegro', 'Montenegro', '2006-06-28'),
(115, 'Marocco', 'Morocco', 'Maroc', '1956-11-12'),
(116, 'Mozambico', 'Mozambique', 'Mozambique', '1975-09-16'),
(117, 'Myanmar', 'Myanmar', 'Myanmar', '1948-04-19'),
(118, 'Namibia', 'Namibia', 'Namibie', '1990-04-23'),
(119, 'Nauru', 'Nauru', 'Nauru', '1999-09-14'),
(120, 'Nepal', 'Nepal', 'Népal', '1955-12-14'),
(121, 'Paesi Bassi', 'Netherlands', 'Pays-Bas', '1945-12-10'),
(122, 'Nuova Zelanda', 'New Zealand', 'Nouvelle-Zélande', '1945-10-24'),
(123, 'Nicaragua', 'Nicaragua', 'Nicaragua', '1945-10-24'),
(124, 'Niger', 'Niger', 'Niger', '1960-09-20'),
(125, 'Nigeria', 'Nigeria', 'Nigéria', '1960-10-07'),
(126, 'Norvegia', 'Norway', 'Norvège', '1945-11-27'),
(127, 'Oman', 'Oman', 'Oman', '1971-10-07'),
(128, 'Pakistan', 'Pakistan', 'Pakistan', '1947-09-30'),
(129, 'Palau', 'Palau', 'Palaos', '1994-12-15'),
(130, 'Panama', 'Panama', 'Panama', '1945-11-13'),
(131, 'Papua Nuova Guinea', 'Papua New Guinea', 'Papouasie-Nouvelle-Guinée', '1975-10-10'),
(132, 'Paraguay', 'Paraguay', 'Paraguay', '1945-10-24'),
(133, 'Peru', 'Peru', 'Pérou', '1945-10-31'),
(134, 'Filippine', 'Philippines', 'Philippines', '1945-10-24'),
(135, 'Polonia', 'Poland', 'Pologne', '1945-10-24'),
(136, 'Portogallo', 'Portugal', 'Portugal', '1955-12-14'),
(137, 'Qatar', 'Qatar', 'Qatar', '1971-09-21'),
(138, 'Repubblica di Corea', 'Republic of Korea', 'République de Corée', '1991-09-17'),
(139, 'Repubblica di Moldova', 'Republic of Moldova', 'République de Moldova', '1992-03-02'),
(140, 'Romania', 'Romania', 'Roumanie', '1955-12-14'),
(141, 'Federazione Russa', 'Russian Federation', 'Fédération de Russie', '1945-10-24'),
(142, 'Ruanda', 'Rwanda', 'Rwanda', '1962-09-18'),
(143, 'Saint Kitts e Nevis', 'Saint Kitts and Nevis', 'Saint-Kitts-et-Nevis', '1983-09-23'),
(144, 'Santa Lucia', 'Saint Lucia', 'Sainte-Lucie', '1979-09-18'),
(145, 'Saint Vincent e le Grenadine', 'Saint Vincent and the Grenadines', 'Saint-Vincent-et-les-Grenadines', '1980-09-16'),
(146, 'Samoa', 'Samoa', 'Samoa', '1976-12-15'),
(147, 'San Marino', 'San Marino', 'Saint-Marin', '1992-03-02'),
(148, 'Sao Tome e Principe', 'Sao Tome and Principe', 'Sao Tomé-et-Principe', '1975-09-16'),
(149, 'Arabia Saudita', 'Saudi Arabia', 'Arabie saoudite', '1945-10-24'),
(150, 'Senegal', 'Senegal', 'Sénégal', '1960-09-28'),
(151, 'Serbia', 'Serbia', 'Serbie', '2000-11-01'),
(152, 'Seychelles', 'Seychelles', 'Seychelles', '1976-09-21'),
(153, 'Sierra Leone', 'Sierra Leone', 'Sierra Leone', '1961-09-27'),
(154, 'Singapore', 'Singapore', 'Singapour', '1965-09-21'),
(155, 'Slovacchia', 'Slovakia', 'Slovaquie', '1993-01-19'),
(156, 'Slovenia', 'Slovenia', 'Slovénie', '1992-05-22'),
(157, 'Isole Salomone', 'Solomon Islands', 'Îles Salomon', '1978-09-19'),
(158, 'Somalia', 'Somalia', 'Somalie', '1960-09-20'),
(159, 'Sud Africa', 'South Africa', 'Afrique du Sud', '1945-11-07'),
(160, 'Spagna', 'Spain', 'Espagne', '1955-12-14'),
(161, 'Sri Lanka', 'Sri Lanka', 'Sri Lanka', '1955-12-14'),
(162, 'Sudan', 'Sudan', 'Soudan', '1956-11-12'),
(163, 'Suriname', 'Suriname', 'Suriname', '1975-12-04'),
(164, 'Swaziland', 'Swaziland', 'Swaziland', '1968-09-24'),
(165, 'Svezia', 'Sweden', 'Suède', '1946-11-19'),
(166, 'Svizzera', 'Switzerland', 'Suisse', '2002-09-10'),
(167, 'Repubblica Araba di Siria', 'Syrian Arab Republic', 'République arabe syrienne', '1945-10-24'),
(168, 'Tagikistan', 'Tajikistan', 'Tadjikistan', '1992-03-02'),
(169, 'Tailandia', 'Thailand', 'Thaïlande', '1946-12-16'),
(170, 'Repubblica di Macedonia', 'The former Yugoslav Republic of Macedonia', 'ex-République yougoslave de Macédoine', '1993-04-08'),
(171, 'Timor Est', 'Timor-Leste', 'Timor oriental', '2002-09-27'),
(172, 'Togo', 'Togo', 'Togo', '1960-09-20'),
(173, 'Tonga', 'Tonga', 'Tonga', '1999-09-14'),
(174, 'Trinidad e Tobago', 'Trinidad and Tobago', 'Trinité-et-Tobago', '1962-09-18'),
(175, 'Tunisia', 'Tunisia', 'Tunisie', '1956-11-12'),
(176, 'Turchia', 'Turkey', 'Turquie', '1945-10-24'),
(177, 'Turkmenistan', 'Turkmenistan', 'Turkménistan', '1992-03-02'),
(178, 'Tuvalu', 'Tuvalu', 'Tuvalu', '2000-09-05'),
(179, 'Uganda', 'Uganda', 'Ouganda', '1962-10-25'),
(180, 'Ucraina', 'Ukraine', 'Ukraine', '1945-10-24'),
(181, 'Emirati Arabi Uniti', 'United Arab Emirates', 'Emirats arabes unis', '1971-12-09'),
(182, 'Regno Unito', 'United Kingdom of Great Britain and Northern Ireland', 'Royaume-Uni', '1945-10-24'),
(183, 'Tanzania', 'United Republic of Tanzania', 'Tanzanie', '1961-12-14'),
(184, 'Stati Uniti d''America', 'United States of America', 'Etats-Unis', '1945-10-24'),
(185, 'Uruguay', 'Uruguay', 'Uruguay', '1945-12-18'),
(186, 'Uzbekistan', 'Uzbekistan', 'Ouzbékistan', '1992-03-02'),
(187, 'Vanuatu', 'Vanuatu', 'Vanuatu', '1981-09-15'),
(188, 'Venezuela', 'Venezuela (Bolivarian Republic of)', 'Vénézuela', '1945-11-15'),
(189, 'Viet Nam', 'Viet Nam', 'Viet Nam', '1977-09-20'),
(190, 'Yemen', 'Yemen', 'Yémen', '1947-09-30'),
(191, 'Zambia', 'Zambia', 'Zambie', '1964-12-01'),
(192, 'Zimbabwe', 'Zimbabwe', 'Zimbabwe', '1980-08-25');

-- --------------------------------------------------------

--
-- Table structure for table `page_category`
--

CREATE TABLE IF NOT EXISTS `page_category` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` text,
  `date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page_category`
--

INSERT INTO `page_category` (`id`, `name`, `description`, `date`) VALUES
(1, 'Accademia', NULL, '2015-02-27 11:02:44'),
(2, 'Vivaio', NULL, '2015-03-24 10:45:54'),
(3, 'test', NULL, '2015-04-16 15:34:29');

-- --------------------------------------------------------

--
-- Table structure for table `page_comment`
--

CREATE TABLE IF NOT EXISTS `page_comment` (
  `id` int(11) NOT NULL,
  `entry` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `author` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `web` varchar(200) DEFAULT NULL,
  `text` text NOT NULL,
  `notification` tinyint(1) NOT NULL,
  `reply` int(11) DEFAULT NULL,
  `published` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `page_entry`
--

CREATE TABLE IF NOT EXISTS `page_entry` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  `last_edit_date` datetime NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `video_code` varchar(64) DEFAULT NULL,
  `text` text NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `enable_comments` tinyint(1) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `social` tinyint(1) NOT NULL,
  `private` tinyint(1) NOT NULL,
  `users` varchar(255) NOT NULL,
  `read` int(11) NOT NULL,
  `tpl_code` text,
  `box_tpl_code` text
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page_entry`
--

INSERT INTO `page_entry` (`id`, `category_id`, `author`, `creation_date`, `last_edit_date`, `title`, `slug`, `image`, `video_code`, `text`, `tags`, `enable_comments`, `published`, `social`, `private`, `users`, `read`, `tpl_code`, `box_tpl_code`) VALUES
(1, 1, 0, '2011-10-20 12:02:48', '2015-02-27 11:12:51', 'Accademia', 'accademia', 'citterio-accademia.jpg', NULL, '<p style="text-align: center;">\r\n	L''esperienza centenaria di Citterio della ''Salumeria Italiana''<br />\r\n	è la migliore garanzia della bontà e della qualità dei suoi prodotti.<br />\r\n	La sapienza degli esperti nella preparazione di antiche ricette<br />\r\n	e l''attenzione alle nuove esigenze dei consumatori<br />\r\n	sono i segreti delle sue rinomate specialità, che continuano<br />\r\n	a deliziare i più attenti buongustai.</p>', NULL, 0, 1, 0, 0, '', 61, '<h1 class="hidden">{{ title }}</h1>\r\n<p>{{ img|class:img-responsive center-block }}</p>\r\n{{ text }}', NULL),
(2, 1, 0, '2011-10-26 17:34:44', '2015-02-27 14:46:11', 'Terre di origine', 'terre-di-origine', NULL, NULL, '<p style="text-align: right;">\r\n	I prodotti della salumeria italiana sono conosciuti<br />\r\n	e apprezzati in tutto il mondo per la loro altissima qualità.<br />\r\n	Citterio si inserisce in questa produzione gastronomica di eccellenza e ti invita<br />\r\n	a percorrere un viaggio nella migliore tradizione della salumeria italiana.<br />\r\n	Un gustoso itinerario che passa attraverso le località di provenienza dei suoi prodotti:<br />\r\n	Vignola, Parma, San Daniele, la Valtellina, Milano e l''Alto Adige.<br />\r\n	Citterio ha scelto di produrre i suoi salumi proprio in questi luoghi<br />\r\n	perchè crede ne legame tra il territorio e le sue ricette.</p>', NULL, 0, 1, 0, 0, '', 63, '<h1 class="hidden">{{ title }}</h1>\r\n{{ text }}', NULL),
(3, 1, 0, '2011-10-28 15:17:39', '2015-04-16 16:39:44', 'San Daniele', 'san-daniele', NULL, NULL, '<div class="col-sm-5 col-xs-12">\r\n	<img class="youtube-thumb img-responsive" data-video="kZk-_6Bxpcg" src="http://img.youtube.com/vi/kZk-_6Bxpcg/hqdefault.jpg" /></div>\r\n<div class="col-sm-7 col-xs-12">\r\n	<b>San Daniele</b><br />\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vehicula vel turpis at tempor. Integer frin-<br />\r\n	gilla, nunc in euismod convallis, odio nulla vehicula orci, quis gravida metus justo at neque. Nam iaculis<br />\r\n	sit amet nulla accumsan luctus. Vivamus eu orci vel quam imperdiet vehicula vitae a lacus. Fusce viverra<br />\r\n	ligula sed velit rhoncus pharetra. Quisque non mauris eget ex condimentum tempor. Nam quis odio vitae<br />\r\n	nisl vulputate faucibus. Vestibulum tincidunt gravida dolor eget egestas.<br />\r\n	Sed felis massa, porta quis dictum ut, faucibus et ante. Nam non dignissim tellus. Pellentesque efficitur<br />\r\n	erat leo. Maecenas ultrices posuere neque nec molestie. Curabitur nec mattis nunc, condimentum<br />\r\n	tempus purus. Curabitur cursus, orci eu pulvinar convallis, mi enim lobortis odio, a facilisis erat nunc vel<br />\r\n	quam.</div>', NULL, 0, 1, 0, 0, '', 19, '<h1>{{ title }}</h1>\r\n{{ text }}', NULL),
(4, 2, 1, '2011-11-01 09:59:14', '2015-03-25 16:02:51', 'Piemonte', 'piemonte', NULL, NULL, '<p>\r\n	<img class="youtube-thumb" data-video="kZk-_6Bxpcg" src="http://img.youtube.com/vi/kZk-_6Bxpcg/hqdefault.jpg" style="width: 100%" /></p>\r\n<p style="text-align: justify;">\r\n	Piemonte integer volutpat varius turpis vitae consequat. Fusce massa risus, aliquam ut efficitur sed, consequat lobortis ex. Nulla nec dolor sit amet urna congue congue. Donec in tellus magna. Curabitur ut felis eu metus dapibus ultrices. Morbi risus neque, hendrerit eget tellus dictum, mattis pretium velit. Mauris at elit est. Vivamus vel est ac quam interdum consequat.</p>\r\n<p style="text-align: justify;">\r\n	Curabitur egestas molestie massa quis pellentesque. Quisque eu justo eget leo tincidunt bibendum. Duis lobortis mi in leo condimentum cursus. Donec gravida felis euismod sodales ultricies. Proin vehicula auctor sapien, ut iaculis erat vulputate laoreet. Integer posuere mollis lorem et mattis. Praesent pellentesque diam et congue consectetur. In dictum dui quis euismod dignissim. Aenean vel nisi nec lectus varius luctus eget vel dui. Morbi eleifend pulvinar turpis in feugiat. Aenean porttitor vehicula nunc quis viverra. Nullam eu facilisis massa. Praesent sed libero at dui lacinia scelerisque. Aliquam euismod magna a mi sodales consectetur.</p>', NULL, 0, 1, 0, 0, '', 8, '<h1 class="hidden">{{ title }}</h1>\r\n{{ text }}', NULL),
(5, 2, 0, '2011-11-08 14:05:57', '2015-03-24 10:50:44', 'Vivaio', 'vivaio', NULL, NULL, '<p style="text-align: right">\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vehicula vel turpis at tempor. Integer<br />\r\n	fringilla, nunc in euismod convallis, odio nulla vehicula orci,<br />\r\n	quis gravida metus justo at neque. Nam iaculis sit<br />\r\n	amet nulla accumsan luctus.<br />\r\n	Vivamus eu orci vel quam imperdiet vehicula vitae a lacus. Fusce viverra ligula sed velit rhoncus pha-<br />\r\n	retra. Quisque non mauris eget ex<br />\r\n	condimentum tempor. Nam quis odio vitae nisl vulputate faucibus.<br />\r\n	Vestibulum tincidunt gravida dolor eget egestas.<br />\r\n	Sed felis massa, porta quis dictum ut, faucibus et ante.<br />\r\n	Nam non dignissim tellus. Pellentesque efficitur erat leo. Maecenas ultrices<br />\r\n	posuere neque nec molestie.<br />\r\n	Curabitur nec mattis nunc, condimentum tempus purus.<br />\r\n	Curabitur cursus, orci eu pulvinar convallis,<br />\r\n	mi enim lobortis odio, a facilisis erat nunc vel quam.</p>', NULL, 0, 1, 0, 0, '', 38, '<div class="hidden">{{ title }}</div>\r\n<div class="row">\r\n    <div class="col-md-6 col-sm-12">\r\n        <div id="vivaio-svg-container"></div>\r\n         <script type="text/javascript" src="lib/js/vivaio.js"></script>\r\n         <script>\r\n             var dict = {\r\n                 ''piemonte'': {\r\n                     label: ''Piemonte'',\r\n                     slug: ''piemonte''\r\n                  },\r\n                 ''lombardia'': {\r\n                     label: ''Lombardia'',\r\n                     slug: ''lombardia''\r\n                  },\r\n             };\r\n             var svg = new vivaio.Svg(''vivaio-svg-container'', ''contents/attachment/accademia/VIVAIO.svg'', dict);\r\n          </script>\r\n    </div>\r\n    <div class="col-md-6 col-sm-12">\r\n        <div id="page-content">{{ text }}</div>\r\n    </div>\r\n</div>', NULL),
(7, 2, 0, '2015-03-24 10:48:08', '2015-03-24 12:45:16', 'Lombardia', 'lombardia', NULL, NULL, '<p style="text-align: right;">\r\n	Lombardia vivamus blandit erat et suscipit lacinia. Ut ornare magna eu sagittis tincidunt. Nullam velit diam, dictum tincidunt nulla a.</p>\r\n<p style="text-align: right;">\r\n	dapibus tincidunt orci. Ut posuere lacus odio, eu elementum erat malesuada quis. Integer sit amet dolor enim. Ut luctus nisl nunc, eu dapibus arcu ultricies eu. Curabitur gravida elit ac eleifend bibendum.</p>\r\n<p style="text-align: right;">\r\n	Integer volutpat varius turpis vitae consequat. Fusce massa risus, aliquam ut efficitur sed, consequat lobortis ex. Nulla nec dolor sit amet urna congue congue. Donec in tellus magna. Curabitur ut felis eu metus dapibus ultrices. Morbi risus neque, hendrerit eget tellus dictum, mattis pretium velit. Mauris at elit est. Vivamus vel est ac quam interdum consequat.</p>', NULL, 0, 1, 0, 0, '', 3, '<h1 class="hidden">{{ title }}</h1>\r\n{{ text }}', NULL),
(8, 3, 0, '2015-04-16 15:34:47', '2015-04-17 13:28:01', 'Test', 'test', '400x200.1.jpg', 'RSzgh3D7-Q0', '<p>\r\n	<img class="img-responsive" data-video="RSzgh3D7-Q0" src="/citterio/contents/attachment/catalogo-salumi/cotto.png" style="width: 400px; height: 244px;" /></p>\r\n<p>\r\n	RSzgh3D7-Q0 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pellentesque ultricies nisi. Fusce volutpat mi nec purus egestas, id fermentum nunc fringilla. Phasellus a velit ac libero pretium bibendum. Vivamus eu nunc sodales, pharetra urna id, suscipit orci. Cras non nibh sollicitudin, consequat eros varius, efficitur enim. Curabitur ultricies, lacus eu tempor venenatis, est sapien ullamcorper nulla, a malesuada lectus ante id leo. Integer vehicula mauris quam, ut congue urna elementum vel. Pellentesque vel dapibus lacus, at feugiat velit. Integer iaculis lacus porta, fringilla arcu id, porta lacus. Phasellus ac aliquet sapien. Mauris pretium, nibh sed dictum faucibus, ante nisi viverra ligula, in luctus elit arcu nec est. Morbi et placerat nisl, sed rutrum sapien. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur vel magna mauris.</p>\r\n<p>\r\n	Etiam lorem velit, semper in augue eu, ornare varius odio. Mauris hendrerit dolor eu sodales commodo. Aenean consequat quis metus et porttitor. Cras quis ante nec quam blandit efficitur at non ex. Praesent tristique ligula cursus ligula faucibus, in consectetur purus iaculis. Integer venenatis mi a feugiat tristique. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer at facilisis erat, non placerat metus. Curabitur sit amet nisi et mi tempus sagittis eu eget nunc.</p>\r\n<p>\r\n	Quisque eu enim varius, scelerisque velit vitae, euismod arcu. Sed tincidunt, ipsum sed mattis faucibus, felis quam mattis velit, in volutpat ante lacus eu orci. Nunc dignissim metus ut metus aliquam ornare. Nunc mi quam, ultrices a vulputate vitae, tincidunt id nisi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam lectus nisl, eleifend at egestas at, tempor vitae ex. Donec blandit porttitor nunc. Etiam nec massa magna.</p>', NULL, 0, 1, 1, 0, '', 8, '<h1>{{ title }}</h1>\r\n<div class="col-sm-6 col-xs-12">\r\n{{ slideshow|size:800x600 }}\r\n</div>\r\n<div class="col-sm-6 col-xs-12">\r\n{{ text }}\r\n</div>', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_entry_image`
--

CREATE TABLE IF NOT EXISTS `page_entry_image` (
  `id` int(11) NOT NULL,
  `pageentry_id` int(11) NOT NULL,
  `description` text,
  `file` varchar(255) NOT NULL,
  `video_code` varchar(64) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page_entry_image`
--

INSERT INTO `page_entry_image` (`id`, `pageentry_id`, `description`, `file`, `video_code`) VALUES
(3, 8, NULL, 'barb-croc_thO.jpg', 'RSzgh3D7-Q0'),
(4, 8, NULL, 'barbera_thO.jpg', NULL),
(5, 8, NULL, '1800x900.2.jpg', 'yqOUxUo4vLM');

-- --------------------------------------------------------

--
-- Table structure for table `page_opt`
--

CREATE TABLE IF NOT EXISTS `page_opt` (
  `id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `showcase_title` varchar(200) NOT NULL,
  `showcase_number` smallint(3) NOT NULL,
  `showcase_auto_start` tinyint(1) NOT NULL,
  `showcase_auto_interval` int(5) NOT NULL,
  `showcase_tpl_code` text NOT NULL,
  `entry_tpl_code` text NOT NULL,
  `box_tpl_code` text NOT NULL,
  `comment_moderation` tinyint(1) NOT NULL,
  `comment_notification` tinyint(1) NOT NULL,
  `newsletter_entries_number` smallint(2) NOT NULL,
  `newsletter_tpl_code` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page_opt`
--

INSERT INTO `page_opt` (`id`, `instance`, `showcase_title`, `showcase_number`, `showcase_auto_start`, `showcase_auto_interval`, `showcase_tpl_code`, `entry_tpl_code`, `box_tpl_code`, `comment_moderation`, `comment_notification`, `newsletter_entries_number`, `newsletter_tpl_code`) VALUES
(1, 0, 'In evidenza', 3, 1, 5000, '<article>\r\n<h1>{{ title }}</h1>\r\n<p>{{ img|class:left }}</p>\r\n{{ text }}\r\n</div>\r\n</article>', '<h1>{{ title }}</h1>\r\n<div class="col-sm-6 col-xs-12">\r\n<p>{{ img|class:img-responsive }}</p>\r\n</div>\r\n<div class="col-sm-6 col-xs-12">\r\n{{ social }}\r\n{{ text }}\r\n</div>', '<h1>{{ title }}</h1>\r\n<p>{{ img|class:left }}</p>\r\n{{ text }}\r\n<div class="null"></div>', 0, 1, 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `php_module`
--

CREATE TABLE IF NOT EXISTS `php_module` (
  `id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `php_module`
--

INSERT INTO `php_module` (`id`, `instance`, `content`) VALUES
(1, 6, '$lng = (isset($_SESSION[''lng''])) ? $_SESSION[''lng'']:''it_IT'';\r\n$access = new \\Gino\\Access();\r\n$registry = \\Gino\\Registry::instance();\r\n \r\n$buffer = "<div class=\\"top-bar\\">";\r\n$buffer .= "<div class=\\"left\\">";\r\nif($registry->sysconf->multi_language) {\r\n  $query = "SELECT id, label, language_code, country_code FROM language WHERE active=''1'' ORDER BY language DESC";\r\n  $a = $this->_db->selectquery($query);\r\n  $lng_buffer = array();\r\n  foreach($a as $b) {\r\n    if(isset($_SESSION[''lng''])) {\r\n      $selected = $_SESSION[''lng''] == $b[''language_code''].''_''.$b[''country_code''] ? true : false;\r\n    }\r\n    else {\r\n      $dft_lang_query = "SELECT dft_language FROM sys_conf WHERE id=''1''";\r\n      $c = $this->_db->selectquery($dft_lang_query);\r\n      $dft_lang = $c[0][''dft_language''];\r\n      \r\n      $selected = $b[''id''] == $dft_lang ? true : false;\r\n    }\r\n    if(!$selected) {\r\n      $lng_buffer[]  =  "<a href=\\"index.php?lng=".$b[''language_code''].''_''.$b[''country_code'']."\\">".\\Gino\\htmlChars($b[''label''])."</a>";\r\n    }\r\n    else {\r\n      $lng_buffer[]  =  "<a class=\\"selected\\">".\\Gino\\htmlChars($b[''label''])."</a>";\r\n    }\r\n  }\r\n  \r\n  $buffer .= implode("", $lng_buffer); \r\n}\r\n$buffer .= "</div>";\r\n$buffer .= "<div class=\\"right\\">";\r\nif(!isset($_SESSION[''user_id''])) {\r\n    $buffer .= "<span class=\\"link\\" onclick=\\"login_toggle.toggle();\\">"._("Area riservata")."</span>";\r\n    $buffer .= "<div id=\\"topbar-login\\" style=\\"display:none;\\">";\r\n    $buffer .= "<div>";\r\n    $buffer .= "<form method=\\"post\\" action=\\"index.php\\" style=\\"float:right\\">";\r\n    $buffer .= "<input type=\\"hidden\\" name=\\"action\\" value=\\"auth\\" />";\r\n    $buffer .= "<div class=\\"form-row\\">";\r\n    $buffer .= "<label>User</label>";\r\n    $buffer .= "<input type=\\"text\\" name=\\"user\\" required />";\r\n    $buffer .= "</div>";\r\n    $buffer .= "<div class=\\"form-row\\">";\r\n    $buffer .= "<label>Password</label>";\r\n    $buffer .= "<input type=\\"password\\" name=\\"pwd\\" required />";\r\n    $buffer .= "</div>";\r\n    $buffer .= "<div class=\\"form-row\\">";\r\n    $buffer .= "<label></label>";\r\n    $buffer .= "<input type=\\"submit\\" class=\\"generic\\" value=\\"login\\" />";\r\n    $buffer .= "</div>";\r\n    $buffer .= "</form>";\r\n    $buffer .= "<div class=\\"null\\"></div>";\r\n    $buffer .= "</div>";\r\n    $buffer .= "</div>";\r\n    $buffer .= "<script>var login_toggle = new Fx.Reveal(''topbar-login'');</script>";\r\n}\r\nelse {\r\n    $admin_link = false;\r\n    \r\n        $buffer .= "<a href=\\"admin\\">"._("Amministrazione")."</a>";\r\n        $admin_link = true;\r\n\r\n    $query = "SELECT CONCAT(firstname, '' '', lastname) AS name FROM user_app WHERE user_id=''".$_SESSION[''user_id'']."''";\r\n    $a = $this->_db->selectquery($query);\r\n    $username = $a>0 ? $a[0][''name'']:null;\r\n    $buffer .= "<a href=\\"index.php?evt[user-userCard]\\"><span title=\\""._("Profilo utente")."\\" class=\\"tooltip\\">".$username."</span></a>";\r\n    $buffer .= "<a href=\\"index.php?action=logout\\">"._("Logout")."</a>";\r\n    $buffer .= "<div class=\\"null\\"></div>";\r\n}\r\n$buffer .= "</div>";\r\n$buffer .= "<div class=\\"clear\\"></div>";\r\n$buffer .= "</div>";'),
(2, 9, '$buffer = "<div class=\\"top-bar\\">";\r\n\r\n$index = new \\Gino\\App\\Index\\index();\r\n\r\n$sysMdls = $index->sysModulesManageArray();\r\n$mdls = $index->modulesManageArray();\r\n \r\nif(count($sysMdls)) {	\r\n  $onchange = "location.href=''$this->_home?evt[''+$(this).value+'']'';";\r\n  $buffer .= "<select name=''sysmdl_menu'' onchange=\\"$onchange\\">";\r\n  $buffer .= "<option value=\\"\\">"._("Sistema")."</option>";\r\n  foreach($sysMdls as $sm) { \r\n    $buffer .= "<option value=\\"".$sm[''name'']."-manage".ucfirst($sm[''name''])."\\">".\\Gino\\htmlChars($sm[''label''])."</option>";\r\n  }\r\n  $buffer .= "</select> ";\r\n}\r\n				\r\nif(count($mdls)) {\r\n  $onchange = "location.href=''$this->_home?evt[''+$(this).value+'']'';";\r\n  $buffer .= "<select name=''mdl_menu'' onchange=\\"$onchange\\">";	\r\n  $buffer .= "<option value=\\"\\">"._("Moduli")."</option>";\r\n  foreach($mdls as $m) {\r\n    $buffer .= "<option value=\\"".$m[''name'']."-manageDoc\\">".\\Gino\\htmlChars($m[''label''])."</option>";\r\n  }	\r\n  $buffer .= "</select>";\r\n}\r\n\r\n$buffer .= "</div>";');

-- --------------------------------------------------------

--
-- Table structure for table `php_module_opt`
--

CREATE TABLE IF NOT EXISTS `php_module_opt` (
  `id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `title_vis` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `search_site_opt`
--

CREATE TABLE IF NOT EXISTS `search_site_opt` (
  `id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `sys_mdl` varchar(256) NOT NULL,
  `inst_mdl` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_conf`
--

CREATE TABLE IF NOT EXISTS `sys_conf` (
  `id` smallint(2) NOT NULL,
  `multi_language` tinyint(1) NOT NULL,
  `dft_language` smallint(2) NOT NULL,
  `log_access` tinyint(1) NOT NULL,
  `head_description` text NOT NULL,
  `head_keywords` varchar(255) DEFAULT NULL,
  `head_title` varchar(255) NOT NULL,
  `google_analytics` varchar(20) DEFAULT NULL,
  `captcha_public` varchar(64) DEFAULT NULL,
  `captcha_private` varchar(64) DEFAULT NULL,
  `sharethis_public_key` varchar(64) DEFAULT NULL,
  `disqus_shortname` varchar(64) DEFAULT NULL,
  `email_admin` varchar(128) NOT NULL,
  `email_from_app` varchar(100) DEFAULT NULL,
  `mobile` tinyint(1) NOT NULL DEFAULT '0',
  `password_crypt` enum('none','sha1','md5') DEFAULT 'none',
  `enable_cache` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_conf`
--

INSERT INTO `sys_conf` (`id`, `multi_language`, `dft_language`, `log_access`, `head_description`, `head_keywords`, `head_title`, `google_analytics`, `captcha_public`, `captcha_private`, `sharethis_public_key`, `disqus_shortname`, `email_admin`, `email_from_app`, `mobile`, `password_crypt`, `enable_cache`) VALUES
(1, 1, 1, 1, 'Content Management System', NULL, 'gino CMS', NULL, NULL, NULL, NULL, NULL, 'kkk@otto.to.it', 'no-reply@otto.to.it', 0, 'md5', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sys_gimage`
--

CREATE TABLE IF NOT EXISTS `sys_gimage` (
  `id` int(11) NOT NULL,
  `key` varchar(32) NOT NULL,
  `path` varchar(255) NOT NULL,
  `width` int(8) NOT NULL,
  `height` int(8) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_gimage`
--

INSERT INTO `sys_gimage` (`id`, `key`, `path`, `width`, `height`) VALUES
(1, 'e3ab89826fe86d137df8a160ee1aa66b', '/citterio/contents/gimage/gimage_1.jpg', 140, 140),
(2, '6ec87ca6b1e81e43e85b25013d439edc', '/citterio/contents/gimage/gimage_2.jpg', 140, 140),
(3, '69879551f14229872588389c5af79007', '/citterio/contents/gimage/gimage_3.jpg', 300, 100),
(4, '630d01ac566c9e06767eb8302d04a941', '/citterio/contents/gimage/gimage_4.jpg', 300, 100),
(5, '2c41def5f7a8fb4960fd992783a4a943', '/citterio/contents/gimage/gimage_5.jpg', 800, 600),
(6, '7b4ff04f07b1203dfb4df5fe05a1b841', '/citterio/contents/gimage/gimage_6.jpg', 800, 600),
(7, 'e76979df9810d48d7f12f17f36599466', '/citterio/contents/gimage/gimage_7.jpg', 800, 600);

-- --------------------------------------------------------

--
-- Table structure for table `sys_graphics`
--

CREATE TABLE IF NOT EXISTS `sys_graphics` (
  `id` smallint(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(128) DEFAULT NULL,
  `html` text
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `sys_graphics`
--

INSERT INTO `sys_graphics` (`id`, `name`, `description`, `type`, `image`, `html`) VALUES
(1, 'header_public', 'Header pagine pubbliche', 1, 'header.jpg', ''),
(2, 'header_private', 'Header pagine private', 2, '', '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="840" height="160" id="header" align="middle">\r\n	<param name="allowScriptAccess" value="sameDomain" />\r\n	<param name="allowFullScreen" value="false" />\r\n        <param name="wmode" value="transparent">\r\n	<param name="movie" value="_GRAPHICS_/header.swf" /><param name="quality" value="high" /><param name="bgcolor" value="#ffffff" /><embed src="_GRAPHICS_/header.swf" quality="high" bgcolor="#ffffff" width="840" height="160" wmode="transparent" name="header" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />\r\n	</object>'),
(3, 'header_admin', 'Header amministrazione', 1, 'header_admin.jpg', 'HEADER'),
(4, 'header_mobile', 'Header dispositivi mobili', 1, 'header_mobile.jpg', ''),
(5, 'header_adhoc', 'Header ad hoc', 2, 'pf2.jpg', 'HEADER'),
(6, 'footer_public', 'Footer index pubblica', 1, 'footer.jpg', ''),
(7, 'footer_private', 'Footer index privata', 2, '', '<p>\r\nheader\r\n</p>'),
(8, 'footer_admin', 'Footer amministrazione', 1, 'footer_admin.jpg', ''),
(9, 'footer_mobile', 'Footer dispositivi mobili', 1, 'footer_mobile.jpg', ''),
(10, 'footer_adhoc', 'Footer ad hoc', 1, '', 'FOOTER ADHOC');

-- --------------------------------------------------------

--
-- Table structure for table `sys_layout_css`
--

CREATE TABLE IF NOT EXISTS `sys_layout_css` (
  `id` int(11) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `label` varchar(200) NOT NULL,
  `description` text
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_layout_css`
--

INSERT INTO `sys_layout_css` (`id`, `filename`, `label`, `description`) VALUES
(1, 'mobile.css', 'Css per la visione mobile', 'Contiene regole per i dispositivi mobile'),
(2, 'admin.css', 'Css area amministrativa', 'Contiene regole per l''area amministrativa'),
(3, 'gino-blocks-tpl.css', 'Css per template a blocchi', 'Contiene regole css per il layout a blocchi di gino');

-- --------------------------------------------------------

--
-- Table structure for table `sys_layout_skin`
--

CREATE TABLE IF NOT EXISTS `sys_layout_skin` (
  `id` int(11) NOT NULL,
  `label` varchar(200) NOT NULL,
  `session` varchar(128) DEFAULT NULL,
  `rexp` varchar(200) DEFAULT NULL,
  `urls` varchar(200) DEFAULT NULL,
  `template` varchar(200) NOT NULL,
  `css` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `auth` enum('yes','no','') NOT NULL,
  `cache` bigint(16) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_layout_skin`
--

INSERT INTO `sys_layout_skin` (`id`, `label`, `session`, `rexp`, `urls`, `template`, `css`, `priority`, `auth`, `cache`) VALUES
(1, 'Home Pubblica', NULL, '#(index.php(\\?evt\\[index-index_page\\])?[^\\[\\]]*)?$#', NULL, '2', 0, 11, 'no', 0),
(2, 'Pagine Pubbliche', NULL, '#evt\\[(?!index)#', NULL, '3', 0, 9, 'no', 0),
(3, 'Home Amministrazione', NULL, NULL, 'index.php?evt[index-admin_page]', '4', 0, 6, 'yes', 0),
(4, 'Pagine Amministrazione', NULL, '#evt\\[\\w+-((manage)|(wrapper))\\w*\\]#', NULL, '5', 2, 5, 'yes', 0),
(5, 'Pagina Autenticazione', NULL, NULL, 'index.php?evt[auth-login]', '3', 0, 3, 'no', 0),
(6, 'Default', NULL, '#^.*$#', NULL, '1', 2, 13, '', 0),
(7, 'Pagine Private', NULL, '#evt\\[(?!index)#', NULL, '3', 0, 10, 'yes', 0),
(8, 'Home Privata', NULL, '#(index.php(\\?evt\\[index-index_page\\])?[^\\[\\]]*)?$#', NULL, '2', 0, 12, 'yes', 0),
(9, 'Pagine Mobile', 'L_mobile=1', '#.*#', NULL, '8', 1, 2, '', 0),
(10, 'Home Mobile', 'L_mobile=1', '#^index.php$#', NULL, '7', 1, 1, '', 0),
(11, '_popup', NULL, '#&_popup=1#', NULL, '6', 2, 4, 'yes', 0),
(12, 'Luoghi di Produzione', NULL, '#page/view/terre-di-origine.*#', NULL, '9', 0, 7, '', 0),
(13, 'Nel Mondo', NULL, '#maps/map/.*#', NULL, '10', 0, 8, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sys_layout_tpl`
--

CREATE TABLE IF NOT EXISTS `sys_layout_tpl` (
  `id` int(11) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `label` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `free` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_layout_tpl`
--

INSERT INTO `sys_layout_tpl` (`id`, `filename`, `label`, `description`, `free`) VALUES
(1, 'default.tpl', 'Default', 'Template di default a blocchi', 0),
(2, 'home.php', 'Home', 'Template home page', 1),
(3, 'page.php', 'Pagine', 'Template pagine interne', 1),
(4, 'admin_home.php', 'Home admin', 'Template home area amministrativa', 1),
(5, 'admin_page.php', 'Pagine admin', 'Template pagine area amministrativa', 1),
(6, '_popup.php', '_popup', 'Template per l''inserimento di foreign o m2m contestuali', 1),
(7, 'home_mobile.php', 'Home mobile', 'Template home page dispositivi mobile', 1),
(8, 'pages_mobile.php', 'Pagine mobile', 'Template pagine interne dispositivi mobile', 1),
(9, 'production_places.php', 'Luoghi di Produzione', 'Template per la pagina dei luoghi di produzione', 1),
(10, 'nel-mondo.php', 'Nel Mondo', 'Template mappa interattiva Nel Mondo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sys_layout_tpl_block`
--

CREATE TABLE IF NOT EXISTS `sys_layout_tpl_block` (
  `id` int(11) NOT NULL,
  `tpl` int(4) NOT NULL,
  `position` smallint(2) NOT NULL,
  `width` int(4) NOT NULL,
  `um` tinyint(1) NOT NULL,
  `align` tinyint(1) NOT NULL,
  `rows` smallint(2) NOT NULL,
  `cols` smallint(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_layout_tpl_block`
--

INSERT INTO `sys_layout_tpl_block` (`id`, `tpl`, `position`, `width`, `um`, `align`, `rows`, `cols`) VALUES
(1, 1, 1, 0, 0, 0, 1, 1),
(2, 1, 2, 0, 0, 0, 1, 1),
(3, 1, 3, 960, 1, 2, 1, 2),
(4, 1, 4, 0, 0, 0, 1, 1),
(5, 1, 5, 960, 1, 2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sys_log_access`
--

CREATE TABLE IF NOT EXISTS `sys_log_access` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_log_access`
--

INSERT INTO `sys_log_access` (`id`, `user_id`, `date`) VALUES
(1, 1, '2015-01-20 10:01:31'),
(2, 1, '2015-01-20 11:12:18'),
(3, 1, '2015-01-20 12:06:05'),
(4, 1, '2015-01-20 13:45:47'),
(5, 1, '2015-01-21 12:14:17'),
(6, 1, '2015-01-21 16:42:19'),
(7, 1, '2015-01-22 10:44:40'),
(8, 1, '2015-01-28 12:14:45'),
(9, 1, '2015-01-28 15:11:21'),
(10, 1, '2015-01-28 16:53:37'),
(11, 1, '2015-01-28 16:57:07'),
(12, 1, '2015-01-29 14:04:27'),
(13, 1, '2015-01-30 09:20:02'),
(14, 1, '2015-01-30 14:18:06'),
(15, 1, '2015-02-02 09:47:46'),
(16, 1, '2015-02-02 11:39:08'),
(17, 1, '2015-02-02 14:23:16'),
(18, 1, '2015-02-02 15:29:59'),
(19, 1, '2015-02-03 09:52:44'),
(20, 1, '2015-02-05 09:32:42'),
(21, 1, '2015-02-05 14:11:51'),
(22, 1, '2015-02-09 10:17:13'),
(23, 1, '2015-02-09 14:03:36'),
(24, 1, '2015-02-09 15:48:22'),
(25, 1, '2015-02-10 10:15:06'),
(26, 1, '2015-02-10 11:15:32'),
(27, 1, '2015-02-10 16:10:51'),
(28, 1, '2015-02-12 12:18:59'),
(29, 1, '2015-02-12 14:40:05'),
(30, 1, '2015-02-12 15:45:55'),
(31, 1, '2015-02-13 09:18:39'),
(32, 1, '2015-02-13 10:00:43'),
(33, 1, '2015-02-13 11:12:27'),
(34, 1, '2015-02-13 12:13:42'),
(35, 1, '2015-02-13 14:00:20'),
(36, 1, '2015-02-13 15:51:18'),
(37, 1, '2015-02-13 16:51:01'),
(38, 1, '2015-02-16 10:11:40'),
(39, 1, '2015-02-16 11:45:58'),
(40, 1, '2015-02-16 13:48:58'),
(41, 1, '2015-02-17 10:44:24'),
(42, 1, '2015-02-17 14:38:52'),
(43, 1, '2015-02-17 17:29:26'),
(44, 1, '2015-02-23 10:25:06'),
(45, 1, '2015-02-23 12:56:09'),
(46, 1, '2015-02-23 15:55:43'),
(47, 1, '2015-02-24 12:26:09'),
(48, 1, '2015-02-24 13:56:47'),
(49, 1, '2015-02-26 10:16:13'),
(50, 1, '2015-02-26 16:21:42'),
(51, 1, '2015-02-27 10:59:49'),
(52, 1, '2015-02-27 14:23:18'),
(53, 1, '2015-03-11 12:30:08'),
(54, 1, '2015-03-11 15:55:01'),
(55, 1, '2015-03-17 17:35:21'),
(56, 1, '2015-03-24 09:52:36'),
(57, 1, '2015-03-24 12:43:41'),
(58, 1, '2015-03-24 17:06:27'),
(59, 1, '2015-03-25 12:40:51'),
(60, 1, '2015-03-25 12:54:12'),
(61, 1, '2015-03-25 13:46:00'),
(62, 1, '2015-04-02 14:48:05'),
(63, 1, '2015-04-02 16:44:40'),
(64, 1, '2015-04-02 22:40:24'),
(65, 1, '2015-04-08 14:38:06'),
(66, 1, '2015-04-13 12:44:39'),
(67, 1, '2015-04-14 14:04:42'),
(68, 1, '2015-04-14 17:25:48'),
(69, 1, '2015-04-15 10:41:37'),
(70, 1, '2015-04-15 15:42:17'),
(71, 1, '2015-04-16 10:20:05'),
(72, 1, '2015-04-16 14:38:58'),
(73, 1, '2015-04-16 17:34:40'),
(74, 1, '2015-04-17 09:56:49'),
(75, 1, '2015-04-17 14:20:06'),
(76, 1, '2015-04-20 17:15:38'),
(77, 1, '2015-04-21 11:49:19');

-- --------------------------------------------------------

--
-- Table structure for table `sys_menu_opt`
--

CREATE TABLE IF NOT EXISTS `sys_menu_opt` (
  `id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `cache` bigint(16) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_menu_opt`
--

INSERT INTO `sys_menu_opt` (`id`, `instance`, `title`, `cache`) VALUES
(1, 4, 'Menu principale', 0),
(2, 5, 'Menu amministrazione', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sys_menu_voices`
--

CREATE TABLE IF NOT EXISTS `sys_menu_voices` (
  `id` int(11) NOT NULL,
  `instance` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `label` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `type` enum('int','ext') NOT NULL,
  `order_list` smallint(3) NOT NULL,
  `perms` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_menu_voices`
--

INSERT INTO `sys_menu_voices` (`id`, `instance`, `parent`, `label`, `url`, `type`, `order_list`, `perms`) VALUES
(1, 5, 0, 'Amministrazione', 'admin', 'int', 1, '2,0'),
(2, 4, 0, 'Azienda', '', 'int', 2, ''),
(3, 5, 0, 'Logout', 'index.php?action=logout', 'int', 2, '1,0'),
(4, 4, 0, 'Prodotti', '', 'int', 3, ''),
(5, 4, 0, 'Accademia', 'page/view/accademia/', 'int', 4, ''),
(6, 4, 0, 'Press Area', '', 'int', 5, ''),
(7, 4, 2, 'Area Trade', '', 'int', 5, ''),
(8, 4, 2, 'Intranet', '', 'int', 6, ''),
(9, 4, 2, 'Family Company', '', 'int', 1, ''),
(10, 4, 2, 'Nel Mondo', 'maps/map/nel-mondo', 'int', 2, ''),
(13, 4, 7, 'News', '', 'int', 1, ''),
(14, 4, 7, 'Fiere', '', 'int', 2, ''),
(15, 4, 7, 'Alert Offerte', '', 'int', 3, ''),
(16, 4, 7, 'Download', '', 'int', 4, ''),
(17, 4, 8, 'News', '', 'int', 1, ''),
(18, 4, 8, 'Download', '', 'int', 2, ''),
(22, 4, 5, 'Terre d''origine', 'page/view/terre-di-origine/', 'int', 1, ''),
(23, 4, 5, 'Expo 2015', '', 'int', 2, ''),
(24, 4, 5, 'Ricette', '', 'int', 3, ''),
(28, 4, 6, 'Comunicati', '', 'int', 1, ''),
(29, 4, 6, 'Company Profile', '', 'int', 2, ''),
(32, 4, 2, 'Sostenibilità', '', 'int', 3, ''),
(33, 4, 2, 'Comunicazione', '', 'int', 4, ''),
(55, 4, 6, 'Fotogallery', '', 'int', 3, ''),
(56, 4, 6, 'Contatti', '', 'int', 4, ''),
(57, 4, 23, 'Diario di Expo', '', 'int', 1, ''),
(58, 4, 23, 'Vivaio', 'page/view/vivaio/', 'int', 2, ''),
(59, 4, 23, 'Citterio Expo', '', 'int', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `sys_module`
--

CREATE TABLE IF NOT EXISTS `sys_module` (
  `id` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `module_app` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_module`
--

INSERT INTO `sys_module` (`id`, `label`, `name`, `module_app`, `active`, `description`) VALUES
(4, 'Menu principale', 'mainMenu', 10, 1, 'Menu principale'),
(5, 'Menu amministrazione', 'menu_admin', 10, 1, 'Menu area amministrativa'),
(6, 'Top Bar', 'topbar', 14, 1, 'Barra superiore con scelta lingua ed autenticazione'),
(9, 'Top Bar Admin', 'topbaradmin', 14, 1, 'Barra superiore con link diretto all''amministrazione dei singoli moduli'),
(10, 'Nel Mondo', 'maps', 21, 1, 'Modulo mappe interattive');

-- --------------------------------------------------------

--
-- Table structure for table `sys_module_app`
--

CREATE TABLE IF NOT EXISTS `sys_module_app` (
  `id` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `tbl_name` varchar(30) NOT NULL,
  `instantiable` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  `removable` tinyint(1) NOT NULL,
  `class_version` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_module_app`
--

INSERT INTO `sys_module_app` (`id`, `label`, `name`, `active`, `tbl_name`, `instantiable`, `description`, `removable`, `class_version`) VALUES
(1, 'Impostazioni', 'sysconf', 1, 'sys_conf', 0, 'Principali impostazioni di sistema', 0, '1.0'),
(2, 'Lingue', 'language', 1, 'language', 0, 'Gestione delle lingue disponibili per le traduzioni', 0, '1.0'),
(3, 'Moduli di sistema', 'sysClass', 1, 'sys_class', 0, 'Modifica, installazione e rimozione dei moduli di sistema', 0, '1.0'),
(4, 'Moduli', 'module', 1, 'sys_module', 0, 'Modifica, installazione e rimozione dei moduli di classi istanziate e moduli funzione', 0, '1.0'),
(5, 'Utenti', 'user', 1, 'user', 0, 'Gestione degli utenti di sistema', 0, '1.0'),
(6, 'Statistiche', 'statistics', 1, 'sys_stat', 0, 'Statistiche degli accessi all''area privata', 0, '1.0'),
(7, 'Layout', 'layout', 1, 'sys_layout', 0, 'Gestione di css, template, skin ed assegnazione a indirizzi o classi di indirizzi', 0, '1.0'),
(8, 'Header e Footer', 'graphics', 1, 'sys_graphics', 0, 'Gestione personalizzata degli header e footer del sistema', 0, '1.0'),
(9, 'Allegati', 'attachment', 1, 'attachment', 0, 'Archivi di file con struttura ad albero', 0, '1.0'),
(10, 'Menu', 'menu', 1, 'sys_menu', 1, '', 0, '1.0'),
(11, 'Pagine', 'page', 1, 'page', 0, 'Pagine html con struttura ad albero', 0, '1.0'),
(12, 'Index', 'index', 1, '', 0, '', 0, '1.0'),
(13, 'Ricerca nel sito', 'searchSite', 1, 'search_site', 0, 'Form di ricerca nel sito', 0, '1.0'),
(14, 'phpModuleView', 'phpModuleView', 1, 'php_module', 1, 'Generatore di moduli contenenti codice php', 1, '1.0'),
(15, 'Strumenti', 'instruments', 1, 'instruments', 0, 'Alcuni strumenti, quali l''elenco delle risorse disponibili (con i relativi link) e dei mime type', 0, '1.0'),
(16, 'Autenticazione', 'auth', 1, 'auth', 0, 'Modulo utenti, gruppi e permessi', 0, '1.0'),
(17, 'Funzioni di sistema', 'sysfunc', 1, 'sysfunc', 0, 'Funzioni di sistema', 0, '1.0'),
(18, 'Geo IP', 'geoIP', 1, 'geoip', 0, 'Modulo per la geolocalizzazione di indirizzi IP', 1, '0.1'),
(19, 'Catalogo', 'catalogue', 1, 'catalogue', 0, 'Modulo di gestione catalogo', 1, '0.1'),
(20, 'Ricettario', 'cookbook', 1, 'cookbook', 0, 'Modulo di gestione ricettario', 1, '0.1'),
(21, 'gmaps', 'gmaps', 1, 'gmaps', 1, 'Gestore di mappe interattive contenenti punti di interesse percorsi ed aree', 1, '0.1.0');

-- --------------------------------------------------------

--
-- Table structure for table `sys_tag`
--

CREATE TABLE IF NOT EXISTS `sys_tag` (
  `id` int(11) NOT NULL,
  `tag` varchar(68) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_tag_taggeditem`
--

CREATE TABLE IF NOT EXISTS `sys_tag_taggeditem` (
  `id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `content_controller_class` varchar(255) NOT NULL,
  `content_controller_instance` int(11) NOT NULL,
  `content_class` varchar(64) NOT NULL,
  `content_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachment_ctg`
--
ALTER TABLE `attachment_ctg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_opt`
--
ALTER TABLE `auth_opt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_user_add`
--
ALTER TABLE `auth_user_add`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `auth_user_group`
--
ALTER TABLE `auth_user_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_user_registration`
--
ALTER TABLE `auth_user_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalogue_node`
--
ALTER TABLE `catalogue_node`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalogue_product`
--
ALTER TABLE `catalogue_product`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `catalogue_product_country`
--
ALTER TABLE `catalogue_product_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalogue_raw_material`
--
ALTER TABLE `catalogue_raw_material`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookbook_category`
--
ALTER TABLE `cookbook_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookbook_dish`
--
ALTER TABLE `cookbook_dish`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookbook_ingredient`
--
ALTER TABLE `cookbook_ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookbook_recipe`
--
ALTER TABLE `cookbook_recipe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookbook_recipe_category`
--
ALTER TABLE `cookbook_recipe_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookbook_recipe_country`
--
ALTER TABLE `cookbook_recipe_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookbook_recipe_ingredient`
--
ALTER TABLE `cookbook_recipe_ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookbook_recipe_season`
--
ALTER TABLE `cookbook_recipe_season`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookbook_season`
--
ALTER TABLE `cookbook_season`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `geoip_country`
--
ALTER TABLE `geoip_country`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `gmaps_area`
--
ALTER TABLE `gmaps_area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_area_category`
--
ALTER TABLE `gmaps_area_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_area_point`
--
ALTER TABLE `gmaps_area_point`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_category`
--
ALTER TABLE `gmaps_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_map`
--
ALTER TABLE `gmaps_map`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_map_area`
--
ALTER TABLE `gmaps_map_area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_map_path`
--
ALTER TABLE `gmaps_map_path`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_map_point`
--
ALTER TABLE `gmaps_map_point`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_marker`
--
ALTER TABLE `gmaps_marker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_opt`
--
ALTER TABLE `gmaps_opt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_path`
--
ALTER TABLE `gmaps_path`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_path_category`
--
ALTER TABLE `gmaps_path_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_path_point`
--
ALTER TABLE `gmaps_path_point`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_point`
--
ALTER TABLE `gmaps_point`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_point_attachment`
--
ALTER TABLE `gmaps_point_attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_point_category`
--
ALTER TABLE `gmaps_point_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_point_image`
--
ALTER TABLE `gmaps_point_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_point_service`
--
ALTER TABLE `gmaps_point_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_point_video`
--
ALTER TABLE `gmaps_point_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmaps_service`
--
ALTER TABLE `gmaps_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instruments`
--
ALTER TABLE `instruments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instruments_opt`
--
ALTER TABLE `instruments_opt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_opt`
--
ALTER TABLE `language_opt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nation`
--
ALTER TABLE `nation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_category`
--
ALTER TABLE `page_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_comment`
--
ALTER TABLE `page_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_entry`
--
ALTER TABLE `page_entry`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `page_entry_image`
--
ALTER TABLE `page_entry_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_opt`
--
ALTER TABLE `page_opt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `php_module`
--
ALTER TABLE `php_module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `php_module_opt`
--
ALTER TABLE `php_module_opt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_site_opt`
--
ALTER TABLE `search_site_opt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_conf`
--
ALTER TABLE `sys_conf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_gimage`
--
ALTER TABLE `sys_gimage`
  ADD PRIMARY KEY (`id`), ADD KEY `key` (`key`);

--
-- Indexes for table `sys_graphics`
--
ALTER TABLE `sys_graphics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_layout_css`
--
ALTER TABLE `sys_layout_css`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_layout_skin`
--
ALTER TABLE `sys_layout_skin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_layout_tpl`
--
ALTER TABLE `sys_layout_tpl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_layout_tpl_block`
--
ALTER TABLE `sys_layout_tpl_block`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_log_access`
--
ALTER TABLE `sys_log_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_menu_opt`
--
ALTER TABLE `sys_menu_opt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_menu_voices`
--
ALTER TABLE `sys_menu_voices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_module`
--
ALTER TABLE `sys_module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_module_app`
--
ALTER TABLE `sys_module_app`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_tag`
--
ALTER TABLE `sys_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_tag_taggeditem`
--
ALTER TABLE `sys_tag_taggeditem`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachment`
--
ALTER TABLE `attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `attachment_ctg`
--
ALTER TABLE `attachment_ctg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_opt`
--
ALTER TABLE `auth_opt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `auth_user_group`
--
ALTER TABLE `auth_user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_registration`
--
ALTER TABLE `auth_user_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `catalogue_node`
--
ALTER TABLE `catalogue_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=384;
--
-- AUTO_INCREMENT for table `catalogue_product`
--
ALTER TABLE `catalogue_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=888;
--
-- AUTO_INCREMENT for table `catalogue_product_country`
--
ALTER TABLE `catalogue_product_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59344;
--
-- AUTO_INCREMENT for table `catalogue_raw_material`
--
ALTER TABLE `catalogue_raw_material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `cookbook_category`
--
ALTER TABLE `cookbook_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cookbook_dish`
--
ALTER TABLE `cookbook_dish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cookbook_ingredient`
--
ALTER TABLE `cookbook_ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cookbook_recipe`
--
ALTER TABLE `cookbook_recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cookbook_recipe_category`
--
ALTER TABLE `cookbook_recipe_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cookbook_recipe_country`
--
ALTER TABLE `cookbook_recipe_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cookbook_recipe_ingredient`
--
ALTER TABLE `cookbook_recipe_ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cookbook_recipe_season`
--
ALTER TABLE `cookbook_recipe_season`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cookbook_season`
--
ALTER TABLE `cookbook_season`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `geoip_country`
--
ALTER TABLE `geoip_country`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=250;
--
-- AUTO_INCREMENT for table `gmaps_area`
--
ALTER TABLE `gmaps_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gmaps_area_category`
--
ALTER TABLE `gmaps_area_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gmaps_area_point`
--
ALTER TABLE `gmaps_area_point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gmaps_category`
--
ALTER TABLE `gmaps_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `gmaps_map`
--
ALTER TABLE `gmaps_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `gmaps_map_area`
--
ALTER TABLE `gmaps_map_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gmaps_map_path`
--
ALTER TABLE `gmaps_map_path`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gmaps_map_point`
--
ALTER TABLE `gmaps_map_point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `gmaps_marker`
--
ALTER TABLE `gmaps_marker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gmaps_opt`
--
ALTER TABLE `gmaps_opt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gmaps_path`
--
ALTER TABLE `gmaps_path`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gmaps_path_category`
--
ALTER TABLE `gmaps_path_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gmaps_path_point`
--
ALTER TABLE `gmaps_path_point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gmaps_point`
--
ALTER TABLE `gmaps_point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `gmaps_point_attachment`
--
ALTER TABLE `gmaps_point_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gmaps_point_category`
--
ALTER TABLE `gmaps_point_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `gmaps_point_image`
--
ALTER TABLE `gmaps_point_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gmaps_point_service`
--
ALTER TABLE `gmaps_point_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gmaps_point_video`
--
ALTER TABLE `gmaps_point_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gmaps_service`
--
ALTER TABLE `gmaps_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `instruments`
--
ALTER TABLE `instruments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `instruments_opt`
--
ALTER TABLE `instruments_opt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `language_opt`
--
ALTER TABLE `language_opt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `nation`
--
ALTER TABLE `nation`
  MODIFY `id` smallint(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=193;
--
-- AUTO_INCREMENT for table `page_category`
--
ALTER TABLE `page_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `page_comment`
--
ALTER TABLE `page_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `page_entry`
--
ALTER TABLE `page_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `page_entry_image`
--
ALTER TABLE `page_entry_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `page_opt`
--
ALTER TABLE `page_opt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `php_module`
--
ALTER TABLE `php_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `php_module_opt`
--
ALTER TABLE `php_module_opt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `search_site_opt`
--
ALTER TABLE `search_site_opt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sys_conf`
--
ALTER TABLE `sys_conf`
  MODIFY `id` smallint(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sys_gimage`
--
ALTER TABLE `sys_gimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sys_graphics`
--
ALTER TABLE `sys_graphics`
  MODIFY `id` smallint(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sys_layout_css`
--
ALTER TABLE `sys_layout_css`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sys_layout_skin`
--
ALTER TABLE `sys_layout_skin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `sys_layout_tpl`
--
ALTER TABLE `sys_layout_tpl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sys_layout_tpl_block`
--
ALTER TABLE `sys_layout_tpl_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sys_log_access`
--
ALTER TABLE `sys_log_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `sys_menu_opt`
--
ALTER TABLE `sys_menu_opt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sys_menu_voices`
--
ALTER TABLE `sys_menu_voices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT for table `sys_module`
--
ALTER TABLE `sys_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sys_module_app`
--
ALTER TABLE `sys_module_app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `sys_tag`
--
ALTER TABLE `sys_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sys_tag_taggeditem`
--
ALTER TABLE `sys_tag_taggeditem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
