package juego2048renovado;

//Nombre: Romel Romero
import juego2048renovado.Tablero.Direccion;

import java.util.Random;
import java.util.Scanner;
import java.lang.Math;

public class Juego {

	//Métodos
	public static void main(String [] args) {
		
        int exponente = 0;
		
        //Salida y entrada por pantalla
		System.out.println("BIENVENIDO AL JUEGO 2048 RENOVADO");
		Scanner sc = new Scanner(System.in);
		System.out.println("Elige una potencia para generar el tablero");
		
		//Exponente al que se eleva el tablero
		exponente = sc.nextInt();
		int tam = 2048;  // Hacemos la conversion de double a int
		
		Tablero tablero = new Tablero(exponente, exponente); //Creamos el objeto tablero
		
		//Se inicializa el tablero y se pinta
		tablero.inicializarTablero(); 
		pintarTablero(tablero);
		
		//Limpiamos la entrada de datos
		sc.nextLine();
		
		do {
			System.out.println("Introduce los siguientes teclas para las direcciones");	
			System.out.println("a) Arriba | b) Abajo | c) Derecha | d) Izquierda");	
			String dirStr = sc.nextLine();
			Direccion dirEnum = manejarDireccion(dirStr);
			tablero.moverFichas(dirEnum);
			tablero.inicializarPosEnJuego();
			pintarTablero(tablero);
			
		}while(!tablero.esFinJuego());	
		
		System.out.println("Fin del juego se ha llegado al límite");	
		sc.close();
		
	}
	
	//Método que me cambia de String al tipo enumerado
	public static Direccion manejarDireccion(String dir) 
	{
		
		Direccion dirEnum = null;
		
		if(dir.equals("a")) 
		{
			dirEnum = dirEnum.ARRIBA;
		}
		else if(dir.equals("b")) 
		{
			dirEnum = dirEnum.ABAJO;
		}
		else if(dir.equals("c")) 
		{
			dirEnum = dirEnum.DERECHA;
		}
		else if(dir.equals("d"))
		{
			dirEnum = dirEnum.IZQUIERDA;
		}
		
		return dirEnum;
	}
	
	//Método que me pinta el tablero
	public static void pintarTablero(Tablero tablero) 
	{

	    Celda[][] celdas = tablero.getTablero();
	    
	    String linea = "-";
	    
	    pintarLinea(tablero, linea);
	    System.out.println();
	    
	    for (int f = 0; f < tablero.getTamFil(); f++) {
	        System.out.print("|");
	        for (int c = 0; c < tablero.getTamColum(); c++) {
	            pintarCelda(celdas[f][c], f, c);
	            System.out.print("|");
	        }  
	        System.out.println();
	        pintarLinea(tablero, linea);
	        System.out.println();
	    }
	}

	//Método que me pinta la celda
	public static void pintarCelda(Celda celda, int posX, int posY) 
	{
	    
	    if (celda.getValorCelda() == 0) {
	        System.out.print("     ");
	    } else {
	        System.out.print("  " + celda.getValorCelda() + "  ");
	    }
	}

	//Método que me pinta la linea
	public static void pintarLinea(Tablero tablero, String linea) {
	    for (int i = 0; i <= 6 * tablero.getTamColum() - 1; i++) {
	        System.out.print(linea);
	    }
	}
	
}
