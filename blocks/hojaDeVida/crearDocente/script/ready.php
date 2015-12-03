$("#crearDocente").validationEngine({
promptPosition : "centerRight", 
scroll: false,
autoHidePrompt: true,
autoHideDelay: 2000
});

$(function() {
	$("#crearDocente").submit(function() {
		$resultado=$("#crearDocente").validationEngine("validate");
		if ($resultado) {
			return true;
		}
		return false;
	});
});

$("#crearDocenteRegistrar").validationEngine({
	promptPosition : "centerRight", 
	scroll: false,
	autoHidePrompt: true,
	autoHideDelay: 2000
});

$(function() {
$("#crearDocenteRegistrar").submit(function() {
$resultado=$("#crearDocenteRegistrar").validationEngine("validate");

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
	$("#crearDocenteModificar").submit(function() {
		$resultado=$("#crearDocenteModificar").validationEngine("validate");
		if ($resultado) {
			return true;
		}
		return false;
	});
});

$("#crearDocenteModificar").validationEngine({
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
$('#<?php echo $this->campoSeguro('tipoDocumento')?>').width(450);
$('#<?php echo $this->campoSeguro('entidad')?>').width(450);
$('#<?php echo $this->campoSeguro('modalidad')?>').width(450);
$('#<?php echo $this->campoSeguro('pais')?>').width(450);
$('#<?php echo $this->campoSeguro('anno')?>').width(450);

//////////////////**********Se definen los campos que requieren campos de select2**********////////////////

$("#<?php echo $this->campoSeguro('facultad')?>").select2();
$("#<?php echo $this->campoSeguro('proyectoCurricular')?>").select2();

$('#<?php echo $this->campoSeguro('tipoDocumento')?>').select2();
$('#<?php echo $this->campoSeguro('entidad')?>').select2();
$('#<?php echo $this->campoSeguro('modalidad')?>').select2();
$('#<?php echo $this->campoSeguro('pais')?>').select2();
$('#<?php echo $this->campoSeguro('anno')?>').select2();

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
