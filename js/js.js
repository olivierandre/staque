app = {

	init: function() {
		_this = this;

		click.init();
		date.init();
		buzz.init();
		tiny.init();
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
		_this.clickPreviewButton();
		_this.clickPreviewAnswerButton()
		_this.focusInputQuestion();
		_this.clickAnswer();

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
	},

	clickPreviewButton: function() {
		$("#previewQuestion").on("click", function() {
			affiche.previewResultTextarea(true);
			return false;
		})
	},

	clickPreviewAnswerButton: function() {
		$("#previewAnswer").on("click", function() {
			affiche.previewResultTextarea(false);
			return false;
		})
	},

	focusInputQuestion: function() {
		$("#tiny").on("focusout", function() {
			affiche.afficheTextarea()
		})
	},

	clickAnswer: function() {
		$(".answerButton").on("click", function() {
			affiche.afficheAnswerTextarea();
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
	},

	afficheTextarea: function() {
		_this = this;
		_this.inputTiny = $("#tiny input");

		if(!typeof widget === 'undefined') {
			_this.tagInput = widget.getValue().length;
		}

		_this.titleInput = _this.inputTiny.first().val().split(" ").join("").length;
		console.log(_this.titleInput);
		
		if(_this.titleInput > 0 && _this.tagInput > 0)  {
			$(".textarea, #previewSubmitButton").animate({
				opacity: 1
			})
		} else {
			$(".textarea, #previewSubmitButton").animate({
				opacity: 0
			})
		}
	},

	afficheAnswerTextarea: function(bool) {
		_this = this;
		_this.boxTiny = $(".textarea, #previewSubmitButton")

		if( _this.boxTiny.css('opacity') == 0) {
			_this.boxTiny.animate({
				opacity: 1
			})
		} else {
			_this.boxTiny.animate({
				opacity: 0
			})
		}
	},

	previewResultTextarea: function(question) {
		var	val = tinyMCE.activeEditor.getContent();
		
		if(question) {
			_this.seePreview = $("#seePreview");
		} else {
			_this.seePreview = $("#seePreviewAnswer");
		}
		
		_this.seePreview.empty();

		$("<p>").text("Visualisation de votre message").appendTo(_this.seePreview);
		if(question) {
			$("<div>").attr("id", "seeTitre").appendTo(_this.seePreview);
			$("<div>").attr("id", "seeTags").appendTo(_this.seePreview);
		}
	
		$("<div>").attr("id", "seeDescription").appendTo(_this.seePreview);

		if(question) {
			$("<h2>").text( $("#titreQuestion").val() ).appendTo("#seeTitre");
			$("<p>").text( autocomplete.getValue(widget.getValue()) ).appendTo("#seeTags");
		}
		
		$("#seeDescription").html(val);

		_this.seePreview.fadeIn({
			complete : function() {
				$("#submitQuestion").animate({
					opacity: 1
				})
				SyntaxHighlighter.highlight();
			}
		});		
	}
}

autocomplete = {
	init: function() {
		//setInterval(widget.blur, 5000);
	},

	getValue: function(val) {
		texte = "";
		len = val.length;

		for(i=0; i < len; i++) {
			texte += val[i][0].value + ', ';
		}

		texte = texte.slice(0, texte.length - 2)
		$("#tagsQuestion").val(texte);

		return texte
	}
}

tiny = {
	init: function() {

		autocomplete.init();

		if(typeof tinymce !== 'undefined') {
			tinymce.init({
			    selector: "textarea",
			    menubar: false,
			    plugins: [
			        "preview sh4tinymce"
			    ],
			    toolbar: "undo redo | sh4tinymce | code",
			    height : 300
			})
		}
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