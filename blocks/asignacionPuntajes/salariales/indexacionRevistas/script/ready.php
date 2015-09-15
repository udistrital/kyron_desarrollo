$("#indexacionRevistas").validationEngine({
promptPosition : "centerRight", 
scroll: false,
autoHidePrompt: true,
autoHideDelay: 2000
});

$(function() {
	$("#indexacionRevistas").submit(function() {
		$resultado=$("#indexacionRevistas").validationEngine("validate");
		if ($resultado) {
			return true;
		}
		return false;
	});
});

$("#indexacionRevistasRegistrar").validationEngine({
	promptPosition : "centerRight", 
	scroll: false,
	autoHidePrompt: true,
	autoHideDelay: 2000
});

$(function() {
$("#indexacionRevistasRegistrar").submit(function() {
$resultado=$("#indexacionRevistasRegistrar").validationEngine("validate");

if ($resultado) {

return true;
}
return false;
});
});

$(function () {
    $("button").button().click(function (event) { 
        event.preventDefault();
    });
});

$(function() {
	$("#indexacionRevistasModificar").submit(function() {
		$resultado=$("#indexacionRevistasModificar").validationEngine("validate");
		if ($resultado) {
			return true;
		}
		return false;
	});
});

$("#indexacionRevistasModificar").validationEngine({
	promptPosition : "centerRight", 
	scroll: false,
	autoHidePrompt: true,
	autoHideDelay: 2000
});

$('#tablaTitulos').dataTable( {
	"sPaginationType": "full_numbers"
});
        
////////////Función que organiza los tabs en la interfaz gráfica//////////////
$(function() {
	$("#tabs").tabs();
}); 
//////////////////////////////////////////////////////////////////////////////

// Asociar el widget de validación al formulario


/////////Se define el ancho de los campos de listas desplegables///////

$('#<?php echo $this->campoSeguro('docente')?>').width(465);      
$('#<?php echo $this->campoSeguro('facultad')?>').width(450);      
$('#<?php echo $this->campoSeguro('proyectoCurricular')?>').width(450);      

$('#<?php echo $this->campoSeguro('docenteRegistrar')?>').width(465);
$('#<?php echo $this->campoSeguro('contextoRevista')?>').width(450);
$('#<?php echo $this->campoSeguro('annoRevista')?>').width(450);


///*********El ancho (width) de los siguientes campos es mayor debido a que se encuentran dentro de un div****///
$('#<?php echo $this->campoSeguro('pais')?>').width(470);
$('#<?php echo $this->campoSeguro('categoria')?>').width(470);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////**********Se definen los campos que requieren campos de autocompletar**********////////////////

$("#<?php echo $this->campoSeguro('facultad')?>").select2();
$("#<?php echo $this->campoSeguro('proyectoCurricular')?>").select2();

$("#<?php echo $this->campoSeguro('contextoRevista')?>").select2();
$("#<?php echo $this->campoSeguro('annoRevista')?>").select2();

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

<!-- document.getElementsByTagName('label')[5].firstChild.data.innerHTML="Hola"; -->

<!-- var label = document.querySelector('label[for="categoria"]'); -->
<!-- // change it's content -->
<!-- label.textContent = 'Emmanuel' -->