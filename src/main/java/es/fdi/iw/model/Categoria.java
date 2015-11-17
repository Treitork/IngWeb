package es.fdi.iw.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
//#
@Entity
/*@NamedQueries({
    @NamedQuery(name="todasCategorias",
            query="")
})*/
public class Categoria {
	private String nombre;
	private int puntuacion;
	private long id;
	
	public Categoria(String nombre, int puntuacion) {
		this.nombre = nombre;
		this.puntuacion = puntuacion;
	}
	
	@Id
	@GeneratedValue
	public long getId(){
		return id;
	}
	
public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setPuntuacion(int puntuacion) {
		this.puntuacion = puntuacion;
	}

	public void setId(long id) {
		this.id = id;
	}

public String getNombre() {
	return nombre;
}

public int getPuntuacion() {
	return puntuacion;
}
}
