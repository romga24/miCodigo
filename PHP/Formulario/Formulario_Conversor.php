<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <title>Conversor de Monedas</title>
</head>
<body class="bg-gray-100 h-screen flex items-center justify-center rounded-lg">

    <div class="bg-white p-8 rounded shadow-md max-w-md w-full">
        <h1 class="text-2xl font-bold mb-4">Conversor de Monedas</h1>

        <form action="respuesta.php" method="post" class="space-y-4">
            <div class="flex flex-col">
                <label for="valorMoneda" class="text-sm font-medium">Introduce el valor a convertir</label>
                <input type="text" name="valorMoneda" id="valorMoneda" class="mt-1 p-2 border rounded focus:outline-none focus:ring focus:border-blue-300">
            </div>

            <div class="flex flex-col">
                <label for="moneda" class="text-sm font-medium">Tipo de Moneda</label>
                <select name="moneda[]" id="moneda" multiple class="mt-1 p-2 border rounded focus:outline-none focus:ring focus:border-blue-300">
                    <option value="yenes" selected>Yen</option>
                    <option value="bolivares">Bolívares</option>
                    <option value="libra">Libra Esterlina</option>
                </select>
            </div>

            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Convertir</button>
        </form>
    </div>

</body>
</html>