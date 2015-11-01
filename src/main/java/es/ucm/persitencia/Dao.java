package es.ucm.persitencia;

public interface Dao {
public abstract void create(Object Obj);
public abstract void update(Object Obj);
public abstract void delete(Object ...objs);
public abstract Object read(Object ... objs);
}
