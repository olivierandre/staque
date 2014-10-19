<?php 
	session_start();
	/*unset($_SESSION['error']);

	if(!$_SESSION['log']) {
		include("../methodes/logout.php");
	}*/

	include("functions/model/include_bdd.php");
	include("functions/createSaltToken.php");
	include("functions/fonc_control.php");
	include("functions/constant.php");
	include("functions/dateFr.php");

	$page = "home";
	$pageLogRegister = false;

	if (!empty($_GET['page'])) {
		$page = $_GET['page'];
	}
	
	if (function_exists($page)) {
		call_user_func($page);	
	}

	/*include("../presentation/footer.php");*/