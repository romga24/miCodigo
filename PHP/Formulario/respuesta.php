<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página de Respuesta</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 font-sans">
    <div class="max-w-md mx-auto mt-10 bg-white p-6 rounded-lg shadow-md">
        <h1 class="text-2xl font-bold text-teal-500 mb-4">Respuesta de Conversión de Moneda</h1>
        <?php
            $valorMoneda = $_POST['valorMoneda'];
            $arrayTipoMoneda = $_POST['moneda'];
            $valor = 0;

            if (isset($valorMoneda) && isset($arrayTipoMoneda)) {
                foreach ($arrayTipoMoneda as $tipo) {
                    switch ($tipo) {
                        case 'libra':
                            $valor = $valorMoneda * 1.17;
                            echo '<p class="mb-2 rounded">La cantidad en ' . $valorMoneda . ' euros es ' . $valor . ' en libra esterlina</p>';
                            break;
                        case 'yenes':
                            $valor = $valorMoneda * 0.0062;
                            echo '<p class="mb-2 rounded">La cantidad en ' . $valorMoneda . ' euros es ' . $valor . ' en yenes</p>';
                            break;
                        case 'bolivares':
                            $valor = $valorMoneda * 3910100;
                            echo '<p class="mb-2 rounded">La cantidad en ' . $valorMoneda . ' euros es ' . $valor . ' en bolívares</p>';
                            break;
                    }
                }
            } else {
                echo '<p class="mb-2 text-red-500 rounded">Debe introducir una cantidad y seleccionar al menos un tipo de moneda</p>';
            }

            $paginaAnterior = $_SERVER['HTTP_REFERER'];
            echo '<a href="' . $paginaAnterior . '" class="text-teal-500 hover:underline rounded">Volver a la página anterior</a>';
        ?>
    </div>
</body>
</html>