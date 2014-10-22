<div id="question">
	<a class="boutonQuestion" href="index.php?page=verifLogQuestion">Poser une question</a>
</div>

<div id="messageConnexion">
	<a href="index.php?page=connexion">Veuillez vous connecter ...</a>
	<a href="index.php?page=register">... ou vous inscrire</a>
</div>
<div id="accueilQuestion">
<?php 
	$numberPerPage = 3;

	$limit = 1;

	if(!empty($_GET['limit'])) {
		$limit = $_GET['limit'];
	}

	$pagination = ($limit - 1) * $numberPerPage;
	$totalQuestions = getAllQuestions();

	$totalQuestions = ceil($totalQuestions/$numberPerPage);

	include("question/afficheQuestion.php"); 
	
?>

	<div id="pagination">
	<?php if($limit > 1) : ?>
		<a id='prec' href="index.php?page=home&limit=<?= $limit - 1 ?>">Page précédente</a>
	<?php endif ?>

	<?php if($limit < $totalQuestions) : ?>
		<a id='suiv' href="index.php?page=home&limit=<?= $limit + 1 ?>">Page Suivante</a>
	<?php endif ?>
	</div>
</div>