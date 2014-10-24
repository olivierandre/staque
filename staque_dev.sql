-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 23 Octobre 2014 à 17:20
-- Version du serveur :  5.6.16
-- Version de PHP :  5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `staque`
--

-- --------------------------------------------------------

--
-- Structure de la table `answers`
--

CREATE TABLE IF NOT EXISTS `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  `answer` text NOT NULL,
  `id_note` int(11) NOT NULL DEFAULT '3',
  `resolve` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=140 ;

--
-- Contenu de la table `answers`
--

INSERT INTO `answers` (`id`, `id_user`, `id_question`, `answer`, `id_note`, `resolve`, `date_created`, `date_modified`) VALUES
(1, 8, 6, '<p>La question est pas terrible ...</p>', 3, 0, '2014-10-20 17:09:24', '2014-10-20 17:09:24'),
(2, 6, 6, '<p>Vraiment nul comme question ...</p>', 3, 0, '2014-10-21 12:23:50', '2014-10-21 12:23:50'),
(3, 6, 3, '<p>est-ce que la class "String" existe ?</p>', 3, 1, '2014-10-21 12:50:10', '2014-10-21 12:50:10'),
(11, 6, 2, '<p>toto</p>\r\n<pre class="brush:php;auto-links:false;toolbar:false" contenteditable="false">echo "coucou"</pre>\r\n<p> </p>', 3, 0, '2014-10-21 15:11:07', '2014-10-21 15:11:07'),
(80, 6, 2, '<p>test</p>', 3, 1, '2014-10-21 17:27:53', '2014-10-21 17:27:53'),
(81, 6, 6, '<p>Ceci est un essai</p>\r\n<pre class="brush:sql;auto-links:false;toolbar:false" contenteditable="false">SELECT * FROM entreprise</pre>\r\n<p>&nbsp;</p>', 3, 1, '2014-10-22 09:23:15', '2014-10-22 09:23:15'),
(82, 6, 6, '<pre class="brush:html;auto-links:false;toolbar:false" contenteditable="false">&lt;div&gt;\r\n    &lt;p&gt;Coucou&lt;/p&gt;\r\n&lt;/div&gt;</pre>\r\n<p>&nbsp;</p>', 3, 0, '2014-10-22 09:25:14', '2014-10-22 09:25:14'),
(87, 3, 7, '<p>Faut pas oublier la virgule, Roger !!!</p>\r\n<pre class="brush:php;auto-links:false;toolbar:false" contenteditable="false">echo "coucou";\r\ndie();</pre>\r\n<p>&ccedil;a marchera beaucoup mieux ...</p>', 3, 1, '2014-10-22 10:12:04', '2014-10-22 10:12:04'),
(88, 3, 7, '<p>Avec le point virgule &ccedil;a fonctionne mieux ...</p>', 3, 0, '2014-10-22 12:48:50', '2014-10-22 12:48:50'),
(89, 3, 7, '<p>Ceci est un essai</p>', 3, 0, '2014-10-23 11:41:26', '2014-10-23 11:41:26');

-- --------------------------------------------------------

--
-- Structure de la table `comment_answers`
--

CREATE TABLE IF NOT EXISTS `comment_answers` (
  `id_user` int(11) NOT NULL,
  `id_answer` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `comment_answers`
--

INSERT INTO `comment_answers` (`id_user`, `id_answer`, `comment`, `date_created`, `date_modified`) VALUES
(3, 87, 'test 1', '2014-10-23 11:23:18', '2014-10-23 11:23:18'),
(3, 87, 'Très belle réponse !', '2014-10-23 11:23:53', '2014-10-23 11:23:53'),
(3, 87, 'test', '2014-10-23 11:24:01', '2014-10-23 11:24:01'),
(6, 88, 'Merci pour votre réponse !!!', '2014-10-23 11:33:47', '2014-10-23 11:33:47'),
(3, 88, 'Très beau commentaire', '2014-10-23 11:39:42', '2014-10-23 11:39:42'),
(6, 89, 'Ceci est un commentaire d''essai', '2014-10-23 12:38:41', '2014-10-23 12:38:41'),
(3, 3, 'Superbe réponse !', '2014-10-23 15:46:32', '2014-10-23 15:46:32');

-- --------------------------------------------------------

--
-- Structure de la table `note_answer`
--

CREATE TABLE IF NOT EXISTS `note_answer` (
  `id_answer` int(11) NOT NULL,
  `id_note` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `note_answer`
--

INSERT INTO `note_answer` (`id_answer`, `id_note`, `id_user`, `date_created`, `date_modified`) VALUES
(1, 5, 6, '2014-10-21 12:36:19', '2014-10-21 12:36:19'),
(2, 5, 6, '2014-10-21 12:36:21', '2014-10-21 12:36:21'),
(0, 7, 0, '2014-10-21 12:58:09', '2014-10-21 12:58:09'),
(0, 6, 0, '2014-10-21 12:58:09', '2014-10-21 12:58:09'),
(2, 7, 3, '2014-10-21 13:00:23', '2014-10-21 13:00:23'),
(2, 6, 3, '2014-10-21 13:00:23', '2014-10-21 13:00:23'),
(1, 7, 3, '2014-10-21 13:00:26', '2014-10-21 13:00:26'),
(1, 6, 3, '2014-10-21 13:00:26', '2014-10-21 13:00:26'),
(3, 5, 3, '2014-10-21 14:12:32', '2014-10-21 14:12:32'),
(4, 5, 3, '2014-10-21 14:18:16', '2014-10-21 14:18:16'),
(11, 5, 3, '2014-10-21 16:26:47', '2014-10-21 16:26:47'),
(80, 5, 3, '2014-10-21 17:28:31', '2014-10-21 17:28:31'),
(87, 5, 6, '2014-10-22 10:32:44', '2014-10-22 10:32:44'),
(87, 4, 6, '2014-10-22 12:24:59', '2014-10-22 12:24:59'),
(81, 4, 3, '2014-10-22 12:28:40', '2014-10-22 12:28:40'),
(80, 4, 3, '2014-10-22 15:44:33', '2014-10-22 15:44:33'),
(88, 5, 6, '2014-10-23 11:37:23', '2014-10-23 11:37:23'),
(89, 5, 6, '2014-10-23 12:38:09', '2014-10-23 12:38:09'),
(89, 5, 7, '2014-10-23 12:39:32', '2014-10-23 12:39:32'),
(11, 5, 7, '2014-10-23 13:52:22', '2014-10-23 13:52:22'),
(80, 5, 7, '2014-10-23 13:52:33', '2014-10-23 13:52:33'),
(82, 5, 3, '2014-10-23 15:50:55', '2014-10-23 15:50:55'),
(3, 4, 3, '2014-10-23 15:53:35', '2014-10-23 15:53:35'),
(88, 5, 7, '2014-10-23 15:54:36', '2014-10-23 15:54:36'),
(87, 5, 7, '2014-10-23 15:55:36', '2014-10-23 15:55:36'),
(91, 5, 3, '2014-10-23 16:03:03', '2014-10-23 16:03:03'),
(92, 5, 3, '2014-10-23 16:04:35', '2014-10-23 16:04:35');

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) NOT NULL,
  `titre` varchar(70) NOT NULL,
  `question` text NOT NULL,
  `id_note` int(11) NOT NULL,
  `view` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `questions`
--

INSERT INTO `questions` (`id`, `id_users`, `titre`, `question`, `id_note`, `view`, `date_created`, `date_modified`) VALUES
(2, 3, 'Question 1', '<p>Ceci est une question test</p>\r\n<pre class="brush:js;auto-links:false;toolbar:false" contenteditable="false">&lt;script&gt;\r\n    alert("coucou");\r\n&lt;/script&gt;</pre>\r\n<p>Merci !</p>', 2, 148, '2014-10-20 11:28:30', '2014-10-20 11:28:30'),
(3, 3, 'Problème avec Java', '<pre class="brush:java;auto-links:false;toolbar:false" contenteditable="false">toto = new String("toto");</pre>\r\n<p>Ce code ne fonctionne pas ...</p>', 2, 51, '2014-10-20 11:34:55', '2014-10-20 11:34:55'),
(6, 3, 'Nouvelle question PHP', '<pre class="brush:php;auto-links:false;toolbar:false" contenteditable="false">function coucou($texte) {\r\n    return echo $texte;\r\n}</pre>\r\n<p>Ca marche pas &ccedil;a !</p>', 2, 446, '2014-10-20 11:37:32', '2014-10-20 11:37:32'),
(7, 6, 'J''ai un problème PHP', '<p>Bonjour,&nbsp;</p>\r\n<p>Je rencontre un probl&egrave;me PHP</p>\r\n<p>Voici le code :</p>\r\n<pre class="brush:php;auto-links:false;toolbar:false" contenteditable="false">echo "coucou"\r\n\r\ndie();</pre>\r\n<p>Merci de votre aide !!!</p>', 2, 495, '2014-10-22 10:11:01', '2014-10-22 10:11:01'),
(8, 7, 'Problème C++', '<p>C''est quoi C++ ?</p>', 2, 49, '2014-10-23 13:53:38', '2014-10-23 13:53:38');

-- --------------------------------------------------------

--
-- Structure de la table `questions_tags`
--

CREATE TABLE IF NOT EXISTS `questions_tags` (
  `id_question` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `questions_tags`
--

INSERT INTO `questions_tags` (`id_question`, `id_tag`) VALUES
(2, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 3),
(6, 1),
(0, 0),
(0, 1),
(7, 1),
(8, 4);

-- --------------------------------------------------------

--
-- Structure de la table `tech_countries`
--

CREATE TABLE IF NOT EXISTS `tech_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=243 ;

--
-- Contenu de la table `tech_countries`
--

INSERT INTO `tech_countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'US', 'United States'),
(2, 'CA', 'Canada'),
(3, 'AF', 'Afghanistan'),
(4, 'AL', 'Albania'),
(5, 'DZ', 'Algeria'),
(6, 'DS', 'American Samoa'),
(7, 'AD', 'Andorra'),
(8, 'AO', 'Angola'),
(9, 'AI', 'Anguilla'),
(10, 'AQ', 'Antarctica'),
(11, 'AG', 'Antigua and/or Barbuda'),
(12, 'AR', 'Argentina'),
(13, 'AM', 'Armenia'),
(14, 'AW', 'Aruba'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia and Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BV', 'Bouvet Island'),
(32, 'BR', 'Brazil'),
(33, 'IO', 'British lndian Ocean Territory'),
(34, 'BN', 'Brunei Darussalam'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CV', 'Cape Verde'),
(41, 'KY', 'Cayman Islands'),
(42, 'CF', 'Central African Republic'),
(43, 'TD', 'Chad'),
(44, 'CL', 'Chile'),
(45, 'CN', 'China'),
(46, 'CX', 'Christmas Island'),
(47, 'CC', 'Cocos (Keeling) Islands'),
(48, 'CO', 'Colombia'),
(49, 'KM', 'Comoros'),
(50, 'CG', 'Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran (Islamic Republic of)'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'CI', 'Ivory Coast'),
(107, 'JM', 'Jamaica'),
(108, 'JP', 'Japan'),
(109, 'JO', 'Jordan'),
(110, 'KZ', 'Kazakhstan'),
(111, 'KE', 'Kenya'),
(112, 'KI', 'Kiribati'),
(113, 'KP', 'Korea, Democratic People''s Republic of'),
(114, 'KR', 'Korea, Republic of'),
(115, 'XK', 'Kosovo'),
(116, 'KW', 'Kuwait'),
(117, 'KG', 'Kyrgyzstan'),
(118, 'LA', 'Lao People''s Democratic Republic'),
(119, 'LV', 'Latvia'),
(120, 'LB', 'Lebanon'),
(121, 'LS', 'Lesotho'),
(122, 'LR', 'Liberia'),
(123, 'LY', 'Libyan Arab Jamahiriya'),
(124, 'LI', 'Liechtenstein'),
(125, 'LT', 'Lithuania'),
(126, 'LU', 'Luxembourg'),
(127, 'MO', 'Macau'),
(128, 'MK', 'Macedonia'),
(129, 'MG', 'Madagascar'),
(130, 'MW', 'Malawi'),
(131, 'MY', 'Malaysia'),
(132, 'MV', 'Maldives'),
(133, 'ML', 'Mali'),
(134, 'MT', 'Malta'),
(135, 'MH', 'Marshall Islands'),
(136, 'MQ', 'Martinique'),
(137, 'MR', 'Mauritania'),
(138, 'MU', 'Mauritius'),
(139, 'TY', 'Mayotte'),
(140, 'MX', 'Mexico'),
(141, 'FM', 'Micronesia, Federated States of'),
(142, 'MD', 'Moldova, Republic of'),
(143, 'MC', 'Monaco'),
(144, 'MN', 'Mongolia'),
(145, 'ME', 'Montenegro'),
(146, 'MS', 'Montserrat'),
(147, 'MA', 'Morocco'),
(148, 'MZ', 'Mozambique'),
(149, 'MM', 'Myanmar'),
(150, 'NA', 'Namibia'),
(151, 'NR', 'Nauru'),
(152, 'NP', 'Nepal'),
(153, 'NL', 'Netherlands'),
(154, 'AN', 'Netherlands Antilles'),
(155, 'NC', 'New Caledonia'),
(156, 'NZ', 'New Zealand'),
(157, 'NI', 'Nicaragua'),
(158, 'NE', 'Niger'),
(159, 'NG', 'Nigeria'),
(160, 'NU', 'Niue'),
(161, 'NF', 'Norfork Island'),
(162, 'MP', 'Northern Mariana Islands'),
(163, 'NO', 'Norway'),
(164, 'OM', 'Oman'),
(165, 'PK', 'Pakistan'),
(166, 'PW', 'Palau'),
(167, 'PA', 'Panama'),
(168, 'PG', 'Papua New Guinea'),
(169, 'PY', 'Paraguay'),
(170, 'PE', 'Peru'),
(171, 'PH', 'Philippines'),
(172, 'PN', 'Pitcairn'),
(173, 'PL', 'Poland'),
(174, 'PT', 'Portugal'),
(175, 'PR', 'Puerto Rico'),
(176, 'QA', 'Qatar'),
(177, 'RE', 'Reunion'),
(178, 'RO', 'Romania'),
(179, 'RU', 'Russian Federation'),
(180, 'RW', 'Rwanda'),
(181, 'KN', 'Saint Kitts and Nevis'),
(182, 'LC', 'Saint Lucia'),
(183, 'VC', 'Saint Vincent and the Grenadines'),
(184, 'WS', 'Samoa'),
(185, 'SM', 'San Marino'),
(186, 'ST', 'Sao Tome and Principe'),
(187, 'SA', 'Saudi Arabia'),
(188, 'SN', 'Senegal'),
(189, 'RS', 'Serbia'),
(190, 'SC', 'Seychelles'),
(191, 'SL', 'Sierra Leone'),
(192, 'SG', 'Singapore'),
(193, 'SK', 'Slovakia'),
(194, 'SI', 'Slovenia'),
(195, 'SB', 'Solomon Islands'),
(196, 'SO', 'Somalia'),
(197, 'ZA', 'South Africa'),
(198, 'GS', 'South Georgia South Sandwich Islands'),
(199, 'ES', 'Spain'),
(200, 'LK', 'Sri Lanka'),
(201, 'SH', 'St. Helena'),
(202, 'PM', 'St. Pierre and Miquelon'),
(203, 'SD', 'Sudan'),
(204, 'SR', 'Suriname'),
(205, 'SJ', 'Svalbarn and Jan Mayen Islands'),
(206, 'SZ', 'Swaziland'),
(207, 'SE', 'Sweden'),
(208, 'CH', 'Switzerland'),
(209, 'SY', 'Syrian Arab Republic'),
(210, 'TW', 'Taiwan'),
(211, 'TJ', 'Tajikistan'),
(212, 'TZ', 'Tanzania, United Republic of'),
(213, 'TH', 'Thailand'),
(214, 'TG', 'Togo'),
(215, 'TK', 'Tokelau'),
(216, 'TO', 'Tonga'),
(217, 'TT', 'Trinidad and Tobago'),
(218, 'TN', 'Tunisia'),
(219, 'TR', 'Turkey'),
(220, 'TM', 'Turkmenistan'),
(221, 'TC', 'Turks and Caicos Islands'),
(222, 'TV', 'Tuvalu'),
(223, 'UG', 'Uganda'),
(224, 'UA', 'Ukraine'),
(225, 'AE', 'United Arab Emirates'),
(226, 'GB', 'United Kingdom'),
(227, 'UM', 'United States minor outlying islands'),
(228, 'UY', 'Uruguay'),
(229, 'UZ', 'Uzbekistan'),
(230, 'VU', 'Vanuatu'),
(231, 'VA', 'Vatican City State'),
(232, 'VE', 'Venezuela'),
(233, 'VN', 'Vietnam'),
(234, 'VG', 'Virgin Islands (British)'),
(235, 'VI', 'Virgin Islands (U.S.)'),
(236, 'WF', 'Wallis and Futuna Islands'),
(237, 'EH', 'Western Sahara'),
(238, 'YE', 'Yemen'),
(239, 'YU', 'Yugoslavia'),
(240, 'ZR', 'Zaire'),
(241, 'ZM', 'Zambia'),
(242, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Structure de la table `tech_score`
--

CREATE TABLE IF NOT EXISTS `tech_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `score` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `tech_score`
--

INSERT INTO `tech_score` (`id`, `name`, `description`, `score`, `date_created`, `date_modified`) VALUES
(1, 'NEW_USER', 'Nouvel utilisateur', 5, '2014-10-19 21:41:48', '2014-10-19 21:41:48'),
(2, 'ASK_QUESTION', 'Poser une question', 2, '2014-10-19 21:41:48', '2014-10-19 21:41:48'),
(3, 'ANSWER_QUESTION', 'Répondre à une question', 4, '2014-10-19 21:42:39', '2014-10-19 21:42:39'),
(4, 'BEST_ANSWER', 'Etre choisi comme la meilleure réponse', 20, '2014-10-19 21:42:39', '2014-10-19 21:42:39'),
(5, 'GOOD_ANSWER', 'Avoir une réponse votée favorablement', 5, '2014-10-19 21:43:36', '2014-10-19 21:43:36'),
(6, 'BAD_ANSWER', 'avoir une réponse votée défavorablement', -5, '2014-10-19 21:43:36', '2014-10-19 21:43:36'),
(7, 'VOTE_BAD_ANSWER', 'Voter défavorablement une réponse', -1, '2014-10-19 21:44:00', '2014-10-19 21:44:00');

-- --------------------------------------------------------

--
-- Structure de la table `tech_tags`
--

CREATE TABLE IF NOT EXISTS `tech_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Contenu de la table `tech_tags`
--

INSERT INTO `tech_tags` (`id`, `name`, `date_created`, `date_modified`) VALUES
(1, 'PHP', '2014-10-19 16:30:41', '2014-10-19 16:30:41'),
(2, 'Javascript', '2014-10-19 16:30:41', '2014-10-19 16:30:41'),
(3, 'Java', '2014-10-19 21:08:33', '2014-10-19 21:08:33'),
(4, 'C++', '2014-10-19 21:08:33', '2014-10-19 21:08:33'),
(5, 'AppleScript', '2014-10-23 15:19:01', '2014-10-23 15:19:01'),
(6, 'AS3', '2014-10-23 15:19:01', '2014-10-23 15:19:01'),
(7, 'Bash', '2014-10-23 15:19:01', '2014-10-23 15:19:01'),
(8, 'ColdFusion', '2014-10-23 15:19:01', '2014-10-23 15:19:01'),
(9, 'C#', '2014-10-23 15:19:01', '2014-10-23 15:19:01'),
(10, 'CSS', '2014-10-23 15:19:01', '2014-10-23 15:19:01'),
(11, 'Delphi', '2014-10-23 15:19:01', '2014-10-23 15:19:01'),
(12, 'Diff', '2014-10-23 15:19:01', '2014-10-23 15:19:01'),
(13, 'Erlang', '2014-10-23 15:19:01', '2014-10-23 15:19:01'),
(14, 'Groovy', '2014-10-23 15:19:01', '2014-10-23 15:19:01'),
(15, 'JavaFX', '2014-10-23 15:19:01', '2014-10-23 15:19:01'),
(16, 'Perl', '2014-10-23 15:19:01', '2014-10-23 15:19:01'),
(17, 'Plain', '2014-10-23 15:19:01', '2014-10-23 15:19:01'),
(18, 'Ruby', '2014-10-23 15:19:01', '2014-10-23 15:19:01'),
(19, 'Sass', '2014-10-23 15:19:01', '2014-10-23 15:19:01'),
(20, 'Scala', '2014-10-23 15:19:01', '2014-10-23 15:19:01'),
(21, 'Sql', '2014-10-23 15:19:01', '2014-10-23 15:19:01'),
(22, 'Vb', '2014-10-23 15:19:01', '2014-10-23 15:19:01');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(70) NOT NULL,
  `birthday` datetime NOT NULL,
  `id_country` varchar(2) NOT NULL,
  `id_language` int(11) NOT NULL,
  `job` varchar(50) NOT NULL,
  `web` varchar(75) NOT NULL,
  `lien_photo` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(50) NOT NULL,
  `token` varchar(50) NOT NULL,
  `valid_count` tinyint(1) NOT NULL,
  `actif` tinyint(1) NOT NULL,
  `id_note` int(11) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pseudo` (`pseudo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `pseudo`, `firstname`, `lastname`, `email`, `birthday`, `id_country`, `id_language`, `job`, `web`, `lien_photo`, `password`, `salt`, `token`, `valid_count`, `actif`, `id_note`, `date_created`, `date_modified`) VALUES
(3, 'Viggo', 'Olivier', 'Andre', 'olivier.andre77@gmail.com', '1979-12-19 00:00:00', 'FR', 0, 'Développeur PHP', '', '5448fbf760866.jpg', '669d241a469fcec1022b0b0e8b5ab5e04d2c0412cacb4c784eb69c5fc54b01f54b564a32bfebdce46ddac4558291303a451384a17acaa40c7f3154e8f4e8a219', '2AbQ*kugHhnMaxoVOIJoeqB2jbf6eh6dHSqdYWKLkUxTRyivSx', 'YRG5TMBXvOrGFmWlEtcFYSMQ1RANoRBW*jKBzHEHzJH5evVbq*', 0, 0, 1, '2014-10-17 10:09:34', '2014-10-23 15:08:06'),
(6, 'Roger', 'Roger', '', 'roger.andre77@gmail.com', '1970-01-01 01:00:00', 'FR', 0, '', '', '', '399d3c2cb2817d9ad877646dc9e32bed1bcbe52b846d2251fe3df4701b5c319572730cb495d071b93e023e6cc8135e47f6857b12df2f688c324aebf318dd31e5', 'cjudG61wNtZl17p.IOYzPd.H7Svijhtk6*MXqfh91zH0meywiB', 'Nt0MoQ.UGcj1l36MCOVo4UQbBVaCd.Z*3J65YbUhpF.Fefp48s', 0, 0, 1, '2014-10-17 10:22:14', '2014-10-20 14:52:35'),
(7, 'jean', '', '', 'jean.olivier@gmail.com', '0000-00-00 00:00:00', 'FR', 0, '', '0', '', 'fd2ba991a317e20f1bad874fb478b2d7ee089b4324db8085ee5c0fa05bd68b7d14834d6753af094602289284a357953cfbec3e74d843c018c37ccac80439a835', 'iDQRxs2UnzdwFRGwrMLjsjy1PgCMsvyKG4OFjJl.wEH19lzuAP', 'ToMl1Qay.dW2CZZjMFb0ZrzGSQ39blQ9MIf2udrWrICI2VF4tw', 0, 0, 1, '2014-10-17 10:40:44', '2014-10-17 10:40:44'),
(8, 'Antonio25', '', 'Barney', 'antonio.andre@gmail.com', '2013-05-02 00:00:00', 'NO', 0, 'Testeur', 'www.test.fr', '', '64ce2dd7907e2a568b6110a45fa7866ab6cc8eb4fe199b18588ea9dc1d384994eafb845dcf1a492ae77bb50fa58e3000dfb955d2d82e27bd3aec85bff763a998', 'tBQLobKl5sJN5mutZShGO8gDwAxkU6bjiZ1ESIMI8TMKvKyHzB', 'bieFwGdP5nKC*d431yR1sXHx5s9dM6.4q7yAKomzJ2sdDMqyhe', 0, 0, 1, '2014-10-17 11:53:14', '2014-10-17 14:30:47');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
