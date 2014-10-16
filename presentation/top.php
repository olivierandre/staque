	<header id="top">
		<div id="title">
			<h1><?= $title ?></h1>
		</div>
		<div id="log">
		<?php if($pageLogRegister) : ?>
			<a href="index.php">Retour accueil</a>
		<?php else : ?>
			<a href="index.php?page=connexion">Se connecter</a>
			<a href="index.php?page=register">S'inscrire</a>
		<?php endif ?>
		</div>
	</header>

