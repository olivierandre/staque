app = {

	init: function() {
		_this = this;

		click.init();
		date.init();
		buzz.init();
		//tiny.init();
		affiche.init();
	}
}

click = {
	init: function() {
		_this = this;
		_this.boutonQuestion = $(".boutonQuestion");
		_this.formulaireLogSubmit = $("#formulaireLog")

		_this.clickBoutonQuestion();
		_this.clickLogProfil();
		_this.clickUpdateProfil();

	},

	clickBoutonQuestion: function() {
		_this.boutonQuestion.on("click", function() {
			href = $(this).attr('href');
			question.ajaxQuestion(href);
			return false;
		})
	},

	clickLogProfil: function() {
		$("#formLog").on("submit", function() {
			update.ajaxLogProfil($(this));
			return false;
		})
	},

	clickUpdateProfil: function() {
		$("#formProfil").on("submit", function() {
			update.ajaxUpdateProfil($(this));
			return false;
		})
	}
}

affiche = {
	init: function() {
		_this = this;
		_this.errorForm = $('#titreForm h1');

	},

	afficheTitreForm: function(texte) {
		$('#titreForm h1').html(texte)
			.animate({
				opacity: 1
			}).delay(5000)
			.animate({
				opacity: 0
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

update = {
	init: function() {
		_this = this;
	},

	ajaxUpdateProfil: function(e) {
		_this = this;

		$.ajax({
			url: e.attr("action"),
			type: e.attr("method"),
			data: e.serialize(),
			success: function(html) {
				affiche.afficheTitreForm($(html).find(".errorForm").text());
				var form = $(html).find("#formProfil");
				$("#formProfil").empty().append(form);
				
			}
		})
		
	},

	ajaxLogProfil: function(e) {
		_this = this;

		$.ajax({
			url: e.attr("action"),
			type: e.attr("method"),
			data: e.serialize(),
			success: function(html) {
				$('body').fadeOut({
					duration: 1500,
					complete: function() {
						$('body').empty().append(html).fadeIn({
							duration: 1500,
							complete: function() {
								//location.href = location.origin + location.pathname;
								window.location.assign(location.origin + location.pathname)
							}
						});
						
					}
				})
				//var texte = $(html).find(".errorForm").text();
				//affiche.afficheTitreForm(texte);
			},
			error: function(error) {
				affiche.afficheTitreForm("Vos données renseignées sont incorrectes");
				$('#formulaireLog form input[type=text], #formulaireLog form input[type=password]').val("");
			}
		})
		
	}
}

question = {
	init: function() {
		_this = this;
	},

	ajaxQuestion: function(url) {
		_this = this;
		_this.messageConnexion = $("#messageConnexion");

		$.ajax({
			url: url,
			success: function(html) {
				bool = html;
				if(!bool) {
					if( _this.messageConnexion.is(':hidden')) {
						_this.messageConnexion.
						show({
							effect: 'slide',
							easing: 'easeOutExpo',
							duration: 800
						}).delay(5000).hide({
							effect: "slide", 
							direction : "right" , 
							easing: 'easeInExpo',
							duration: 800
						});
					}
					
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
		$("#birthday").datepicker({
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
		    dateFormat: 'dd/mm/yy',
		    changeMonth: true,
      		changeYear: true,
      		yearRange:"-100:+0"
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