<?php
	include("presentation/header.php");
	include("presentation/top.php");

	$id_question = $_GET['id_question'];
	$id_user = $_SESSION['id'];

	if(empty($id_question)) {
		header(PAGE_ACCUEIL);
		die();
	} 

	// Gestion des réponses
	$answers = getAnswers($id_question);

	addView($id_question);
	include("question/afficheQuestion.php"); 
	$count = getUserQuestion($id_question, $id_user);

	if(!$count) : 
?>

	<div id="afficheReponse">
	<h3>Les réponses ...</h3>

	<?php 
		foreach($answers as $answer) : 
		$pseudo_answer = getPseudo($answer['id_user']);
		$pseudoScore = 0;

	?>
		<div class="aAnswer">
			<div class="seeDescription">
				<?= $answer['answer'] ?>
			</div>
			<div class='informationQuestion'>
				<ul>
					<li><?= $answer['date_created'] ?></li>
					<li>Réponse de : <?= $pseudo_answer ?> (<?= $pseudoScore ?>)</li>
				</ul>
			</div>
		</div>
	<?php endforeach ?>

	</div>

	<div id="repondre">
		<button class="answerButton button">Répondre à la question</button>
	</div>
<?php endif; ?>

	<div id="divFormTiny">
		<form id="tinyAnswer" method="post" action="index.php?page=verifAnswer&id_question=<?= $id_question ?>">
			
			<input type="hidden" name="id_user" value="<?= $id_user ?>">
			
			<div class="textarea">
		    	<textarea name="textQuestion"></textarea>
		    </div>

		    <div id="previewSubmitButton">
			    <button id="previewAnswer">preview</button>
			    <input id="submitQuestion" type="submit">
			</div>
		</form>
		
	</div>
	<div id="seePreviewAnswer"></div>	


<?php
	include("presentation/footer.php");
?>