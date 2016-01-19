package es.fdi.iw.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
/* Queries */
@NamedQueries({
    @NamedQuery(name="todasAsignaturas",
            query="select a from Asignatura a"),
    @NamedQuery(name="buscarAsignatura",
			query="select u from Asignatura u where nombre = :Asignatura ")
})
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

public static Asignatura crearAsignatura(String formAsignatura, String formCurso, int formAnio) {
	// TODO Auto-generated constructor stub
	Asignatura a = new Asignatura();
	a.nombre = formAsignatura;
	a.grupo = formCurso;
	a.anio = formAnio;
	return a;
}

/* Metodos */

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
