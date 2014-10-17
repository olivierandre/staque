<?php 

	if(empty($_SESSION['id'])) {
		header("PAGE_ACCUEIL");
		die();
	}

	if(!empty($_SESSION['infoProfil'])) {
		$infoRegister = $_SESSION['infoProfil'];
		$pseudo = $infoRegister['pseudo'];
		$firstname = $infoRegister['firstname'];
		$lastname = $infoRegister['lastname'];
		$email = $infoRegister['email'];
		$birthday = $infoRegister['birthday'];
		$countryUser = $infoRegister['id_country'];
		$job = $infoRegister['job'];
		$web = $infoRegister['web'];

		$_SESSION['infoRegister'] = "";
	} else {
		$username = "";
		$email = "";
		$countryUser = "";
	}

	$id = $_SESSION['id'];
	$profil = getUserProfil($id);

	$countryUser = $profil['id_country'];
	if(empty($countryUser)) {
		$countryUser = "";
	}

	$birthday = strtotime($profil['birthday']);
	
	if( $birthday == 0) {
		$birthday = "";
	} else {
		$birthday = date("d/m/Y", $birthday);
	}

	$job = $profil['job'];
	if(empty($job)) {
		$job = "";
	} 

	$web = $profil['web'];
	if(empty($web)) {
		$web = "";
	} 

	$countries = getAllCountries();
	$dateCreation = dateFrWithHour($profil['date_created']);
	
?>

<div id="formulaireLog">
	<form method="POST" action="index.php?page=verifProfil">
		<label for="pseudo">Pseudo</label>
		<input type="text" id="pseudo" name="pseudo" value="<?= ucfirst($profil['pseudo']) ?>">

		<label for="firstname">Prénom</label>
		<input type="text" id="firstname" name="firstname" value="<?= ucfirst($profil['firstname']) ?>">

		<label for="lastname">Nom</label>
		<input type="text" id="lastname" name="lastname" value="<?= ucfirst($profil['lastname']) ?>">

		<label for="email">Email</label>
		<input type="text" id="email" name="email" value="<?= ucfirst($profil['email']) ?>">

		<label for="birthday">Date d'anniversaire</label>
		<input type="text" id="birthday" name="birthday" value="<?= $birthday ?>">

		<label for="country">Country</label>
			<select name="id_country" id="country">
				<option value=""></option> 
				<?php 
					foreach($countries as $country) : 
						$id_country = $country['country_code'];
						if($countryUser == $id_country) : echo "trouve";
				?>
				<option selected value="<?= $id_country ?>"><?= $country['country_name'] ?></option> 
				<?php else : ?>
				<option value="<?= $id_country ?>"><?= $country['country_name'] ?></option>
				<?php endif ?> 
				<?php endforeach ?>
			</select>

		<!-- <label for="Langue">Langue</label>
		<input type="text" id="Langue" name="Langue"> -->

		<label for="job">Métier</label>
		<input type="text" id="job" name="job" value="<?= $profil['job'] ?>">

		<label for="web">Site web</label>
		<input type="text" id="web" name="web" value="<?=$web ?>" placeholder="N'ajoutez pas le 'http://'">

		

		<p class="errorForm">Date création : <?= $dateCreation ?></p>

		<input type="submit" value="Update profil">

		<?php 
		if(!empty($_SESSION['errorProfil'])) : 
			$error = $_SESSION['errorProfil'];
			$_SESSION['errorProfil'] = "";
		?>
		<p class="errorForm"><?= $error ?></p>
		<?php endif;?>
	</form>
	
</div>