<?php
	function insertAnswer($id_user, $id_question, $answer) {
		$dbh = connectDBH();
		$sql = "INSERT INTO answers (id_user, id_questions, answer, resolve, date_created, date_modified)
				VALUES(:id_user, :id_question, :answer, FALSE, NOW(), NOW())";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(':id_user', $id_user);
		$stmt->bindValue(':id_question', $id_question);
		$stmt->bindValue(':answer', $answer);

		$stmt->execute();
		$id = $dbh->lastInsertId();
		
		closeDBH($dbh);
		
		return $id;
	}

	function getAnswers($id_question) {
		$dbh = connectDBH();
		$sql = "SELECT * FROM answers
				WHERE id_question = :id_question
				ORDER BY resolve, date_created";
		// todo : ne pas oublier de prendre en compte le score avant la date de création

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(':id_question', $id_question);

		$stmt->execute();
		$answers = $stmt->fetchAll();
		
		closeDBH($dbh);
		
		return $answers;
	}



