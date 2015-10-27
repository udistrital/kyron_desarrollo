<?php

namespace asignacionPuntajes\salariales\excelenciaAcademica;

if (! isset ( $GLOBALS ["autorizado"] )) {
	include ("../index.php");
	exit ();
}

include_once ("core/manager/Configurador.class.php");
include_once ("core/connection/Sql.class.php");

// Para evitar recefiniciones de clases el nombre de la clase del archivo sqle debe corresponder al nombre del bloque
// en camel case prececida por la palabra sql
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
				$cadenaSql .= "	nombre";
				$cadenaSql .= " FROM ";
				$cadenaSql .= " docencia.facultad";
				break;
				
			case "proyectoCurricular" :
				$cadenaSql = "SELECT";
				$cadenaSql .= " id_proyectocurricular,";
				$cadenaSql .= "	nombre";
				$cadenaSql .= " FROM ";
				$cadenaSql .= " docencia.proyectocurricular";
				$cadenaSql .= " WHERE estado=true";
				break;
				
			case "tipoExperiencia" :
				$cadenaSql = "SELECT";
				$cadenaSql .= " id_tipo_experiencia_calificada,";
				$cadenaSql .= "	descripcion";
				$cadenaSql .= " FROM";
				$cadenaSql .= " docencia.tipo_experiencia_calificada";
				break;
				
			case "resolucionEmitidaPor" :
				$cadenaSql = "SELECT";
				$cadenaSql .= " id_tipo_emisor_resolucion,";
				$cadenaSql .= "	descripcion";
				$cadenaSql .= " FROM ";
				$cadenaSql .= " docencia.tipo_emisor_resolucion";
				break;
				
			case "docente" :
				$cadenaSql=" SELECT";
				$cadenaSql.=" documento_docente||' - '||primer_nombre||' '||segundo_nombre||' '||primer_apellido||' '||segundo_apellido AS value, ";
				$cadenaSql.=" documento_docente AS data ";
				$cadenaSql.=" FROM ";
				$cadenaSql.=" docencia.docente WHERE documento_docente||' - '||primer_nombre||' '||segundo_nombre||' '||primer_apellido||' '||segundo_apellido ";
				$cadenaSql.=" LIKE '%" . $variable . "%' AND estado=true LIMIT 10;";
				break;
								
			case "consultar" :			
				$cadenaSql=" select ";
				$cadenaSql.=" ea.id_excelencia_academica as id_excelencia, ";
				$cadenaSql.=" ea.documento_docente, ";
				$cadenaSql.=" dc.primer_nombre||' '||dc.segundo_nombre||' '||dc.primer_apellido||' '||dc.segundo_apellido nombre_docente, ";
				$cadenaSql.=" ea.numero_resolucion,";
				$cadenaSql.=" ea.fecha_resolucion,";
				$cadenaSql.=" ea.numero_acta,";
				$cadenaSql.=" ea.fecha_acta,";
				$cadenaSql.=" ea.puntaje as puntaje ";
				$cadenaSql.=" from ";
				$cadenaSql.=" docencia.excelencia_academica ea ";
				$cadenaSql.=" left join docencia.docente dc on ea.documento_docente=dc.documento_docente ";
				$cadenaSql.=" left join docencia.docente_proyectocurricular dc_pc on ea.documento_docente=dc_pc.documento_docente ";
				$cadenaSql.=" left join docencia.proyectocurricular pc on dc_pc.id_proyectocurricular=pc.id_proyectocurricular ";
				$cadenaSql.=" left join docencia.facultad fc on pc.id_facultad=fc.id_facultad ";
				$cadenaSql.=" where ";
				$cadenaSql.=" ea.estado=true ";
				$cadenaSql.=" and dc.estado=true ";
				$cadenaSql.=" and pc.estado=true ";
				$cadenaSql.=" and dc_pc.estado=true";
				if ($variable ['documento_docente'] != '') {
					$cadenaSql .= " AND dc.documento_docente = '" . $variable ['documento_docente'] . "'";
				}
				if ($variable ['id_facultad'] != '') {
					$cadenaSql .= " AND fc.id_facultad = '" . $variable ['id_facultad'] . "'";
				}
				if ($variable ['id_proyectocurricular'] != '') {
					$cadenaSql .= " AND pc.id_proyectocurricular = '" . $variable ['id_proyectocurricular'] . "'";
				}
				break;
				
			case "registrar" :
				$cadenaSql = "INSERT INTO docencia.excelencia_academica( ";
				$cadenaSql .= "documento_docente, numero_resolucion, ";
				$cadenaSql .= "fecha_resolucion, numero_acta, fecha_acta, puntaje) ";
				$cadenaSql .= " VALUES (" . $variable ['id_docenteRegistrar'] . ",";
				$cadenaSql .= " '" . $variable ['numeroResolucion'] . "',";
				$cadenaSql .= " '" . $variable ['fechaResolucion'] . "',";
				$cadenaSql .= " '" . $variable ['numeroActa'] . "',";
				$cadenaSql .= " '" . $variable ['fechaActa'] . "',";
				$cadenaSql .= " '" . $variable ['puntaje'] . "')";
				break;				
				
			case "publicacionActualizar" :
				$cadenaSql=" SELECT ea.id_excelencia_academica, ea.documento_docente,";
				$cadenaSql.=" dc.primer_nombre||' '||dc.segundo_nombre||' '||dc.primer_apellido||' '||dc.segundo_apellido nombre_docente,";
				$cadenaSql.=" ea.numero_resolucion, ";
				$cadenaSql.=" ea.fecha_resolucion, ";
				$cadenaSql.=" ea.numero_acta, ";
				$cadenaSql.=" ea.fecha_acta, ";
				$cadenaSql.=" ea.puntaje ";
				$cadenaSql.=" FROM docencia.excelencia_academica as ea ";
				$cadenaSql.=" left join docencia.docente dc on ea.documento_docente=dc.documento_docente ";
				$cadenaSql.=" WHERE ea.documento_docente ='" . $variable['documento_docente']. "'";
				$cadenaSql.=" and ea.id_excelencia_academica ='" . $variable['identificadorExcelenciaAcad']. "'";
				break;
				
			case "actualizar" :
				$cadenaSql = "UPDATE ";
				$cadenaSql .= "docencia.excelencia_academica ";
				$cadenaSql .= "SET ";
				$cadenaSql .= "numero_resolucion = '" . $variable ['numeroResolucion'] . "', ";
				$cadenaSql .= "fecha_resolucion = '" . $variable ['fechaResolucion'] . "', ";
				$cadenaSql .= "numero_acta = '" . $variable ['numeroActa'] . "', ";
				$cadenaSql .= "fecha_acta = '" . $variable ['fechaActa'] . "', ";
				$cadenaSql .= "puntaje = '" . $variable ['puntaje'] . "' ";
				$cadenaSql .= "normatividad = '" . $variable ['normatividad'] . "' ";
				$cadenaSql .= "WHERE ";
				$cadenaSql .= "documento_docente ='" . $variable ['id_docenteRegistrar'] . "' ";
				$cadenaSql .= "and id_excelencia_academica ='" . $variable ['identificadorExcelenciaAcad'] . "' ";
				$cadenaSql .= "and estado=true";
				break;
				
		}
		
		return $cadenaSql;
	}
}

?>
