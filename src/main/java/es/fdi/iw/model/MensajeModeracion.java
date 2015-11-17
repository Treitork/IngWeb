package es.fdi.iw.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
/*@NamedQueries({
    @NamedQuery(name="todosMensaje",
            query="")
})*/
public class MensajeModeracion {
private String moderador,mensaje;
private long id;
public MensajeModeracion(String moderador, String mensaje) {
	this.moderador = moderador;
	this.mensaje = mensaje;
}
public void setModerador(String moderador) {
	this.moderador = moderador;
}
public void setMensaje(String mensaje) {
	this.mensaje = mensaje;
}
public String getModerador() {
	return moderador;
}
public String getMensaje() {
	return mensaje;
}
@Id
@GeneratedValue
public long getId() {
	return id;
}
public void setId(long id){
	this.id=id;
}

}
