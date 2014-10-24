<?php

	function insertScore($id_answer, $id_note, $id_user) {
		$dbh = connectDBH();
		$sql = "INSERT INTO note_answer
				VALUES(:id_answer, :id_note, :id_user, NOW(), NOW())";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_answer", $id_answer);
		$stmt->bindValue(":id_note", $id_note);
		$stmt->bindValue(":id_user", $id_user);

		$return = $stmt->execute();

		closeDBH($dbh);
		return $return;
	}

	function getScoreInscription($id_user) {
		$dbh = connectDBH();
		$sql = "SELECT SUM(tech_score.score) as score FROM tech_score 
				LEFT JOIN users ON users.id_note = tech_score.id 
				WHERE users.id = :id_user";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_user", $id_user);

		$stmt->execute();
		$score = $stmt->fetchColumn();

		closeDBH($dbh);
		return $score;
	}

	function getScoreAskQuestion($id_user) {
		$dbh = connectDBH();
		$sql = "SELECT IFNULL(SUM(tech_score.score), 0) AS score FROM tech_score 
				LEFT JOIN questions ON questions.id_note = tech_score.id 
				WHERE questions.id_users = :id_user";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_user", $id_user);

		$stmt->execute();
		$score = $stmt->fetchColumn();

		closeDBH($dbh);
		return $score;
	}

	function getScoreAnswerById($id_user) {
		$dbh = connectDBH();
		/*$sql = "SELECT IFNULL(SUM(tech_score.score), 0) AS score FROM answers 
				JOIN note_answer ON note_answer.id_answer = answers.id 
				JOIN tech_score ON tech_score.id = note_answer.id_note 
				WHERE answers.id_user = :id_user";*/

		$sql = "SELECT IFNULL(SUM(tech_score.score), 0) AS score FROM note_answer 
				JOIN tech_score ON tech_score.id = note_answer.id_note 
				WHERE note_answer.id_user = :id_user";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_user", $id_user);

		$stmt->execute();
		$score = $stmt->fetchColumn();

		closeDBH($dbh);
		return $score;
	}

	function getScoreForAAnswer($id_user) {
		$dbh = connectDBH();
		$sql = "SELECT IFNULL(SUM(tech_score.score), 0) as score FROM tech_score 
				LEFT JOIN answers ON answers.id_note = tech_score.id 
				WHERE answers.id_user = :id_user";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_user", $id_user);

		$stmt->execute();
		$score = $stmt->fetchColumn();

		closeDBH($dbh);
		return $score;
	}


	function getScore($id_user) {
		$score = getScoreInscription($id_user) 
				+ getScoreAskQuestion($id_user) 
				+ getScoreAnswerById($id_user) 
				+ getScoreForAAnswer($id_user);

		return $score;
	}

	function getScoreAnswer($id_answer) {
		$dbh = connectDBH();
		$sql = "SELECT IFNULL(SUM(tech_score.score), 0) AS score FROM note_answer 
				JOIN tech_score ON tech_score.id = note_answer.id_note
				WHERE id_answer = :id_answer 
				AND tech_score.id != :tech_score_id";
		
		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_answer", $id_answer);
		$stmt->bindValue(":tech_score_id", VOTE_BAD_ANSWER);

		$stmt->execute();
		$score = $stmt->fetchColumn();

		closeDBH($dbh);
		return $score;
	}

	function isVote($id_question, $id_answer, $id_user) {
		$dbh = connectDBH();
		$sql = "SELECT COUNT(*) AS count FROM note_answer 
				JOIN answers ON answers.id = note_answer.id_answer
				WHERE id_answer = :id_answer AND note_answer.id_user = :id_user 
				AND answers.id_question = :id_question";
		
		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_question", $id_question);
		$stmt->bindValue(":id_answer", $id_answer);
		$stmt->bindValue(":id_user", $id_user);

		$stmt->execute();
		$count = $stmt->fetchColumn();

		closeDBH($dbh);
		return $count;
	}
?>