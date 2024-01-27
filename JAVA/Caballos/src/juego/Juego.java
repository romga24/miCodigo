package juego;

import java.util.Scanner;

public class Juego {
		
	 public static final String VERDE = "\u001B[32m"; 
	 public static final String RESET = "\u001B[0m";
	 
	    //Programa principal, que contiene la lógica del juego
		public static void main(String[] args) {
	  
			//Abrimos el flujo de datos
	        Scanner sc = new Scanner(System.in);
	        
	        System.out.println("BIENVENIDO");
	        System.out.println("Introduce el número de jugadores (maximo cinco)");

	        int numJug = sc.nextInt();
	        
	        //Inicializamos el array de jugadores
	        Jugador[] jugadores = new Jugador[numJug];
	        int i = 0;
	        
	        //Limpia el flujo de datos
	        sc.nextLine(); 

	        //Vamos insertando datos en el array de jugadores
	        while (i < jugadores.length) 
	        {
	            System.out.println("Introduce el nombre del jugador(J1, J2...etc) " + (i + 1));
	            String nombre = sc.nextLine();
	            jugadores[i] = new Jugador(nombre, i);
	            i++;
	        }

	        //Inicializamos el tablero
	        Tablero tablero = new Tablero(jugadores);
	        tablero.mostrarEstadoTablero();
	        System.out.println("Que comience la partida....");

	        //Variable que controla la ejecución de juego
	        boolean esPartida = false;

	        int jugadorIndex = 0;
	        System.out.println("Jugador " + jugadores[jugadorIndex].getNombre() + " lanza dado, haz click en ENTER, por favor");  
	        sc.nextLine();
	        
	        //Mientras siga la partida
	         while (!esPartida)
	         {	 
	        	
	            //Jugador i tira dado
	            int numDado = jugadores[jugadorIndex].tirarDado();
	            //Se actualiza su pos fila
	            jugadores[jugadorIndex].setPosFila(jugadores[jugadorIndex].getPosFila() + numDado);
	            
	            //Si al tirar se pasa del MAX_FILA o llega al tope, gana
	            if (tablero.haGanado(jugadores[jugadorIndex].getPosFila())) 
	            {
	                System.out.print(VERDE + "Fin del juego, ha ganado el jugador " + jugadores[jugadorIndex].getNombre() + RESET);
	                esPartida = true;
	                
	            //Si no, entonces se actualiza su pos en el tablero
	            } else 
	            {
	            	tablero = new Tablero(jugadores);
	                if (jugadorIndex == numJug - 1) 
	                {
	                    jugadorIndex = 0;
	                } else 
	                {
	                	//Actualiza a jugador siguiente
	                    jugadorIndex++;
	                } 
	                
	            //Mostrar tablero actualizado 
	            tablero.mostrarEstadoTablero();  
	            System.out.println("Jugador " + jugadores[jugadorIndex].getNombre() + " lanza dado, haz click en ENTER, por favor");
		        sc.nextLine();
		        
	            }       
	        }   
	        sc.close();
	    }
		
}
