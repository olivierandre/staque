<?php
	function createUser($username, $email, $country_code, $password, $salt, $token) {
		$dbh = connectDBH();
		$sql = "INSERT INTO usercontrol (username, email, country_code, password, salt, token, dateCreated, dateModified)
				VALUES(:username, :email, :country_code, :password, :salt, :token, NOW(), NOW())";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":username", $username);
		$stmt->bindValue(":email", $email);
		$stmt->bindValue(":country_code", $country_code);
		$stmt->bindValue(":password", $password);
		$stmt->bindValue(":salt", $salt);
		$stmt->bindValue(":token", $token);
		$stmt->execute();
		$count = $stmt->rowCount();

		closeDBH($dbh);
		return $count;
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

	function verifLogin($username, $password) {
		$dbh = connectDBH();
		$sql = "SELECT COUNT(*) AS find FROM usercontrol
				WHERE (username = :username
				OR email = :username) 
				AND password = :password";

		$stmt = $dbh->prepare($sql);

		$stmt->bindValue(":username", $username);
		$stmt->bindValue(":email", $username);
		$stmt->bindValue(":password", $password);

		$stmt->execute();
		$find = $stmt->fetchColumn();

		closeDBH($dbh);
		return $find;
	}

	function getSalt($username) {
		$dbh = connectDBH();
		$sql = "SELECT salt FROM usercontrol
				WHERE username = :username
				OR email = :username";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":username", $username);
		$stmt->execute();

		$find = $stmt->fetchColumn();

		closeDBH($dbh);
		return $find;
	}

	function getId($username) {
		$dbh = connectDBH();
		$sql = "SELECT id FROM usercontrol
				WHERE username = :username
				OR email = :username";
		
		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":username", $username);

		$stmt->execute();
		$user = $stmt->fetchColumn();

		closeDBH($dbh);
		return $user;
	}

	function verifUsernameMail($username) {
		$dbh = connectDBH();
		$sql = "SELECT COUNT(*) AS usernameFind FROM usercontrol
				WHERE username = :username
				OR email = :username";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(":username", $username);

		$stmt->execute();
		$usernameFind = $stmt->fetchColumn();

		closeDBH($dbh);
		return $usernameFind;
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

	function setCookieUser($username) {
		setcookie("movie".$username, $username, time() + 300, '/');
	}


?>