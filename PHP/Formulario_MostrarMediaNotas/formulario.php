<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <title>Formulario</title>
</head>
<body> 
<?php
    $notasAlumno = array();
    $nombreAlumno = array();
    $apellidoAlumno = array();

    //Función para calcular la media
    function calcularMedia($notasAlumno, $indiceAlumno) {
        $suma = 0;
        $media = 0;

        for ($j = 0; $j < count($notasAlumno[$indiceAlumno]); $j++) {
            $suma+= floatval($notasAlumno[$indiceAlumno][$j]);
        }

        $media = $suma / count($notasAlumno[$indiceAlumno]);

        return $media;
    }

    //Función para pintar la nota
    function pintarNota($nota) {
        if ($nota >= 5) {
            echo '<td class="py-2 px-4 bg-green-500">' . $nota . '</td>';
        }else {
            echo '<td class="py-2 px-4 bg-red-500">' . $nota . '</td>';
        }
    }

    //Verificamos los datos
    if (isset($_POST['nota']) && isset($_POST['nombreAlumno']) && isset($_POST['apellidoAlumno'])) {

        $notasAlumno = $_POST['nota'];
        $nombreAlumno = $_POST['nombreAlumno'];
        $apellidoAlumno = $_POST['apellidoAlumno'];

        echo '<div class="max-w-md mx-auto bg-white p-6 rounded-md shadow-md text-center">';
        echo '<h2 class="text-2xl font-bold mb-4">Tabla de Notas de Alumnos</h2>';

        echo '<table>';
        echo '<thead>';
        echo '<td><strong>Nombre</strong></td>';
        echo '<td><strong>Apellidos</strong></td>';
        echo '<td><strong>Nota 1</strong></td>';
        echo '<td><strong>Nota 2</strong></td>';
        echo '<td><strong>Nota 3<strong></td>';
        echo '<td><strong>Media de notas<strong></td>';
        echo '</thead>';

        echo '<tbody>';

        for ($i = 0; $i < count($nombreAlumno); $i++) {
            echo '<tr>';
            echo '<td class="py-2 px-4 bg-gray-100">' . $nombreAlumno[$i] . '</td>';
            echo '<td class="py-2 px-4 bg-gray-100">' . $apellidoAlumno[$i] . '</td>';

            for ($j = 0; $j < count($notasAlumno[$i]); $j++) {
                pintarNota($notasAlumno[$i][$j]);
            }

            $media = number_format(calcularMedia($notasAlumno, $i),2);
            pintarNota($media);

            echo '</tr>';
        }

        echo '</tbody>';
        echo '</table>';
        echo '</div>';
    }
?>
</body>
</html>

