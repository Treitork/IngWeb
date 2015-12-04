package es.fdi.iw.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.NamedQueries;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Entity
/* Queries */
/*
@NamedQueries({
@NamedQuery(name="todosUsuarios",
query="select u from Usuario u"),
@NamedQuery(name="usuarioLogin",
query="select u from Usuario u where u.login = :loginParam"),
@NamedQuery(name="borrarUsuario",
query="delete from Usuario u where u.id= :idParam")
})*/

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
private Integer puntuacion_media;
private boolean activo;
private String imagen;

/* Constructores */
public Usuario(){}

/* Metodos */
public static Usuario crearUsuario(String nombre, String apellidos, String login, String email,String rol){
	Usuario u = new Usuario();
	u.email = email;
	u.hashedAndSalted = bcryptEncoder.encode(login);
	u.nombre = nombre;
	u.apellidos = apellidos;
	u.rol = rol;
	u.puntuacion_media = 0;
	u.activo = true;
	u.imagen ="void";
	return u;
}

public boolean esValidalogin(String login) {
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

public Integer getPuntuacion_media() {
	return puntuacion_media;
}

public void setPuntuacion_media(Integer puntuacion_media) {
	this.puntuacion_media = puntuacion_media;
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

}
