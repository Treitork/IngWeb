package es.fdi.iw.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Entity
/*@NamedQueries({
@NamedQuery(name="todosUsuarios",
query="select u from Usuario u"),
@NamedQuery(name="usuarioLogin",
query="select u from Usuario u where u.login = :loginParam"),
@NamedQuery(name="borrarUsuario",
query="delete from Usuario u where u.id= :idParam")
})*/

public class Usuario {
private long id;
private static BCryptPasswordEncoder bcryptEncoder = new BCryptPasswordEncoder();
private String hashedAndSalted;
private boolean activo;
private String nombre,apellidos,login,imagen,rol;
private Integer puntuacion;
public String getHashedAndSalted() {
	return hashedAndSalted;
}
public void setHashedAndSalted(String hashedAndSalted) {
	this.hashedAndSalted = hashedAndSalted;
}
public String getLogin() {
	return login;
}
public void setLogin(String login) {
	this.login = login;
}
public void setNombre(String nombre) {
	this.nombre = nombre;
}
public void setApellidos(String apellidos) {
	this.apellidos = apellidos;
}
public void setRol(String rol) {
	this.rol = rol;
}
public void setPuntuacion(Integer puntuacion) {
	this.puntuacion = puntuacion;
}

private List<Asignatura> clases;
private List<Votacion> recibidas;
private List<HistorialVotaciones> historial;

public Usuario(){}
public Usuario(String nombre, String apellidos, String login, String rol) {
	this.nombre = nombre;
	this.apellidos = apellidos;
	this.login = login;
	this.rol = rol;
	this.clases = null;
	this.recibidas = null;
	this.historial = null;
	this.activo = true;
}

public static Usuario crearUsuario(String nombre, String apellidos, String login, String rol){
	Usuario u = new Usuario();
	u.nombre = nombre;
	u.apellidos = apellidos;
	u.hashedAndSalted = bcryptEncoder.encode(login);
	u.rol = rol;
	u.clases = null;
	u.recibidas = null;
	u.historial = null;
	u.activo = true;
	return u;
}

public boolean esValidalogin(String login) {
	return bcryptEncoder.matches(login, hashedAndSalted);		
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

@Id
@GeneratedValue
public long getId(){
	return id;
}

public void setId(long id) {
	this.id = id;
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
@Column(unique=true)
public String getlogin() {
	return login;
}

public String getImagen() {
	return imagen;
}

public void setlogin(String login) {
	this.login = login;
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

@OneToMany(targetEntity=Asignatura.class)
@JoinColumn(name="usuario")
public List<Asignatura> getClases() {
	return clases;
}

@OneToMany(targetEntity=Votacion.class)
@JoinColumn(name="receptor")
public List<Votacion> getRecibidas() {
	return recibidas;
}

@OneToMany(targetEntity=HistorialVotaciones.class)
@JoinColumn(name="propietario")
public List<HistorialVotaciones> getHistorial() {
	return historial;
}

}
