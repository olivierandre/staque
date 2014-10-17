<?php
	if(!empty($_POST)) {

		$pseudo = strip_tags($_POST['pseudo']);
		$password = $_POST['password'];
		$check = FALSE;
		$loc = 'Location: http://localhost/staque/index.php?page=connexion';

		if(!empty($_POST['remember'])) {
			$check = TRUE;
		}
		
		if(empty($pseudo) || empty($password)) {
			$_SESSION['errorConnexion'] = "Combinaison login/mot de passe erronée";
			header($loc);
			die();
		} else {

			$salt = getSalt($pseudo);

			$passwordCrypt = hash('sha512', SALT_PREFIX.$password.$salt);

			$verifAccess = verifLogin(strtolower($pseudo), $passwordCrypt);
		} 

		if($check) {
			setCookieUser($pseudo);
		}

		if($verifAccess) {
			$idUser = getId($pseudo);
			$_SESSION['log'] = TRUE;
			$_SESSION['pseudo'] = $pseudo;
			$_SESSION['id'] = $idUser;

		} else {
			$_SESSION['errorConnexion'] = "Vos données renseignées sont incorrectes";
			header($loc);
			die();
		}
	}

	header(PAGE_ACCUEIL);
	die();
?>