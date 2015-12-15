package es.fdi.iw.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
/* Queries */
// ... //

/* Clase */
public class Asignatura {
/* Atributos */
private long id;
private String nombre;
private String grupo;
private int anio;

/* Constructores */
public Asignatura(){}

/* Metodos */
public Asignatura crearAsignatura(String nombre,String grupo,int anio){
Asignatura a = new Asignatura();
a.nombre = nombre;
a.grupo = grupo;
a.anio = anio;
return a;	
}

/* Getters & Setters */
@Id
@GeneratedValue
public long getId() {
	return id;
}

public void setId(long id) {
	this.id = id;
}

public String getNombre() {
	return nombre;
}

public void setNombre(String nombre) {
	this.nombre = nombre;
}

public String getGrupo() {
	return grupo;
}

public void setGrupo(String grupo) {
	this.grupo = grupo;
}

public int getAnio() {
	return anio;
}

public void setAnio(int anio) {
	this.anio = anio;
}
/* Tablas del Join */
}
