package es.ucm.persitencia;

import java.util.List;

public interface GenericDao<T extends DomainObject> {
	
	public T get(Long id);
	public List<T> getAll();
	public void save(T object);
	public void delete(T object);

}
