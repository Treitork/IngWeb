package es.ucm.persitencia;

import java.util.List;

import es.ucm.model.User;

public interface UserDao extends Dao{
	public void addUser(User user);
	public List<User> listUsers();
	public void removeContact(Integer id);
}
