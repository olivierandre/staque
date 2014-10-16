<?php
	session_start();
	include("../inc/header.php");
	include("../methodes/bdd.php");
?>
	<div id="header">
			<a href="../html/index.php">Retour accueil</a>
	</div>

	<div id="formulaireLog">
		<h1>Perte du mot de passe</h1>
		<form method="POST" action="reinitPass.php">
			<label for="username">Username ou mail</label>
			<input type="text" id="username" name="username">

			<input type="submit" value="Réinitialiser mot de passe !">
			
			<?php 
				if(!empty($_SESSION['errorConnexion'])) : 
					$error = $_SESSION['errorConnexion'];
					$_SESSION['errorConnexion'] = "";
			?>
			
			<p class="errorForm"><?= $error ?></p>
			<?php endif;?>
		</form>
	</div>