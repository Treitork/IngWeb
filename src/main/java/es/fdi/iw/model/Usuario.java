package es.fdi.iw.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.NamedQueries;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Entity
/* Queries */

@NamedQueries({
	@NamedQuery(name="todosUsuarios",
			query="select u from Usuario u"),
	@NamedQuery(name="busquedaUsuario",
	query="select u from Usuario u where u.nombre like :param1 or u.apellidos like :param1"),
	@NamedQuery(name="usuarioLogin",
	query="select u from Usuario u where email = :loginParam"),
	@NamedQuery(name="borrarUsuario",
	query="delete from Usuario u where u.id= :idParam"),
	@NamedQuery(name="notaUsuario",
	query="delete from Usuario u where u.id= :idParam"),
	@NamedQuery(name="busquedaUsuarioId",
	query="select u from Usuario u where u.id = :param1"),
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
	private Double puntuacion;
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
		u.puntuacion = 0.0;
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

	@OneToMany(targetEntity=Asignatura.class, fetch=FetchType.EAGER)
	@Cascade(CascadeType.ALL)
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

	public double getPuntuacion() {
		return puntuacion;
	}

	public void setPuntuacion(double puntuacion) {
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