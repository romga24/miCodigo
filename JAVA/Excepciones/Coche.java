package Excepciones;

import java.util.Scanner;

public class Coche {
	
	//Atributos
	private boolean haArrancado;
	private boolean esMarchaAtras;
	private int velocidadMaxima;
	private int velocidadMaximaAtras;
	private int velocidad;
	
	//Constructores
	public Coche(boolean haArrancado,boolean esMarchaAtras,int velocidadMaxima, int velocidadMaximaAtras, int velocidad) 
	{
		this.haArrancado = haArrancado;
		this.esMarchaAtras = esMarchaAtras;
		this.velocidadMaxima = velocidadMaxima;
		this.velocidadMaximaAtras = velocidadMaximaAtras;
		this.velocidad = velocidad;
	}
	
	public Coche(int velocidadMaxima, int velocidadMaximaAtras) 
	{
		this.velocidadMaxima = velocidadMaxima;
		this.velocidadMaximaAtras = velocidadMaximaAtras;
	}
	
	//Metodos de la clase Coche
	public void arrancar() 
	{
		try {
			if(!haArrancado) {
				haArrancado = true;
			}
			else {
				throw new IllegalStateException();
			}
		}catch(IllegalStateException e) {
			System.out.println("El coche ya ha arracado");
		}	
	}
	
	public void detener() 
	{
		try {
			if(haArrancado) {
				haArrancado = false;
			}
			else if(!haArrancado || velocidad != 0) {
				throw new IllegalStateException();
			}	
		}catch(IllegalStateException e) {
			System.out.println("Error el coche esta detenido");
		}	
	}
	
	public boolean ponerMarchaAtras(boolean esMarchaAtras) 
	{
		boolean laMarcha = false;
		
		try {
			if((!haArrancado || haArrancado) && velocidad != 0) {
				laMarcha = esMarchaAtras;
			}
			else if(esMarchaAtras || !((!haArrancado || haArrancado) && velocidad != 0)) {
				throw new IllegalStateException();
			}
		}catch(IllegalStateException e) {
			System.out.println("No se puede poner la marcha atras");
		}
		
		return laMarcha;	
	}
	
	public boolean quitarMarchaAtras(boolean esMarchaAtras) {
		
		boolean laMarcha = false;
		
		try {
			if((!haArrancado || haArrancado) && velocidad == 0) {
				laMarcha = esMarchaAtras;
			}
			else if(!esMarchaAtras || !((!haArrancado || haArrancado) && velocidad == 0)) {
				throw new IllegalStateException();
			}
		}catch(IllegalStateException e) {
			System.out.println("No se puede poner la marcha atras");
		}
		
		return laMarcha;	
	}

	public void acelerar(int velocidadEntrada) 
	{
		try {
			if(velocidadEntrada <= 0) {
				throw new IllegalStateException();
			}
			else if(!esMarchaAtras) {
				//Se suma para verificar
				this.velocidad += velocidadEntrada;
				//Si es mayor a la maxima de deja como antes
				if(velocidad > velocidadMaxima) {
					this.velocidad -= velocidadEntrada;
				}
			}
			else if(esMarchaAtras) {
				this.velocidad -= velocidadEntrada;
					if(velocidad < velocidadMaximaAtras) {
						this.velocidad += velocidadEntrada;
					}
			}
		}catch(IllegalStateException e) {
			System.out.println("No se pudo modificar la velocidad");
		}	
	}
	
	public void ponerCero() 
	{
		this.velocidad = 0;
	}
	
	public void frenar(int velocidadEntrada) 
	{
		try {
			if(velocidadEntrada <= 0) {
				throw new IllegalStateException();
			}
			else if(!esMarchaAtras) {
				this.velocidad -= velocidadEntrada;
					if(velocidad < 0) {
						ponerCero();
					}
			}
			else if(esMarchaAtras) {
				this.velocidad += velocidadEntrada;
					if(velocidad > 0) {
						ponerCero();
					}
			}
		}catch(IllegalStateException e) {
			System.out.println("No se pudo modificar la velocidad");
		}	
	}
	
	public String toString() {
		return "ESTADO DEL COCHE: \nEstado de arranque: "
				+ haArrancado() + "\n" + "Estado de la marcha: " + tieneLaMarcha() + "\n" +
				"Velocidad: " + velocidad + " km/h";
	}
	
	public String haArrancado() {
		String cadena = " ";
		if(haArrancado) {
			cadena = "Esta encendido";
		}
		else {
			cadena = "Esta apagado";
		}
		return cadena;
	}
	
	public String tieneLaMarcha() {
		
		String cadena = " ";
		if(esMarchaAtras) {
			cadena = "Tiene la marcha atras";
		}
		else {
			cadena = "No tiene la marcha atras";
		}
		return cadena;
	}
	
	public int menu() {
		Scanner sc = new Scanner(System.in);
		int numero;
		do {
		    System.out.println("1 – Arrancar\n2 – Detener\n3 – Poner marcha atrás\n4 – Quitar marcha atrás\n5 – Acelerar");
			System.out.println("6 – Frenar\n0 – Fin");
			System.out.println("Introduce la opcion: ");
			numero = sc.nextInt();

		}while(numero < 0 || numero > 6);
		return numero;
	}
	
}
