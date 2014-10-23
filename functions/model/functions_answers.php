<?php
	function insertAnswer($id_user, $id_question, $answer) {
		$dbh = connectDBH();
		$sql = "INSERT INTO answers (id_user, id_question, answer, id_note, resolve, date_created, date_modified)
				VALUES(:id_user, :id_question, :answer, :id_note, FALSE, NOW(), NOW())";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(':id_user', $id_user);
		$stmt->bindValue(':id_question', $id_question);
		$stmt->bindValue(':answer', $answer);
		$stmt->bindValue(':id_note', ANSWER_QUESTION);

		$stmt->execute();
		$id = $dbh->lastInsertId();
		
		closeDBH($dbh);
		
		return $id;
	}

	function getAnswers($id_question) {
		$dbh = connectDBH();

		$sql = "SELECT answers.*, SUM(tech_score.score) AS score FROM answers 
				LEFT JOIN note_answer ON note_answer.id_answer = answers.id 
				LEFT JOIN tech_score ON tech_score.id = note_answer.id_note
				WHERE id_question = :id_question 
				GROUP BY answers.id 
				ORDER BY answers.resolve DESC, score DESC";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(':id_question', $id_question);

		$stmt->execute();
		$answers = $stmt->fetchAll();
		
		closeDBH($dbh);
		
		return $answers;
	}

	function getAnswersById($id_user) {
		$dbh = connectDBH();
		$sql = "SELECT COUNT(*) AS count FROM answers
				WHERE id_user = :id_user
				ORDER BY resolve, date_created DESC";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(':id_user', $id_user);

		$stmt->execute();
		$count = $stmt->fetchColumn();
		
		closeDBH($dbh);
		
		return $count;
	}

	function setResolve($id_answer) {
		$dbh = connectDBH();
		$sql = "UPDATE answers
				SET resolve = TRUE
				WHERE id = :id_answer";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(':id_answer', $id_answer);

		$update = $stmt->execute();
		
		closeDBH($dbh);
		
		return $update;
	}



