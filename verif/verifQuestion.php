<?php 
	if($_POST) {

		$id = $_SESSION['id'];
		$titreQuestion = strip_tags($_POST['titreQuestion']);
		$tagsQuestion = $_POST['tagsQuestion'];
		$textQuestion = $_POST['textQuestion'];

		$tagsQuestion = explode(", ", $tagsQuestion);

		$idQuestion = insertQuestion($id,$titreQuestion, $textQuestion);
		insertTagsQuestion($idQuestion, $tagsQuestion);

		if($idQuestion) {
			header(PAGE_ACCUEIL);
			die();
		}
	
	} else {

	}

?>