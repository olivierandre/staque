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
	$isResolve = isQuestionResolve($id_question);
	$h3 = "Les réponses ...";
	$classH3 = "";
	$firstTime = TRUE;

	if($isResolve) {
		$h3 = "voici la meilleure réponse !!!";
		$classH3 = "h3bestAnswer";
	} 
?>
	
	<div id="afficheReponse" >
		<h3 class="<?= $classH3 ?>"><?= $h3 ?></h3>

	<?php 
		foreach($answers as $answer) : 
		$pseudo_answer = getPseudo($answer['id_user']);
		
		$idAnswer = $answer['id'];
		$user_id_answer = $answer['id_user'];
		$scoreAnswer = getScoreAnswer($idAnswer);
		$pseudoScore = getScore($user_id_answer);

		$isVote = isVote($id_question, $idAnswer, $id_user);

		// J'ai les commentaires pour chaque réponse
		$commentsAnswer = getComment($idAnswer);
		$countCommentsAnswer = count($commentsAnswer);
		$i = 1;

	?>
			<div class="boutonScore" id="boutonScore_<?= $idAnswer ?>">
			<div id="scoreAnswer_<?= $idAnswer ?>" class="scoreAnswer"><p><?= $scoreAnswer ?></p></div>
			<?php 
				if(!$isVote && ($user_id_answer !== $id_user) && isLog()) {
					$affiche = '<button href="index.php?page=verifVote&idAnswer='.$idAnswer.'&vote=pos&user_vote='.$id_user.'&userAnswer='.$user_id_answer.'&id_question='.$id_question.'" id="votePos_'.$idAnswer.'" class="votePos">+</button>';
				} else {
					$affiche = '<div class="votePos"><p>+</p></div>';
				}
					echo $affiche;
				
				if(!$isVote && ($user_id_answer !== $id_user) && isLog()) {
					$affiche = '<button href="index.php?page=verifVote&idAnswer='.$idAnswer.'&vote=neg&user_vote='.$id_user.'&userAnswer='.$user_id_answer.'&id_question='.$id_question.'" id="voteNeg_'.$idAnswer.'" class="voteNeg">-</button>';
				} else {
					$affiche = '<div class="voteNeg"><p>-</p></div>';
				}
					echo $affiche;
				?>
				
			</div>

			<div id="aAnswer_<?= $idAnswer ?>" class="aAnswer">
				<div class="seeDescription">
					<?= $answer['answer'] ?>
				</div>
				<div class='informationQuestion'>
					<ul>
						<li><?= dateFrWithHour($answer['date_created']) ?></li>
						<li><a href="index.php?page=afficheProfil&user=<?= $user_id_answer ?>">Réponse de : <?= $pseudo_answer ?> (<?= $pseudoScore ?>)</a></li>
					</ul>
				</div>

			<?php if(isLog() && $count && !$isResolve) : ?>
				<div class="boutonBestAnswer" id="bestAnswer_<?= $idAnswer ?>">
					<a href="index.php?page=verifBestAnswer&idAnswer=<?= $idAnswer ?>&user_vote=<?= $id_user ?>&id_question=<?= $id_question ?>">Meilleure réponse</a>
				</div>
			<?php endif ?>

			<?php if(isLog()) : ?>
				<div class="boutonComment" id="boutonComment_<?= $idAnswer ?>">
					<button>Ajouter un commentaire</button>
				</div>
			<?php endif ?>
			
			<?php if($countCommentsAnswer > 0) : ?>
				<div class="boutonCommentAffiche" id="afficheComment_<?= $idAnswer ?>">
					<button>Afficher les commentaires</button>
				</div>
			<?php endif; ?>

				<div class="comment">
				<?php if(isLog()) : ?>
					<form id="formComment_<?= $idAnswer ?>" class="formComment" method="POST" action="index.php?page=verifComment&idAnswer=<?= $idAnswer ?>">
						<input type="text" name="response" placeholder="Votre commentaire" >
						<input type="submit" value="Valider votre commentaire" id="submit_<?= $idAnswer ?>">
						<input type="hidden" name="id_user" value="<?= $id_user ?>">
						<input type="hidden" name="id_question" value="<?= $id_question ?>">
					</form>
				<?php endif ?>

					<div id="afficheCommentaire_<?= $idAnswer ?>" class="commentaireAffiche">
			<?php foreach($commentsAnswer as $comment) :
					if($i %2) {
						$pair = "pair";
					} else {
						$pair = "impair";
					}
					$i++;
			?>

						<div id="commentaireAffiche_<?= $idAnswer ?>" class="afficheCommentaire <?= $pair ?>">
							<p><?= ucfirst($comment['comment']) ?></p>
							<span>De <?= $comment['pseudo'] ?>, posté le <?= dateFrWithHour($comment['date_created']) ?></span>
						</div>
			<?php endforeach; $i=1; ?>
					</div>
				</div>

			</div>
	
		<div class='clearfix'></div>

		<?php 
			if($isResolve && $firstTime) :
				$h4 = "les autres réponses ...";
				$firstTime = FALSE;
		?>
		<h4 class="autresReponses"><?= $h4 ?></h4>
		<?php		
			endif;
			endforeach ;
		?>


	</div>

<?php if(!$count && isLog()) : ?>
	<div id="repondre">
		<button class="answerButton button">Répondre à la question</button>
	</div>

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
<?php endif ?>

<?php
	include("presentation/footer.php");
?>