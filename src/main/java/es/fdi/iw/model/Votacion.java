package es.fdi.iw.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
/*@NamedQueries({
    @NamedQuery(name="todaVotacion",
            query="")
})*/
public class Votacion {
private long idModelo;
private String emisor,receptor,comentario;
private List<Categoria> elementos;
public Votacion(Integer idModelo, String emisor, String receptor, String comentario, List<Categoria> elementos) {
	this.idModelo = idModelo;
	this.emisor = emisor;
	this.receptor = receptor;
	this.comentario = comentario;
	this.elementos = elementos;
}

public void setIdModelo(long idModelo) {
	this.idModelo = idModelo;
}

public void setEmisor(String emisor) {
	this.emisor = emisor;
}

public void setReceptor(String receptor) {
	this.receptor = receptor;
}

public void setComentario(String comentario) {
	this.comentario = comentario;
}

public void setElementos(List<Categoria> elementos) {
	this.elementos = elementos;
}

@Id
public long getIdModelo() {
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

@ManyToMany(targetEntity=Categoria.class,fetch=FetchType.EAGER)
public List<Categoria> getelementos() {
	return elementos;
}

}
