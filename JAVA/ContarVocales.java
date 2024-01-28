package problemas;

import java.util.Scanner;

public class ContarVocales {
	public static void main(String [] args) 
	{
		char vocales [] = {'a', 'e', 'i','o', 'u'};
		int contador = 0;
		Scanner sc = new Scanner(System.in);
		String cadena = sc.nextLine();
		
		cadena = cadena.toLowerCase();
		
		for(int i = 0; i < vocales.length; i++) 
		{
			contador = contarVocales(vocales[i], cadena);
			System.out.println("La cantidad de " + vocales[i] + " es " + contador);
		}
	}
	
	public static int contarVocales(char vocal, String cadena) 
	{
		int numeroVocales = 0;
		for(int i = 0; i < cadena.length(); i++) 
		{
			if(cadena.charAt(i) == vocal) 
			{
				numeroVocales++;
			}
		}
		return numeroVocales;
	}
}
