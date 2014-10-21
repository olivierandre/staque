<?php

	if(!empty($_GET) && (array_key_exists('HTTP_X_REQUESTED_WITH', $_SERVER) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') ) {
		$id_answer = $_GET['idAnswer'];
		//$userAnswer = $_GET['userAnswer'];
		$vote = $_GET['vote'];
		$userVote = $_GET['user_vote'];

		if($vote === 'pos') {

			$id_note = GOOD_ANSWER;

		} elseif($vote === 'neg') {
			insertScore($id_answer, VOTE_BAD_ANSWER, $userVote);
			$id_note = BAD_ANSWER;

		} else {
			// on a tenté de me tromper ...
			header(PAGE_ACCUEIL);
			die();
		}

		insertScore($id_answer, $id_note, $userVote);
		
		echo getScoreAnswer($id_answer);

	} else {
		header(PAGE_ACCUEIL);
		die();
	}
?>