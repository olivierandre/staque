<div id="formulaireLog">
		<form method="POST" action="verifLog.php">
			<label for="username">Username ou mail</label>
			<input type="text" id="username" name="username">

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
		<a class="lost" href="../log/lost.php">Mot de passe perdu ?</a>
	</div>