<?php
	function insertQuestion($id_users, $titre, $question) {
		$dbh = connectDBH();
		$sql = "INSERT INTO questions (id_users, titre, question, id_note, view, date_created, date_modified)
				VALUES(:id_users, :titre, :question, :id_note, :view, NOW(), NOW())";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_users", $id_users);
		$stmt->bindValue(":titre", $titre);
		$stmt->bindValue(":question", $question);
		$stmt->bindValue(":id_note", ASK_QUESTION);
		$stmt->bindValue(":view", 0);

		$stmt->execute();
		$id = $dbh->lastInsertId();

		closeDBH($dbh);
		return $id;
	}

	function numberOfQuestionsUser($id_user) {
		$dbh = connectDBH();
		$sql = "SELECT COUNT(*) AS count FROM questions
				WHERE id_users = :id_user";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_user", $id_user);

		$stmt->execute();
		$count = $stmt->fetchColumn();

		closeDBH($dbh);
		return $count;
	}

	function getAllQuestions() {
		$dbh = connectDBH();
		$sql = "SELECT COUNT(*) FROM questions";

		$stmt = $dbh->prepare($sql);
		$stmt->execute();
		$questions = $stmt->fetchColumn();

		closeDBH($dbh);
		return $questions;
	}

	function getRecentQuestions($pagination, $numberPerPage) {
		$dbh = connectDBH();
		$sql = "SELECT * FROM questions
				ORDER BY date_created DESC
				LIMIT :limite, :numberPerPage";


		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":limite", (int)$pagination, PDO::PARAM_INT);
		$stmt->bindValue(":numberPerPage", (int)$numberPerPage, PDO::PARAM_INT);
		$stmt->execute();
		$questions = $stmt->fetchAll();

		closeDBH($dbh);
		return $questions;
	}

	function getQuestion($id_question) {
		$dbh = connectDBH();
		$sql = "SELECT * FROM questions
				WHERE id = :id_question";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_question", $id_question);

		$stmt->execute();
		$question = $stmt->fetchAll();

		closeDBH($dbh);
		return $question;
	}

	function getUserQuestion($id_question, $id_user) {
		$dbh = connectDBH();
		$sql = "SELECT COUNT(*) AS find FROM questions
				WHERE id = :id_question
				AND id_users = :id_user";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_question", $id_question);
		$stmt->bindValue(":id_user", $id_user);

		$stmt->execute();
		$find = $stmt->fetchColumn();

		closeDBH($dbh);
		return $find;
	}

	function addView($id_question) {
		$dbh = connectDBH();
		$sql = "UPDATE questions
				SET view = view + 1 
				WHERE id = :id_question";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_question", $id_question);

		$maj = $stmt->execute();

		closeDBH($dbh);
		return $maj;
	}

	function isQuestionResolve($id_question) {
		$dbh = connectDBH();
		$sql = "SELECT COUNT(*) AS resolve FROM answers 
				WHERE id_question = :id_question
				AND resolve = TRUE";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_question", $id_question);

		$stmt->execute();
		$resolve = $stmt->fetchColumn();

		closeDBH($dbh);
		return $resolve;
	}

?>