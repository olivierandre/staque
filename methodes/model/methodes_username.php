<?php

	function createUser($pseudo, $email, $password, $salt, $token) {
		$dbh = connectDBH();
		$sql = "INSERT INTO users (pseudo, email, password, salt, token, date_created, date_modified)
				VALUES(:pseudo, :email, :password, :salt, :token, NOW(), NOW())";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":pseudo", $pseudo);
		$stmt->bindValue(":email", $email);
		$stmt->bindValue(":password", $password);
		$stmt->bindValue(":salt", $salt);
		$stmt->bindValue(":token", $token);
		$stmt->execute();

		$lastId = $dbh->lastInsertId();

		return $lastId;
	}

	function updateProfilUser($id, $pseudo, $firstname, $lastname, $email, $birthday, $id_country, $job, $web) {
		$dbh = connectDBH();
		$sql = "UPDATE users 
				SET pseudo = :pseudo,
					firstname = :firstname,
					lastname = :lastname,
					email = :email,
					birthday = :birthday,
					id_country = :id_country,
					job = :job,
					web = :web,
					date_modified = NOW()
				WHERE id = :id";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id", $id);
		$stmt->bindValue(":pseudo", $pseudo);
		$stmt->bindValue(":firstname", $firstname);
		$stmt->bindValue(":lastname", $lastname);
		$stmt->bindValue(":email", $email);
		$stmt->bindValue(":birthday", $birthday);
		$stmt->bindValue(":id_country", $id_country);
		$stmt->bindValue(":job", $job);
		$stmt->bindValue(":web", $web);
		
		$count = $stmt->execute();

		closeDBH($dbh);
		return $count;
	}

	function getUserProfil($id) {
		$dbh = connectDBH();
		$sql = "SELECT pseudo, firstname, lastname, email, birthday, id_country, job, web, lien_photo, date_created, date_modified FROM users
				WHERE id = :id";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":id", $id);

		$stmt->execute();
		$userFind = $stmt->fetchAll();

		closeDBH($dbh);
		return $userFind[0];
	}

	function verifUsernameMail($userId) {
		$dbh = connectDBH();
		$sql = "SELECT COUNT(*) AS usernameFind FROM users
				WHERE pseudo = :userId
				OR email = :userId";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":userId", $userId);

		$stmt->execute();
		$userFind = $stmt->fetchColumn();

		closeDBH($dbh);
		return $userFind;
	}

	function verifPseudoNotUser($pseudo, $id) {
		$dbh = connectDBH();
		$sql = "SELECT COUNT(*) AS pseudoFind FROM users
				WHERE pseudo = :pseudo
				AND id != :id";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":pseudo", $pseudo);
		$stmt->bindValue(":id", $id);

		$stmt->execute();
		$userFind = $stmt->fetchColumn();

		closeDBH($dbh);
		return $userFind;
	}

	function updateUser($email, $password, $oldToken, $newToken) {
		$dbh = connectDBH();
		$sql = "UPDATE usercontrol
				SET password = :password,
				token = :newToken,
				dateModified = NOW()
				WHERE email = :email
				AND token = :oldToken";

		$stmt = $dbh->prepare($sql);

		$stmt->bindValue(":password", $password);
		$stmt->bindValue(":newToken", $newToken);
		$stmt->bindValue(":email", $email);
		$stmt->bindValue(":oldToken", $oldToken);

		$updateUser = $stmt->execute();

		closeDBH($dbh);
		return $updateUser;
	}

	function verifLogin($pseudo, $password) {
		$dbh = connectDBH();
		$sql = "SELECT COUNT(*) AS find FROM users
				WHERE (pseudo = :pseudo
				OR email = :pseudo) 
				AND password = :password";

		$stmt = $dbh->prepare($sql);

		$stmt->bindValue(":pseudo", $pseudo);
		$stmt->bindValue(":email", $pseudo);
		$stmt->bindValue(":password", $password);

		$stmt->execute();
		$find = $stmt->fetchColumn();

		closeDBH($dbh);
		return $find;
	}

	function getSalt($pseudo) {
		$dbh = connectDBH();
		$sql = "SELECT salt FROM users
				WHERE pseudo = :pseudo
				OR email = :pseudo";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":pseudo", $pseudo);
		$stmt->execute();

		$find = $stmt->fetchColumn();

		closeDBH($dbh);
		return $find;
	}

	function getId($pseudo) {
		$dbh = connectDBH();
		$sql = "SELECT id FROM users
				WHERE pseudo = :pseudo
				OR email = :pseudo";
		
		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":pseudo", $pseudo);

		$stmt->execute();
		$user = $stmt->fetchColumn();

		closeDBH($dbh);
		return $user;
	}

	function findMail($username) {
		$dbh = connectDBH();
		$sql = "SELECT email FROM usercontrol
				WHERE username = :username
				OR email = :username";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":username", $username);

		$stmt->execute();
		$findMail = $stmt->fetchColumn();

		closeDBH($dbh);
		return $findMail;
	}

	function uniqueToken() {
		return uniqid(mt_rand(), true);
	}

	function verifMailToken($email, $token) {
		$dbh = connectDBH();
		$sql = "SELECT COUNT(*) AS find FROM usercontrol
				WHERE token = :token
				AND email = :email";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":email", $email);
		$stmt->bindValue(":token", $token);

		$stmt->execute();
		$findUserReinit = $stmt->fetchColumn();

		closeDBH($dbh);
		return $findUserReinit;
	}

	function getToken($username) {
		$dbh = connectDBH();
		$token = uniqueToken();
		$sql = "SELECT token FROM usercontrol
				WHERE username = :username
				OR email = :username";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":username", $username);

		$stmt->execute();
		$findToken = $stmt->fetchColumn();

		closeDBH($dbh);
		return $findToken;
	}

	function updateToken($username) {
		$dbh = connectDBH();
		$token = uniqueToken();
		$sql = "UPDATE usercontrol SET token = :token
				WHERE username = :username
				OR email = :username";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":username", $username);
		$stmt->bindValue(":token", $token);

		$result = $stmt->execute();

		closeDBH($dbh);
		return $result;
	}

	function uniqueSalt() {
		return uniqid(mt_rand(), true);
	}

	function isLog() {
		if(!empty($_SESSION['log'])) {
			return true;
		}
	}

	function hashPass($email, $password) {
		for($i = 0; $i < 5000; $i++) {
			$passwordCrypt = hash('sha512', SALT_PREFIX.$password.getSalt($email));
		}

		return $passwordCrypt;
	}

	function setCookieUser($pseudo) {
		setcookie("staque", $pseudo, time() + 300, '/');
	}


?>