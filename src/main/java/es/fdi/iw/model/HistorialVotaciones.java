package es.fdi.iw.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
@Entity
/*@NamedQueries({
    @NamedQuery(name="todoHistorial",
            query="")
})*/
public class HistorialVotaciones {
private Date fecha;
private String propietario;
private long id;

public HistorialVotaciones(Date fecha, long idVotacion,String propietario) {
	this.fecha = fecha;
	this.id = idVotacion;
	this.propietario = propietario;
}
public Date getFecha() {
	return fecha;
}

public String getPropietario() {
	return propietario;
}

@Id
public long getId() {
	return id;
}
public void setFecha(Date fecha) {
	this.fecha = fecha;
}
public void setPropietario(String propietario) {
	this.propietario = propietario;
}
public void setId(long id) {
	this.id = id;
}


}		
