,<!--Nombre: Romel Romero-->
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Tabla PHP</title>
    <style>
        /*Hojas de estilos aplicadas al calendario, algunas partes estan incrustadas en el propio codigo en PHP*/
        table, tr, td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px;
        text-align: center;
        }
        tr:nth-of-type(8) {
        display: none;
        color: rgb(179, 223, 255);
        }
        tr:first-child{
        font-weight: bold;
            }
        table{ 
        margin-bottom: 10px;
        }
    </style>
</head>
<body style="margin: 0;padding: 0;display: flex;align-items: center;flex-direction: column;font-family: 'Calibri'">
    <div id=caja-primera style="font-weight: bold;margin-left: 1em;text-align: center;">
    <h1>CALENDARIO ESCOLAR 2023-2024</h1>
    <p>Cuadro sintesis informativo</p>
    </div>
    <?php
    // Declaramos constantes para las filas y columnas del array multidimensinal
    define("MAX_FILA", 5);
    define("MAX_COLUMNA", 7);

    //FESTIVOS
    // Declaramos la estructura de datos

    //Definimos un array asociativo para los dias FESTIVOS y NO LECTIVOS
    $diasEspeciales = array(
        1 => array(1, 2, 3),  // Días especiales en enero
        2 => array(22, 23),   // Días especiales en febrero
        3 => array(1),        // Días especiales en marzo
        5 => array(1, 2, 3),  // Días especiales en mayo
        10 => array(12, 13),  // Días especiales en octubre
        11 => array(1),       // Días especiales en noviembre
        12 => array(6, 8)     // Días especiales en diciembre
    );

    $inicioFinCurso = array(
        6 =>"SEPTIEMBRE",
        22 => "JUNIO",
    );
    $diasSemana = ["L", "M", "X", "J", "V", "S", "D"];
    // FUNCIONES

    // Función para calcular el día de inicio del curso en septiembre usando el algoritmo de Zeller
    function buscarDiaComienzoMesSeptiembre($anio, $mes, $dia) {
        if ($mes < 3) {
            $mes += 12;
            $anio -= 1;
        }
        // Calcular el día de la semana
        $diaAnio = $dia + floor((13 * ($mes + 1)) / 5) + $anio % 100 + floor($anio % 100 / 4) + floor($anio / 400) - floor($anio / 100) * 2;

        // Devolver el día de la semana entre 0 y 6 (empezando desde sabado hasta el viernes)
        return ($diaAnio % 7);
    }
    //Funcion que me dibuja los espacio en blanco a comienzo de cada mes dependiendo del dia de la semana que sea
    function espaciosEnBlanco($topeContador) {
        $espaciosDevueltos = 0;     
               
            if ($topeContador == 0) {
                //Si es sabadoPonemos 5 espacios en blanco
                $espaciosDevueltos = 5; 
            } elseif ($topeContador == 1) {
                $espaciosDevueltos = 6;
            } elseif ($topeContador == 2) {
                $espaciosDevueltos = 7;
            } elseif ($topeContador == 3) {
                $espaciosDevueltos = 1;
            } elseif ($topeContador == 4) {
                $espaciosDevueltos = 2;
            } elseif ($topeContador == 5) {
                $espaciosDevueltos = 3;
            } elseif ($topeContador == 6) {
                $espaciosDevueltos = 4;
         }
          return $espaciosDevueltos;            
        }

    // Función que devuelve el número de días en un mes específico
    function devuelveDias($mes, $anio) {
        $dias = 0;
        switch ($mes) {
            // Meses con 31 días
            case 1: case 3: case 5: case 7: case 8: case 10: case 12:
                $dias = 31;
                break;
            // Meses con 30 días
            case 4: case 6: case 9: case 11:
                $dias = 30;
                break;
            // Febrero
            default:
                if (esBisiesto($anio)) {
                    $dias = 29;
                } else {
                    $dias = 28;
                }
                break;
        }
        return $dias;
    }
    // Función para verificar si un año es bisiesto
    function esBisiesto($anio) {
        return ($anio % 4 == 0 && $anio % 100 != 0) || $anio % 400 == 0;
    }

    function dibujarDias($diasSem) {
        //Dibujamos los dias de la semana 
        echo "<tr>";
        foreach ($diasSem as $valor) {
            echo "<td>";
            echo $valor;
            echo "</td>";
        }
        echo "</tr>";
    }
    //Funcion que verifica si es fin de semana 
    function esFinDeSemana($miMatriz, $fila, $columna) {
        return ($miMatriz[$fila][$columna] != " ") && ($columna == 5 || $columna == 6);
    }
    //Funcion que verifica si es inicio o fin de curso
    function esInicioOfinDeCurso($miMatriz, $fila, $columna, $mes) {
        return ($miMatriz[$fila][$columna] == 7 && $mes == 9 ) || ($miMatriz[$fila][$columna] == 21 && $mes == 6);
    }

    //Funcion que pinta el los datos del array por pantalla tomando en cuenta las condiciones de festividades...etc
    function pintarTablaEnPantalla($miMatriz, $diasSemana, $contadorTope, $mes, $diasEspeciales) {
        dibujarDias($diasSemana); //Dibujamos los dias de la semana
        for ($fila = 0; $fila <= MAX_FILA; $fila++) 
            {
            echo "<tr>";
            for ($columna = 0; $columna < MAX_COLUMNA; $columna++) 
            {
                //Si es vacia, mostramos columna vacia
                if ($miMatriz[$fila][$columna] == " ") {
                    echo "<td>";
                    echo "&nbsp";
                    echo "</td>";
                }
                //Si es vacia, y no es fin de semana se muestran los dias azules 
                elseif(($miMatriz[$fila][$columna] != " ") && ($columna != 5 && $columna != 6) && !($mes == 12 && $fila == 4) && !($mes == 1 && $fila == 1) && !($mes == 3 && $fila == 4))
                {                  
                        //Si no es dia festivo disbuja celda azul
                        if(!esDiaFestivo($miMatriz, $fila, $columna, $mes, $diasEspeciales) && !esInicioOfinDeCurso($miMatriz, $fila, $columna, $mes))
                        {
                            dibujarCeldaAzul($miMatriz, $fila, $columna);   
                        }
                        //Si es dia festivo
                        elseif(esDiaFestivo($miMatriz, $fila, $columna, $mes, $diasEspeciales))
                        {
                            dibujarCeldaRoja($miMatriz, $fila, $columna);
                        }
                        elseif(esInicioOfinDeCurso($miMatriz, $fila, $columna, $mes) && !esDiaFestivo($miMatriz, $fila, $columna, $mes, $diasEspeciales)){
                            dibujarCeldaVerde($miMatriz, $fila, $columna);
                        }
                }
                // Si es fin de semana y no es diciembre ni abril y tampoco es la primera semana de enero
                elseif(esFinDeSemana($miMatriz, $fila, $columna) && !($mes == 12 && $fila == 4) && !($mes == 1 && $fila == 1)){
                    dibujarCeldaRoja($miMatriz, $fila, $columna);
                }
                //Si no es la ultima semana de diciembre
                elseif($mes == 12 && $fila == 4){
                    dibujarCeldaRoja($miMatriz, $fila, $columna);
                }
                //Si es la primera semana de enero
                elseif($mes == 1 && $fila == 1)
                {
                    dibujarCeldaRoja($miMatriz, $fila, $columna);
                }
                //Si es semana santa...
                elseif($mes == 3 && $fila == 4)
                {
                    dibujarCeldaRoja($miMatriz, $fila, $columna);
                }
            }
               echo "</tr>";
            }  
            
        }
     
    //Funcion que verifica si un dia es festivo vificando en el array de dias si hay un dia festivo que coincida en el array de dias festivos
    function esDiaFestivo($miMatriz, $fila, $columna, $mes, $diasEspeciales) {
        $okFestivo = false; //En principio no es festivo
        //Veficamos si el mes se encuentra en el array de los dias festivos
        if(array_key_exists($mes,$diasEspeciales)){
            //Metemos los datos del array en dias festivos 
            $diasFestivosMes = $diasEspeciales[$mes];
            for ($i = 0; $i < count($diasFestivosMes); $i++) {
                if ($miMatriz[$fila][$columna] == $diasFestivosMes[$i]) {
                    $okFestivo = true;
                    break;
                }
            }
        }
        return $okFestivo;
    }
   
    //Funcion que dibuja celda ROJA
    function dibujarCeldaRoja($miMatriz, $fila, $columna){
        echo '<td style="background-color:rgb(248, 147, 147)">';
        echo $miMatriz[$fila][$columna];
        echo '</td>';
    }
    //Funcion que dibuja la celda azul
    function dibujarCeldaAzul($miMatriz, $fila, $columna){
        echo '<td style="background-color:rgb(179, 223, 255)">';
        echo $miMatriz[$fila][$columna];
        echo '</td>';
    }
    //Funcion que dibuja la celda verde
    function dibujarCeldaVerde($miMatriz, $fila, $columna){
        echo '<td style="background-color:rgb(179, 255, 230)">';
        echo $miMatriz[$fila][$columna];
        echo '</td>';
    }
    /*Funcion que llena el array con los dias dependiendo de sus condiciones, etc...
    Ponemos & ya que es un parametro por referencia, es decir que cuando me salga de la funcion esos datos que se han metido se van a guardar
    tanto en la variable general que se usa en el programa, si no se pusiera el array no se llenaria de datos y seria un parametro por valor*/
    function llenarTabla(&$miMatriz, $contadorDiaSemana, $diaTopeMes) {
        $espaciosEnBlanco = espaciosEnBlanco($contadorDiaSemana); 
        $finDias = false;
        $contador = 1;
            for ($fila = 0; $fila <= MAX_FILA && !$finDias; $fila++) {
                for ($columna = 0; $columna < MAX_COLUMNA; $columna++) {
                    if ((($fila == 0 && $columna < $espaciosEnBlanco) && $espaciosEnBlanco != 0)) {
                    $miMatriz[$fila][$columna] = " ";
                    }
                    elseif($contador > $diaTopeMes){
                        $miMatriz[$fila][$columna] = " ";
                    }
                    else{
                    $miMatriz[$fila][$columna] = $contador;
                    $contador++;
                    }
                }  
             }
        }
    
    //Funcion que dado el numero del mes me devuelme el mes en cadena de caracteres
    function mesEspecifico($mes){
        $diaToString = " ";
        if($mes == 1){
            $diaToString = "ENERO";
        }
        elseif($mes == 2){
            $diaToString = "FEBRERO";
        }
        elseif($mes == 3){
            $diaToString = "MARZO";
        }
        elseif($mes == 4){
            $diaToString = "ABRIL";
        }
        elseif($mes == 5){
            $diaToString = "MAYO";
        }
        elseif($mes == 6){
            $diaToString = "JUNIO";
        }
        elseif($mes == 7){
            $diaToString = "JULIO";
        }
        elseif($mes == 8){
            $diaToString = "AGOSTO";
        }
        elseif($mes == 9){
            $diaToString = "SEPTIEMBRE";
        }
        elseif($mes == 10){
            $diaToString = "OCTUBRE";
        }
        elseif($mes == 11){
            $diaToString = "NOVIEMBRE";
        }
        elseif($mes == 12){
            $diaToString = "DICIEMBRE";
        }
       return $diaToString;
    }

    ?> 
    <?php
    $contadorMes = 9;
    $contadorDiaMes = 1;
    $anio = 2023;
    $miMatriz = array();
    $esMes = false;

    // Inicializa la matriz bidimensional con valores nulos, para darle el tamano de la tabla de un mes general
    for ($fila = 0; $fila < MAX_FILA; $fila++) {
        for ($columna = 0; $columna < MAX_COLUMNA; $columna++) {
            $miMatriz[$fila][$columna] = null;
        }
    }
    
    echo '<div id="caja-principal" style="display: flex;flex-direction: row;flex-wrap: wrap;margin-left: 8em;width: 40%">';
    
    while (!$esMes) {

        echo '<div class="cajas" style="margin-left: 20px;">'; //Creamos el div correspondiente al calendario
        echo '<table style="margin-bottom: 10px;">';

        $mes = mesEspecifico($contadorMes);
        echo '<caption style="background-color:rgb(255, 0, 0);color:white;font-weight:bold">';
        echo "{$mes}</caption>";

        $contadorDiaSemana = buscarDiaComienzoMesSeptiembre($anio,$contadorMes, $contadorDiaMes);
        $diaTopeMes = devuelveDias($contadorMes, $anio);

        llenarTabla($miMatriz, $contadorDiaSemana, $diaTopeMes);
        pintarTablaEnPantalla($miMatriz, $diasSemana, $contadorDiaSemana, $contadorMes, $diasEspeciales);

        $contadorMes++;
        //Si llegamos a los trece meses ya se habra cumplido los 12 meses por lo que comenzamos en enero
        if ($contadorMes == 13) {
            $anio++;
            $contadorMes = 1;
        }
        //Al llegar a julio nos salimos el bucle
        if ($contadorMes == 8) {
            $esMes = true; // Dejan de crearse los meses
        }

        echo "</table>";
        echo '</div>';
    }
    echo '</div>';
    ?>
    </div>
</body>
</html>