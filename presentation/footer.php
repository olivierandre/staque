		<script src="js/jquery-2.1.1.min.js"></script>
		<script src="js/jquery-ui/jquery-ui.min.js"></script>
		<script type="text/javascript" src="js/js.js"></script>

	<?php if($page === "question" || $page === "home" || $page === "reponse") : ?>

        <script type="text/javascript" src="js/syntax/scripts/shCore.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushJScript.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushAppleScript.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushAS3.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushBash.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushColdFusion.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushCpp.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushCSharp.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushCss.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushDelphi.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushDiff.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushErlang.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushGroovy.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushJava.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushJavaFX.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushJScript.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushPerl.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushPhp.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushPlain.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushPython.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushRuby.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushSass.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushScala.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushSql.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushVb.js"></script>
        <script type="text/javascript" src="js/syntax/scripts/shBrushXml.js"></script>
        <script type="text/javascript">SyntaxHighlighter.highlight()</script>
    <?php 
        endif;
        if($page === "question" || $page === "reponse") :
    ?>
        <script type="text/javascript" src="js/tinymce/tinymce.min.js"></script>
    <?php 
        endif;
        if($page === "question") :
    ?>
        <script src="js/autocomplete/autocomplete.js"></script>
        <script>
        	var tags = [<?php 
                if(!empty($tags)) :
                    foreach($tags as $tag) : ?>
                '<?= strtoupper($tag['name']) ?>',
                    <?php endforeach; endif; ?>]
        	var widget = new AutoComplete("search_bar", tags);
        </script>
        <?php endif ?>
	</body>
</html>