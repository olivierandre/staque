<?php
	if(!empty($_POST)) {

		$loc = "Location: http://localhost/staque/index.php?page=register";

		$pseudo = $_POST['pseudo'];
		$email = $_POST['email'];
		$password = $_POST['password'];
		$passwordAgain = $_POST['passwordAgain'];

		$_POST['password'] ="";
		$_POST['passwordAgain'] = "";

		$_SESSION['infoRegister'] = $_POST;

		if(verifUsernameMail($pseudo)) {
			$_SESSION['errorLog'] = "Pseudo déjà utilisé";
			header($loc);
			die();
		} else if (verifUsernameMail($email)) {
			$_SESSION['errorLog'] = "Adresse mail déjà existant";
			header($loc);
			die();
		}

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
				
			$id = createUser(strtolower($pseudo), strtolower($email), $passwordCrypt, $salt, $token);

		}

		if($id) {
			$_SESSION['log'] = TRUE;
			$_SESSION['id'] = $id;
			$_SESSION['pseudo'] = $pseudo;
			$_SESSION['infoRegister'] = "";

			// MAJ_Score

			

			
			header("Location: http://localhost/staque/index.php?page=profil");
			die();
		} else {
			$_SESSION['errorLog'] = "La création de vos identifiants a échoué";
		}		

	} else {
		$_SESSION['errorLog'] = "Veuillez vous enregistrer ou vous connecter pour accéder à votre profil";
	}

	header($loc);
	die();

?>