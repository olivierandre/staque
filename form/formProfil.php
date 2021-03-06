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
	
	if( $birthday <= 0) {
		$birthday = "";
	} else {
		$birthday = date("d/m/Y", $birthday);
		$age = date('Y') - date('Y', strtotime($birthday));
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
	$error = "PROFIL";

	if(!empty($_SESSION['errorProfil'])) {
		$error = $_SESSION['errorProfil'];
		$_SESSION['errorProfil'] = "";
	}

	$nbQuestions = numberOfQuestionsUser($id);
	$nbAnswers = getAnswersById($id);
	$score = getScore($id);

	$filename = "default-user.png";

	if(!empty($profil['lien_photo'])) {
		$filename = $profil['lien_photo'];
	}
?>

<div id="titreForm">
	<h1 class="errorForm"><?= $error ?></h1>
</div>


<div id="infoProfil">
	<div class="imgProfil100">
		<img src="img/figure/<?= $filename ?>">
		<p class="pseudo"><?= $pseudo ?></p>
		<p class="pseudoScore"><?= $score ?></p>
		<p class='infoProfil'>Inscrit le <?= $dateCreation ?></p>
		<p class='infoProfil'>A posé <?= $nbQuestions ?> question(s)</p>
		<p class='infoProfil'>A répondu à <?= $nbAnswers ?> question(s)<p>
	</div>
	<form id="insertImage" method="POST" enctype="multipart/form-data" action="index.php?page=verifImage">
		<label for="filename">Lien vers votre image de profil</label><br>
		<input type="file" id="filename" name="filename">
		<input type="hidden" name="id" value="<?= $id ?>">
		<input type="hidden" name="pseudo" value="<?= $pseudo ?>"><br>
		
		<input type="submit" value="Envoyer le fichier" />
	</form>
</div>

<div id="formulaireLog">

	<form id="formProfil" method="POST" action="index.php?page=verifProfil">

		<label for="pseudo">Pseudo</label>
		<input type="text" id="pseudo" name="pseudo" value="<?= ucfirst($pseudo) ?>">

		<label for="firstname">Prénom</label>
		<input type="text" id="firstname" name="firstname" value="<?= ucfirst($profil['firstname']) ?>">

		<label for="lastname">Nom</label>
		<input type="text" id="lastname" name="lastname" value="<?= ucfirst($profil['lastname']) ?>">

		<label for="email">Email</label>
		<input type="text" id="email" name="email" value="<?= $profil['email'] ?>">

		<!-- <label for="birthday">Date de naissance</label>
		<input type="text" id="birthday" name="birthday" value="<?= $birthday ?>"> -->

		<label for="country">Country</label>
			<select name="id_country" id="country">
				<option value=""></option> 
				<?php 
					foreach($countries as $country) : 
						$id_country = $country['country_code'];
						if($countryUser == $id_country) :
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

<!-- 		<p class="date_creat">Date création : <?= $dateCreation ?></p> -->

		<input type="submit" value="Update profil">
	</form>
	
</div>