<?php

	/*
	* 	PRESENTATION
	*/

	function home() {
		showPage("html", "staque");
	}

	function profil() {
		showPage("presentation", "votre profil");
	}

	/*
	* 	GESTION DE LA CONNEXION ET REGISTER
	*/

	function connexion() {
		showPage("log", "page de CONNEXION");
	}

	function register() {
		showPage("log", "page d'inscription");
	}

	function logout() {
		showPage("log", null);
	}

	function lost() {
		showPage("log", "perte du mot de passe");
	}

	/*
	*	PAGE DE VERIFICATION
	*/  
	function verifRegister() {
		showPage("verif", null);
	}

	function verifLog() {
		showPage("verif", null);
	}

	function verifProfil() {
		showPage("verif", null);
	}

	function verifLogQuestion() {
		showPage("verif", null);
	}

	function verifQuestion() {
		showPage("verif", null);
	}

	/*
	*	Gestion des questions
	*/  
	function question() {
		$pseudo = $_SESSION['pseudo'];
		
		if(empty($pseudo)) {
			$pseudo = "";
		}

		showPage("question", "Posez votre question, ".$pseudo);
	}

	/*
	*	Affiche les pages
	*/  
	function showPage ($dir, $title){
		$title = ucfirst($title);
		global $page;
		global $pageLogRegister;
		include($dir."/".$page.".php");
	}