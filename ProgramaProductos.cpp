#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>
#include <time.h>

using namespace std;

//Constantes
const int MAX_PRODUCTOS = 100;
const int CENTINELA = -1;

//Tipos
typedef enum { COLA, FANTA, CERVEZA, VINO, GASEOSA, AGUA, CAFE} tBebidas;
struct tProducto {
	tBebidas bebida;
	int unidades = 0;
	int codigo = 0;
	double precio = 0;
};
typedef tProducto tProductoComprado;
typedef tProducto tProductos[MAX_PRODUCTOS];
typedef tProductoComprado tCarrito[MAX_PRODUCTOS];
struct tListaProductos {
	tProductos listaProductos;
	int contador;
};
struct tListaCarrito {
	tCarrito listaCarrito;
	int contador;
	double costeTotal = 0;
};

int menu();
bool cargarArchivo(tProductos& productos);
tBebidas stringAbebida(string bebida);
string bebidaAstring(tBebidas bebida);
void guardaProductos(const tListaProductos &productos);
void generaFactura(tListaCarrito carrito);
void comprar(int codigo, int cantidad, tListaProductos& productos, tListaCarrito& carrito);

int main() {

}

int menu() {

	int op;

	do {	
		cout << "1. Anadir producto" << endl;
		cout << "2. Eliminar producto" << endl;
		cout << "3. Efectuar pedido y terminar" << endl;
		cout << "0. Salir" << endl;

		cout << "\nOpcion: ";
		cin >> op;

	} while (op < 0 || op > 3);

	return op;
}

bool cargarArchivo(tProductos& productos) {

	bool cargado;
	ifstream archivo;
	int codigo;
	string cadenaBebida;

	archivo.open("catalogo.txt");

	if (archivo.is_open()) {
		cargado = true;

		for (int i = 0; i < MAX_PRODUCTOS; i++) {

			archivo >> codigo;
			while (codigo != CENTINELA) {
				productos[i].codigo = codigo;
				archivo >> productos[i].precio;
				archivo >> productos[i].unidades;
				getline(archivo, cadenaBebida);
				productos[i].bebida = stringAbebida(cadenaBebida);
			}
		}
	}
	else {
		cargado = false;
		cout << "El archivo no se ha podido abrir" << endl;
	}
	return cargado;
}

tBebidas stringAbebida(string bebida) {

	tBebidas tipoBebida;

	if (bebida == "coca-cola") {
		tipoBebida = COLA;
	}
	else if (bebida == "fanta") {
		tipoBebida = FANTA;
	}
	else if (bebida == "cerveza") {
		tipoBebida = CERVEZA;
	}
	else if (bebida == "vino de mesa") {
		tipoBebida = VINO;
	}
	else if (bebida == "gaseosa") {
		tipoBebida = GASEOSA;
	}
	else if (bebida == "agua mineral") {
		tipoBebida = AGUA;
	}
	else if (bebida == "cafe helado") {
		tipoBebida = CAFE;
	}
	return tipoBebida;
}

string bebidaAstring(tBebidas bebida) {

	string sBebida;

	switch (bebida) {
	case COLA: sBebida = "coca-cola"; break;
	case FANTA: sBebida = "fanta"; break;
	case CERVEZA: sBebida = "cerveza"; break;
	case VINO: sBebida = "vino de mesa"; break;
	case GASEOSA: sBebida = "gaseosa"; break;
	case AGUA: sBebida = "agua mineral"; break;
	case CAFE: sBebida = "cafe helado"; break;
	}
	return sBebida;
}

void guardaProductos(const tListaProductos& productos) {

	ofstream archivo;
	archivo.open("catalogo.txt");
	string bebida;

	if (archivo.is_open()) {

		for (int i = 0; i < productos.contador; i++) {
			archivo << productos.listaProductos[i].codigo << " ";
			archivo << productos.listaProductos[i].precio << " ";
			archivo << productos.listaProductos[i].unidades << " ";
			bebida = bebidaAstring(productos.listaProductos[i].bebida);
			archivo << bebida << endl;
		}
	}
	else {
		cout << "El archivo no se ha podido abrir" << endl;
	}
}

void generaFactura(tListaCarrito carrito) {

	ofstream archivo;
	archivo.open("factura.txt");
	string bebida;

	if (archivo.is_open()) {

		archivo << "Factura de la compra" << endl; 
			for (int i = 0; i < carrito.contador; i++) {
			archivo << "\n" << i + 1 << " ";
			bebida = bebidaAstring(carrito.listaCarrito[i].bebida);
			archivo << bebida << " ";
			archivo << carrito.listaCarrito[i].precio;
			carrito.costeTotal = carrito.costeTotal + carrito.listaCarrito[i].precio * carrito.listaCarrito[i].unidades;
		}
		archivo << "\nCoste total: " << carrito.costeTotal << endl;
		archivo << "Coste + IVA: " << carrito.costeTotal + carrito.costeTotal * 0.21 << endl;
	}
	else {
		cout << "El archivo no se ha podido abrir" << endl;
	}
}

void comprar(int codigo, int cantidad, tListaProductos& productos, tListaCarrito& carrito) {

	do {
		cout << "Introduce el codigo de lo quieras comprar: ";
		cin >> codigo;
		if (productos.listaProductos[codigo].unidades > 0) {
			cout << "Introduce la cantidad: ";
			cin >> cantidad;
			if (cantidad <= productos.listaProductos[codigo].unidades) {
				productos.listaProductos[codigo].unidades = productos.listaProductos[codigo].unidades - cantidad;
				carrito.listaCarrito[codigo].unidades = carrito.listaCarrito[codigo].unidades + cantidad;
			}
			else {
				cout << "No hay existencias";
			}
		}
		else {
			cout << "No queda mas " << bebidaAstring(productos.listaProductos[codigo].bebida);
		}
	} while (codigo < 0 || codigo > 6);
}
