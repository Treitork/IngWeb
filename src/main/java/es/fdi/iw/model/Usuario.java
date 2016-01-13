package es.fdi.iw.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.NamedQueries;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Entity
/* Queries */

@NamedQueries({
@NamedQuery(name="todosUsuarios",
query="select u from Usuario u"),
@NamedQuery(name="busquedaUsuario",
query="select u from Usuario u where u.nombre= :param1"),
@NamedQuery(name="usuarioLogin",
query="select u from Usuario u where email = :loginParam"),
@NamedQuery(name="borrarUsuario",
query="delete from Usuario u where u.id= :idParam"),
@NamedQuery(name="notaUsuario",
query="delete from Usuario u where u.id= :idParam"),
@NamedQuery(name="mejoresProfesores",query="select u from Usuario u where u.rol='profesor' order by puntuacion desc"),
@NamedQuery(name="mejoresAlumnos",query="select u from Usuario u where u.rol='user' order by puntuacion desc")
})

/* Clase */
public class Usuario {
/* Atributos */
private static BCryptPasswordEncoder bcryptEncoder = new BCryptPasswordEncoder();
private long id;
private String email;
private String hashedAndSalted;
private String nombre;
private String apellidos;
private String rol;
private Integer puntuacion;
private boolean activo;
private String imagen;
private List<Asignatura> asignaturas;

/* Constructores */
public Usuario(){}

/* Metodos */
public static Usuario crearUsuario(String email,String login,String nombre,String apellidos,String rol){
	Usuario u = new Usuario();
	u.email = email;
	u.hashedAndSalted = bcryptEncoder.encode(login);
	u.nombre = nombre;
	u.apellidos = apellidos;
	u.rol = rol;
	u.puntuacion = 0;
	u.activo = true;
	u.imagen ="void";
	return u;
}

public boolean esLoginValido(String login) {
	return bcryptEncoder.matches(login, hashedAndSalted);		
}

public String toString(){
	return  id + " " + email + " " + hashedAndSalted + " " + nombre + " " +  apellidos + " " + rol;
}

/* Getters & Setters*/
@Id
@GeneratedValue
public long getId(){
	return id;
}

@OneToMany(targetEntity=Categoria.class, fetch=FetchType.EAGER)
public List<Asignatura> getAsignaturas() {
	return asignaturas;
}

public void setAsignaturas(List<Asignatura> asignaturas) {
	this.asignaturas = asignaturas;
}

public void setId(long id) {
	this.id = id;
}
@Column(unique=true)
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}

public String getHashedAndSalted() {
	return hashedAndSalted;
}

public void setHashedAndSalted(String hashedAndSalted) {
	this.hashedAndSalted = hashedAndSalted;
}

public String getNombre() {
	return nombre;
}

public void setNombre(String nombre) {
	this.nombre = nombre;
}

public String getApellidos() {
	return apellidos;
}

public void setApellidos(String apellidos) {
	this.apellidos = apellidos;
}

public String getRol() {
	return rol;
}

public void setRol(String rol) {
	this.rol = rol;
}

public Integer getPuntuacion() {
	return puntuacion;
}

public void setPuntuacion(Integer puntuacion) {
	this.puntuacion = puntuacion;
}

public boolean isActivo() {
	return activo;
}

public void setActivo(boolean activo) {
	this.activo = activo;
}

public String getImagen() {
	return imagen;
}

public void setImagen(String imagen) {
	this.imagen = imagen;
}

/* Tablas del Join */
// OneToMany
// Una tabla que me devuelva las votaciones que he hecho el usuario concreto
// Una tabla que devuelva las asignaturas en las que esta el usuario  concreto

}
