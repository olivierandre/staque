<?php
	function insertScore($id) {
		$dbh = connectDBH();
		$sql = "";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":pseudo", $pseudo);
		$stmt->bindValue(":id", $id);

		$stmt->execute();
		$userFind = $stmt->fetchColumn();

		closeDBH($dbh);
		return $userFind;
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
		$sql = "SELECT SUM(tech_score.score) AS score FROM tech_score 
				LEFT JOIN questions ON questions.id_note = tech_score.id 
				WHERE questions.id_users = :id_user";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_user", $id_user);

		$stmt->execute();
		$score = $stmt->fetchColumn();

		closeDBH($dbh);
		return $score;
	}

	function getScoreUser($id_user) {
		$dbh = connectDBH();
		$sql = "SELECT SUM(score) AS score FROM score
				WHERE id_user = :id_user";

		$stmt->bindValue(":id_user", $id_user);

		$stmt->execute();
		$score = $stmt->fetchColumn();

		closeDBH($dbh);
		return $score;
	}

	function getScore($id_users) {
		$score = getScoreInscription($id_users) + getScoreAskQuestion($id_users);
		return $score;
	}


?>