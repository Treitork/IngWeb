package es.fdi.iw.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
/* Queries */
// ... //
/*
@NamedQueries({
    @NamedQuery(name="todosMensajesModeracion",
            query="select m from MENSAJE_MODERACION m order by id desc"),
})*/

/* Clase */
public class MensajeModeracion {
/* Atributos */	
private long id;
private String emisor;
private String titulo;
public String getTitulo() {
	return titulo;
}

public void setTitulo(String titulo) {
	this.titulo = titulo;
}

private String mensaje;

/* Constructores */
public MensajeModeracion(){}

/* Metodos */
public MensajeModeracion crearMensajeModeracion(String emisor,String mensaje,String titulo){
	MensajeModeracion m = new MensajeModeracion();
	m.emisor = emisor;
	m.mensaje = mensaje;
	m.titulo = titulo;
	return m;
}

/* Getters & Setters*/
@Id
@GeneratedValue
public long getId() {
	return id;
}

public void setId(long id) {
	this.id = id;
}

public String getEmisor() {
	return emisor;
}

public void setEmisor(String emisor) {
	this.emisor = emisor;
}

public String getMensaje() {
	return mensaje;
}

public void setMensaje(String mensaje) {
	this.mensaje = mensaje;
}

}
