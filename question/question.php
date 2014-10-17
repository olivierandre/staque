<?php
	include("presentation/header.php");
	include("presentation/top.php");
?>

<form id="tiny" method="post" action="index.php?page=verifQuestion">
    <textarea name="content"></textarea>
    <input type="submit">
</form>


<?php
	echo '<script type="text/javascript" src="js/tinymce/tinymce.min.js"></script>';
	include("presentation/footer.php");
?>