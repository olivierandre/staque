<?php

	function getTags() {
		$dbh = connectDBH();
		$sql = "SELECT name FROM tech_tags";

		$stmt = $dbh->prepare($sql);
		$stmt->execute();

		$tags = $stmt->fetchAll();

		return $tags;
	}

	function insertTagsQuestion($id_question, $id_tag) {
		$dbh = connectDBH();
		$sql = "INSERT INTO questions_tags
				VALUES(:id_question, :id_tag)";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_question", $id_question);
		$stmt->bindValue(":id_tag", $id_tag);

		$stmt->execute();
		$id = $stmt->lastInsertId();

		closeDBH($dbh);
		return $id;
	}

	function getIdTag($name) {
		$dbh = connectDBH();
		$sql = "SELECT id FROM tech_tags
				WHERE name = :name";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":name", $name);

		$stmt->execute();
		$id = $stmt->fetchColumn();

		closeDBH($dbh);
		return $id;
	}

?>