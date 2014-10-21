<?php
	if($_POST) {
		
		$id_question = $_POST['id_question'];
		$answer = $_POST['textQuestion'];
		$id_user = $_POST['id_user'];

		// Insertion de la réponse
		$id = insertAnswer($id_user, $id_question, $answer);
		
		$_POST = "";

		if($id) {
			header("Location: http://localhost:8888/staque/index.php?page=reponse&id_question=$id_question");
			die();
		}

	} else {
		header(PAGE_ACCUEIL);
		die();
	}
	
?>