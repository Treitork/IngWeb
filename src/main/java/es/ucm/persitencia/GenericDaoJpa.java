package es.ucm.persitencia;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
public class GenericDaoJpa <T extends DomainObject> implements GenericDao<T>{

	private Class<T> type;
	protected EntityManager entityManager;
	
	@PersistenceContext
	public void setEntityManager(EntityManager entityManager){
	this.entityManager = entityManager;	
	}
	
	public GenericDaoJpa(Class<T> type) {
		super();
		this.type = type;
	}
	
	@Override
	//@Transactional(readOnly=true)
	public T get(Long id) { // Patron Singleton
		if(id == null) return null;
		else return entityManager.find(type,id);
	}

	@Override
	public List<T> getAll() {
		return null;
	}

	@Override
	public void save(T object) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(T object) {
		// TODO Auto-generated method stub
		
	}
	
	

}
