<?php

	/*
	* 	PRESENTATION
	*/

	function home() {
		showPage("html", "staque", "Bienvenue sur le site 'STAQUE'");
	}

	function profil() {
		showPage("presentation", "votre profil");
	}

	function afficheProfil() {
		showPage("presentation", "voici le profil de ...");
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

	function verifAnswer() {
		showPage("verif", null);
	}

	function verifVote() {
		showPage("verif", null);
	}

	function verifBestAnswer() {
		showPage("verif", null);
	}

	function verifComment() {
		showPage("verif", null);
	}

	/*
	*	Gestion des questions/réponses
	*/  
	function question() {
		$pseudo = $_SESSION['pseudo'];
		
		if(empty($pseudo)) {
			$pseudo = "";
		}

		showPage("question", "Posez votre question, ".$pseudo);
	}

	function reponse() {
		showPage("reponse", "Apportez une réponse ...");
	}


	/*
	*	Affiche les pages
	*/  
	function showPage ($dir, $title, $description = "Description de la page"){
		$title = ucfirst($title);
		global $page;
		global $pageLogRegister;
		include($dir."/".$page.".php");
	}