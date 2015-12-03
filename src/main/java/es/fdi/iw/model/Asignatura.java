package es.fdi.iw.model;

public class Asignatura {
	public Asignatura(String anio, String modalidad, String nombre, int curso) {
		this.anio = anio;
		this.modalidad = modalidad;
		this.nombre = nombre;
		this.curso = curso;
	}
	private String anio,modalidad,nombre;
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
	public void setCurso(int curso) {
		this.curso = curso;
	}
	private int curso;
}
