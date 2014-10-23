<?php 
	namespace abeautifulsite;
	use	Exception;
	require ('functions/SimpleImage/src/abeautifulsite/SimpleImage.php');

	if(!empty($_POST) && $_FILES['filename']['error'] == 0) {
	
		$filenameTmp = $_FILES['filename']['tmp_name'];
		$id = $_POST['id'];
		$pseudo = $_POST['pseudo'];

		$accepted = array("image/jpeg", "image/jpeg", "image/gif", "image/png");
		$extension = end(explode(".", $_FILES['filename']['name']));
		$filename = uniqid().'.'.$extension;

		// Vérifie le type de fichier
		$finfo = finfo_open(FILEINFO_MIME_TYPE);
		$mime = finfo_file($finfo, $filenameTmp);
		finfo_close($finfo);

		if(in_array($mime, $accepted)) {
			$directory = "C:/xampp2/htdocs/staque/img/figure/".$filename;
			move_uploaded_file($filenameTmp, $directory);

			$img = new SimpleImage($directory);
			$img->adaptive_resize(100, 100)->save($directory);

			insertImage($id, $filename);

		}

		header("Location: http://localhost/staque/index.php?page=profil&pseudo=$pseudo");
		die;

	} 

	header(PAGE_ACCUEIL);
	die;
?>