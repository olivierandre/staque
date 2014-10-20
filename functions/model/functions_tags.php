<?php

	function getTags() {
		$dbh = connectDBH();
		$sql = "SELECT name FROM tech_tags";

		$stmt = $dbh->prepare($sql);
		$stmt->execute();

		$tags = $stmt->fetchAll();

		return $tags;
	}

	function insertTagsQuestion($id_question, $arrayTags) {
		$dbh = connectDBH();
		$sql = "INSERT INTO questions_tags
				VALUES(:id_question, :id_tag)";
		$stmt = $dbh->prepare($sql);

		for($i = 0; $i < count($arrayTags); $i++) {
			$tagsName = getIdTag($arrayTags[$i]);

			$stmt->bindValue(":id_question", $id_question);
			$stmt->bindValue(":id_tag", $tagsName);
			$stmt->execute();
		}

		closeDBH($dbh);
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

	function getNameTag($id) {
		$dbh = connectDBH();
		$sql = "SELECT name FROM tech_tags
				WHERE id = :id";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id", $id);

		$stmt->execute();
		$name = $stmt->fetchColumn();

		closeDBH($dbh);
		return $name;
	}

	function getIdTagQuestion($id_question) {
		$dbh = connectDBH();
		$sql = "SELECT id_tag FROM questions_tags
				WHERE id_question = :id_question";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id_question", $id_question);

		$stmt->execute();
		$tags = $stmt->fetchAll();

		closeDBH($dbh);
		return $tags;
	}

?>