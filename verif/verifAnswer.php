<?php
	if($_POST) {
		
		$id_question = $_GET['id_question'];
		$answer = $_POST['textQuestion'];
		$id_user = $_POST['id_user'];

		// Insertion de la réponse
		$id = insertAnswer($id_user, $id_question, $answer);
		echo $id;

	} else {
		header(PAGE_ACCUEIL);
		die();
	}
	
?>