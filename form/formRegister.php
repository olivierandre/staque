	<?php

		if(empty($_SESSION['infoRegister'])) {
			$pseudo = "";
			$email = "";
		} else {
			$infoUser = $_SESSION['infoRegister'];
			$pseudo = $infoUser['pseudo'];
			$email = $infoUser['email'];
			$_SESSION['infoRegister'] = "";
		}
		
	?>

	<form id="register" method="POST" action="index.php?page=verifRegister">
		<h1>Formulaire d'inscription</h1>

		<label for="pseudo">Votre pseudo</label>
		<input id="pseudo" placeholder="Obligatoire" name="pseudo" value = "<?= $pseudo ?>" type="text">

		<label for="email">Email</label>
		<input id="email" placeholder="Obligatoire" name="email" value="<?= $email ?>" type="text">
<?php /*
		<label for="country">Country</label>
		<select name="country" id="country">
			<option value=""></option> 
			<?php 
				foreach($countries as $country) : 
					$country_code = $country['country_code'];
					if($countryUser == $country_code) : echo "trouve";
			?>
			<option selected value="<?= $country_code ?>"><?= $country['country_name'] ?></option> 
			<?php else : ?>
			<option value="<?= $country_code ?>"><?= $country['country_name'] ?></option>
			<?php endif ?> 
			<?php endforeach ?>
		</select>
*/?>

		<label for="password">Password</label>
		<input id="password" placeholder="Obligatoire" name="password" type="password">

		<label for="passwordAgain">Password again</label>
		<input id="passwordAgain" placeholder="Obligatoire" name="passwordAgain" type="password">

		<input type="submit" value="S'inscrire !!!!">

		<?php 
			if(!empty($_SESSION['errorLog'])) : 
			$error = $_SESSION['errorLog'];
			$_SESSION['errorLog'] = "";
		?>

		<p class="errorForm"><?= $error ?></p>

		<?php endif;?>

	</form>
