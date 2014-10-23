<?php

	if($_POST) {

		if(empty($_POST) || empty($_GET['idAnswer'])) {
			header(PAGE_ACCUEIL);
			die();
		}

		$comment = strip_tags($_POST['response']);
		$idAnswer = $_GET['idAnswer'];
		$id_user = $_POST['id_user'];
		$id_question = $_POST['id_question'];

		insertComment($id_user, $idAnswer, $comment);

		header("Location: http://localhost/staque/index.php?page=reponse&id_question=$id_question");
		die();
	} 
	
	header(PAGE_ACCUEIL);
	die();
?>