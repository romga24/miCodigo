
let arrayTareas = ["Hacer la compra", "Preparar clase", "Escribir artículo", "Limpiar la habitación", "Estudiar"];

function mostrarTareas(){
    const miBody = document.body;
        for (let i = 0; i < arrayTareas.length; i++) {
            const nuevoParrafo = document.createElement("p");
            nuevoParrafo.textContent = arrayTareas[i];
            miBody.appendChild(nuevoParrafo);
        } 
}

document.addEventListener("DOMContentLoaded", mostrarTareas);
    







