package es.fdi.iw.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Id;
//#
@Entity
/*@NamedQueries({
    @NamedQuery(name="todasAsignaturas",
            query="")
})*/
public class Asignatura {
	private int curso;
	private String anio,modalidad,nombre;
	private long id;
	private long usuario;
	public Asignatura(String anio, String modalidad, String nombre, int curso,long usuario,long id) {
		this.anio = anio;
		this.modalidad = modalidad;
		this.nombre = nombre;
		this.curso = curso;
		this.setUsuario(usuario);
		this.id = id;
	}

	public String getAnio() {
		return anio;
	}
	public void setAnio(String anio) {
		this.anio = anio;
	}
	public String getModalidad() {
		return modalidad;
	}
	public void setModalidad(String modalidad) {
		this.modalidad = modalidad;
	}
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getCurso() {
		return curso;
	}
	
	@Id
	@GeneratedValue
	public long getId(){
		return id;
	}	
	public void setId(long id){
		this.id = id;
	}
	public void setCurso(int curso) {
		this.curso = curso;
	}
	public long getUsuario() {
		return usuario;
	}

	public void setUsuario(long usuario) {
		this.usuario = usuario;
	}
}
