<?php 
	session_start();
	/*unset($_SESSION['error']);

	if(!$_SESSION['log']) {
		include("../methodes/logout.php");
	}*/

	include("methodes/methodes_bdd/bdd.php");
	include("methodes/fonc_control.php");
	include("methodes/constant.php");

	$page = "home";
	$pageLogRegister = false;

	if (!empty($_GET['page'])) {
		$page = $_GET['page'];
	}
	
	if (function_exists($page)) {
		call_user_func($page);	
	}

	/*include("../presentation/footer.php");*/