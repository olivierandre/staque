<?php

	function home() {
		showPage("html", "staque");
	}

	function connexion() {
		showPage("log", "page de connexion");
	}

	function register() {
		showPage("log", "page d'inscription");
	}

	function verifRegister() {
		showPage("verif", null);
	}

	function profil() {
		showPage("log", "votre profil");
	}

	function showPage ($dir, $title){
		$title = ucfirst($title);
		global $page;
		global $pageLogRegister;
		include($dir."/".$page.".php");
	}