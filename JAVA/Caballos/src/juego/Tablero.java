package juego;

public class Tablero {

	//Constantes 
	public static final int MAX_FILA = 10;
	public static final int MAX_COLUMNA = 5;
	
	private Jugador[][] jugadores; //Array bisimensional de jugadores
	
	//Constructor para inicializar el tablero
	public Tablero(Jugador[] jugadores2) 
	{
	    this.jugadores = new Jugador[MAX_FILA][MAX_COLUMNA];
	    Jugador[] jugador = jugadores2;
	    int i = 0;

	    while (i < jugador.length) 
	    {  
	       jugadores[jugador[i].getPosFila()][i] = jugador[i]; 
	       i++;
	    }
	}
	
	//Método que nos da el estado del tablero
	public void mostrarEstadoTablero() 
	{
	    dibujarLinea();
	    System.out.println();
	    for (int fila = 0; fila < jugadores.length; fila++) 
	    {
	        System.out.print("|");
	        for (int columna = 0; columna < jugadores[0].length; columna++) 
	        {
	            if (jugadores[fila][columna] != null && jugadores[fila][columna].getNombre() != null) 
	            {
	                System.out.print("  " + jugadores[fila][columna].getNombre() + "\t" + "|");
	            } else 
	            {
	                System.out.print(" \t" + "|");  // Espacio en blanco si el jugador es null
	            }
	        }
	        System.out.println();
	        dibujarLinea();
	        System.out.println();
	    }
	}
	
	//Método que dibuja parte de la línea del tablero
	public void dibujarLinea() 
	{
		int i = 0;
		String flecha = "-";
		while(i < 40) {
			System.out.print(flecha);
			i++;
		}
	}
	
	//Metodo que verifica si es un ganador
	public boolean haGanado(int posFila)
	{
		boolean haGanado = false;
		if(posFila == MAX_FILA || posFila > MAX_FILA || posFila == MAX_FILA - 1) {
			haGanado = true;
		}
		return haGanado;
	}
		
}
