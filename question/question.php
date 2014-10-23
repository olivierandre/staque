<?php
	include("presentation/header.php");
	include("presentation/top.php");

	$tags = getTags();
	$id_user = $_SESSION['id'];

	$pseudo = $_SESSION['pseudo'];
	$dateCreated = getDateCreated($id_user);
	$nbQuestions = numberOfQuestionsUser($id_user);
	$nbAnswers = getAnswersById($id_user);
	$score = getScore($id_user);

	$filename = getImage($id_user);

	if(empty($filename)) {
		$filename = "default-user.png";
	}

?>

<section id="sectionQuestion">
	<div id="divFormTiny">
		<form id="tiny" method="post" action="index.php?page=verifQuestion">
			<label for="titreQuestion">Titre de la question</label>
			<input type="text" name="titreQuestion" id="titreQuestion" placeholder="What's your programming question? Be specific.">

			<label for="tagsQuestion">Tags</label>
			<div id="search_bar"></div>
			<input type="hidden" id ="tagsQuestion" name="tagsQuestion" value="">

			<div class="textarea">
		    	<textarea name="textQuestion"></textarea>
		    </div>

		    <div id="previewSubmitButton">
			    <button id="previewQuestion">preview</button>
			    <input id="submitQuestion" type="submit">
			</div>
		</form>
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

	<div id="seePreview">
	</div>

</section>


<?php
	
	include("presentation/footer.php");
?>