package juego;

import java.util.Random;

public class Jugador {

	private String jugadorId;
	private int posFila;
	private int posColumna;
	
	//Constructor de la clase jugador
	public Jugador(String jugadorId, int posColumna) 
	{
		this.jugadorId = jugadorId;
		this.posFila = 0; //Posición inicial en la fila cero
		this.posColumna = posColumna;
	}
	
	//Muestra el nombre del jugador
	public String getNombre() {
		return this.jugadorId;
	}
	
	//Devuelve la posicion fila
	public int getPosFila() {
		return this.posFila;
	}
	
	//Función que actualiza la posición fila
	public void setPosFila(int posFila) {
		this.posFila = posFila;
	}
	
	//Bucle que me tira el dado
	public int tirarDado() 
	{
		Random rd = new Random();
		int numAleat = rd.nextInt(4 - 1 + 1) + 1; //Me genera un número en el intervalo (4-1)	
		return numAleat;
	}
	
}
