<?php
	include("presentation/header.php");
	include("presentation/top.php");

	$id_question = $_GET['id_question'];
	$id_user = 0;

	if(!empty($_SESSION['id'])) {
		$id_user = $_SESSION['id'];
	}

	if(empty($id_question)) {
		header(PAGE_ACCUEIL);
		die();
	} 

	// Gestion des réponses
	$answers = getAnswers($id_question);

	addView($id_question);
	include("question/afficheQuestion.php"); 
	$count = getUserQuestion($id_question, $id_user);

?>

	<div id="afficheReponse">
		<h3>Les réponses ...</h3>

	<?php 
		foreach($answers as $answer) : 
		$pseudo_answer = getPseudo($answer['id_user']);
		$pseudoScore = 0;
		$idAnswer = $answer['id'];
		$user_id_answer = $answer['id_user'];
		$scoreAnswer = getScoreAnswer($idAnswer);

		$isVote = isVote($id_question, $idAnswer, $id_user);
	?>
			<div class="boutonScore" id="boutonScore_<?= $idAnswer ?>">
			<div id="scoreAnswer_<?= $idAnswer ?>" class="scoreAnswer"><p><?= $scoreAnswer ?></p></div>
			<?php 
				if(!$isVote && ($user_id_answer !== $id_user) && isLog()) {
					$affiche = '<button href="index.php?page=verifVote&idAnswer='.$idAnswer.'&vote=pos&user_vote='.$id_user.'" id="votePos_'.$idAnswer.'" class="votePos">+</button>';
				} else {
					$affiche = '<div class="votePos"><p>+</p></div>';
				}
					echo $affiche;
				
				if(!$isVote && ($user_id_answer !== $id_user) && isLog()) {
					$affiche = '<button href="index.php?page=verifVote&idAnswer='.$idAnswer.'&vote=neg&user_vote='.$id_user.'" id="voteNeg_'.$idAnswer.'" class="voteNeg">-</button>';
				} else {
					$affiche = '<div class="voteNeg"><p>-</p></div>';
				}
					echo $affiche;
				?>
				
			</div>

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
		<div class='clearfix'></div>
	<?php endforeach ?>

	</div>

<?php if(!$count && isLog()) : ?>
	<div id="repondre">
		<button class="answerButton button">Répondre à la question</button>
	</div>
<?php endif ?>

	<div id="divFormTiny">
		<form id="tinyAnswer" method="post" action="index.php?page=verifAnswer">
			
			<input type="hidden" name="id_user" value="<?= $id_user ?>">
			<input type="hidden" name="id_question" value="<?= $id_question ?>">
			
			<div class="textarea">
		    	<textarea name="textQuestion"></textarea>
		    </div>

		    <div id="previewSubmitButton">
			    <button id="previewAnswer">preview</button>
			    <input id="submitAnswer" type="submit">
			</div>
		</form>
		
	</div>
	<div id="seePreviewAnswer"></div>	


<?php
	include("presentation/footer.php");
?>