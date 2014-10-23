<?php

	function insertComment($id_user, $id_answer, $comment) {
		$dbh = connectDBH();
		$sql = "INSERT INTO comment_answers (id_user, id_answer, comment, date_created, date_modified)
				VALUES(:id_user, :id_answer, :comment, NOW(), NOW())";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(':id_user', $id_user);
		$stmt->bindValue(':id_answer', $id_answer);
		$stmt->bindValue(':comment', $comment);

		$stmt->execute();
		$id = $dbh->lastInsertId();
		
		closeDBH($dbh);
		
		return $id;
	}

	function getComment($id_answer) {
		$dbh = connectDBH();
		$sql = "SELECT users.pseudo, comment_answers.* FROM comment_answers 
				JOIN users ON users.id = comment_answers.id_user 
				WHERE id_answer = :id_answer";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(':id_answer', $id_answer);

		$stmt->execute();
		$comments = $stmt->fetchAll();
		
		closeDBH($dbh);
		
		return $comments;
	}


?>