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

    if (isset($_POST['nota']) && isset($_POST['nombreAlumno']) && isset($_POST['apellidoAlumno'])) {

        $notasAlumno = $_POST['nota'];
        $nombreAlumno = $_POST['nombreAlumno'];
        $apellidoAlumno = $_POST['apellidoAlumno'];

        header('Content-type: text/html; charset=utf-8');

        $db = 'mysql:host=localhost;dbname=colegio;charset=utf8';
        $user = 'root';
        $pass = '123456789r';

        if (isset($_POST['nota']) && isset($_POST['nombreAlumno']) && isset($_POST['apellidoAlumno'])) {

            $notasAlumno = $_POST['nota'];
            $nombreAlumno = $_POST['nombreAlumno'];
            $apellidoAlumno = $_POST['apellidoAlumno'];
    
            $db = 'mysql:host=localhost;dbname=colegio;charset=utf8';
            $user = 'root';
            $pass = '123456789r';
    
            try {
                $conn = new PDO($db, $user, $pass);
                $sentenciaAgregarEstudiante = "CALL AgregarEstudiante(:nombre, :apellido)";
                $sentenciaAgregarNota = "CALL AgregarNota(:idEstudiante, :nota)";
        
                $consultaUno = $conn->prepare($sentenciaAgregarEstudiante);
                $consultaDos = $conn->prepare($sentenciaAgregarNota);
        
                for ($i = 0; $i < count($nombreAlumno); $i++) {
                    $consultaUno->bindParam(':nombre', $nombreAlumno[$i], PDO::PARAM_STR);
                    $consultaUno->bindParam(':apellido', $apellidoAlumno[$i], PDO::PARAM_STR);
                    $consultaUno->execute();
        
                    $stmt = $conn->query("SELECT LAST_INSERT_ID() AS ultimoId");
                    $result = $stmt->fetch(PDO::FETCH_ASSOC);
                    $idEstudiante = $result['ultimoId'];
        
                    for ($j = 0; $j < count($notasAlumno[$i]); $j++) {
                        $nota = str_replace(',', '.', $notasAlumno[$i][$j]);
                        $consultaDos->bindParam(':idEstudiante', $idEstudiante, PDO::PARAM_INT);
                        $consultaDos->bindParam(':nota', $nota, PDO::PARAM_STR);
                        $consultaDos->execute();
                    }
                }
                echo '<strong style="color:green">Datos insertados satisfactoriamente</strong>';
            }catch (PDOException $e) {
                echo 'Error: ' . $e->getMessage();
            }finally {
                $conn = null;
            }
        }
    }
?>
</body>
</html>

