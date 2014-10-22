<?php

	if(!empty($_GET)) {

		$idAnswer = $_GET['idAnswer'];
		$idUser = $_GET['user_vote'];
		$id_question = $_GET['id_question'];

		if(empty($idAnswer) || empty($idUser) || empty($id_question)) {
			header(PAGE_ACCUEIL);
			die();
		}

		$maj = setResolve($idAnswer);
		insertScore($idAnswer, BEST_ANSWER, $idUser);

		header("Location: http://localhost/staque/index.php?page=reponse&id_question=$id_question");

	} else {
		header(PAGE_ACCUEIL);
		die();
	}





?>