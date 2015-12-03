package es.fdi.iw.model;

import java.util.List;

public class ModeloVotacion {
private Integer id;
private String emisor,receptor,rolDirigido;
private List<String> categorias;

public ModeloVotacion(Integer id, String emisor, String receptor, String rolDirigido, List<String> categorias) {
	this.id = id;
	this.emisor = emisor;
	this.receptor = receptor;
	this.rolDirigido = rolDirigido;
	this.categorias = categorias;
}

public Integer getId() {
	return id;
}
public String getEmisor() {
	return emisor;
}
public String getReceptor() {
	return receptor;
}
public String getRolDirigido() {
	return rolDirigido;
}
public List<String> getCategorias() {
	return categorias;
}
}
