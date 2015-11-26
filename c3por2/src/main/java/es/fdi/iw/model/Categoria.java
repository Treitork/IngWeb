package es.fdi.iw.model;

public class Categoria {
public Categoria(String nombre, int puntuacion) {
		this.nombre = nombre;
		this.puntuacion = puntuacion;
	}
private String nombre;
private int puntuacion;
public String getNombre() {
	return nombre;
}

public int getPuntuacion() {
	return puntuacion;
}
}
