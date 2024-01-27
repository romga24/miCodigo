package excepciones;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {
	
	public static void main(String [] args) {
		
		Scanner sc = new Scanner(System.in);
		Coche elCoche = new Coche(120, 22);
		System.out.println("Modifica tu coche");
		int velocidad = 0;
		boolean ok = true;
		
		try {
			int numero = elCoche.menu();
			while(numero != 0){
				switch(numero) {
					case 1:
						elCoche.arrancar();
						break;
					case 2:
						elCoche.detener();
						break;
					case 3:
						elCoche.ponerMarchaAtras(ok);
						break;
					case 4: 
						elCoche.quitarMarchaAtras(ok);
						break;
					case 5: 
						System.out.println("Introduce la velocidad que va a la que vas a acelerar");
						velocidad = sc.nextInt();
						elCoche.acelerar(velocidad);;
						break;
					case 6: 
						System.out.println("Introduce la velocidad que va a la que vas a acelerar");
						velocidad = sc.nextInt();
						elCoche.frenar(velocidad);
						break;
				}
			numero = elCoche.menu();
		}
		}catch(InputMismatchException e) {
			System.out.println("Numero erroneo");
		}finally {
			System.out.println(elCoche.toString());
		}	
	}
}
