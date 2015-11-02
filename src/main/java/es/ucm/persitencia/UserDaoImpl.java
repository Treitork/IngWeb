package es.ucm.persitencia;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import es.ucm.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void create(Object Obj) {	
	}

	@Override
	public void update(Object Obj) {
}

	@Override
	public void delete(Object... objs) {
}

	@Override
	public Object read(Object... objs) {
return null;
	}

	@Override
	public void addUser(User user) {
sessionFactory.getCurrentSession().save(user);
	}

	@Override
	public List<User> listUsers() {
		return sessionFactory.getCurrentSession().createQuery("select * from User").list();
	}

	@Override
	public void removeContact(Integer id) {
		User user = (User) sessionFactory.getCurrentSession().load(User.class,id);
		if(null != user) sessionFactory.getCurrentSession().delete(user);
	}

}
