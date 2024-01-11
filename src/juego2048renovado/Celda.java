package juego2048renovado;

public class Celda {

	//Atributos
	private int valorCelda;
	private int posX;
	private int posY;
		
	//Constructor de la clase Celda
	public Celda(int valorCelda) 
	{
		this.valorCelda = valorCelda;
	}
	
	//Metodo getter que me devuelve el valor de la celda
	public int getValorCelda()
	{
		return this.valorCelda;
	}
	
	//Método setter que me devuelve el valor de la celda
	public void setValorCelda(int valorCelda)
	{
		this.valorCelda = valorCelda;
	}
	
	//Método setter que me devuelve la posición de X
	public void setPosX(int posX)
	{
		this.posX = posX;
	}
	
	//Método setter que me devuelve la posicion de Y
	public void setPosY(int posY)
	{
		this.posY = posY;
	}
	
	//Método getter que me devuelve la posicion de X
	public int getPosX() 
	{
		return this.posX;
	}
		
	//Método getter que me devuelve la posicion de Y
    public int getPosY() 
    {	
		return this.posY;
	}
    
}
