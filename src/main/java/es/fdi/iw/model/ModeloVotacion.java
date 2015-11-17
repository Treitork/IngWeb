package es.fdi.iw.model;

import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
@Entity
/*@NamedQueries({
    @NamedQuery(name="todosModelos",
            query="")
})*/
public class ModeloVotacion {
private long id;
private String emisor,receptor,rolDirigido;
private List<String> categorias;

public ModeloVotacion(Integer id, String emisor, String receptor, String rolDirigido, List<String> categorias) {
	this.id = id;
	this.emisor = emisor;
	this.receptor = receptor;
	this.rolDirigido = rolDirigido;
	this.categorias = categorias;
}
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

public String getReceptor() {
	return receptor;
}

public void setReceptor(String receptor) {
	this.receptor = receptor;
}

public String getRolDirigido() {
	return rolDirigido;
}

public void setRolDirigido(String rolDirigido) {
	this.rolDirigido = rolDirigido;
}
@ElementCollection
public List<String> getCategorias() {
	return categorias;
}

public void setCategorias(List<String> categorias) {
	this.categorias = categorias;
}

}
