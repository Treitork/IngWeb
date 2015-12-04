package es.fdi.iw.model;

import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
/* Queries */
// ... //

/* Clase */
public class Votacion {
/* Atributos */
private long id;
private long id_emisor;
private long id_receptor;
private Date fecha;
private List<Categoria> categorias;
private String votacion;

/* Constructores */
public Votacion(){}

/* Metodos */
public Votacion crearVotacion(long id,long id_emisor,long id_receptor){
	Votacion v = new Votacion();
	return v;
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

public long getId_emisor() {
	return id_emisor;
}

public void setId_emisor(long id_emisor) {
	this.id_emisor = id_emisor;
}

public long getId_receptor() {
	return id_receptor;
}

public void setId_receptor(long id_receptor) {
	this.id_receptor = id_receptor;
}

@Temporal(TemporalType.DATE)
public Date getFecha(){
	return fecha;
}

public void setFecha(Date fecha){
this.fecha = fecha;
}

@OneToMany(targetEntity=Categoria.class, fetch=FetchType.EAGER)
public List<Categoria> getCategorias(){
	return categorias;
}

public void setCategorias(List<Categoria> categorias){
	this.categorias = categorias;
}

public String getVotacion() {
	return votacion;
}

public void setVotacion(String votacion) {
	this.votacion = votacion;
}
/* Tablas del Join */
}
