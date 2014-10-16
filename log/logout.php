<?php
	session_start();

	unset($_COOKIE['movie'.$_SESSION['username']]);
	setcookie("movie".$_SESSION['username'], "", 0, "/");

	session_destroy();
	unset($_SESSION);
	setcookie("PHPSESSID", "", 0, "/");

	header("Location: http://localhost/m/html/index.php");
	die();
?>