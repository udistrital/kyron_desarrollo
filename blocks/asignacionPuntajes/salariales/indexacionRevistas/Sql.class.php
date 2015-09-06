<?php

namespace asignacionPuntajes\salariales\indexacionRevistas;

if (! isset ( $GLOBALS ["autorizado"] )) {
	include ("../index.php");
	exit ();
}

include_once ("core/manager/Configurador.class.php");
include_once ("core/connection/Sql.class.php");

// Para evitar redefiniciones de clases el nombre de la clase del archivo sqle debe corresponder al nombre del bloque
// en camel case precedida por la palabra sql
class Sql extends \Sql {
	var $miConfigurador;
	function __construct() {
		$this->miConfigurador = \Configurador::singleton ();
	}
	function getCadenaSql($tipo, $variable = "") {
		
		/**
		 * 1.
		 * Revisar las variables para evitar SQL Injection
		 */
		$prefijo = $this->miConfigurador->getVariableConfiguracion ( "prefijo" );
		$idSesion = $this->miConfigurador->getVariableConfiguracion ( "id_sesion" );
		
		switch ($tipo) {
			
			/**
			 * Clausulas genéricas.
			 * se espera que estén en todos los formularios
			 * que utilicen esta plantilla
			 */
			case "iniciarTransaccion" :
				$cadenaSql = "START TRANSACTION";
				break;
			
			case "finalizarTransaccion" :
				$cadenaSql = "COMMIT";
				break;
			
			case "cancelarTransaccion" :
				$cadenaSql = "ROLLBACK";
				break;
			
			case "eliminarTemp" :
				
				$cadenaSql = "DELETE ";
				$cadenaSql .= "FROM ";
				$cadenaSql .= $prefijo . "tempFormulario ";
				$cadenaSql .= "WHERE ";
				$cadenaSql .= "id_sesion = '" . $variable . "' ";
				break;
			
			case "insertarTemp" :
				$cadenaSql = "INSERT INTO ";
				$cadenaSql .= $prefijo . "tempFormulario ";
				$cadenaSql .= "( ";
				$cadenaSql .= "id_sesion, ";
				$cadenaSql .= "formulario, ";
				$cadenaSql .= "campo, ";
				$cadenaSql .= "valor, ";
				$cadenaSql .= "fecha ";
				$cadenaSql .= ") ";
				$cadenaSql .= "VALUES ";
				
				foreach ( $_REQUEST as $clave => $valor ) {
					$cadenaSql .= "( ";
					$cadenaSql .= "'" . $idSesion . "', ";
					$cadenaSql .= "'" . $variable ['formulario'] . "', ";
					$cadenaSql .= "'" . $clave . "', ";
					$cadenaSql .= "'" . $valor . "', ";
					$cadenaSql .= "'" . $variable ['fecha'] . "' ";
					$cadenaSql .= "),";
				}
				
				$cadenaSql = substr ( $cadenaSql, 0, (strlen ( $cadenaSql ) - 1) );
				break;
			
			case "rescatarTemp" :
				$cadenaSql = "SELECT ";
				$cadenaSql .= "id_sesion, ";
				$cadenaSql .= "formulario, ";
				$cadenaSql .= "campo, ";
				$cadenaSql .= "valor, ";
				$cadenaSql .= "fecha ";
				$cadenaSql .= "FROM ";
				$cadenaSql .= $prefijo . "tempFormulario ";
				$cadenaSql .= "WHERE ";
				$cadenaSql .= "id_sesion='" . $idSesion . "'";
				break;
			
			/* Consultas del desarrollo */
			case "facultad" :
				$cadenaSql = "SELECT";
				$cadenaSql .= " id_facultad,";
				$cadenaSql .= "	nombre_facultad";
				$cadenaSql .= " FROM ";
				$cadenaSql .= " docencia.facultades";
				break;
				
			case "proyectoCurricular" :
				$cadenaSql = "SELECT";
				$cadenaSql .= " id_facultad,";
				$cadenaSql .= "	nombre_proyecto";
				$cadenaSql .= " FROM ";
				$cadenaSql .= " docencia.proyectocurricular";
				break;
				
			case "pais" :
				$cadenaSql = "SELECT";
				$cadenaSql .= " paiscodigo,";
				$cadenaSql .= "	paisnombre";
				$cadenaSql .= " FROM ";
				$cadenaSql .= " docencia.pais_kyron";
				$cadenaSql .= " WHERE 1=1";
				if($variable == 0){
					$cadenaSql .= " and lower(paisnombre) = 'colombia'";
				}elseif ($variable == 1){
					$cadenaSql .= " and lower(paisnombre) != 'colombia'";
				}
				break;
				
			case "categoria_revista" :
				$cadenaSql = "select";
				$cadenaSql .= " id_tipo_indexacion,";
				$cadenaSql .= "	descripcion";
				$cadenaSql .= " FROM ";
				$cadenaSql .= " docencia.categoria_revista";
				$cadenaSql .= " WHERE";
				$cadenaSql .= " contexto_revista =" . $variable;
				break;
				
			case "docente" :
				$cadenaSql = "SELECT informacion_numeroidentificacion||' - '||informacion_nombres AS  value, informacion_numeroidentificacion  AS data ";
				$cadenaSql .= " FROM docencia.docente_informacion";
				$cadenaSql .= " WHERE cast(informacion_numeroidentificacion as text) LIKE '%" . $variable . "%'";
				$cadenaSql .= " OR informacion_nombres LIKE '%" . $variable . "%' LIMIT 10;";
				
				break;
				
			case "consultarIndexacion" :			
				$cadenaSql = "SELECT  id_indexacion_revista, id_revista_docente, ";
				$cadenaSql .= " informacion_nombres, informacion_apellidos,  ";
				$cadenaSql .= " revista_nombre, titulo_articulo, paisnombre,   ";
				$cadenaSql .= "item_nombre, numero_issn, ";
				$cadenaSql .= "anno_publicacion, ";
				$cadenaSql .= " volumen_revista, numero_volumen, paginas_revista, fecha_publicacion ";
				$cadenaSql .= "FROM docencia.dependencia_docente ";
				$cadenaSql .= "JOIN docencia.categoria_docente ON categoria_iddocente = dependencia_iddocente ";
				$cadenaSql .= "JOIN docencia.docente_informacion ON informacion_numeroidentificacion = dependencia_iddocente ";
				$cadenaSql .= "JOIN docencia.indexacion_revistas ON id_revista_docente = dependencia_iddocente ";
				$cadenaSql .= "LEFT JOIN docencia.parametros_indexacion ON item_id = revista_indexacion ";
				$cadenaSql .= "LEFT JOIN docencia.pais_kyron ON paiscodigo = pais_publicacion ";
				$cadenaSql .= "WHERE 1=1";
// 				if ($variable [0] != '') {
// 					$cadena_sql .= " AND dependencia_iddocente = '" . $variable [0] . "'";
// 				}
// 				if ($variable [1] != '') {
// 					$cadena_sql .= " AND dependencia_facultad = '" . $variable [1] . "'";
// 				}
// 				if ($variable [2] != '') {
// 					$cadena_sql .= " AND dependencia_proyectocurricular = '" . $variable [2] . "'";
// 				}
				break;
				
				case "insertarIndexacion" :
					$cadenaSql = "INSERT INTO docencia.indexacion_revistas( ";
					$cadenaSql .= "id_revista_docente, revista_nombre, revista_tipo, pais_publicacion, ";
					$cadenaSql .= "revista_indexacion, ";
					$cadenaSql .= "numero_issn, anno_publicacion, volumen_revista, numero_volumen, paginas_revista, ";
					$cadenaSql .= "titulo_articulo, numero_autores, numero_autores_ud, fecha_publicacion, ";
					$cadenaSql .= "acta_numero, fecha_acto, numero_caso, puntaje) ";
					$cadenaSql .= " VALUES (" . $variable [0] . ",";
					$cadenaSql .= " '" . $variable [1] . "',";
					$cadenaSql .= " '" . $variable [2] . "',";
					$cadenaSql .= "'" . $variable [3] . "',";
					$cadenaSql .= " '" . $variable [4] . "',";
					$cadenaSql .= " " . $variable [5] . ",";
					$cadenaSql .= " '" . $variable [6] . "',";
					$cadenaSql .= " '" . $variable [7] . "',";
					$cadenaSql .= " '" . $variable [8] . "',";
					$cadenaSql .= " '" . $variable [9] . "',";
					$cadenaSql .= " '" . $variable [10] . "',";
					$cadenaSql .= " '" . $variable [11] . "',";
					$cadenaSql .= " '" . $variable [12] . "',";
					$cadenaSql .= "' " . $variable [13] . "' ,";
					$cadenaSql .= "' " . $variable [14] . "',";
					$cadenaSql .= " '" . $variable [15] . "',";
					$cadenaSql .= "' " . $variable [16] . "',";
					$cadenaSql .= " '" . $variable [17] . "')";
					break;
		}
		
		return $cadenaSql;
	}
}

?>
