package es.fdi.iw.model;

import java.util.List;

public class Votacion {
private Integer idModelo;
private String emisor,receptor,comentario;
private List<Categoria> votacion;
public Votacion(Integer idModelo, String emisor, String receptor, String comentario, List<Categoria> votacion) {
	this.idModelo = idModelo;
	this.emisor = emisor;
	this.receptor = receptor;
	this.comentario = comentario;
	this.votacion = votacion;
}
public Integer getIdModelo() {
	return idModelo;
}
public String getEmisor() {
	return emisor;
}
public String getReceptor() {
	return receptor;
}
public String getComentario() {
	return comentario;
}
public List<Categoria> getVotacion() {
	return votacion;
}

}
