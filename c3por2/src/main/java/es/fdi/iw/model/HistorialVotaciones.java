package es.fdi.iw.model;

import java.util.Date;

public class HistorialVotaciones {
Date fecha;
Integer idVotacion;

public HistorialVotaciones(Date fecha, Integer idVotacion) {
	this.fecha = fecha;
	this.idVotacion = idVotacion;
}
public Date getFecha() {
	return fecha;
}

public Integer getIdVotacion() {
	return idVotacion;
}
}
