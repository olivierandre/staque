<?php

	if($page === 'home') {
		$recentQuestion = getRecentQuestions($pagination, $numberPerPage);
		$opacity = "";
	} else {
		$recentQuestion  = getQuestion($id_question);
		$opacity = "opacity";
	}

	foreach($recentQuestion as $question) :
	$tagQuestion = "";
	$id_question = $question['id'];
	
	$getTags = getIdTagQuestion($id_question);
	foreach($getTags as $tag) {
		$tagQuestion .= getNameTag($tag['id_tag']).', ';
	}

	$tagQuestion = substr($tagQuestion, 0, count($tagQuestion)-3);

	$id_users = $question['id_users'];

	$pseudo = getUserProfil($id_users)['pseudo'];
	$pseudoScore = getScore($id_users);
	if($page === "home") :	
?>
<a <?php else :?>
<div <?php endif ?>
class="afficheRecentQuestion <?= $opacity ?>" href="index.php?page=reponse&id_question=<?= $id_question ?>">

<?php if($page === "reponse") : ?>
	<h3>La question ...</h3>
<?php endif ?>

	<div class="seeTitre">
		<h2><?= $question['titre'] ?></h2>
	</div>

	<div class="seeTags">
		<p><?= $tagQuestion ?></p>
	</div>

	<div class="seeDescription">
		<?= $question['question'] ?>
	</div>

	<div class='informationQuestion'>
		<ul>
			<li><?= dateFrWithHour($question['date_created']) ?></li>
			<li>Nombre de vues : <?= $question['view'] ?></li>
			<li>Question posée par : <?= $pseudo ?> (<?= $pseudoScore ?>)</li>
		</ul>
	</div>

<?php if($page === "home") : ?>
</a>
<?php else :?>
</div>
<?php endif ?>

<?php endforeach ?>