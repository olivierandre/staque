app = {

	init: function() {
		_this = this;

		click.init();
		date.init();
		buzz.init();
		tiny.init();
	}
}

click = {
	init: function() {
		_this = this;

		_this.clickBoutonQuestion();

	},

	clickBoutonQuestion: function() {
		$(".boutonQuestion").on("click", function() {
			href = $(this).attr('href');
			question.ajaxQuestion(href);
			return false;
		})
	}
}

tiny = {
	init: function() {
		tinymce.init({
		    selector: "textarea",
		    plugins: [
		        "advlist autolink lists link image charmap print preview anchor",
		        "searchreplace visualblocks code fullscreen",
		        "insertdatetime media table contextmenu paste"
		    ],
		    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
		});
	}
}

question = {
	init: function() {
		_this = this;
	},

	ajaxQuestion: function(url) {
		_this = this;

		$.ajax({
			url: url,
			success: function(html) {
				bool = html;
				if(!bool) {
					$("#messageConnexion").fadeIn().delay(5000).hide("pulsate");
				} else {
					document.location = html;
				}
			}
		})

		
	}
}

date = {
	init: function() {
		_this = this;

		_this.styleDatePicker();
	},

	styleDatePicker: function() {
		$( "#birthday" ).datepicker({
		    altField: "#datepicker",
		    closeText: 'Fermer',
		    prevText: 'Précédent',
		    nextText: 'Suivant',
		    currentText: 'Aujourd\'hui',
		    monthNames: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'],
		    monthNamesShort: ['Janv.', 'Févr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Août', 'Sept.', 'Oct.', 'Nov.', 'Déc.'],
		    dayNames: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
		    dayNamesShort: ['Dim.', 'Lun.', 'Mar.', 'Mer.', 'Jeu.', 'Ven.', 'Sam.'],
		    dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
		    weekHeader: 'Sem.',
		    dateFormat: 'dd/m/yy'
		});
	}
}

buzz = {
	init: function() {
		_this = this;

		_this.shakeQuestion();
	},

	shakeQuestion: function() {

		setInterval(function() {
			$( ".boutonQuestion" ).effect("shake", {
				times : 2
			}, 800);
		}, 3000)
	}
}

$(function() {
	app.init();
})