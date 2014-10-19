<?php
	function insertQuestion($id_users, $question) {
		$dbh = connectDBH();
		$sql = "INSERT INTO questions
				VALUES(:id_users, :question, NOW(), NOW()";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_users", $id_users);
		$stmt->bindValue(":question", $question);

		$stmt->execute();
		$id = $stmt->lastInsertId();

		closeDBH($dbh);
		return $id;
	}

	function numberOfQuestionsUser($id_users) {
		$dbh = connectDBH();
		$sql = "SELECT COUNT(*) AS count FROM questions
				WHERE id_users = :id_users";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_users", $id_users);

		$stmt->execute();
		$count = $stmt->fetchColumn();

		closeDBH($dbh);
		return $count;
	}

?>