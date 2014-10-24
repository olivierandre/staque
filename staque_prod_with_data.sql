-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 24 Octobre 2014 à 11:55
-- Version du serveur :  5.6.16
-- Version de PHP :  5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `staque_prod`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `answers`
--

INSERT INTO `answers` (`id`, `id_user`, `id_question`, `answer`, `id_note`, `resolve`, `date_created`, `date_modified`) VALUES
(1, 3, 2, '<p><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">avec les dynamic mais je trouve &ccedil;a plut&ocirc;t crade toute fa&ccedil;on pour faire ce genre de chose il y a rien de vraiment &eacute;l&eacute;gant:</span></p>\r\n<pre class="brush:csharp;auto-links:false;toolbar:false" contenteditable="false">List&lt;dynamic&gt; result = new List&lt;dynamic&gt;();\r\n			foreach (var item in personnes)\r\n			{\r\n				dynamic r=new ExpandoObject();\r\n				r.NomPersonne = item.Nom;\r\n				foreach (var doc in item.DocIdentite)\r\n				{\r\n					var p = r as IDictionary&lt;String, object&gt;;\r\n					p[doc.TypeDoc.IDTypeDoc] = doc.TypeDoc;\r\n				}\r\n				result.Add(r);\r\n			}\r\n			// Exemple de r&eacute;cup&eacute;ration\r\n			TypeDoc type1=result[0].TypeDoc1;</pre>\r\n<p><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">&nbsp;</span></p>', 3, 0, '2014-10-24 10:09:49', '2014-10-24 10:09:49'),
(2, 2, 3, '<p><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">C''est une eigenclass ou metaclasse ou Singleton, la communaut&eacute; Ruby n''a pas encore d&eacute;cid&eacute; comment les appeler.</span><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Tu peux en savoir plus en regardant ce gist:</span><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><a style="color: #325078; text-decoration: none; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" href="https://gist.github.com/rsliter/4216800" target="_blank" rel="nofollow">https://gist.github.com/rsliter/4216800</a></p>', 3, 1, '2014-10-24 10:13:15', '2014-10-24 10:13:15'),
(3, 4, 4, '<p>Elle est trop dure ta question Mireille !!!</p>', 3, 0, '2014-10-24 10:20:28', '2014-10-24 10:20:28'),
(4, 7, 5, '<p><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">L''utilisation d''AJAX en&nbsp;</span><span style="color: #333333; font-size: 13px; font-family: monospace; padding: 2px; background: #eeeeee;">file<span style="color: black;">:</span><span style="color: #808080;">//</span></span><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">&nbsp;est une source infinie de probl&egrave;mes... Ca me semble du reste assez h&eacute;r&eacute;tique conceptuellement. Tu devrais essayer depuis un serveur local, ce serait plus judicieux.</span><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Et si l''utilisation d''un serveur local n''est pas envisageable, alors il faudra se poser la question de savoir si les technologies que tu utilises sont vraiment adapt&eacute;es &agrave; ton besoin.</span></p>', 3, 0, '2014-10-24 11:12:35', '2014-10-24 11:12:35');

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
(3, 2, 'Merci pour ce retour très intéressant.', '2014-10-24 10:13:54', '2014-10-24 10:13:54'),
(5, 3, 'Moyen ta réponse, Céline ...', '2014-10-24 10:21:01', '2014-10-24 10:21:01'),
(8, 4, 'Superbe réponse Alain. Vraiment ...', '2014-10-24 11:26:56', '2014-10-24 11:26:56'),
(1, 4, 'Il est trop fort ce Alain !', '2014-10-24 11:41:37', '2014-10-24 11:41:37'),
(6, 4, 'Je suis d''accord sur le principe du same origin. Qu''on peut outrepasser justement grâce à CORS.  Ma problématique est bien dans le cadre de CORS, s''il est possible d''établir une nouvelle connexion en HTTPS, et donc d''échanger des certificats, avec XmlHTTPRequest. (ou XDomainRequest).  A+', '2014-10-24 11:47:56', '2014-10-24 11:47:56'),
(7, 4, 'Le problème n''est pas le même : la same-origin-policy n''aurait pas autorisé un fichier du disque dur à communiquer avec un site web. Les règles CORS n''outrepassent rien du tout et notamment pas ça. (Elles permettent à deux sites de communiquer s''ils sont d''accords. C''est différent.)  ... Mais oui, le problème du certificat côté client, reste. Je ne suis pas sûr de comment ça pourrait marcher, parce qu''il s''agit là d''authentifier le fait que c''est bien ton navigateur, qui appelle le site A à la demande du site B. Et à ma connaissance, le protocole SSL ne permet pas de moyen de représenter l''autorité "client X, à la demande de domaine Y"', '2014-10-24 11:49:56', '2014-10-24 11:49:56'),
(6, 4, 'Tu as complètement raison. J''ai pris un raccourcis erroné en parlant du même problème   Quoi qu''il en soit, je n''ai effectivement pas réussi à demander à mon JS d''ouvrir un nouveau canal SSL, alors que la problématique Cross-Domain était résolue.  J''ai donc mis en oeuvre l''autre solution que je présentais : Un frontal Apache avec lequel mon client communique en HTTPS 2 serveurs derrière le frontal avec lesquels il communique en HTTP Quand le client lance le JS, il a déjà ouvert son tunnel SSL avec le frontal Apache. Mais dans tous les cas, il n''y a plus de XDomain avec JS, vu qu''il appelle lui aussi le frontal. C''est mod_proxy qui s''occupe de faire la redirection vers la bon serveur en interne...   La solution marche et je dois avouer, me plait.  Merci encore pour vos aides. A+', '2014-10-24 11:51:32', '2014-10-24 11:51:32'),
(6, 3, 'Très pointue comme question ...', '2014-10-24 11:53:25', '2014-10-24 11:53:25'),
(6, 2, 'Merci de votre aide !!!', '2014-10-24 11:55:02', '2014-10-24 11:55:02');

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
(3, 7, 5, '2014-10-24 10:37:19', '2014-10-24 10:37:19'),
(3, 6, 4, '2014-10-24 10:37:19', '2014-10-24 10:37:19'),
(2, 4, 2, '2014-10-24 10:50:15', '2014-10-24 10:50:15'),
(2, 5, 2, '2014-10-24 10:50:21', '2014-10-24 10:50:21'),
(4, 5, 7, '2014-10-24 11:26:28', '2014-10-24 11:26:28');

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_users` int(11) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `question` text NOT NULL,
  `id_note` int(11) NOT NULL,
  `view` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `questions`
--

INSERT INTO `questions` (`id`, `id_users`, `titre`, `question`, `id_note`, `view`, `date_created`, `date_modified`) VALUES
(1, 2, 'Fatal error: Call to a member function fetch() on a non-object', '<p><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Bonjour,&nbsp;</span><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">J''ai chang&eacute; d&rsquo;h&eacute;bergeur et depuis ce transfert, j''obtiens une erreur</span></p>\r\n<div class="bbcode_container" style="margin: 5px 20px 20px; padding: 0px; color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">\r\n<div class="bbcode_quote" style="margin: 0px 10px 10px; padding: 0px; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border: 1px solid #417394; font-style: italic; font-stretch: normal; font-family: Tahoma, Calibri, Verdana, Geneva, sans-serif; position: relative; top: 0px; background: none #f2f6f8;">\r\n<div class="quote_container" style="margin: 0px; padding: 5px 10px; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">\r\n<div class="bbcode_quote_container" style="margin: 0px; padding: 0px; width: 9px; height: 13px; position: absolute; left: -9px; background: url(''http://www.developpez.net/forums/images/misc/quote-left.png'') 0% 50% no-repeat transparent;">&nbsp;</div>\r\nFatal error: Call to a member function fetch(PDO::FETCH_OBJ) on a non-object</div>\r\n</div>\r\n</div>\r\n<p><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Il ne veut pas de mon PDO, pourtant celui-ci est activ&eacute; sur le serveur...</span><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Cette erreur me rend fou depuis plusieurs jours; est ce que quelqu''un &agrave; une piste de solution ?&nbsp;</span><img class="inlineimg" style="border: 0px; max-width: 100%; vertical-align: bottom; color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" title=":)" src="http://www.developpez.net/forums/images/smilies/icon_smile.gif" alt="" border="0" /><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Merci pour votre aide.</span></p>\r\n<pre class="brush:php;auto-links:false;toolbar:false" contenteditable="false">&lt;?php\r\n    session_start ();\r\n    require_once(''./admin/connexion_bdd.php'');\r\n    $sql =  ''SELECT * '' .\r\n                ''FROM textes '' .\r\n                ''WHERE textes.id=2'';\r\n    $reponse = $bdd-&gt;query($sql);\r\n        $texte = $reponse-&gt;fetch(PDO::FETCH_OBJ);\r\n        $contenu1=$texte-&gt;contenu1;\r\n        $contenu2=$texte-&gt;contenu2;\r\n        $contenu3=$texte-&gt;contenu3;\r\n        $contenu4=$texte-&gt;contenu4;\r\n \r\n \r\n    $sql1 =  "SELECT * FROM photos";\r\n        $reponse1 = $bdd-&gt;query($sql1);\r\n        $photos = $reponse1-&gt;fetchAll(PDO::FETCH_OBJ);\r\n    $count=0;\r\n    $count2=0;\r\n    $count3=1;\r\n    $count4=0;\r\n    foreach ($photos as $photo){\r\n    $count+=1;\r\n    ${''miniature''.$count}  = $photo-&gt;miniature;\r\n    ${''photo''.$count}  = $photo-&gt;chemin;\r\n    ${''title''.$count}  = $photo-&gt;titleEN;\r\n    ${''alt''.$count}  = $photo-&gt;altEN;\r\n    }\r\n</pre>\r\n<p><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">&nbsp;</span></p>', 2, 3, '2014-10-24 09:42:18', '2014-10-24 09:42:18'),
(2, 4, 'Création ou instanciation d''une classe avec un nombre d''attributs inconnu à l''avance', '<p><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Salut,</span><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">J''ai une entit&eacute; personne et une autre entit&eacute; Document d''identit&eacute; (avec une relation 0-n : une personne peut avoir plusieurs documents d''identit&eacute;) et chaque document d''identit&eacute; poss&egrave;de un type du document d''identit&eacute; c''est pour &ccedil;a qu''on a une entit&eacute; TypeDocIdentite. Je veux cr&eacute;er une classe dont les attributs sont les attributs de la personne avec tous les types de documents d''identit&eacute; sauf que le nombre de Types de documents d''identit&eacute; n''est pas connu &agrave; l''avance et c''est illimit&eacute; c''est comme si je veux faire cela ( mais c''est faux biensur on ne peut pas mettre un foreach &agrave; l''int&eacute;rieur d''un new):</span></p>\r\n<pre class="brush:csharp;auto-links:false;toolbar:false" contenteditable="false">var query = from p in objectContext.Personne select new { NomPersonne = p.Nom , PrenomPersonne = p.Prenom ,\r\n  foreach(var Type in objectContext.TypeDocIdentite ) { Type.NomType  = p.DocIdentite.where(d=&gt;d.TypeDoc.IDTypeDoc == Type.IDTypeDoc )} }</pre>\r\n<p><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">J''esp&egrave;re que j''ai bien expliqu&eacute; le probl&egrave;me, je ne sais pas si ce que je veux faire est possible ou pas mais j''en ai vraiment besoin.<br /><br />Merci d''avance.<br /></span></p>', 2, 3, '2014-10-24 10:07:50', '2014-10-24 10:07:50'),
(3, 3, 'Instruction que je ne comprends pas', '<p><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Bonjour,</span><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Je suis en train d''analyser un script Ruby comportant la ligne suivante :</span></p>\r\n<pre class="brush:ruby;auto-links:false;toolbar:false" contenteditable="false">...\r\nclass &lt;&lt; Graphics\r\n...</pre>\r\n<p><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">J''ai beau chercher dans des tutos Ruby, je ne trouve pas le sens de cette instruction, et les recherches Google sont infructueuses puisque celui-ci ne prend pas en compte "&lt;&lt;".<br /><br />Merci d''avance pour vos r&eacute;ponses,<br />Cordialement.<br /></span></p>', 2, 19, '2014-10-24 10:11:47', '2014-10-24 10:11:47'),
(4, 5, '[Algo] Floyd-Warshall et matrice des distances', '<p><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Bonjour &agrave; tous</span><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">J''ai &agrave; r&eacute;soudre un probl&egrave;me de routage en JAVA</span><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Avec l''algo de Floyd-Warshall en j''ai un probl&egrave;me avec la question de la matrice de distances</span><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Je stocke les liens suivants dans une matrice 2D</span></p>\r\n<pre class="brush:java;auto-links:false;toolbar:false" contenteditable="false">0 1\r\n1 2\r\n2 3\r\n3 4\r\n4 5\r\n5 1\r\n6 7\r\n</pre>\r\n<p><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">J''utilise le code suivant pour, entre autre, g&eacute;n&eacute;rer la matrice des distances:<br /></span></p>\r\n<pre class="brush:java;auto-links:false;toolbar:false" contenteditable="false">for (int v = 0; v &lt; n; v++) {\r\n            matriceDistance[v][v] = INF;\r\n            matriceDesSucc[v][v] = -1;\r\n        }\r\n        for (int i = 0; i &lt; m; i++) {\r\n            int u = liens[i][0];\r\n            int v = liens[i][1];\r\n            matriceDistance[u][v] = 0; //poids\r\n            matriceDesSucc[u][v] = v;\r\n        }\r\n \r\n        for (int k = 0; k &lt; n; k++) {\r\n            for (int i = 0; i &lt; n; i++) {\r\n                for (int j = 0; j &lt; n; j++) {\r\n                    if (matriceDistance[i][j] &gt; (matriceDistance[i][k] + matriceDistance[k][j])) {\r\n                        matriceDistance[i][j] = matriceDistance[i][k] + matriceDistance[k][j];\r\n                        matriceDesSucc[i][j] = matriceDesSucc[i][k];\r\n                    }\r\n                }\r\n            }\r\n        }</pre>\r\n<p><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;"><strong>Mon questionnement se situe &agrave; la ligne 8.. Comme calculer le poids d''un lien ?</strong><br />j''ai cherch&eacute; partout et dans les exemples &ccedil;a semble &ecirc;tre attribu&eacute; par hasard....<br /><br />&Eacute;clairez-moi SVP<br />Merci<br /></span></p>', 2, 23, '2014-10-24 10:19:09', '2014-10-24 10:19:09'),
(5, 6, 'XmlHTTPRequest, CORS et Certificat SSL', '<p><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Bonjour &agrave; tous,</span><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Je dois d&eacute;velopper des WebServices, les s&eacute;curiser dans un tunnel HTTPS, et y acc&eacute;der depuis du JS (AngularJS) h&eacute;berg&eacute; sur un autre domaine... Oui, je sais...</span><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Quand je tappe le WSDL de mon WebService depuis un navigateur, il me demande quel certificat je veux envoyer (j''ai cr&eacute;&eacute; ce dernier avec OpenSSL et je l''ai charg&eacute; dans mon navigateur). Puis le serveur m''envoie &agrave; son tour son certificat, que j''accepte. A partir de l&agrave;, on peut communiquer. Jusque l&agrave;, tout va bien et tout me semble normal.</span><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Maintenant, quand je veux faire l''appel &agrave; ce m&ecirc;me WSDL depuis un JS (</span><em style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">que j''appelle depuis un index.html en local sur file://</em><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">) je r&eacute;cup&egrave;re &eacute;videmment un objet&nbsp;</span><em style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">XmlHTTPRequest</em><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">, positionne&nbsp;</span><em style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">withCredentials=true</em><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">, j''ai positonn&eacute; le&nbsp;</span><em style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Access-Control-Allow-Origin: *</em><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">&nbsp;sur mon serveur ainsi que&nbsp;</span><em style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Access-Control-Allow-Credentials: true</em><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">.</span><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Probl&egrave;me : mon JS n''envoie pas le certificat client, donc le serveur... ne lui r&eacute;pond pas.</span><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Existe-t-il une solution pour envoyer un certificat avec JS et accepter celui du serveur ?</span><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Ou la seule solution pour moi est de mettre en place un proxy frontal qui s''occupe de :</span></p>\r\n<ol class="decimal" style="margin: 0px 40px; padding: 0px; color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">\r\n<li style="margin: 0px; padding: 0px; list-style: decimal outside;">&eacute;tablir le lien HTTPS/SSL avec le client</li>\r\n<li style="margin: 0px; padding: 0px; list-style: decimal outside;">dispatcher vers les 2 domaines les requ&ecirc;tes clientes<br />\r\n<ol class="decimal" style="margin: 0px 40px; padding: 0px;">\r\n<li style="margin: 0px; padding: 0px; list-style: decimal outside;">Pour &ecirc;tre s&eacute;curis&eacute; de point &agrave; point, je dois pouvoir mettre en place un tunnel SSL entre mon frontal et mes 2 serveurs non ?</li>\r\n</ol>\r\n</li>\r\n</ol>\r\n<p><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;">Par avance, merci pour vos pistes, r&eacute;ponses, solutions, etc...</span><br style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: 13px; background-color: #fafafa;" /><span style="color: #333333; font-family: Verdana, Arial, Tahoma, Calibri, Geneva, sans-serif; font-size: small;"><span style="background-color: #fafafa;">Nana</span></span></p>', 2, 31, '2014-10-24 11:09:25', '2014-10-24 11:09:25');

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
(1, 1),
(2, 9),
(3, 18),
(4, 3),
(5, 2);

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
(1, 'Viggo', 'Olivier', 'André', 'olivier.andre77@gmail.com', '1979-12-19 00:00:00', 'FR', 0, '', '', '544a00af08b80.jpg', '425db1bcc06ff31c93cc020c6455ee7f9948a904bcfe93e82b8521ed9a968a3c1936043f05c53eec65d69f4959a90156bfaf361423376d381bb77df4145107a5', '0uxjtiq3ganxzjv7D1ojPbMt9Fnr4J3YgYZsl14GaUcjdHTU6z', '8i2ws0L2tUn40hBNu6ue3cMdMKKN75tgUWBWiWpTvogB4sKXfm', 0, 0, 1, '2014-10-24 09:31:52', '2014-10-24 09:32:32'),
(2, 'Kitty', 'Hello', 'Kitty', 'hello.kitty@gmail.com', '1974-05-07 00:00:00', 'JP', 0, 'Développeuse expérimenté sur PHP, JAVA & Ruby', 'http://www.sanrio.com/', '544a013ae0573.jpg', 'bd72bb9c2ce4113dcdde5a9f4f9d671f716c4903f258610c6a5f9b90e4766624981c37b491c5065a1e20d97c7aeb278366cabeb79efef6f4056eb9d29f7c36ce', 'VC.BVenEmWDNA1FW4QEVtVFBH762hiHhnO.6kBpiZ2uv3BrKB0', 'lNKEOBSsAn5oQeFhjL6OIuXiVbU7iRUOI7ZctYAbTLZC2O4SV6', 0, 0, 1, '2014-10-24 09:34:01', '2014-10-24 09:38:36'),
(3, 'Rene', 'René', 'Angélil', 'rene.angelil@free.fr', '0000-00-00 00:00:00', 'CA', 0, 'Développeur PHP', '', '544a03708794e.jpg', '82bc8705c785fc30ae7c84808a288cb80eaa26aecf4a4abf78720a07004de357548572c0cee86cd8e13ff474e301789b79afd23222ea853980af58e26ae10571', 'E*vkTtosbDAq3dULWB04AaN8enwvApX3HS0D5EOe6.UX2.VnYa', '4o.oz3tmiiDu0uMr6Q4i6Z.dVBCGYfQ77A6vI89AQvaBPP6so7', 0, 0, 1, '2014-10-24 09:44:00', '2014-10-24 10:04:16'),
(4, 'Celine', 'Céline', 'Dion', 'celine.dion@yahoo.fr', '0000-00-00 00:00:00', 'CA', 0, 'Développeuse JAVA, C#', 'www.celinedion.fr', '544a08682d183.jpg', 'c628c1533868427463cd3fa988eb350265ade909359bb26e43e394128bdeed77c25bd8923f9dfd765a2700b84d906922e94022d9a9466c2349465e127f11ffd7', 'lexDyFI2IoByfrDoXo.YaazuOk3aed2duU0V6Gbx*Ncowt5cTu', 'h1R9clJn5hZBtMWIvLlWm7*Qd8UZeIhwf65g**UtXi5pIiRCC3', 0, 0, 1, '2014-10-24 10:04:37', '2014-10-24 10:05:25'),
(5, 'Mireille', 'Mireille', 'Mathieu', 'mireille.mathieu@orange.fr', '0000-00-00 00:00:00', 'FR', 0, 'Développeur Java', 'www.mireillemathieu.com', '544a0b0d5be6e.png', 'a68e1dce5ca19a10c676b0b1b6b8d0be6cc2dea9b1f26e3221ed5e736ec16a4f354cabc6b0a5a410106954edca2f91d06ddd3e94ab673a609ccff954f36e6e08', 'yWkjypmPKyeMysqGEfviZpmWtpmGygrIJQNF.ull76aHbIf3UQ', 'n5m.voinQ3HfkxETJGSjtP7c*GVYaD7Ue*G6P21rK8vhsT3A0F', 0, 0, 1, '2014-10-24 10:16:12', '2014-10-24 10:17:13'),
(6, 'Nana', 'Nana', 'Mouskouri', 'nana.mouskouri@aol.fr', '0000-00-00 00:00:00', 'GR', 0, 'Full-Stack Web Developper', 'www.nana-mouskouri.net', '544a169f3a1b2.png', '74fd1bb8e133495c3173d54d91b6e9860b92e4257411e6c03f68c7d82cd6985a760b645dd133f0ba54bc36b06610f40873f3396d565aa3b461b8cc2a53e6c512', 'IQ.tZ.vqo8k5kkoi3BfZMShKyiZPtwbvryMsGQC9JDD8abb8jg', 'fAA2pePGtq59eT*AOhX4swSKlnU2OtMaBQSNLxKD*jAJwWcGk0', 0, 0, 1, '2014-10-24 11:05:33', '2014-10-24 11:07:36'),
(7, 'Dieu', 'Alain', 'Delon', 'alain.delon@free.fr', '0000-00-00 00:00:00', 'FR', 0, 'Développeur beau gosse', 'fr.wikipedia.org/wiki/Alain_Delon', '544a17dcdc456.jpg', 'fa87993f5ef8c34f1f2b3fddee90dadf3e3bef5660176affe21dce8bbcce5075e99e3a513ea126c7c9bf8651ab5a73d4999b59c1abcf4a84d23e00601f5bfc92', 'Ej7GybdlyEnZSLqQGDrPPFs3kI5nt.F2sN*3I48QMTohYHs5jM', '2T0qCA8X0TU0JJuGzX3OzUgjaQ21taPfCrd*vEWywKA9pnUPpK', 0, 0, 1, '2014-10-24 11:10:49', '2014-10-24 11:11:21'),
(8, 'Pierre', 'Pierre', 'Bellemare', 'pierre.bellemaire@free.fr', '0000-00-00 00:00:00', 'FR', 0, 'Ingénieur d''études senior', 'fr.wikipedia.org/wiki/Pierre_Bellemare', '544a197c412d7.jpg', 'f2778fca3b8a71a93903bef0f5412b420782f291daf5593f7316c6683e1c81d4805a63d27d10b63e66c39188a78c65744448e8a3d6bed457cc4fb9b5a80e4c69', 'LDUBBYaWs8PQGwntTGM1FaLnH9XAzKrfHcFwkgXnZdOMqc6p.Z', 'P7zn2Z1OoU3.5mh300QubJqQXwmDcJsD54t7X.rNDEr7iy8ExC', 0, 0, 1, '2014-10-24 11:17:43', '2014-10-24 11:18:21');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
