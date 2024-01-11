package juego2048renovado;

import java.util.Random;

public class Tablero {
	
	//Declaración de atributos
	private int tamFil;
	private int tamColum;
	private Celda [][] tablero;
	private int valorGanador;
		
	//Definimos los enumerado de dirección
	public enum Direccion
	{
	    ARRIBA, ABAJO, DERECHA, IZQUIERDA
	};
	    	
	//Establecemos el constructor por defecto
	public Tablero(int tamFil, int tamColum)
	{
	    this.setTamFil(tamFil);
		this.setTamColum(tamColum);
		this.setValorGanador(2048);
		this.tablero = new Celda[tamFil][tamColum];
	}
		
	//Métodos getter que me da el tamaño de la fila	
	public int getTamFil() 
	{
		return this.tamFil;
	}

	//Métodos setter que establece el tamaño de la fila	
	public void setTamFil(int tamFil) 
	{
		this.tamFil = tamFil;
	}
	
	//Métodos setter que establece el tamaño de la columna	
	public void setTamColum(int tamColum)
	{
		this.tamColum = tamColum;
	}
	
	//Métodos setter que me da el tamaño de la columna
	public int getTamColum()
	{
		return this.tamColum;
	}
	 
	//Método que me devuelve el tablero
	public Celda[][] getTablero()
	{
		return this.tablero;
	}
	
	public void setValorGanador(int valorGanador) {
		this.valorGanador = valorGanador;
	}
	 
	//Metodo que me inicializa el tablero en jugada inicial
	public void inicializarTablero()
	{
		//Contador de veces de los números aleatorios a inicializar
		for(int i = 0; i < 2; i++) {
		   inicializarPos();
		}
		for(int f = 0; f < tamFil; f++)
		{
			for(int c = 0; c < tamColum; c++)
			{
		    	Celda celda = new Celda(0);  	
		    	if(tablero[f][c] == null)
		    	{
		        	tablero[f][c] = celda;           	
		    	}    	
			}	
		 }
	}
		
	//Me devuelve un número Aleatorio 2 o 4
	public int generarAleatorio()
	{
	   Random rd = new Random();
	   int numAleat = 0;
	   boolean esCorrecto = false;
		 while(!esCorrecto) 
		 {	
			numAleat = rd.nextInt(4 - 1 + 1) + 1;		
			if(numAleat == 2 || numAleat == 4) 
			{		
		    	 esCorrecto = true;    	 
			}
		 } 
		 return numAleat;
	}
		
	//Me genera una posicion aleatoria en X
	public int generarPosAleatX()
	{
		Random rd = new Random();
		int posX = rd.nextInt(tamFil);
		return posX;
	}
		
	//Me genera una posicion aleatoria en Y
	public int  generarPosAleatY()
	{
		Random rd = new Random();
		int posY = rd.nextInt(tamColum);
		return posY;
	}
		
	//Inicializa las dos posiciones iniciales al jugar la partida
	public void inicializarPos()
	{ 
		 int num = generarAleatorio();
	     Celda celda = new Celda(num);
		 celda.setPosX(generarPosAleatX());
	     celda.setPosY(generarPosAleatY());
	     tablero[celda.getPosX()][celda.getPosY()] = celda;
	}
	
	public void inicializarPosEnJuego()
	{ 
		boolean esVacio = false;
		
		while(!esVacio) 
		{
			int num = generarAleatorio(); //Me genera un numero aleatorio
			int y = generarPosAleatX();
			int x = generarPosAleatY();
	     
			if(tablero[x][y].getValorCelda() == 0) 
			{
				tablero[x][y].setValorCelda(num);
				esVacio = true;
			}
		}     
	}
	 
	//Según el parámetro de dirección movemos las fichas
	public void moverFichas(Direccion direccion) 
	{
	    
		switch(direccion) 
		{
		
		    //Mover izquierda
			case IZQUIERDA:
				
				moverDeDerechaIzquierda();
				break;
		
			//Mover derecha
			case DERECHA:
				
				moverDeIzquierdaDerecha();
				break;
				
			//Mover arriba
			case ARRIBA:
			
				moverArriba();
				break;
			
			//Mover abajo
			case ABAJO:
			
				moverAbajo();
				break;
		}
		
	}
	
	//Método que me mueve las fichas hacia arriba
	public void moverArriba() 
	{
	    for (int c = 0; c < tamColum; c++) 
	    {
	        for (int f = tamFil - 1; f > 0; f--) 
	        {
	            // Si la posición está vacía
	            if (tablero[f - 1][c].getValorCelda() == 0) 
	            {
	                tablero[f - 1][c] = tablero[f][c];
	                tablero[f][c] = new Celda(0);
	            }
	        }
	        // Hago la fusión de la celda
	        for (int ultFila = tamFil - 1; ultFila > 0; ultFila--) {
	            fusionarCelda(tablero[ultFila][c], tablero[ultFila - 1][c], ultFila, c);
	        }
	    }
	}
	
	public void moverAbajo() 
	{
	    for (int c = 0; c < tamColum; c++) 
	    {
	        for (int f = 0; f < tamFil - 1; f++) 
	        {
	            // Si la posición está vacía y la celda actual no es 0
	            if (tablero[f + 1][c].getValorCelda() == 0) 
	            {
	                // Desplazamos los elementos hacia abajo
	                tablero[f + 1][c] = tablero[f][c];
	                tablero[f][c] = new Celda(0);
	            }
	        }
	        // Hago la fusión de la celda después de todos los desplazamientos
	        for (int primFila = 0; primFila < tamFil - 1; primFila++) {
	        	fusionarCelda(tablero[primFila][c], tablero[primFila + 1][c], primFila, c);
	        }
	    }  
	}
	
	// Método que mueve las filas de derecha a izquierda
	public void moverDeDerechaIzquierda() 
	{
	    for (int f = 0; f < tamFil; f++) 
	    {
	        for (int c = tamColum - 1; c > 0; c--) 
	        {
	            // Si la posición está vacía
	            if (tablero[f][c - 1].getValorCelda() == 0) 
	            {
	                tablero[f][c - 1] = tablero[f][c];
	                tablero[f][c] = new Celda(0);
	            }
	        }
	        // Hago la fusión de la celda
	        for (int primCol = tamColum - 1; primCol > 0; primCol--) 
	        {
	            fusionarCelda(tablero[f][primCol], tablero[f][primCol - 1], f, primCol);
	        }
	    }
	}

	// Método que mueve las filas de izquierda a derecha
	public void moverDeIzquierdaDerecha() 
	{
		
	    for (int f = 0; f < tamFil; f++) 
	    {
	        for (int c = 0; c < tamColum - 1; c++) 
	        {
	            // Si la posición está vacía
	            if (tablero[f][c + 1].getValorCelda() == 0) 
	            {
	                tablero[f][c + 1] = tablero[f][c];
	                tablero[f][c] = new Celda(0);
	            }
	        }
	        // Hago la fusión de la celda
	        for (int ultCol = 0; ultCol < tamColum - 1; ultCol++) 
	        {
	            fusionarCelda(tablero[f][ultCol], tablero[f][ultCol + 1], f, ultCol);
	        }
	    }
	}
	
	//Método que fusiona las dos celdas
	public void fusionarCelda(Celda primeraCelda, Celda segundaCelda, int posX, int posY) 
	{		
		if(primeraCelda.getValorCelda() == segundaCelda.getValorCelda()) 
		{
			
			//Sumamos el valor de las celdas 
			int valorCeldaNuevo = primeraCelda.getValorCelda() + segundaCelda.getValorCelda();
			
			//Borramos la celda que ya se fusionó, se establece el valo a 0
			primeraCelda.setValorCelda(0);
			
			//Actualizamos el valor nuevo de la celda y la posición X e Y
			segundaCelda.setValorCelda(valorCeldaNuevo);
			segundaCelda.setPosX(posX);
			segundaCelda.setPosY(posY);			
		}			
	}

	//Método que comprueba si hay un ganador o el tablero está lleno
	public boolean esFinJuego() 
	{
		int contadorLleno = 0;
		boolean esGanarOLleno = false;
		
		for(int f = 0; f < tamFil && !esGanarOLleno; f++) 
		{
			for(int c = 0; c < tamColum; c++) 
			{	
				if(tablero[f][c].getValorCelda() == valorGanador) 
				{
					//Si una celda alcanza el tope se gana
					esGanarOLleno = true;
				}
				if(tablero[f][c].getValorCelda() != 0) 
				{
					contadorLleno++;
					if(contadorLleno == tamFil * tamColum) 
					{
						esGanarOLleno = true;
					}
				}
			}
		}
		return esGanarOLleno;
	}
	
}