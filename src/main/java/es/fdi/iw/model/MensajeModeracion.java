package es.fdi.iw.model;

public class MensajeModeracion {
private String moderador,mensaje;

public MensajeModeracion(String moderador, String mensaje) {
	super();
	this.moderador = moderador;
	this.mensaje = mensaje;
}
public String getModerador() {
	return moderador;
}
public String getMensaje() {
	return mensaje;
}
}
