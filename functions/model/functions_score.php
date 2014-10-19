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



?>