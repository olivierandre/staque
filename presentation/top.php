	<header id="top">
		<div id="title">
			<h1><?= $title ?></h1>
		</div>

		<div id="log">
		<?php 

			if(!empty($_COOKIE['staque'])) {
				$pseudo = $_COOKIE['staque'];
			} else if (isLog()) {
				$pseudo = $_SESSION['pseudo'];
			}

			if(!empty($pseudo)) :
				$id = getId($pseudo);

		?>
			<a href="index.php?page=profil&pseudo=<?= $pseudo ?>"><?= $pseudo ?></a>
			<a href="index.php?page=logout">Logout</a>

		<?php else : ?>
			<a href="index.php?page=connexion">Se connecter</a>
			<a href="index.php?page=register">S'inscrire</a>
		<?php endif ?>

		<?php if(empty($pageHome)) : ?>
			<a href="index.php">Retour accueil</a>
		<?php endif ?>	
		
		</div>
	</header>