<?php

	if(!empty($_GET) && (array_key_exists('HTTP_X_REQUESTED_WITH', $_SERVER) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') ) {
		$id_answer = $_GET['idAnswer'];
		$vote = $_GET['vote'];
		$userVote = $_GET['user_vote'];
		$id_question = $_GET['id_question'];
		$user_id_answer = $_GET['userAnswer'];

		if($vote === 'pos') {
			$id_note = GOOD_ANSWER;
			insertScore($id_answer, $id_note, $user_id_answer);

		} elseif($vote === 'neg') {
			// Pour la personne qui a voté négativement ...
			insertScore($id_answer, VOTE_BAD_ANSWER, $userVote);
			// Pour la personne qui a posé la question
			$id_note = BAD_ANSWER;
			insertScore($id_answer, $id_note, $user_id_answer);

		} else {
			// on a tenté de me tromper ...
			header(PAGE_ACCUEIL);
			die();
		}

		
		
		header("Location: http://localhost/staque/index.php?page=reponse&id_question=$id_question");
		die();

	} else {
		header(PAGE_ACCUEIL);
		die();
	}
?>