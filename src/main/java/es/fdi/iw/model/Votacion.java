package es.fdi.iw.model;

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

/* Clase */
public class Votacion {
/* Atributos */
private long id;
private long id_emisor;
private long id_receptor;
private Date fecha;
private List<Categoria> categorias;
private String comentario;
private double puntuacionMedia;

/* Constructores */
public Votacion(){}

/* Metodos */
public Votacion crearVotacion(long id_emisor,long id_receptor, 
		Date fecha, List<Categoria> categorias, String comentario, double puntuacionMedia){
	Votacion v = new Votacion();
	v.id_emisor = id_emisor;
	v.id_receptor = id_receptor;
	v.fecha = fecha;
	v.categorias = categorias;
	v.comentario = comentario;
	v.puntuacionMedia = puntuacionMedia;
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
