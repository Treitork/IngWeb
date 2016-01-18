package es.fdi.iw.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
// @Embeddable
/* Queries */
/*@NamedQueries({
    @NamedQuery(name="todasCategorias",
            query="select c from Categoria c"),
    @NamedQuery(name="deleteBook",
            query="delete from Book o where o.id=:idParam")
})*/
// ... //

/* Clase */
public class Categoria {
/* Atributos */
private long id_votacion;
private String categoria;
private double puntuacion;

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
@Id
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

public double getPuntuacion() {
	return puntuacion;
}

public void setPuntuacion(double puntuacion) {
	this.puntuacion = puntuacion;
}
}
