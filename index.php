<?php 
	session_start();
	/*unset($_SESSION['error']);

	if(!$_SESSION['log']) {
		include("../methodes/logout.php");
	}*/

	include("methodes/model/include_bdd.php");
	include("methodes/createSaltToken.php");
	include("methodes/fonc_control.php");
	include("methodes/constant.php");
	include("methodes/dateFr.php");

	$page = "home";
	$pageLogRegister = false;

	if (!empty($_GET['page'])) {
		$page = $_GET['page'];
	}
	
	if (function_exists($page)) {
		call_user_func($page);	
	}

	/*include("../presentation/footer.php");*/