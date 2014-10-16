<?php
	if(!empty($_POST)) {
		session_start();
		$username = strip_tags($_POST['username']);
		$password = $_POST['password'];
		$check = FALSE;

		if(!empty($_POST['remember'])) {
			$check = TRUE;
		}
		
		if(empty($username) || empty($password)) {
			$_SESSION['errorConnexion'] = "Combinaison login/mot de passe erronée";
			header('Location: ../log/log.php');
			die();
		} else {
			include("../methodes/bdd.php");
			include("../methodes/methodes_username.php");
			include("../methodes/methodes_select_film.php");
			include("../inc/constant.php");

			$salt = getSalt($username);

			$passwordCrypt = hash('sha512', SALT_PREFIX.$password.$salt);

			$verifAccess = verifLogin(strtolower($username), $passwordCrypt);
		} 

		if($check) {
			setCookieUser($username);
		}

		if($verifAccess) {
			$idUser = getId($username);
			$_SESSION['log'] = TRUE;
			$_SESSION['username'] = $username;
			$_SESSION['userSlugPrefer'] = getMoviePreferUser($idUser);
			header("Location: ../html/index.php");
			die();
		} else {
			$_SESSION['errorConnexion'] = "Vos données renseignées sont incorrectes";
			header("Location: ../log/log.php");
			die();
		}
	}
?>