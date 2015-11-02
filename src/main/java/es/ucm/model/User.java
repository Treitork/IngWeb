package es.ucm.model;

import java.io.Serializable;

import org.hibernate.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="User")
public class User implements Serializable{
	

	private static final long serialVersionUID = 1L;
    @Id
    @Column(name="ID_USER")
    @GeneratedValue	
	private Integer id;
    @Column(name="USER_NAME")
		private String name;
    @Column(name="LAST_NAME")
		private String lastName;
    @Column(name="FIRST_NAME")
		private String firstName;
    @Column(name="EMAIL")
		private String email;
    @Column(name="AGE")
		private int age;
    @Column(name="PASSWD")
		private String passwd;
    @Column(name="ROLE")
		private char role;
		
		@Id
		@GeneratedValue
		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getLastName() {
			return lastName;
		}

		public void setLastName(String lastName) {
			this.lastName = lastName;
		}

		public String getFirstName() {
			return firstName;
		}

		public void setFirstName(String firstName) {
			this.firstName = firstName;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public int getAge() {
			return age;
		}

		public void setAge(int age) {
			this.age = age;
		}

		public String getPasswd() {
			return passwd;
		}

		public void setPasswd(String passwd) {
			this.passwd = passwd;
		}

		public char getRole() {
			return role;
		}

		public void setRole(char role) {
			this.role = role;
		}

		public static long getSerialversionuid() {
			return serialVersionUID;
		}

		public User(int id, String name, String lastName, String firstName, String email, int age, String passwd,
				char role) {
			this.id = id;
			this.name = name;
			this.lastName = lastName;
			this.firstName = firstName;
			this.email = email;
			this.age = age;
			this.passwd = passwd;
			this.role = role;
		}

}
