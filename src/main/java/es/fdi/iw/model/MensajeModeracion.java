package es.fdi.iw.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
/* Queries */
// ... //

/* Clase */
public class MensajeModeracion {
/* Atributos */	
private long id;
private String emisor;
private String mensaje;

/* Constructores */
public MensajeModeracion(){}

/* Metodos */
public MensajeModeracion crearMensajeModeracion(String emisor,String mensaje){
	MensajeModeracion m = new MensajeModeracion();
	m.emisor = emisor;
	m.mensaje = mensaje;
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
