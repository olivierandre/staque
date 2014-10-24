<?php 
	include("presentation/header.php");
	include("presentation/top.php");

	if(empty($_GET['user'])) {
		header(PAGE_ACCUEIL);
		die();
	} else {
		$userProfil = $_GET['user'];
	}

	$userProfil = getUserProfil($userProfil);

	if(empty($userProfil)) {
		header(PAGE_ACCUEIL);
		die();
	}

	$pseudo = $userProfil['pseudo'];
	$id = getIdViaPseudo($pseudo);
	$nbQuestions = numberOfQuestionsUser($id);
	$nbAnswers = getAnswersById($id);
	$score = getScore($id);
	$dateCreated = $userProfil['date_created'];
	$country = getCountryViaId($userProfil['id_country']);
	$web = $userProfil['web'];

	$filename = "default-user.png";

	if(!empty($userProfil['lien_photo'])) {
		$filename = $userProfil['lien_photo'];
	}

	
?>
<div id="afficheProfil">
	<p>Nom complet : <?= $userProfil['firstname'].' '.$userProfil['lastname'] ?></p>
	<!-- <p>Birthday : <?= dateFr($userProfil['birthday']) ?></p> -->
	<p>Country : <?= $country ?></p>
	<p>Job : <?= $userProfil['job'] ?></p>
	<p>Site web : <a href="http://<?= $web ?>"><?= $web ?></a></p>
</div>

<div id="infoProfil">
	<div class="imgProfil100">
		<img src="img/figure/<?= $filename ?>">
		<p class="pseudo"><?= $pseudo ?></p>
		<p class="pseudoScore"><?= $score ?></p>
		<p class='infoProfil'>Inscrit le <?= dateFr($dateCreated) ?></p>
		<p class='infoProfil'>A posé <?= $nbQuestions ?> question(s)</p>
		<p class='infoProfil'>A répondu à <?= $nbAnswers ?> question(s)<p>
	</div>
</div>


<?php
	include("presentation/footer.php");
?>