package problemas;

import java.util.ArrayList;

public class Alumno {

	//Declaración de los atributos
	private String nombreAlumno;
	private String apellidoAlumno;
	ArrayList <Double> arrayNotasExamen;
	ArrayList <Double> arrayNotasPractica;
	private String ID;
	
	//Constructor
	public Alumno() 
	{
		this.nombreAlumno = " ";
		this.apellidoAlumno = " ";
		this.arrayNotasExamen = new ArrayList<Double>();
		this.arrayNotasPractica = new ArrayList<Double>();
	}
	
	//Métodos getter y setter
	public String getNombre() 
	{
		return nombreAlumno;
	}
	
	public void setNombre(String nombreAlumno) 
	{
		this.nombreAlumno = nombreAlumno;
	}
	
	public void setApellido(String apellidoAlumno) 
	{
		this.apellidoAlumno = apellidoAlumno;
	}
	
	public void setId(String ID) 
	{
		this.ID = ID;
	}
	
	public void aumentarArrayExamen(double notaExamen) 
	{
		arrayNotasExamen.add(notaExamen);
	}
	
	public void aumentarArrayPractica(double notaPractica) 
	{
		arrayNotasPractica.add(notaPractica);
	}
	public double hacerMediaEstudiante() 
	{
		
	    double totalMedia = 0;
	    double sumaMediaExamen = 0;
	    double sumaMediaPractica = 0;
		
	    for(int i = 0; i < arrayNotasExamen.size(); i++) {
		sumaMediaExamen += arrayNotasExamen.get(i);
	    }
		
	    for(int j = 0; j < arrayNotasPractica.size(); j++) {
		sumaMediaPractica += arrayNotasPractica.get(j);
	    }
		
	     totalMedia = (sumaMediaExamen/arrayNotasExamen.size() * 0.80) + (sumaMediaPractica/arrayNotasPractica.size() * 0.20);
	     return totalMedia;
	}
	@Override
	public String toString() 
	{
	     double media = hacerMediaEstudiante();
	     return "El alumno " + "con ID " + ID + " " + nombreAlumno + " " + apellidoAlumno + " " + "ha sacado una media de " + media;
	}
}
