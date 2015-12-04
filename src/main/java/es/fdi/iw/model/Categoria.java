package es.fdi.iw.model;

import javax.persistence.Entity;

@Entity
/* Queries */
// ... //

/* Clase */
public class Categoria {
/* Atributos */
private long id_votacion;
private String categoria;
private int puntuacion;

/* Constructores */
public Categoria(){}
public Categoria(long id_votacion,String categoria,int puntuacion){
this.id_votacion = id_votacion;
this.categoria = categoria;
this.puntuacion = puntuacion;
}

/* Metodos */
// ... //

/* Getters & Setters */
public long getId_votacion() {
	return id_votacion;
}

public void setId_votacion(long id_votacion) {
	this.id_votacion = id_votacion;
}

public String getCategoria(){
	return categoria;
}

public void setCategoria(String categoria) {
	this.categoria = categoria;
}

public int getPuntuacion() {
	return puntuacion;
}

public void setPuntuacion(int puntuacion) {
	this.puntuacion = puntuacion;
}
}
