<?php 

	if(isLog()) {
		header(PAGE_ACCUEIL);
		die();	
	}

	$error = "CONNEXION";

	if(!empty($_SESSION['errorConnexion'])) {
		$error = $_SESSION['errorConnexion'];
		$_SESSION['errorConnexion'] = "";
	}
		
?>

<div id="titreForm">
	<h1 class="errorForm"><?= $error ?></h1>
</div>

<div id="formulaireLog">
		<form id="formLog" method="POST" action="index.php?page=verifLog">
			<label for="pseudo">Pseudo ou email</label>
			<input type="text" id="pseudo" name="pseudo">

			<label for="password">Password</label>
			<input type="password" id="password" name="password">

			<label class="remember" for="remember"><input id="remember" type="checkbox" name="remember">Remember Me</label>

			<input type="submit" value="Se connecter !">

		</form>
		<!-- <a class="lost" href="index.php?page=lost">Mot de passe perdu ?</a> -->
	</div>