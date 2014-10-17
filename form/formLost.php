<div id="formulaireLog">
		<form method="POST" action="index.php?page=reinitPass.php">
			<label for="username">Username ou mail</label>
			<input type="text" id="username" name="username">

			<input type="submit" value="Réinitialiser">
			
			<?php 
				if(!empty($_SESSION['errorConnexion'])) : 
					$error = $_SESSION['errorConnexion'];
					$_SESSION['errorConnexion'] = "";
			?>
			
			<p class="errorForm"><?= $error ?></p>
			<?php endif;?>
		</form>
	</div>