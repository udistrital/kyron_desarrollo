<?php

/**
 * * Importante: Si se desean los datos del bloque estos se encuentran en el arreglo $esteBloque
 */
$directorioImagenes = $this->miConfigurador->getVariableConfiguracion("rutaUrlBloque")."/images";

$conexion = "estructura";
$esteRecursoDB = $this->miConfigurador->fabricaConexiones->getRecursoDB($conexion);


if (!$esteRecursoDB) {
	//Este se considera un error fatal
	exit;
}
switch($_REQUEST["funcion"]){

	case "#docenteid":
		
            $cadena_sql = $this->sql->cadena_sql("buscarNombreDocente", $_REQUEST["name_startsWith"]);
            $registro = $esteRecursoDB->ejecutarAcceso($cadena_sql, "busqueda");
            
            if($registro)
                {
                    //Para autocomplete
                    $respuesta = '[';

                    foreach ($registro as $fila) {
                            $respuesta.='{';
                            $respuesta.='"label":"' . $fila[1] . '",';
                            $respuesta.='"value":"' . $fila[0] . '"';
                            $respuesta.='},';
                    }

                    $respuesta = substr($respuesta, 0, strlen($respuesta) - 1);
                    $respuesta.=']';
                }else
                    {
                        $respuesta='[{"label":"No encontrado","value":"-1"}]';
                    }
		
        break;
        
        case "#docente":
		
            $cadena_sql = $this->sql->cadena_sql("buscarNombreDocente", $_REQUEST["name_startsWith"]);
            $registro = $esteRecursoDB->ejecutarAcceso($cadena_sql, "busqueda");
            
            if($registro)
                {
                    //Para autocomplete
                    $respuesta = '[';

                    foreach ($registro as $fila) {
                            $respuesta.='{';
                            $respuesta.='"label":"' . $fila[1] . '",';
                            $respuesta.='"value":"' . $fila[0] . '"';
                            $respuesta.='},';
                    }

                    $respuesta = substr($respuesta, 0, strlen($respuesta) - 1);
                    $respuesta.=']';
                }else
                    {
                        $respuesta='[{"label":"No encontrado","value":"-1"}]';
                    }
		
        break;
        
        case "#facultad":
		
            $cadena_sql = $this->sql->cadena_sql("buscarProyectos", $_REQUEST["facultad"]);
            $registro = $esteRecursoDB->ejecutarAcceso($cadena_sql, "busqueda");
            
	    $respuesta.= "<option value='' selected>Seleccione...</option>";

            if(!is_array($registro))
                {
                    $respuesta.= "<option value='' selected>--SIN REGISTROS--</option>";
                }else
                {
                        for($j=0;$j<count($registro);$j++)
                        {
                            $respuesta.=  "<option value='".$registro[$j][0]."'>".  htmlentities($registro[$j][1])."</option>";            
                        }
                }
		
        break;
}

echo $respuesta;
?>