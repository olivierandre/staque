<div id="formulaireLog">
		<form method="POST" action="index.php?page=verifLog">
			<label for="pseudo">Pseudo ou email</label>
			<input type="text" id="pseudo" name="pseudo">

			<label for="password">Password</label>
			<input type="password" id="password" name="password">

			<label class="remember" for="remember"><input id="remember" type="checkbox" name="remember">Remember Me</label>

			<input type="submit" value="Se connecter !">

			<?php 
			if(!empty($_SESSION['errorConnexion'])) : 
				$error = $_SESSION['errorConnexion'];
				$_SESSION['errorConnexion'] = "";
			?>
			<p class="errorForm"><?= $error ?></p>
			<?php endif;?>
		</form>
		<a class="lost" href="index.php?page=lost">Mot de passe perdu ?</a>
	</div>