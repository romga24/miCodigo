document.getElementById("elBoton").addEventListener("click", function(){
    const miDiv = document.getElementById("miLista");
    for (let i = 1; i <= 100; i++) {
        const nuevoNodo = document.createElement("li");
        nuevoNodo.textContent = i * i;
        miDiv.appendChild(nuevoNodo);
    }
});






