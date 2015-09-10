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
				break;
				
			case "pais" :
				$cadenaSql = "SELECT";
				$cadenaSql .= " paiscodigo,";
				$cadenaSql .= "	paisnombre";
				$cadenaSql .= " FROM ";
				$cadenaSql .= " docencia.pais";
				if($variable == 0){
					$cadenaSql .= " WHERE paiscodigo = 'COL'";
				}elseif ($variable == 1){
					$cadenaSql .= " WHERE paiscodigo != 'COL'";
				}
				$cadenaSql .= "order by paisnombre";
				break;
				
			case "categoria_revista" :
				$cadenaSql = "select";
				$cadenaSql .= " id_tipo_indexacion,";
				$cadenaSql .= "	descripcion";
				$cadenaSql .= " FROM ";
				$cadenaSql .= " docencia.tipo_indexacion";
				$cadenaSql .= " WHERE";
				$cadenaSql .= " id_contexto =" . $variable;
				break;
				
			case "docente" :
				$cadenaSql = "SELECT documento_docente||' - '||primer_nombre||' '||segundo_nombre||' '||primer_apellido||' '||segundo_apellido AS  value, documento_docente  AS data ";
				$cadenaSql .= " FROM docencia.docente";
				$cadenaSql .= " WHERE cast(documento_docente as text) LIKE '%" . $variable . "%'";
				$cadenaSql .= " OR primer_nombre LIKE '%" . $variable . "%' LIMIT 10;";
				
				break;
								
			case "consultarIndexacion" :			
				$cadenaSql=" select ";
				$cadenaSql.=" ri.documento_docente, ";
				$cadenaSql.=" dc.primer_nombre||' '||dc.segundo_nombre||' '||dc.primer_apellido||' '||dc.segundo_apellido nombre_docente,";
				$cadenaSql.=" ri.nombre_revista, ri.titulo_articulo, pi.paisnombre, ti.descripcion as tipo_indexacion,";
				$cadenaSql.=" ri.numero_issn, ri.anno_publicacion,";
				$cadenaSql.=" ri.volumen_revista, ri.numero_revista,";
				$cadenaSql.=" ri.paginas_revista,";
				$cadenaSql.=" ri.fecha_publicacion ";
				$cadenaSql.=" from ";
				$cadenaSql.=" docencia.revista_indexada ri ";
				$cadenaSql.=" left join docencia.docente dc on ri.documento_docente=dc.documento_docente ";
				$cadenaSql.=" left join docencia.docente_proyectocurricular dc_pc on ri.documento_docente=dc_pc.documento_docente ";
				$cadenaSql.=" left join docencia.proyectocurricular pc on dc_pc.id_proyectocurricular=pc.id_proyectocurricular ";
				$cadenaSql.=" left join docencia.facultad fc on pc.id_facultad=fc.id_facultad ";
				$cadenaSql.=" left join docencia.pais pi on ri.paiscodigo=pi.paiscodigo ";
				$cadenaSql.=" left join docencia.tipo_indexacion ti ON ti.id_tipo_indexacion = ri.id_tipo_indexacion";
				$cadenaSql.=" where 1=1";
				if ($variable [0] != '') {
					$cadenaSql .= " AND dc.documento_docente = '" . $variable ['documento_docente'] . "'";
				}
				if ($variable [1] != '') {
					$cadenaSql .= " AND fc.id_facultad = '" . $variable ['id_facultad'] . "'";
				}
				if ($variable [2] != '') {
					$cadenaSql .= " AND pc.id_proyectocurricular = '" . $variable ['id_proyectocurricular'] . "'";
				}
				break;
				
			case "insertarIndexacion" :
				$cadenaSql = "INSERT INTO docencia.revista_indexada( ";
				$cadenaSql .= "documento_docente, nombre_revista, id_contexto, paiscodigo, ";
				$cadenaSql .= "id_tipo_indexacion, ";
				$cadenaSql .= "numero_issn, anno_publicacion, volumen_revista, numero_revista, paginas_revista, ";
				$cadenaSql .= "titulo_articulo, numero_autores, numero_autores_ud, fecha_publicacion, ";
				$cadenaSql .= "numero_acta, fecha_acta, numero_caso, puntaje) ";
				$cadenaSql .= " VALUES (" . $variable ['id_docenteRegistrar'] . ",";
				$cadenaSql .= " '" . $variable ['nombreRevista'] . "',";
				$cadenaSql .= " '" . $variable ['contextoRevista'] . "',";
				$cadenaSql .= "'" . $variable ['pais'] . "',";
				$cadenaSql .= " '" . $variable ['categoria'] . "',";
				$cadenaSql .= " '" . $variable ['issnRevista'] . "',";
				$cadenaSql .= " '" . $variable ['annoRevista'] . "',";
				$cadenaSql .= " '" . $variable ['volumenRevista'] . "',";
				$cadenaSql .= " '" . $variable ['numeroRevista'] . "',";
				$cadenaSql .= " '" . $variable ['paginasRevista'] . "',";
				$cadenaSql .= " '" . $variable ['tituloArticuloRevista'] . "',";
				$cadenaSql .= " '" . $variable ['numeroAutoresRevista'] . "',";
				$cadenaSql .= " '" . $variable ['numeroAutoresUniversidad'] . "',";
				$cadenaSql .= "' " . $variable ['fechaPublicacionrevista'] . "' ,";
				$cadenaSql .= "' " . $variable ['numeroActaRevista'] . "',";
				$cadenaSql .= " '" . $variable ['fechaActaRevista'] . "',";
				$cadenaSql .= "' " . $variable ['numeroCasoActaRevista'] . "',";
				$cadenaSql .= " '" . $variable ['puntajeRevista'] . "')";
				break;
				
			case "consultarRevistas" :
				$cadenaSql=" SELECT ri.documento_docente,";
				$cadenaSql.=" dc.primer_nombre||' '||dc.segundo_nombre||' '||dc.primer_apellido||' '||dc.segundo_apellido nombre_docente,";
				$cadenaSql.=" ri.nombre_revista, ";
				$cadenaSql.=" ri.id_contexto, ";
				$cadenaSql.=" ri.paiscodigo, ";
				$cadenaSql.=" ri.id_tipo_indexacion, ";
				$cadenaSql.=" ri.numero_issn, ";
				$cadenaSql.=" ri.anno_publicacion, ";
				$cadenaSql.=" ri.volumen_revista, ";
				$cadenaSql.=" ri.numero_revista, ";
				$cadenaSql.=" ri.paginas_revista, ";
				$cadenaSql.=" ri.titulo_articulo, ";
				$cadenaSql.=" ri.numero_autores, ";
				$cadenaSql.=" ri.numero_autores_ud, ";
				$cadenaSql.=" ri.fecha_publicacion, ";
				$cadenaSql.=" ri.numero_acta, ";
				$cadenaSql.=" ri.fecha_acta, ";
				$cadenaSql.=" ri.numero_caso, ";
				$cadenaSql.=" ri.puntaje ";
				$cadenaSql.=" FROM docencia.revista_indexada ri ";
				$cadenaSql.=" left join docencia.docente dc on ri.documento_docente=dc.documento_docente ";
				$cadenaSql.=" WHERE ri.documento_docente ='" . $variable['documento_docente']. "'";
				$cadenaSql.=" and ri.numero_issn ='" . $variable['numero_issn']. "'";
				break;
				
			case "actualizarIndexacion" :
				$cadenaSql = "UPDATE ";
				$cadenaSql .= "docencia.revista_indexada ";
				$cadenaSql .= "SET ";
				$cadenaSql .= "nombre_revista = '" . $variable ['nombreRevista'] . "', ";
				$cadenaSql .= "id_contexto = '" . $variable ['contextoRevista'] . "', ";
				$cadenaSql .= "paiscodigo = '" . $variable ['pais'] . "', ";
				$cadenaSql .= "id_tipo_indexacion = '" . $variable ['categoria'] . "', ";
				$cadenaSql .= "numero_issn = '" . $variable ['issnRevista'] . "', ";
				$cadenaSql .= "anno_publicacion = '" . $variable ['annoRevista'] . "', ";
				$cadenaSql .= "volumen_revista = '" . $variable ['volumenRevista'] . "', ";
				$cadenaSql .= "numero_revista = '" . $variable ['numeroRevista'] . "', ";
				$cadenaSql .= "paginas_revista = '" . $variable ['paginasRevista'] . "', ";
				$cadenaSql .= "titulo_articulo = '" . $variable ['tituloArticuloRevista'] . "', ";
				$cadenaSql .= "numero_autores = '" . $variable ['numeroAutoresRevista'] . "', ";
				$cadenaSql .= "numero_autores_ud = '" . $variable ['numeroAutoresUniversidad'] . "', ";
				$cadenaSql .= "fecha_publicacion = '" . $variable ['fechaPublicacionrevista'] . "', ";
				$cadenaSql .= "numero_acta = '" . $variable ['numeroActaRevista'] . "', ";
				$cadenaSql .= "fecha_acta = '" . $variable ['fechaActaRevista'] . "', ";
				$cadenaSql .= "numero_caso = '" . $variable ['numeroCasoActaRevista'] . "', ";
				$cadenaSql .= "puntaje = '" . $variable ['puntajeRevista'] . "'";
				$cadenaSql .= "WHERE ";
				$cadenaSql .= "documento_docente ='" . $variable ['id_docenteRegistrar'] . "' ";
				$cadenaSql .= "and numero_issn ='" . $variable ['numero_issn_old'] . "' ";
				break;
		}
		
		return $cadenaSql;
	}
}

?>
