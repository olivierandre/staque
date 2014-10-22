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
		$sql = "SELECT * FROM comment_answers
				WHERE id_answer = :id_answer";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(':id_answer', $id_answer);

		$stmt->execute();
		$comments = $stmt->fetchAll();
		
		closeDBH($dbh);
		
		return $comments;
	}


?>