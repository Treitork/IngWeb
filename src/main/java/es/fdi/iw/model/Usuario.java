package es.fdi.iw.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Entity
@NamedQueries({
@NamedQuery(name="allUsers",
query="select u from Usuario u"),
@NamedQuery(name="userByLogin",
query="select u from Usuario u where u.contrasenia = :loginParam")
})

public class Usuario {
private static BCryptPasswordEncoder bcryptEncoder = new BCryptPasswordEncoder();
private String hashedAndSalted;
private boolean activo;
private String nombre,apellidos,contrasenia,imagen,rol;
private Integer puntuacion;
private List<Asignatura> clases;
private List<Votacion> recibidas;
private List<HistorialVotaciones> historial;

public Usuario(){}
public Usuario(String nombre, String apellidos, String contrasenia, String rol) {
	this.nombre = nombre;
	this.apellidos = apellidos;
	this.contrasenia = contrasenia;
	this.rol = rol;
	this.clases = null;
	this.recibidas = null;
	this.historial = null;
	this.activo = true;
}

public static Usuario crearUsuario(String nombre, String apellidos, String contrasenia, String rol){
	Usuario u = new Usuario();
	u.nombre = nombre;
	u.apellidos = apellidos;
	u.hashedAndSalted = bcryptEncoder.encode(contrasenia);
	u.rol = rol;
	u.clases = null;
	u.recibidas = null;
	u.historial = null;
	u.activo = true;
	return u;
}

public boolean esValidaContrasenia(String contrasenia) {
	return bcryptEncoder.matches(contrasenia, hashedAndSalted);		
}

/** añade asignatura al usuario */
public void añadirAsignatura(Asignatura asignatura){
	this.clases.add(asignatura);
}

/** hacer delegado */
public void hacerDelegado(){
	this.rol = "delegado";
}

 /* Geters & Setters */
public Boolean getActivo(){
	return this.activo;
}

public void setActivo(boolean b){
	this.activo = b;
}

public String getNombre() {
	return nombre;
}

public String getApellidos() {
	return apellidos;
}

public String getContrasenia() {
	return contrasenia;
}

public String getImagen() {
	return imagen;
}

public void setContrasenia(String contrasenia) {
	this.contrasenia = contrasenia;
}
public void setClases(List<Asignatura> clases) {
	this.clases = clases;
}
public void setRecibidas(List<Votacion> recibidas) {
	this.recibidas = recibidas;
}
public void setHistorial(List<HistorialVotaciones> historial) {
	this.historial = historial;
}
public void setImagen(String imagen) {
	this.imagen = imagen;
}
public String getRol() {
	return rol;
}

public Integer getPuntuacion() {
	return puntuacion;
}

public List<Asignatura> getClases() {
	return clases;
}
public List<Votacion> getRecibidas() {
	return recibidas;
}

public List<HistorialVotaciones> getHistorial() {
	return historial;
}

}
