<?php
	if(!empty($_POST)) {

		$_SESSION['infoProfil'] = $_POST;

		$id = $_SESSION['id'];
		$pseudo = strip_tags($_POST['pseudo']);
		$firstname = strip_tags($_POST['firstname']);
		$lastname = strip_tags($_POST['lastname']);
		$email = strip_tags($_POST['email']);
		$birthday = date( 'Y-m-d H:i:s', strtotime( strip_tags($_POST['birthday'])));
		$id_country = strip_tags($_POST['id_country']);
		$job = strip_tags($_POST['job']);
		$web = strip_tags($_POST['web']);
		
		$loc = 'Location: http://localhost/staque/index.php?page=profil';
		
		if(empty($pseudo)) {
			$_SESSION['errorProfil'] = "Le pseudo est obligatoire";
			header($loc);
			die();
		} elseif (verifPseudoNotUser($pseudo, $id)) {
			$_SESSION['errorProfil'] = "Ce pseudo est déjà utilisé";
			header($loc);
			die();
		} else {

			// MAJ du profil
			$updateProfil = updateProfilUser($id, $pseudo, $firstname, $lastname, $email, $birthday, $id_country, $job, $web);
		} 

		if($updateProfil) {
			$_SESSION['errorProfil'] = "Votre profil est à jour";
			$_SESSION['infoProfil'] = "";
		} else {
			$_SESSION['errorProfil'] = "Une erreur lors de la mise à jour a eu lieu";
		}
		header($loc);
			die();
	}

	header(PAGE_ACCUEIL);
	die();
?>