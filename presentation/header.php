<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf8">
		<meta name="viewport" content="width=device-width">
		<title><?= $title ?></title>
		<meta name="description" content="<?= $description ?>">
		<link href='http://fonts.googleapis.com/css?family=Raleway:300, 400, 700' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="css/style.css" /> 
		<link rel="stylesheet" href="js/jquery-ui/jquery-ui.min.css" />

	<?php if($page === "question") : ?>
		<link href="js/syntax/styles/shCore.css" rel="stylesheet" type="text/css" />
		<link href="js/syntax/styles/shThemeDefault.css" rel="stylesheet" type="text/css" />
		<link href="js/autocomplete/autocomplete.css" rel="stylesheet" type="text/css" />
	<?php endif; ?>
		
	</head>
	<body>