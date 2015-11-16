package es.fdi.iw.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries({
    @NamedQuery(name="todaVotacion",
            query="")
})
public class Votacion {
private long idModelo;
private String emisor,receptor,comentario;
private List<Categoria> votacion;
public Votacion(Integer idModelo, String emisor, String receptor, String comentario, List<Categoria> votacion) {
	this.idModelo = idModelo;
	this.emisor = emisor;
	this.receptor = receptor;
	this.comentario = comentario;
	this.votacion = votacion;
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
public List<Categoria> getVotacion() {
	return votacion;
}

}
