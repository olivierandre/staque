<?php
	if(!empty($_POST)) {

		$loc = "Location: http://localhost/staque/index.php?page=register";

		$pseudo = $_POST['pseudo'];
		$email = $_POST['email'];
		$password = $_POST['password'];
		$passwordAgain = $_POST['passwordAgain'];

		$_SESSION['infoRegister'] = $_POST;

		/*if(verifUsernameMail($username, null)) {
			$_SESSION['errorLog'] = "Username déjà utilisé";
			header($loc);
			die();
		} else if (verifUsernameMail(null, $email)) {
			$_SESSION['errorLog'] = "Mot de passe déjà existant";
			header($loc);
			die();
		}*/

		if(empty($pseudo)) {
			$_SESSION['errorLog'] = "Veuillez saisir un pseudo";
			header($loc);
			die();
		} else if(empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
			$_SESSION['errorLog'] = "Mail incorrect";
			header($loc);
			die();
		} else if ( empty($password) || empty($passwordAgain) || $password != $passwordAgain) {
			$_SESSION['errorLog'] = "Mot de passe non renseigné";
			header($loc);
			die();
		} else {

			// Création du mot de passe sécurisé
			$salt = getSaltToken();
			$token = getSaltToken();

			for($i = 0; $i < 5000; $i++) {
				$passwordCrypt = hash('sha512', SALT_PREFIX.$password.$salt);
			}
				
			$count = createUser(strtolower($username), strtolower($email), $country, $passwordCrypt, $salt, $token);
		}

		if($count) {
			$_SESSION['log'] = TRUE;
			$_SESSION['username'] = $username;
			header("Location: http://localhost/staque/index.php?page=profil");
		} else {
			$_SESSION['errorLog'] = "La création de vos identifiants a échoué";
			header($loc);
			
		}		

	} else {
		$_SESSION['errorLog'] = "Veuillez vous enregistrer ou vous connecter pour accéder à votre profil";
		header($loc);
		
	}

	die();

?>