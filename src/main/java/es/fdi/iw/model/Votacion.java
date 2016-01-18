package es.fdi.iw.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
/* Queries */
/*@NamedQueries({
    @NamedQuery(name="todosVotos",
            query="select v Votos v order by FECHA desc"),
    @NamedQuery(name="votosEmitidosUsuario",
            query="select from VOTOS v inner join Usuarios u on u.id=v.id_emisor where u.id=:idParam"),
    @NamedQuery(name="votosRecibidosUsuario",
    query="select from VOTOS v inner join Usuarios u on u.id=v.id_ where u.id=:idParam")
})*/


@NamedQueries({
	@NamedQuery(name="buscarVotaciones",
	query="select u from Votacion u where u.id_receptor = :param1")
})

/* Clase */
public class Votacion {
/* Atributos */
private long id;
private long id_emisor;
private long id_receptor;
private Date fecha;
private String comentario;
private double puntuacionMedia;
private List<Categoria> valoraciones;

/* Constructores */
public Votacion(){}

/* Metodos */
public Votacion crearVotacion(long id_emisor,long id_receptor,List<Categoria> votaciones){
	Votacion v = new Votacion();
	v.id_emisor = id_emisor;
	v.id_receptor = id_receptor;
	v.valoraciones = votaciones;
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

@OneToMany(targetEntity=Categoria.class, fetch=FetchType.EAGER)
public List<Categoria> getValoraciones() {
	return valoraciones;
}

public void setValoraciones(List<Categoria> valoraciones) {
	this.valoraciones = valoraciones;
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

public String getComentario() {
	return comentario;
}

public void setComentario(String comentario) {
	this.comentario = comentario;
}

public double getPuntuacionMedia() {
	return puntuacionMedia;
}

public void setPuntuacionMedia(double puntuacionMedia) {
	this.puntuacionMedia = puntuacionMedia;
}

/* Tablas del Join */
}
